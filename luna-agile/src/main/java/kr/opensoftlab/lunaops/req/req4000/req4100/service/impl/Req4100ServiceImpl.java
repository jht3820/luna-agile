package kr.opensoftlab.lunaops.req.req4000.req4100.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import org.json.simple.JSONArray;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import kr.opensoftlab.lunaops.arm.arm1000.arm1000.service.impl.Arm1000DAO;
import kr.opensoftlab.lunaops.com.exception.UserDefineException;
import kr.opensoftlab.lunaops.com.fms.web.service.FileMngService;
import kr.opensoftlab.lunaops.dpl.dpl1000.dpl1000.service.impl.Dpl1000DAO;
import kr.opensoftlab.lunaops.dpl.dpl1000.dpl1100.service.impl.Dpl1100DAO;
import kr.opensoftlab.lunaops.prj.prj1000.prj1100.service.impl.Prj1100DAO;
import kr.opensoftlab.lunaops.prj.prj1000.prj1300.service.impl.Prj1300DAO;
import kr.opensoftlab.lunaops.req.req1000.req1000.service.impl.Req1000DAO;
import kr.opensoftlab.lunaops.req.req4000.req4100.service.Req4100Service;
import kr.opensoftlab.lunaops.req.req4000.req4100.vo.Req4100VO;
import kr.opensoftlab.lunaops.req.req5000.req5000.service.impl.Req5000DAO;
import kr.opensoftlab.lunaops.req.req6000.req6000.service.Req6000Service;
import kr.opensoftlab.lunaops.req.req6000.req6001.service.impl.Req6001DAO;
import kr.opensoftlab.lunaops.stm.stm3000.stm3000.service.impl.Stm3000DAO;
import kr.opensoftlab.sdf.excel.ExcelDataListResultHandler;
import kr.opensoftlab.sdf.util.CommonScrty;
import kr.opensoftlab.sdf.util.ReqHistoryMngUtil;
import kr.opensoftlab.sdf.util.WebhookSend;



@Service("req4100Service")
public class Req4100ServiceImpl extends EgovAbstractServiceImpl implements Req4100Service {
	
    @Resource(name="arm1000DAO")
    private Arm1000DAO arm1000DAO;
    
	
    @Resource(name="stm3000DAO")
    private Stm3000DAO stm3000DAO;
    
	
    @Resource(name="dpl1000DAO")
    private Dpl1000DAO dpl1000DAO;
    
    
    @Resource(name="dpl1100DAO")
    private Dpl1100DAO dpl1100DAO;
    
    
    @Resource(name="req4100DAO")
    private Req4100DAO req4100DAO;
    
    
    @Resource(name="prj1300DAO")
    private Prj1300DAO prj1300DAO;
    
    
    @Resource(name="req6001DAO")
    private Req6001DAO req6001DAO;
    
    
    @Resource(name="req5000DAO")
    private Req5000DAO req5000DAO;
    
    
    @Resource(name="req1000DAO")
    private Req1000DAO req1000DAO;
    
    
    @Resource(name="prj1100DAO")
    private Prj1100DAO prj1100DAO;
	
	
	@Resource(name = "req6000Service")
	private Req6000Service req6000Service;
	
	
   	@Resource(name="fileMngService")
   	private FileMngService fileMngService;
   	
   	@Resource(name = "egovFileIdGnrService")
	private EgovIdGnrService idgenService;
   	
    
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

    
    @Resource(name = "webhookSend")
    private WebhookSend webhookSend;
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private Map<String, String> selectReq4100JsonToMap(Map paramMap){
		Map rtnMap = new HashMap();
		for( Object key : paramMap.keySet() ) {
			String jsonVal = "";
			try{
				jsonVal = (String) paramMap.get(key);
			}catch(ClassCastException cce){	
				continue;
			}
			
			JSONObject jsonObj = null;
			
			
			try{
				jsonObj = new JSONObject(jsonVal);
				rtnMap.put(key, jsonObj.getString("optVal"));
			}catch(JSONException jsonE){
				rtnMap.put(key, jsonVal);
			}catch(NullPointerException npe){
				rtnMap.put(key, jsonVal);
			}
		}
		return rtnMap;
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public void insertReq4100ReqInfoListAjax(Map<String, String> paramMap, Map prjInfo, ReqHistoryMngUtil historyMng) throws Exception {
		
		paramMap = selectReq4100JsonToMap(paramMap);

		
		List<Map<String, String>> reqDatas = new ArrayList();
				
		
		String jsonData = paramMap.get("jsonData");
		
		
		JSONParser jsonParser = new JSONParser();
		
		
		String prjId = (String)prjInfo.get("prjId");
		
		String prjAcrm = (String)prjInfo.get("prjAcrm");
		
		
		JSONArray jsonArray = (JSONArray) jsonParser.parse(jsonData);
		for(int i=0; i<jsonArray.size(); i++){
			org.json.simple.JSONObject token = (org.json.simple.JSONObject) jsonArray.get(i);
			
			
			HashMap<String, String> tokenObj = new ObjectMapper().readValue(token.toString(), HashMap.class) ;
			
			reqDatas.add(tokenObj);
		}
		
		for(Map<String, String> data : reqDatas){
			
			data.put("licGrpId",paramMap.get("licGrpId"));
			data.put("regUsrId",paramMap.get("regUsrId"));
			data.put("regUsrIp",paramMap.get("regUsrIp"));
			data.put("modifyUsrId",paramMap.get("modifyUsrId"));
			data.put("modifyUsrIp",paramMap.get("modifyUsrIp"));
			data.put("prjId", prjId);
			
			
			data.put("reqProType","01");

			
			String reqNewType = data.get("reqNewType");
			
			
			String reqInputType = data.get("reqInputType");
			
			
			if( !"05".equals(reqNewType) && "N".equals(reqInputType.toUpperCase()) ){
				
				String reqUsrEmail = data.get("reqUsrEmail");
				String reqUsrNum = data.get("reqUsrNum");
				
				
				paramMap.put("reqUsrId", data.get("reqUsrId"));
				paramMap.put("reqUsrEmail", reqUsrEmail);
				paramMap.put("reqUsrNum", reqUsrNum);
				
				
				Map userInfo = req4100DAO.selectReq4100ReqUserInfo(paramMap);
				
				
				if(userInfo == null){
					throw new Exception(egovMessageSource.getMessage("req4100.notFoundUsr"));
				}
				
				
				data.put("reqUsrNm", userInfo.get("usrNm").toString());
				data.put("reqUsrDeptNm", userInfo.get("deptNm").toString());
				
				
				
				if( reqUsrEmail == null || "".equals(reqUsrEmail) ){
					data.put("reqUsrEmail", userInfo.get("email").toString());
				}
				
				
				
				if( reqUsrNum == null || "".equals(reqUsrNum) ){
					data.put("reqUsrNum", userInfo.get("telno").toString());
				}
			}
			
			
			String nextOrd = req1000DAO.selectReq1000NextReqOrd(data);
			String newReqOrd = nextOrd;
			
			
			if(prjAcrm != null && !"".equals(prjAcrm)){
				newReqOrd = prjAcrm+"-"+nextOrd;
			}
			
			data.put("reqOrd", newReqOrd);

			
			String atchFileIdString = idgenService.getNextStringId();
			fileMngService.insertFileMasterInfo(atchFileIdString);
			data.put("atchFileId",atchFileIdString);
			
			
			String newReqId = req4100DAO.insertReq4100ReqInfoAjax(data);
			
			String enReqKey = CommonScrty.encryptedAria(prjId, newReqId);
			
			Map<String, String> newReqMap = new HashMap<String, String>();
			
			newReqMap.put("prjId", prjId);
			newReqMap.put("reqId", newReqId);
			newReqMap.put("reqKey", enReqKey);
			
			
			req1000DAO.updateReq1000ReqKey(newReqMap);
			
			
			Map<String, String> newOptMap = new HashMap<String,String>();
			newOptMap.put("licGrpId",(String)paramMap.get("licGrpId"));
			newOptMap.put("prjId",(String)paramMap.get("prjId"));
			newOptMap.put("processId",(String)paramMap.get("prjId"));
			List<Map> prjOptList = prj1300DAO.selectPrj1300PrjProOptList(newOptMap);
			
			
			for(Map prjOptInfo : prjOptList){
				String itemCode = (String)prjOptInfo.get("itemCode");
				
				
				if("03".equals(itemCode)){
					
					atchFileIdString = idgenService.getNextStringId();
					fileMngService.insertFileMasterInfo(atchFileIdString);
					
					
					prjOptInfo.put("reqId",newReqId);
					prjOptInfo.put("itemValue",atchFileIdString);

					prj1300DAO.insertPrj1300PrjProOptValueInfo(prjOptInfo);
				}
			}
		}
	}

	
	@Override
	public List<Req4100VO> selectReq4100List(Req4100VO req4100vo)  throws Exception{
		return req4100DAO.selectReq4100List(req4100vo);
	}

	
	@Override
	public int selectReq4100ListCnt(Req4100VO req4100vo)  throws Exception{
		return req4100DAO.selectReq4100ListCnt(req4100vo);
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public String insertReq4100ReqInfoAjax(Map<String, String> paramMap)  throws Exception{
		
		
		paramMap = selectReq4100JsonToMap(paramMap);
		
		
		String prjAcrm 	= paramMap.get("prjAcrm");

		
		String nextOrd = req1000DAO.selectReq1000NextReqOrd(paramMap);
		String newReqOrd = nextOrd;
					
		
		if(prjAcrm != null && !"".equals(prjAcrm)){
			newReqOrd = prjAcrm+"-"+nextOrd;
		}
		
		paramMap.put("reqOrd", newReqOrd);
		
		
		String newReqId = req4100DAO.insertReq4100ReqInfoAjax(paramMap);
   		
		
		
		String prjId = (String)paramMap.get("prjId");
		
		
		String enReqKey = CommonScrty.encryptedAria(prjId, newReqId);
		
		Map<String, String> newReqMap = new HashMap<String, String>();
		
		newReqMap.put("prjId", prjId);
		newReqMap.put("reqId", newReqId);
		newReqMap.put("reqKey", enReqKey);
		
		
		req1000DAO.updateReq1000ReqKey(newReqMap);
		
		
		Map<String, String> newOptMap = new HashMap<String,String>();
		newOptMap.put("licGrpId",(String)paramMap.get("licGrpId"));
		newOptMap.put("prjId",(String)paramMap.get("prjId"));
		newOptMap.put("processId",(String)paramMap.get("prjId"));
		List<Map> prjOptList = prj1300DAO.selectPrj1300PrjProOptList(newOptMap);
		
		
		for(Map prjOptInfo : prjOptList){
			String itemCode = (String)prjOptInfo.get("itemCode");
			
			
			if("03".equals(itemCode)){
				
				String atchFileIdString = idgenService.getNextStringId();
				fileMngService.insertFileMasterInfo(atchFileIdString);
				
				
				prjOptInfo.put("reqId",newReqId);
				prjOptInfo.put("itemValue",atchFileIdString);

				prj1300DAO.insertPrj1300PrjProOptValueInfo(prjOptInfo);
			}
		}
		
		return newReqId;
		
	}

	@SuppressWarnings("rawtypes")
	@Override
	public Map selectPrj1104ReqInfoAjax(Map<String, String> paramMap)  throws Exception{
		return req4100DAO.selectPrj1104ReqInfoAjax(paramMap);
	}
	
    
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public void updateReq4100ReqInfoAjax(Map paramMap)  throws Exception{
		
		req6000Service.insertReq6000ModifyHistoryList(paramMap);
		
		
		paramMap = selectReq4100JsonToMap(paramMap);
				
		
		String beforeReqChargerId = (String) paramMap.get("before_reqChargerId");
				
		
		String reqChargerId = (String) paramMap.get("reqChargerId");	
		
		
		String reqNm = (String)paramMap.get("reqNm");
		String usrId = (String)paramMap.get("regUsrId");
		
		String prjGrpId = (String)paramMap.get("selPrjGrpId");
		String prjId = (String)paramMap.get("prjId");
		String reqId = (String)paramMap.get("reqId");
		String alarmTitle = "["+reqNm+"] 요구사항에 담당자로 지정되었습니다.";
		
		
		if(!"null".equals(beforeReqChargerId)){
			
			if(reqChargerId != null && !"".equals(reqChargerId) && !beforeReqChargerId.equals(reqChargerId) && !reqChargerId.equals(usrId)){
				
				Map<String,String> armMap = new HashMap<String,String>();
				armMap.put("usrId", reqChargerId);
				armMap.put("sendUsrId", usrId);
				armMap.put("title", alarmTitle);
				armMap.put("content", "["+reqNm+"] 요구사항에 담당자로 지정되었습니다.<br>해당 요구사항을 확인해주세요.");
				armMap.put("reqIds", "<span name='tagReqId' id='tagReqId' prj-grp-id='"+prjGrpId+"' prj-id='"+prjId+"' req-id='"+reqId+"' onclick='fnSpanReqDetailOpen(this)'>"+reqNm+"<li class='fa fa-share'></li></span>");
				armMap.put("armSendTypeCd", "03");
				
				
				arm1000DAO.insertArm1000AlarmInfo(armMap);
			}
		}	
		
		req4100DAO.updateReq4100ReqInfoAjax(paramMap);
	}

    
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public void deleteReq4100ReqInfoAjax(Map<String, Object> paramMap,String prjId)  throws Exception{
		
		List<Map<String,String>> list = (List<Map<String,String>>) paramMap.get("list");
		
		
		
		boolean webHookStatus = false;
		String whkRegUsrNm = "";
		String deleteReqMessage = "";
		int deleteReqMessageCnt = 0;
		String prjNm = "";
		
		try{
			
			webHookStatus = webhookSend.projectWebhookSetting(prjId);
			whkRegUsrNm =  (String)paramMap.get("whkRegUsrNm");
			
		}catch(Exception e){
			
		}
		
		
		int listSize = list.size();
		
		for (int i = 0; i < listSize; i++) {
			Map<String,String> reqMap = list.get(i);
			reqMap.put("prjId", prjId);
			
			
			String reqProType = reqMap.get("reqProType");
			
			String atchFileId = reqMap.get("atchFileId");
			
			
			if( !"01".equals(reqProType) ){
				throw new Exception(egovMessageSource.getMessage("req4100.canNotDeleted.ReceptionType"));
			}
			
			boolean webHookUsrStatus = false;
			Map webhookBeforeReqInfo = null;
			
			try{
				
				webhookBeforeReqInfo = req1000DAO.selectReq1000ReqInfo(reqMap);
				
				
				String reqUsrId = (String) webhookBeforeReqInfo.get("reqUsrId");
				webHookUsrStatus = webhookSend.userWebhookSetting((String)paramMap.get("licGrpId"), reqUsrId);
			}catch(Exception subE){}
			
			
			if(webHookStatus && deleteReqMessageCnt < 11 && webhookBeforeReqInfo != null){
				
				
				if(i == 0){
					prjNm = (String)webhookBeforeReqInfo.get("prjNm");
				}
				
				deleteReqMessage += "["+webhookBeforeReqInfo.get("reqOrd")+"] "+webhookBeforeReqInfo.get("reqNm")+"\n";
				deleteReqMessageCnt++;
			}
			
			if(webHookUsrStatus && webhookBeforeReqInfo != null){
				
				if(i == 0){
					prjNm = (String)webhookBeforeReqInfo.get("prjNm");
				}
				
				webhookSend.setConnectInfo("프로젝트",  prjNm);
				
				
				String messasgeJson = webhookSend.messageJsonSetting(whkRegUsrNm+"님이 요구사항 ["+webhookBeforeReqInfo.get("reqOrd")+"](을)를 삭제했습니다.","#4b73eb");
				webhookSend.usrSend(messasgeJson, "whkReqDeleteCd");
			}
			
			
			
			req4100DAO.deleteReq4100ReqInfoAjax(reqMap);
			
			
			req6000Service.deleteReq6000ReqHistoryInfo(reqMap);
			
			
			if( atchFileId != null && !"".equals(atchFileId) ){
				reqMap.put("atchFileId", atchFileId);
				
				
				req4100DAO.deleteReq4100ReqAtchFile(reqMap);
				
				req4100DAO.deleteReq4100ReqAtchFileDetail(reqMap);
			}
		}
		
		
		if(webHookStatus){
			
			webhookSend.setConnectInfo("프로젝트",  prjNm);
			webhookSend.setConnectInfo("삭제된 요구사항 (11건 이상 생략)",  deleteReqMessage);
			
			
			String messasgeJson = webhookSend.messageJsonSetting(whkRegUsrNm+"님이 요구사항 "+listSize+"건을 삭제했습니다.","#4b73eb");
			webhookSend.prjSend(messasgeJson, "whkReqDeleteCd");
		}
		
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void updateReq4106NewReqAccpetInfoAjax(Map paramMap) throws Exception{
		
		
		Map beforeReqInfo = req4100DAO.selectPrj1104ReqInfoAjax(paramMap); 
		
		
		String reqProType = (String) beforeReqInfo.get("reqProType");
		
		
		if(reqProType != null && !"01".equals(reqProType)) {
			throw new UserDefineException("이미 처리된 요구사항입니다.");
		}
		
		
		String processId = (String) paramMap.get("processId");

		
		
		Map defaultReqInfo = new HashMap();
		
		
		for( Object key : paramMap.keySet() ) {
			
			if("fileList".equals(key)){
				continue;
			}
			String jsonVal = paramMap.get(key).toString();
			JSONObject jsonObj = null;
			
			
			try{
				jsonObj = new JSONObject(jsonVal);
			}catch(JSONException jsonE){
				defaultReqInfo.put(key, paramMap.get(key).toString());
				continue;
			}
			
			
			String chgDetailOptTarget = String.valueOf(jsonObj.get("chgDetailOptTarget"));
			String optVal = String.valueOf(jsonObj.get("optVal"));
			
			
			if("01".equals(chgDetailOptTarget)){
				defaultReqInfo.put(key, optVal);
			}
			
			else if("04".equals(chgDetailOptTarget)){
				
				Map newParamMap = new HashMap();
				newParamMap.putAll(paramMap);
				
				newParamMap.put("processId", paramMap.get("prjId"));
				newParamMap.put("itemId", key);
				newParamMap.put("itemValue", optVal);
				
				
				int optCnt = prj1300DAO.selectPrj1300PrjProOptCnt(newParamMap);
				
				
				if(optCnt > 0){
					prj1300DAO.updatePrj1300PrjProOptValueInfo(newParamMap);
				}else{
					prj1300DAO.insertPrj1300PrjProOptValueInfo(newParamMap);
				}
			}
		}
		
		
		req4100DAO.updateReq4106NewReqAccpetInfoAjax(defaultReqInfo);
		
		
		String prjGrpId = (String)defaultReqInfo.get("selPrjGrpId");
		String prjId = (String)defaultReqInfo.get("prjId");
		String reqId = (String)defaultReqInfo.get("reqId");
		String reqNm = (String) defaultReqInfo.get("reqNm");
		String usrId = (String) defaultReqInfo.get("usrId");
		String reqChargerId = (String) defaultReqInfo.get("reqChargerId");
		String newReqCdNm = "승인";
		String newReqRejectCmnt = "";
		
		
		
		boolean webHookStatus = false;
		
		
		boolean webHookUsrStatus = false;
		String whkRegUsrNm = "";
		
		try{
			
			webHookStatus = webhookSend.projectWebhookSetting(prjId);
			whkRegUsrNm =  (String)defaultReqInfo.get("whkRegUsrNm");
			
			
			String reqUsrId = (String) defaultReqInfo.get("reqUsrId");
			webHookUsrStatus = webhookSend.userWebhookSetting((String)defaultReqInfo.get("licGrpId"), reqUsrId);
		}catch(Exception e){
			
		}
		
		
		
		if(!"reject".equals(processId)){	
			
			Map<String, String> newOptMap = new HashMap<String,String>();
			newOptMap.put("licGrpId",(String)defaultReqInfo.get("licGrpId"));
			newOptMap.put("prjId",(String)defaultReqInfo.get("prjId"));
			newOptMap.put("processId",(String)defaultReqInfo.get("processId"));
			newOptMap.put("flowId",(String)defaultReqInfo.get("flowId"));
			List<Map> reqOptList = prj1100DAO.selectPrj1102OptList(newOptMap);
			
			
			for(Map reqOptInfo : reqOptList){
				String itemCode = (String)reqOptInfo.get("itemCode");
				
				
				if("03".equals(itemCode)){
					
					String atchFileIdString = idgenService.getNextStringId();
					fileMngService.insertFileMasterInfo(atchFileIdString);
					
					
					reqOptInfo.put("reqId",(String)defaultReqInfo.get("reqId"));
					reqOptInfo.put("itemValue",atchFileIdString);
					prj1100DAO.insertPrj1103OtpValueInfo(reqOptInfo);
				}
			}
			
			
			
			if(!usrId.equals(reqChargerId)){
				
				Map<String,String> armMap = new HashMap<String,String>();
				armMap.put("usrId", (String) defaultReqInfo.get("reqChargerId"));
				armMap.put("sendUsrId", (String) defaultReqInfo.get("usrId"));
				armMap.put("title", "["+reqNm+"] 접수 완료 요구사항에 담당자로 지정되었습니다.");
				armMap.put("content", "["+reqNm+"] 접수 완료 요구사항에 담당자로 지정되었습니다.<br>해당 요구사항을 확인해주세요.");
				armMap.put("reqIds", "<span name='tagReqId' id='tagReqId' prj-grp-id='"+prjGrpId+"' prj-id='"+prjId+"' req-id='"+reqId+"' onclick='fnSpanReq4105Open(this)'>"+reqNm+"<li class='fa fa-share'></li></span>");
				armMap.put("armSendTypeCd", "03");
				
				
				arm1000DAO.insertArm1000AlarmInfo(armMap);
			}
			
			
			Map newMap = defaultReqInfo;
			newMap.put("reqChgType", "03"); 
			newMap.put("chgFlowId", defaultReqInfo.get("flowId"));
			newMap.put("chgChargerId", defaultReqInfo.get("reqChargerId"));
			newMap.put("chgUsrId", defaultReqInfo.get("regUsrId"));
			
			req6001DAO.insertReq6001ReqChangeLogInfo(newMap);

		}else{	
			newReqCdNm = "반려";
			newReqRejectCmnt = "<br><br>반려사유: "+ defaultReqInfo.get("reqAcceptTxt");
		}
		
		
		if(webHookStatus || webHookUsrStatus){
			
			Map webhookBeforeReqInfo = req4100DAO.selectReq4100ReqInfo(defaultReqInfo);

			
			String projectUrl = EgovProperties.getProperty("Globals.project.url");
			
			
			webhookSend.setConnectInfo("프로젝트",  (String) webhookBeforeReqInfo.get("prjNm"));
			webhookSend.setConnectInfo("요구사항 명",  (String) webhookBeforeReqInfo.get("reqNm"));
			webhookSend.setConnectInfo("요청자",  (String) webhookBeforeReqInfo.get("reqUsrNm"));
			
			
			if(webhookBeforeReqInfo.get("reqAcceptTxt") != null) {
				webhookSend.setConnectInfo("접수 "+newReqCdNm+" 의견",  (String)webhookBeforeReqInfo.get("reqAcceptTxt"));
			}
			
			
			String messasgeJson = webhookSend.messageJsonSetting(whkRegUsrNm+"님이 요구사항 ["+webhookBeforeReqInfo.get("reqOrd")+"]("+projectUrl+"/data/req/"+webhookBeforeReqInfo.get("reqKey")+")(을)를 접수 "+newReqCdNm+" 했습니다."
					,(String) webhookBeforeReqInfo.get("flowTitleBgColor"));
			
			if(!"reject".equals(processId)){
				
				if(webHookStatus){
					webhookSend.prjSend(messasgeJson, "whkNewAcceptCd");
				}
				
				
				if(webHookUsrStatus){
					webhookSend.usrSend(messasgeJson, "whkNewAcceptCd");
				}
			}
			
			else{
				
				if(webHookStatus){
					webhookSend.prjSend(messasgeJson, "whkNewRejectCd");
				}
				
				if(webHookUsrStatus){
					webhookSend.usrSend(messasgeJson, "whkNewRejectCd");
				}
			}
		}
		
		
		
		String reqUsrId = (String) defaultReqInfo.get("reqUsrId");

		
		if(reqUsrId != null && !"".equals(reqUsrId) &&!usrId.equals(reqUsrId)){
			Map<String,String> armMap = new HashMap<String,String>();
			armMap.put("usrId", reqUsrId);
			armMap.put("sendUsrId", usrId);
			armMap.put("title", "["+reqNm+"] 요청사항 접수가 "+newReqCdNm+"되었습니다.");
			armMap.put("content", "["+reqNm+"] 요청사항 접수가 "+newReqCdNm+"되었습니다.<br>해당 요청사항을 확인해주세요."+newReqRejectCmnt);
			armMap.put("reqIds", "<span name='tagReqId' id='tagReqId' prj-grp-id='"+prjGrpId+"' prj-id='"+prjId+"' req-id='"+reqId+"' onclick='fnSpanReq4108Open(this)'>"+reqNm+"<li class='fa fa-share'></li></span>");
			armMap.put("armSendTypeCd", "04");
			
			
			arm1000DAO.insertArm1000AlarmInfo(armMap);
		}
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectReq6001ReqHistoryList(Map paramMap) throws Exception{
		return (List) req4100DAO.selectReq6001ReqHistoryList(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectReq5000ReqSignList(Map paramMap) throws Exception{
		return (List) req4100DAO.selectReq5000ReqSignList(paramMap);
	}

	@Override
	public void selectReq4100ExcelList(Req4100VO req4100vo,
			ExcelDataListResultHandler resultHandler) throws Exception {
		req4100DAO.selectReq4100ExcelList(req4100vo,resultHandler);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectReq4100AllList(Req4100VO req4100vo) throws Exception {
		return req4100DAO.selectReq4100AllList(req4100vo);
	}
	
	
	@SuppressWarnings({ "rawtypes"})
	public int selectReq4100ProcessFlowReqCnt(Map paramMap) throws Exception {
		return req4100DAO.selectReq4100ProcessFlowReqCnt(paramMap);
	}
	
	@SuppressWarnings("rawtypes")
	public List selectReq4100ProcessFlowReqList(Map paramMap) throws Exception {
		return req4100DAO.selectReq4100ProcessFlowReqList(paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public boolean saveReq4100ReqFlowChgAjax(Map paramMap) throws Exception {
		
		req6000Service.insertReq6000ModifyHistoryList(paramMap);
		
		
		Map defaultReqInfo = new HashMap();
		
		
		for( Object key : paramMap.keySet() ) {
			
			if("fileList".equals(key)){
				continue;
			}
			String jsonVal = paramMap.get(key).toString();
			JSONObject jsonObj = null;
			
			
			try{
				jsonObj = new JSONObject(jsonVal);
			}catch(JSONException jsonE){
				defaultReqInfo.put(key, paramMap.get(key).toString());
				continue;
			}
			
			
			String chgDetailOptTarget = String.valueOf(jsonObj.get("chgDetailOptTarget"));
			String optVal = String.valueOf(jsonObj.get("optVal"));
			String optFlowId = String.valueOf(jsonObj.get("optFlowId"));
			
			
			if("01".equals(chgDetailOptTarget)){
				defaultReqInfo.put(key, optVal);
			}
			
			else if("02".equals(chgDetailOptTarget)){
				
				
				Map newParamMap = new HashMap();
				newParamMap.putAll(paramMap);
				
				
				if(newParamMap.containsKey("flowId")){
					newParamMap.remove("flowId");
				}
				newParamMap.put("flowId", optFlowId);
				newParamMap.put("itemId", key);
				newParamMap.put("itemValue", optVal);
				
				
				int optCnt = prj1100DAO.selectPrj1102OptCntInfo(newParamMap);
				
				
				if(optCnt > 0){
					prj1100DAO.updatePrj1103OtpValueInfo(newParamMap);
				}else{
					prj1100DAO.insertPrj1103OtpValueInfo(newParamMap);
				}
			}
			
			else if("03".equals(chgDetailOptTarget)){
				
				Map newParamMap = new HashMap();
				newParamMap.putAll(paramMap);
				
				
				if(newParamMap.containsKey("flowId")){
					newParamMap.remove("flowId");
				}
				newParamMap.put("flowId", optFlowId);
				
				newParamMap.remove("dplId");
				
				List beforeDplList = dpl1100DAO.selectDpl1100ReqDplList(newParamMap);
				
				newParamMap.put("dplId", optVal);
				
				
				List optCnt = dpl1100DAO.selectDpl1100ReqDplList(newParamMap);
				
				
				if(optCnt != null && optCnt.size() > 0){
					
					if(optVal == null || "".equals(optVal)){

						
						Map dplInfo = (Map) beforeDplList.get(0);
						String beforeDplId = (String) dplInfo.get("dplId"); 
						newParamMap.remove("dplId");
						newParamMap.put("dplId", beforeDplId);
						
						
						String newChgId = dpl1000DAO.selectDpl1500NewChgId(newParamMap);
						
						
						newParamMap.put("chgId", newChgId);
						newParamMap.put("chgNum", 0);
						newParamMap.put("chgTypeCd", "03");
						newParamMap.put("chgNm", paramMap.get("reqId"));
						newParamMap.put("chgOptTypeCd", "04");	
						newParamMap.put("chgUsrId", paramMap.get("regUsrId"));
						
						
						dpl1000DAO.insertDpl1500ModifyHistoryInfo(newParamMap);
						
						dpl1100DAO.deleteDpl1100ReqDplInfo(newParamMap);
					}else{
						
						Map dplInfo = (Map) beforeDplList.get(0);
						String beforeDplId = (String) dplInfo.get("dplId"); 
						
						
						if(!beforeDplId.equals(optVal)) {
						
							
							String newChgId = dpl1000DAO.selectDpl1500NewChgId(newParamMap);
							
							
							newParamMap.put("chgId", newChgId);
							newParamMap.put("chgNum", 0);
							newParamMap.put("chgTypeCd", "02");
							newParamMap.put("chgNm", paramMap.get("reqId"));
							newParamMap.put("chgOptTypeCd", "04");	
							newParamMap.put("chgUsrId", paramMap.get("regUsrId"));
							
							
							dpl1000DAO.insertDpl1500ModifyHistoryInfo(newParamMap);
							
							dpl1100DAO.updateDpl1200ReqDplInfo(newParamMap);
						}
					}
				}else{
					
					if(optVal != null && !"".equals(optVal)){
						
						if(beforeDplList != null && beforeDplList.size() > 0){
							
							Map dplInfo = (Map) beforeDplList.get(0);
							String beforeDplId = (String) dplInfo.get("dplId"); 
							
							
							if(!optVal.equals(beforeDplId)){
								Map newMap = new HashMap<>();
								
								
								newMap.put("prjId", newParamMap.get("prjId"));
								newMap.put("dplId", beforeDplId);
								
								
								String newChgId = dpl1000DAO.selectDpl1500NewChgId(newMap);
								
								newMap.put("chgId", newChgId);
								newMap.put("chgNum", 0);
								newMap.put("chgTypeCd", "03");
								newMap.put("chgNm", paramMap.get("reqId"));
								newMap.put("chgOptTypeCd", "04");	
								newMap.put("chgUsrId", paramMap.get("regUsrId"));
								
								
								dpl1000DAO.insertDpl1500ModifyHistoryInfo(newMap);

								newMap.put("reqId", newParamMap.get("reqId"));
								newMap.put("processId", newParamMap.get("processId"));
								newMap.put("flowId", newParamMap.get("flowId"));
								
								
								dpl1100DAO.deleteDpl1100ReqDplInfo(newMap);
							}
						}
						
						String newChgId = dpl1000DAO.selectDpl1500NewChgId(newParamMap);
						
						
						newParamMap.put("chgId", newChgId);
						newParamMap.put("chgNum", 0);
						newParamMap.put("chgTypeCd", "02");
						newParamMap.put("chgNm", paramMap.get("reqId"));	
						newParamMap.put("chgOptTypeCd", "04");	
						newParamMap.put("chgUsrId", paramMap.get("regUsrId"));
						
						
						dpl1000DAO.insertDpl1500ModifyHistoryInfo(newParamMap);
						
						dpl1100DAO.insertDpl1100ReqDplInfo(newParamMap);
					}
				}
			}
			
			else if("04".equals(chgDetailOptTarget)){
				
				Map newParamMap = new HashMap();
				newParamMap.putAll(paramMap);
				
				newParamMap.put("processId", paramMap.get("prjId"));
				newParamMap.put("itemId", key);
				newParamMap.put("itemValue", optVal);
				
				
				int optCnt = prj1300DAO.selectPrj1300PrjProOptCnt(newParamMap);
				
				
				if(optCnt > 0){
					prj1300DAO.updatePrj1300PrjProOptValueInfo(newParamMap);
				}else{
					prj1300DAO.insertPrj1300PrjProOptValueInfo(newParamMap);
				}
			}
			
			else if("05".equals(chgDetailOptTarget)){
				
				Map newParamMap = new HashMap();
				newParamMap.putAll(paramMap);
				
				newParamMap.put("itemId", key);
				newParamMap.put("itemValue", optVal);
				
				
				int optCnt = prj1300DAO.selectPrj1300PrjProOptCnt(newParamMap);
				
				
				if(optCnt > 0){
					prj1300DAO.updatePrj1300PrjProOptValueInfo(newParamMap);
				}else{
					prj1300DAO.insertPrj1300PrjProOptValueInfo(newParamMap);
				}
			}
		}
		String prjId = (String)defaultReqInfo.get("prjId");
		
		
		boolean webHookStatus = false;
		
		boolean webHookUsrStatus = false;
		
		String whkRegUsrNm = "";
		String projectUrl = "";
		Map webhookBeforeReqInfo = null;
		Map webhookAfterReqInfo = null;
		try{
			webHookStatus = webhookSend.projectWebhookSetting(prjId);
			whkRegUsrNm =  (String)paramMap.get("whkRegUsrNm");
			
			
			webhookBeforeReqInfo = req4100DAO.selectReq4100ReqInfo(defaultReqInfo);

			
			String reqBeforeChargerId = (String) webhookBeforeReqInfo.get("reqChargerId");
			
			
			if(reqBeforeChargerId != null && !"".equals(reqBeforeChargerId)){
				webHookUsrStatus = webhookSend.userWebhookSetting((String)paramMap.get("licGrpId"), reqBeforeChargerId);
			}
			
			
			projectUrl = EgovProperties.getProperty("Globals.project.url");
		}catch(Exception e){
			
		}
		
		
		
		String flowNextNextId = (String) defaultReqInfo.get("flowNextNextId");
		
		if(flowNextNextId != null && "null".equals(flowNextNextId)){
			
			defaultReqInfo.put("reqProType", "04");
		}
		
		
		req4100DAO.updateReq4100ReqFlowChgInfoAjax(defaultReqInfo);
		
		
		String preReqUsrId = (String) defaultReqInfo.get("preReqUsrId");
		String reqChargerId = (String) defaultReqInfo.get("reqChargerId");
		
		
		String prjGrpId = (String)defaultReqInfo.get("selPrjGrpId");
		String reqId = (String)defaultReqInfo.get("reqId");
		String reqNm = (String) defaultReqInfo.get("reqNm");
		
		
		
		
		if(!reqChargerId.equals(preReqUsrId)){
			
			Map<String,String> armMap = new HashMap<String,String>();
			armMap.put("usrId", (String) reqChargerId);
			armMap.put("sendUsrId", (String) defaultReqInfo.get("regUsrId"));
			armMap.put("title", "["+reqNm+"] 요구사항에 담당자로 지정되었습니다.");
			armMap.put("content", "["+reqNm+"] 요구사항에 담당자로 지정되었습니다.<br>해당 요구사항을 확인해주세요.");
			armMap.put("reqIds", "<span name='tagReqId' id='tagReqId' prj-grp-id='"+prjGrpId+"' prj-id='"+prjId+"' req-id='"+reqId+"' onclick='fnSpanReq4105Open(this)'>"+reqNm+"<li class='fa fa-share'></li></span>");
			armMap.put("armSendTypeCd", "03");
			
			
			arm1000DAO.insertArm1000AlarmInfo(armMap);
			
			
			Map newMap = new HashMap();
			newMap.putAll(paramMap);
			newMap.put("reqChgType", "02"); 
			newMap.put("chgUsrId", paramMap.get("regUsrId"));
			newMap.put("preChargerId", preReqUsrId);
			newMap.put("chgChargerId", reqChargerId);
			
			
			req6001DAO.insertReq6001ReqChangeLogInfo(newMap);
			
			
			if(webHookStatus || webHookUsrStatus){
				
				webhookAfterReqInfo = req4100DAO.selectReq4100ReqInfo(defaultReqInfo);
				
				
				webhookSend.setConnectInfo("프로젝트",  (String) webhookAfterReqInfo.get("prjNm"));
				webhookSend.setConnectInfo("요구사항 명",  (String) webhookAfterReqInfo.get("reqNm"));
				webhookSend.setConnectInfo("이전 담당자",  (String) webhookBeforeReqInfo.get("reqChargerNm"));
				webhookSend.setConnectInfo("변경 담당자",  (String) webhookAfterReqInfo.get("reqChargerNm"));
				
				
				String messasgeJson = webhookSend.messageJsonSetting(whkRegUsrNm+"님이 요구사항 ["+webhookBeforeReqInfo.get("reqOrd")+"]("+projectUrl+"/data/req/"+webhookBeforeReqInfo.get("reqKey")+")의 담당자를 변경 했습니다."
						,(String) webhookAfterReqInfo.get("flowTitleBgColor"));
				
				
				if(webHookStatus){
					webhookSend.prjSend(messasgeJson, "whkUserChgCd");
				}
				
				
				if(webHookUsrStatus){
					webhookSend.usrSend(messasgeJson, "whkUserChgCd");
				}
			}
			
			try{
				
				webHookUsrStatus = webhookSend.userWebhookSetting((String)paramMap.get("licGrpId"), reqChargerId);
				
				if(webHookUsrStatus){
					
					webhookSend.setConnectInfo("프로젝트",  (String) webhookAfterReqInfo.get("prjNm"));
					webhookSend.setConnectInfo("요구사항 명",  (String) webhookAfterReqInfo.get("reqNm"));
					webhookSend.setConnectInfo("이전 담당자",  (String) webhookBeforeReqInfo.get("reqChargerNm"));
					webhookSend.setConnectInfo("변경 담당자",  (String) webhookAfterReqInfo.get("reqChargerNm"));
					
					
					String messasgeJson = webhookSend.messageJsonSetting(whkRegUsrNm+"님이 요구사항 ["+webhookBeforeReqInfo.get("reqOrd")+"]("+projectUrl+"/data/req/"+webhookBeforeReqInfo.get("reqKey")+")의 담당자로 지정 했습니다."
							,(String) webhookAfterReqInfo.get("flowTitleBgColor"));
					webhookSend.usrSend(messasgeJson, "whkUserChgCd");
				}
				
			}catch(Exception e){
				
			}
			
		}
		
		
		String flowSignCd = (String) defaultReqInfo.get("flowSignCd");
		if(flowSignCd != null && "01".equals(flowSignCd)){
			
			String reqSignId = (String) defaultReqInfo.get("reqSignId");
			
			Map newParamMap = new HashMap();
			newParamMap.putAll(paramMap);
			newParamMap.put("signFlowId", paramMap.get("flowNextId"));
			newParamMap.put("signUsrId", reqSignId);
			newParamMap.put("signCd", "01");
			newParamMap.put("preFlowId", paramMap.get("flowId"));
			
			req5000DAO.insertReq5000ReqSignInfo(newParamMap);
			
			
			String regUsrId = (String)paramMap.get("regUsrId");
			
			
			if(!reqSignId.equals(regUsrId)) {
				
				Map<String,String> armMap = new HashMap<String,String>();
				armMap.put("usrId", reqSignId);
				armMap.put("sendUsrId", reqChargerId);
				armMap.put("title", "["+reqNm+"] 요구사항에 결재자로 지정되었습니다.");
				armMap.put("content", "["+reqNm+"] 요구사항에 결재자로 지정되었습니다.<br>해당 요구사항을 확인해주세요.");
				armMap.put("reqIds", "<span name='tagReqId' id='tagReqId' prj-grp-id='"+prjGrpId+"' prj-id='"+prjId+"' req-id='"+reqId+"' onclick='fnSpanReq4105Open(this)'>"+reqNm+"<li class='fa fa-share'></li></span>");
				armMap.put("armSendTypeCd", "02");
				
				
				arm1000DAO.insertArm1000AlarmInfo(armMap);
			}
			
			
			try{
				
				webHookUsrStatus = webhookSend.userWebhookSetting((String)paramMap.get("licGrpId"), reqSignId);
			}catch(Exception e){
				
			}
			
			if(webHookStatus || webHookUsrStatus){
				
				webhookAfterReqInfo = req4100DAO.selectReq4100ReqInfo(defaultReqInfo);
				
				
				webhookSend.setConnectInfo("프로젝트",  (String) webhookAfterReqInfo.get("prjNm"));
				webhookSend.setConnectInfo("요구사항 명",  (String) webhookAfterReqInfo.get("reqNm"));
				webhookSend.setConnectInfo("결재자",  (String) webhookAfterReqInfo.get("signUsrNm"));
				
				
				String messasgeJson = webhookSend.messageJsonSetting(whkRegUsrNm+"님이 요구사항 ["+webhookBeforeReqInfo.get("reqOrd")+"]("+projectUrl+"/data/req/"+webhookBeforeReqInfo.get("reqKey")+")(을)를 결재 요청 했습니다."
						,(String) webhookAfterReqInfo.get("flowTitleBgColor"));
				
				
				if(webHookStatus){
					webhookSend.prjSend(messasgeJson, "whkSignRequestCd");
				}
				
				
				if(webHookUsrStatus){
					webhookSend.usrSend(messasgeJson, "whkSignRequestCd");
				}
			}
			
		}else{
			
			if(flowNextNextId != null && !"null".equals(flowNextNextId)){
				
				Map<String, String> newOptMap = new HashMap<String,String>();
				newOptMap.put("licGrpId",(String)paramMap.get("licGrpId"));
				newOptMap.put("prjId",(String)paramMap.get("prjId"));
				newOptMap.put("reqId",(String)paramMap.get("reqId"));
				newOptMap.put("processId",(String)paramMap.get("processId"));
				newOptMap.put("flowId",(String)paramMap.get("flowNextId"));
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
			
			
			String flowNextId = (String)paramMap.get("flowNextId");
			if(flowNextId != null){
				
				
				Map newMap = new HashMap();
				newMap.putAll(paramMap);
				newMap.put("reqChgType", "01"); 
				newMap.put("chgUsrId", paramMap.get("regUsrId"));
				newMap.put("preFlowId", paramMap.get("flowId"));
				newMap.put("chgFlowId", paramMap.get("flowNextId"));
				newMap.put("preChargerId", preReqUsrId);
				newMap.put("chgChargerId", reqChargerId);
				
				
				req6001DAO.insertReq6001ReqChangeLogInfo(newMap);
				
				
				try{
					
					webHookUsrStatus = webhookSend.userWebhookSetting((String)paramMap.get("licGrpId"), preReqUsrId);
				}catch(Exception e){
					
				}
				
				if(webHookStatus || webHookUsrStatus){
					
					webhookAfterReqInfo = req4100DAO.selectReq4100ReqInfo(defaultReqInfo);
					
					
					String beforeFlowId = (String) webhookBeforeReqInfo.get("flowId");
					String afterFlowId = (String) webhookAfterReqInfo.get("flowId");
					
					
					if(beforeFlowId != null && !beforeFlowId.equals(afterFlowId)){
						
						webhookSend.setConnectInfo("프로젝트",  (String) webhookAfterReqInfo.get("prjNm"));
						webhookSend.setConnectInfo("요구사항 명",  (String) webhookAfterReqInfo.get("reqNm"));
						webhookSend.setConnectInfo("이전 작업흐름",  (String) webhookBeforeReqInfo.get("flowNm"));
						webhookSend.setConnectInfo("변경 작업흐름",  (String) webhookAfterReqInfo.get("flowNm"));
						
						
						String messasgeJson = webhookSend.messageJsonSetting(whkRegUsrNm+"님이 요구사항 ["+webhookBeforeReqInfo.get("reqOrd")+"]("+projectUrl+"/data/req/"+webhookBeforeReqInfo.get("reqKey")+")의 작업흐름을 변경 했습니다."
								,(String) webhookAfterReqInfo.get("flowTitleBgColor"));
						
						
						if(webHookStatus){
							webhookSend.prjSend(messasgeJson, "whkFlowChgCd");
						}
						
						
						if(webHookUsrStatus){
							webhookSend.usrSend(messasgeJson, "whkFlowChgCd");
						}
					}
				}
				
			}
		}
		
		return true;
	}
	
	@SuppressWarnings("rawtypes")
	@Override
	public Map selectReq4100ReqInfo(Map<String, String> paramMap) {
		return req4100DAO.selectReq4100ReqInfo(paramMap);
	}

	
	@SuppressWarnings({ "rawtypes"})
	@Override
	public int selectReq4100ReqUsrChk(Map paramMap)throws Exception {
		return req4100DAO.selectReq4100ReqUsrChk(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectReq4100RevisionList(Req4100VO req4100VO) throws Exception{
		return req4100DAO.selectReq4100RevisionList(req4100VO);
	}
	
	
	public int selectReq4100RevisionListCnt(Req4100VO req4100VO) throws Exception {
		return req4100DAO.selectReq4100RevisionListCnt(req4100VO);
	}
	
	@SuppressWarnings({ "rawtypes" })
	public List<Map> selectReq4100PrjAuthReqList(Map paramMap) throws Exception {
		return req4100DAO.selectReq4100PrjAuthReqList(paramMap);
	}
	

	
	@SuppressWarnings("rawtypes")
	public void updateReq4100ReqChargerChgInfoAjax(Map paramMap) throws Exception{
		req4100DAO.updateReq4100ReqChargerChgInfoAjax(paramMap);
		
		String reqId = (String)paramMap.get("reqId");
		String reqNm = (String)paramMap.get("reqNm");
		String prjId = (String)paramMap.get("prjId");
		String prjGrpId = (String)paramMap.get("prjGrpId");
		
		
		Map<String,String> armMap = new HashMap<String,String>();
		armMap.put("usrId", (String) paramMap.get("reqChargerId"));
		armMap.put("sendUsrId", (String) paramMap.get("usrId"));
		armMap.put("title", "["+reqNm+"] 접수 완료 요구사항에 담당자로 이관되었습니다.");
		armMap.put("content", "["+reqNm+"] 접수 완료 요구사항에 담당자로 이관되었습니다.<br>해당 요구사항을 확인해주세요.");
		armMap.put("reqIds", "<span name='tagReqId' id='tagReqId' prj-grp-id='"+prjGrpId+"' prj-id='"+prjId+"' req-id='"+reqId+"' onclick='fnSpanReq4105Open(this)'>"+reqNm+"<li class='fa fa-share'></li></span>");
		armMap.put("armSendTypeCd", "05");
		
		
		arm1000DAO.insertArm1000AlarmInfo(armMap);
	}

	
	
	@SuppressWarnings("rawtypes")
	@Override
	public void selectReq4100ExcelList(Map paramMap, ExcelDataListResultHandler resultHandler) throws Exception {
		req4100DAO.selectReq4100ExcelList(paramMap, resultHandler);
	}
	
	
	
	@SuppressWarnings({ "rawtypes"})
	public List<Map> selectReq4100ProcessReqList(Map paramMap) throws Exception {
		return req4100DAO.selectReq4100ProcessReqList(paramMap);
	}

	
	@SuppressWarnings({ "rawtypes" })
	public List<Map> selectReq4100ReqProTypeOrdList(Map paramMap) throws Exception {
		return req4100DAO.selectReq4100ReqProTypeOrdList(paramMap);
	}
	
	
	
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void updateReq4111ReqInfo(Map paramMap) throws Exception {
		
		String prjGrpId = (String)paramMap.get("selPrjGrpId");
		String prjId = (String)paramMap.get("prjId");
		String reqId = (String)paramMap.get("reqId");
		String reqNm = (String) paramMap.get("reqNm");
		
		
		String doneUsrId = (String) paramMap.get("doneUsrId");
		
		
		String reqUsrId = (String) paramMap.get("reqUsrId");
		
		
		
		boolean webHookStatus = false;
		
		
		boolean webHookUsrStatus = false;
				
		String whkRegUsrNm = "";
		String projectUrl = "";
		Map webhookBeforeReqInfo = null;
		Map webhookAfterReqInfo = null;
		
		try{
			webHookStatus = webhookSend.projectWebhookSetting(prjId);
			whkRegUsrNm =  (String)paramMap.get("whkRegUsrNm");

			
			webHookUsrStatus = webhookSend.userWebhookSetting((String)paramMap.get("licGrpId"), reqUsrId);
			
			
			webhookBeforeReqInfo = req4100DAO.selectReq4100ReqInfo(paramMap);

			
			projectUrl = EgovProperties.getProperty("Globals.project.url");
		}catch(Exception e){
			
		}
		
		
		
		List<Map> flowList = prj1100DAO.selectPrj1101FlowList(paramMap);
		
		String endNextId = "";
		
		for(Map flowInfo : flowList){
			if(flowInfo.get("flowNextId") == null){
				endNextId = (String) flowInfo.get("flowId");
				break;
			}
		}
		paramMap.put("doneFlowId", endNextId);
		
		
		paramMap.put("reqProType", "06");
		
		
		req4100DAO.updateReq4100ReqMiddleDoneInfoAjax(paramMap);

		
		Map newMap = new HashMap();
		newMap.putAll(paramMap);
		newMap.put("chgUsrId", doneUsrId);
		newMap.put("preFlowId", paramMap.get("preFlowId"));
		newMap.put("chgFlowId", paramMap.get("doneFlowId"));
		
		newMap.put("reqChgType", "04"); 
		
		
		req6001DAO.insertReq6001ReqChangeLogInfo(newMap);
		
		
		if(webHookStatus || webHookUsrStatus){
			
			webhookAfterReqInfo = req4100DAO.selectReq4100ReqInfo(paramMap);
		
			
			webhookSend.setConnectInfo("프로젝트",  (String) webhookAfterReqInfo.get("prjNm"));
			webhookSend.setConnectInfo("요구사항 명",  (String) webhookAfterReqInfo.get("reqNm"));
			webhookSend.setConnectInfo("종료 사유",  (String) paramMap.get("reqMiddleDoneTxt"));
			
			
			String messasgeJson = webhookSend.messageJsonSetting("담당자 "+whkRegUsrNm+"님이 요구사항 ["+webhookBeforeReqInfo.get("reqOrd")+"]("+projectUrl+"/data/req/"+webhookBeforeReqInfo.get("reqKey")+")(을)를 중간 종료 처리했습니다."
					,(String) webhookAfterReqInfo.get("flowTitleBgColor"));
			
			if(webHookStatus){
				webhookSend.prjSend(messasgeJson, "whkFlowchgCd");
			}
			
			
			if(webHookUsrStatus){
				webhookSend.usrSend(messasgeJson, "whkFlowchgCd");
			}
		}
		
		
		
		if(!doneUsrId.equals(reqUsrId)){
			
			Map<String,String> armMap = new HashMap<String,String>();
			armMap.put("usrId", reqUsrId);
			armMap.put("sendUsrId", doneUsrId);
			armMap.put("title", "["+reqNm+"] 요구사항이 중간 종료 처리 되었습니다.");
			armMap.put("content", "["+reqNm+"] 요구사항이 중간 종료 처리 되었습니다.</br>해당 요구사항을 확인해주세요.</br>종료 사유: "+paramMap.get("reqMiddleDoneTxt"));
			armMap.put("reqIds", "<span name='tagReqId' id='tagReqId' prj-grp-id='"+prjGrpId+"' prj-id='"+prjId+"' req-id='"+reqId+"' onclick='fnSpanReq4105Open(this)'>"+reqNm+"<li class='fa fa-share'></li></span>");
			armMap.put("armSendTypeCd", "07");
			
			
			arm1000DAO.insertArm1000AlarmInfo(armMap);
		}
	}	
}
