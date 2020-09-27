package kr.opensoftlab.lunaops.req.req5000.req5000.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmm.service.EgovProperties;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import kr.opensoftlab.lunaops.arm.arm1000.arm1000.service.impl.Arm1000DAO;
import kr.opensoftlab.lunaops.com.fms.web.service.FileMngService;
import kr.opensoftlab.lunaops.prj.prj1000.prj1100.service.impl.Prj1100DAO;
import kr.opensoftlab.lunaops.req.req4000.req4100.service.impl.Req4100DAO;
import kr.opensoftlab.lunaops.req.req5000.req5000.service.Req5000Service;
import kr.opensoftlab.lunaops.req.req6000.req6001.service.impl.Req6001DAO;
import kr.opensoftlab.sdf.util.WebhookSend;


@Service("req5000Service")
public class Req5000ServiceImpl  extends EgovAbstractServiceImpl implements Req5000Service{
	
    @Resource(name="arm1000DAO")
    private Arm1000DAO arm1000DAO;
    
    @Resource(name="req4100DAO")
    private Req4100DAO req4100DAO;

    @Resource(name="req6001DAO")
    private Req6001DAO req6001DAO;
    
    @Resource(name="req5000DAO")
    private Req5000DAO req5000DAO;

    
    @Resource(name="prj1100DAO")
    private Prj1100DAO prj1100DAO;

    
    @Resource(name = "webhookSend")
    private WebhookSend webhookSend;
    
    
   	@Resource(name="fileMngService")
   	private FileMngService fileMngService;
   	
   	@Resource(name = "egovFileIdGnrService")
	private EgovIdGnrService idgenService;
   	
    	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void insertReq5000ReqSignInfo(Map paramMap) throws Exception{
		
		String signCd = (String) paramMap.get("signCd");
		
		
		String prjGrpId = (String)paramMap.get("selPrjGrpId");
		String prjId = (String)paramMap.get("prjId");
		String reqId = (String)paramMap.get("reqId");
		String reqNm = (String) paramMap.get("reqNm");
		String signUsrId = (String) paramMap.get("signUsrId"); 
		
		String signRegUsrId = (String) paramMap.get("signRegUsrId"); 
		
		
		String flowSignStopCd = (String) paramMap.get("flowSignStopCd");
		
		
		
		boolean webHookStatus = false;
		
		
		boolean webHookUsrStatus = false;
				
		String whkRegUsrNm = "";
		String projectUrl = "";
		Map webhookBeforeReqInfo = null;
		Map webhookAfterReqInfo = null;
		
		try{
			webHookStatus = webhookSend.projectWebhookSetting(prjId);
			whkRegUsrNm =  (String)paramMap.get("whkRegUsrNm");

			
			webHookUsrStatus = webhookSend.userWebhookSetting((String)paramMap.get("licGrpId"), signRegUsrId);
			
			
			webhookBeforeReqInfo = req4100DAO.selectReq4100ReqInfo(paramMap);

			
			projectUrl = EgovProperties.getProperty("Globals.project.url");
		}catch(Exception e){
			
		}
		
		
		
		if(signCd != null && "03".equals(signCd) && flowSignStopCd != null && "01".equals(flowSignStopCd)){
			List<Map> flowList = prj1100DAO.selectPrj1101FlowList(paramMap);
			
			String endNextId = "";
			
			for(Map flowInfo : flowList){
				if(flowInfo.get("flowNextId") == null){
					endNextId = (String) flowInfo.get("flowId");
					break;
				}
			}

			
			paramMap.remove("signFlowId");
			paramMap.remove("flowNextNextId");
			
			paramMap.put("signFlowId", endNextId);
			paramMap.put("flowNextNextId", null);
		}
		
		req5000DAO.insertReq5000ReqSignInfo(paramMap);
		
		String signCdNm = "승인";
		String signRejectCmnt = "";	
		
		
		if(signCd != null && "02".equals(signCd)){
			
			String flowNextNextId = (String) paramMap.get("flowNextNextId");
			
			if(flowNextNextId != null && "null".equals(flowNextNextId)){
				
				paramMap.put("reqProType", "04");
			}else{ 
				
				Map<String, String> newOptMap = new HashMap<String,String>();
				newOptMap.put("licGrpId",(String)paramMap.get("licGrpId"));
				newOptMap.put("prjId",(String)paramMap.get("prjId"));
				newOptMap.put("processId",(String)paramMap.get("processId"));
				newOptMap.put("flowId",(String)paramMap.get("signFlowId"));
				List<Map> reqOptList = prj1100DAO.selectPrj1102OptList(newOptMap);
				
				
				for(Map reqOptInfo : reqOptList){
					String itemCode = (String)reqOptInfo.get("itemCode");
					reqOptInfo.put("reqId",(String)paramMap.get("reqId"));
					
					
					if("03".equals(itemCode)){
						
						int optCnt = prj1100DAO.selectPrj1102OptCntInfo(reqOptInfo);
						
						
						if(optCnt == 0){
							
							String atchFileIdString = idgenService.getNextStringId();
							fileMngService.insertFileMasterInfo(atchFileIdString);
							
							
							reqOptInfo.put("itemValue",atchFileIdString);
							
							prj1100DAO.insertPrj1103OtpValueInfo(reqOptInfo);
						}
					}
				}
			}
			
			
			req4100DAO.updateReq4100ReqFlowChgInfoAjax(paramMap);
			
			
			Map newMap = new HashMap();
			newMap.putAll(paramMap);
			newMap.put("chgUsrId", paramMap.get("regUsrId"));
			newMap.put("chgFlowId", paramMap.get("signFlowId"));
			
			newMap.put("reqChgType", "01"); 
			
			
			req6001DAO.insertReq6001ReqChangeLogInfo(newMap);
			
			
			if(webHookStatus || webHookUsrStatus){
				
				webhookAfterReqInfo = req4100DAO.selectReq4100ReqInfo(paramMap);
			
				
				webhookSend.setConnectInfo("프로젝트",  (String) webhookAfterReqInfo.get("prjNm"));
				
				
				if(flowNextNextId != null && "null".equals(flowNextNextId)){
					webhookSend.setConnectInfo("프로세스",  (String) webhookAfterReqInfo.get("processNm"));
					webhookSend.setConnectInfo("요구사항 명",  (String) webhookAfterReqInfo.get("reqNm"));
					
					
					String messasgeJson = webhookSend.messageJsonSetting("결재가 승인되었습니다.\n결재자 "+whkRegUsrNm+"님이 요구사항 ["+webhookBeforeReqInfo.get("reqOrd")+"]("+projectUrl+"/data/req/"+webhookBeforeReqInfo.get("reqKey")+")(을)를 최종완료 처리했습니다."
							,(String) webhookAfterReqInfo.get("flowTitleBgColor"));
					
					if(webHookStatus){
						webhookSend.prjSend(messasgeJson, "whkReqDoneCd");
					}
					
					
					if(webHookUsrStatus){
						webhookSend.usrSend(messasgeJson, "whkReqDoneCd");
					}
				}
				else{
					
					webhookSend.setConnectInfo("요구사항 명",  (String) webhookAfterReqInfo.get("reqNm"));
					webhookSend.setConnectInfo("이전 작업흐름",  (String) webhookBeforeReqInfo.get("flowNm"));
					webhookSend.setConnectInfo("변경 작업흐름",  (String) webhookAfterReqInfo.get("flowNm"));
					
					
					String messasgeJson = webhookSend.messageJsonSetting("결재자 "+whkRegUsrNm+"님이 요구사항 ["+webhookBeforeReqInfo.get("reqOrd")+"]("+projectUrl+"/data/req/"+webhookBeforeReqInfo.get("reqKey")+")(을)를 결재 승인 처리했습니다."
							,(String) webhookAfterReqInfo.get("flowTitleBgColor"));
					
					if(webHookStatus){
						webhookSend.prjSend(messasgeJson, "whkSignAcceptCd");
					}
					
					
					if(webHookUsrStatus){
						webhookSend.usrSend(messasgeJson, "whkSignAcceptCd");
					}
				}
			}
			
		}else if("03".equals(signCd)){
			signCdNm = "반려";
			signRejectCmnt = "<br><br>반려사유: "+ paramMap.get("signRejectCmnt");

			String addMessage = "";
			
			if("01".equals(flowSignStopCd)){
				
				paramMap.remove("signCd");
				paramMap.put("signCd", "02");
				
				
				paramMap.put("reqProType", "05");
				
				
				req4100DAO.updateReq4100ReqFlowChgInfoAjax(paramMap);
				
				
				Map newMap = new HashMap();
				newMap.putAll(paramMap);
				newMap.put("chgUsrId", paramMap.get("regUsrId"));
				newMap.put("preFlowId", paramMap.get("preFlowId"));
				newMap.put("chgFlowId", paramMap.get("signFlowId"));
				
				newMap.put("reqChgType", "01"); 
				
				
				req6001DAO.insertReq6001ReqChangeLogInfo(newMap);
				
				addMessage = "\n해당 요구사항은 작업흐름 옵션에 따라 최종완료 처리 되었습니다.";
			}
			
			
			if(webHookStatus || webHookUsrStatus){
				
				webhookAfterReqInfo = req4100DAO.selectReq4100ReqInfo(paramMap);
			
				
				webhookSend.setConnectInfo("프로젝트",  (String) webhookAfterReqInfo.get("prjNm"));
				webhookSend.setConnectInfo("요구사항 명",  (String) webhookAfterReqInfo.get("reqNm"));
				webhookSend.setConnectInfo("반려 사유",  (String) paramMap.get("signRejectCmnt"));
				
				
				String messasgeJson = webhookSend.messageJsonSetting("결재자 "+whkRegUsrNm+"님이 요구사항 ["+webhookBeforeReqInfo.get("reqOrd")+"]("+projectUrl+"/data/req/"+webhookBeforeReqInfo.get("reqKey")+")(을)를 결재 반려 처리했습니다."+addMessage
						,(String) webhookAfterReqInfo.get("flowTitleBgColor"));
				
				if(webHookStatus){
					webhookSend.prjSend(messasgeJson, "whkSignRejectCd");
				}
				
				
				if(webHookUsrStatus){
					webhookSend.usrSend(messasgeJson, "whkSignRejectCd");
				}
			}
			
		}
		
		
		if(!signUsrId.equals(signRegUsrId)){
			
			Map<String,String> armMap = new HashMap<String,String>();
			armMap.put("usrId", signRegUsrId);
			armMap.put("sendUsrId", signUsrId);
			armMap.put("title", "["+reqNm+"] 요구사항 결재가 "+signCdNm+"되었습니다.");
			armMap.put("content", "["+reqNm+"] 요구사항 결재가 "+signCdNm+"되었습니다.<br>해당 요구사항을 확인해주세요."+signRejectCmnt);
			armMap.put("reqIds", "<span name='tagReqId' id='tagReqId' prj-grp-id='"+prjGrpId+"' prj-id='"+prjId+"' req-id='"+reqId+"' onclick='fnSpanReq4105Open(this)'>"+reqNm+"<li class='fa fa-share'></li></span>");
			armMap.put("armSendTypeCd", "07");
			
			
			arm1000DAO.insertArm1000AlarmInfo(armMap);
		}
	}
	
}
