package kr.opensoftlab.lunaops.dpl.dpl1000.dpl1000.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Timer;

import javax.annotation.Resource;

import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.opensoftlab.lunaops.arm.arm1000.arm1000.service.impl.Arm1000DAO;
import kr.opensoftlab.lunaops.dpl.dpl1000.dpl1000.service.Dpl1000Service;
import kr.opensoftlab.lunaops.dpl.dpl1000.dpl1000.vo.Dpl1000VO;
import kr.opensoftlab.lunaops.dpl.dpl1000.dpl1000.vo.Dpl1300VO;
import kr.opensoftlab.lunaops.dpl.dpl2000.dpl2100.service.Dpl2100Service;
import kr.opensoftlab.lunaops.stm.stm9000.stm9000.service.Stm9000Service;
import kr.opensoftlab.lunaops.stm.stm9000.stm9100.service.Stm9100Service;
import kr.opensoftlab.sdf.excel.ExcelDataListResultHandler;
import kr.opensoftlab.sdf.jenkins.vo.AutoBuildVO;
import kr.opensoftlab.sdf.jenkins.vo.BuildVO;
import kr.opensoftlab.sdf.jenkins.vo.ChangePathsVO;
import kr.opensoftlab.sdf.jenkins.vo.ChangeVO;
import kr.opensoftlab.sdf.jenkins.vo.GlobalDplListVO;


@Service("dpl1000Service")
public class Dpl1000ServiceImpl  extends EgovAbstractServiceImpl implements Dpl1000Service{

	
    @Resource(name="arm1000DAO")
    private Arm1000DAO arm1000DAO;
    
	
    @Resource(name="dpl1000DAO")
    private Dpl1000DAO dpl1000DAO;
    
    
    @Resource(name = "dpl2100Service")
    private Dpl2100Service dpl2100Service;
    
    @Resource(name = "stm9000Service")
    private Stm9000Service stm9000Service;
    
	@Resource(name = "stm9100Service")
	private Stm9100Service stm9100Service;
	
	
	@SuppressWarnings("rawtypes")
	public int selectDpl1000ListCnt(Map paramMap) throws Exception{
		return  dpl1000DAO.selectDpl1000ListCnt(paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public List<Map> selectDpl1000List(Map paramMap) throws Exception{
		return  dpl1000DAO.selectDpl1000List(paramMap);
	}
	
	
	@SuppressWarnings({"rawtypes" })
	public List selectDpl1400DplBldNumList(Map paramMap)  throws Exception{
		return dpl1000DAO.selectDpl1400DplBldNumList(paramMap);
	}
	
	
	@SuppressWarnings({"rawtypes" })
	public int selectDpl1400DplBldNumListCnt(Map paramMap)  throws Exception{
		return dpl1000DAO.selectDpl1400DplBldNumListCnt(paramMap);
	}
	
	
	
	@SuppressWarnings("rawtypes")
	public List selectDpl1000DeployNmList(Map inputMap) throws Exception {
		return dpl1000DAO.selectDpl1000DeployNmList(inputMap);
    }
	
	
	@SuppressWarnings({"rawtypes" })
	public List selectDpl1000DeployVerNormalList(Map inputMap)  throws Exception{
		return dpl1000DAO.selectDpl1000DeployVerNormalList(inputMap);
	} 
	
    
	public List<Dpl1000VO> selectDpl1000DeployVerInfoList(Dpl1000VO dpl1000VO) throws Exception {
		return dpl1000DAO.selectDpl1000DeployVerInfoList(dpl1000VO);
    }
	
	
	@SuppressWarnings("rawtypes")
	public Map selectDpl1000DeployVerInfo(Map map) throws Exception {
		return dpl1000DAO.selectDpl1000DeployVerInfo(map);
	}
	
    
	@SuppressWarnings("rawtypes")
	public List selectDpl1000ReqCount(Map inputMap) throws Exception {
		return dpl1000DAO.selectDpl1000ReqCount(inputMap);
    }
	
	
	@SuppressWarnings({"rawtypes" })
	public List selectDpl1300DeployJobList(Map inputMap)  throws Exception{
		return dpl1000DAO.selectDpl1300DeployJobList(inputMap);
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Dpl1300VO> selectDpl1300dplJobGridList(Dpl1300VO dpl1300VO)  throws Exception{
		return dpl1000DAO.selectDpl1300dplJobGridList(dpl1300VO);
	} 
	
	
	public int selectDpl1300dplJobGridListCnt(Dpl1300VO dpl1300VO) throws Exception {
		return dpl1000DAO.selectDpl1300dplJobGridListCnt(dpl1300VO);
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void insertDpl1000DeployVerInfo(Map paramMap) throws Exception{
		
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
		paramMap = rtnMap;
		
		
		paramMap.put("dplStsCd", "01");
		
		
		String prjId = (String)paramMap.get("prjId");
		
		
		String dplId = dpl1000DAO.insertDpl1000DeployVerInfo(paramMap);
		paramMap.put("dplId", dplId);
		
    	
    	JSONArray selJobList = new JSONArray(paramMap.get("selJobList").toString());
    	
    	
    	for(int i=0; i<selJobList.length(); i++){
    		JSONObject jsonObj = selJobList.getJSONObject(i);
    		
    		
    		HashMap<String, Object> jobInfo = new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ;
    		jobInfo.put("prjId", prjId);
    		jobInfo.put("dplId", dplId);
    		
    		dpl1000DAO.insertDpl1300DeployJobInfo(jobInfo);
    	}
    	
    	
    	paramMap.put("signRegUsrId", paramMap.get("regUsrId"));
    	paramMap.put("signStsCd", "04");
    	paramMap.put("signTxt", paramMap.get("dplSignTxt"));
    	
    	
    	dpl2100Service.insertDpl2100DplSignWaitInfo(paramMap);
    	
    	
    	String regUsrId = (String)paramMap.get("regUsrId");
    	
    	
    	String dplUsrId = (String)paramMap.get("dplUsrId");
    	
    	
    	String dplNm = (String)paramMap.get("dplNm");
    	
    	
    	
    	if(!dplUsrId.equals(regUsrId)){
    		
    		Map<String,String> armMap = new HashMap<String,String>();
    		armMap.put("usrId", dplUsrId);
    		armMap.put("sendUsrId", regUsrId);
    		armMap.put("title", "["+dplNm+"] 배포계획에 배포자로 지정되었습니다.");
    		armMap.put("content", "["+dplNm+"] 배포계획에 배포자로 지정되었습니다.<br>해당 배포계획을 확인해주세요.");
    		armMap.put("reqIds", "<span name='tagDplId' id='tagDplId' prj-id='"+prjId+"' dpl-id='"+dplId+"' onclick='fnSpanDplDetailOpen(this)'>"+dplNm+"<li class='fa fa-share'></li></span>");
    		armMap.put("armSendTypeCd", "06");
    		
    		
    		arm1000DAO.insertArm1000AlarmInfo(armMap);
    	}
    }

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void updateDpl1000DeployVerInfo(Map paramMap) throws Exception{
		
		
		
		this.insertDpl1500DplInfoModifyList(paramMap);
		
		
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
		paramMap = rtnMap;
		
		
		Map beforeDplInfo = dpl1000DAO.selectDpl1000DeployVerInfo(paramMap);
		
		
		dpl1000DAO.deleteDpl1300DplJobList(paramMap);
		
		
		
		String prjId = (String)paramMap.get("prjId");
		
    	
    	dpl1000DAO.updateDpl1000DeployVerInfo(paramMap);
    	
		
		String dplId = (String)beforeDplInfo.get("dplId");
		paramMap.put("dplId", dplId);
		
    	
    	JSONArray selJobList = new JSONArray(paramMap.get("selJobList").toString());
    	
    	
    	for(int i=0; i<selJobList.length(); i++){
    		JSONObject jsonObj = selJobList.getJSONObject(i);
    		
    		
    		HashMap<String, Object> jobInfo = new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ;
    		jobInfo.put("prjId", prjId);
    		jobInfo.put("dplId", dplId);
    		
    		dpl1000DAO.insertDpl1300DeployJobInfo(jobInfo);
    	}
    	
    	
    	paramMap.put("signRegUsrId", paramMap.get("regUsrId"));
    	
    	
    	String regUsrId = (String)paramMap.get("regUsrId");
    	
    	
    	String dplUsrId = (String)paramMap.get("dplUsrId");
    	
    	
    	String beforeDplUsrId = (String)beforeDplInfo.get("dplUsrId");
    	
    	
    	String dplNm = (String)paramMap.get("dplNm");
    	
    	
    	if(!dplUsrId.equals(regUsrId)){
    		
    		if(!beforeDplUsrId.equals(dplUsrId)){
    			
    			Map<String,String> armMap = new HashMap<String,String>();
    			armMap.put("usrId", dplUsrId);
    			armMap.put("sendUsrId", regUsrId);
    			armMap.put("title", "["+dplNm+"] 배포계획에 배포자로 지정되었습니다.");
    			armMap.put("content", "["+dplNm+"] 배포계획에 배포자로 지정되었습니다.<br>해당 배포계획을 확인해주세요.");
    			armMap.put("reqIds", "<span name='tagDplId' id='tagDplId' prj-id='"+prjId+"' dpl-id='"+dplId+"' onclick='fnSpanDplDetailOpen(this)'>"+dplNm+"<li class='fa fa-share'></li></span>");
    			armMap.put("armSendTypeCd", "06");
    			
    			
    			arm1000DAO.insertArm1000AlarmInfo(armMap);
    		}
    	}
    	
    	
    	paramMap.put("signRegUsrId", paramMap.get("regUsrId"));
    	paramMap.put("signStsCd", "05");
    	paramMap.put("signTxt", paramMap.get("dplSignTxt"));
    	
    	
    	dpl2100Service.insertDpl2100DplSignWaitInfo(paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void updateDpl1000DplStsCdInfo(Map paramMap) throws Exception{
		
		Map beforeDplInfo = dpl1000DAO.selectDpl1000DeployVerInfo(paramMap);
		
		
		dpl1000DAO.updateDpl1000DplStsCdInfo(paramMap);
		
		
		String newChgId = dpl1000DAO.selectDpl1500NewChgId(paramMap);
		paramMap.put("chgId", newChgId);
		
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.putAll(paramMap);
		
		
		map.put("chgNum", 0);
		map.put("chgTypeCd", "01");
		map.put("chgNm", "배포 상태");	
		map.put("preVal", beforeDplInfo.get("dplStsCd")); 
		map.put("chgVal", paramMap.get("dplStsCd"));	
		map.put("chgOptTypeCd", "02");	
		map.put("chgCommonCd", "DPL00001");	
		map.put("chgUsrId", paramMap.get("regUsrId"));
		
		
		dpl1000DAO.insertDpl1500ModifyHistoryInfo(map);
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void deleteDpl1000DeployVerInfo(Map paramMap) throws Exception{
		
		List<Map<String,String>> list = (List<Map<String,String>>) paramMap.get("list");
		
		
		String prjId = (String)paramMap.get("prjId");
		
		int listSize = list.size();
		List<AutoBuildVO> autoList = GlobalDplListVO.getDplList();
		
		for (int i = 0; i < listSize; i++) {
			Map<String,String> dplMap = list.get(i);
			dplMap.put("prjId", prjId);
			
			
			String dplId = dplMap.get("dplId");
			
			
			dpl1000DAO.deleteDpl1000DeployVerInfo(dplMap);
			
			
			for(int j=0;j<autoList.size();j++){
				AutoBuildVO autoInfo = autoList.get(j);
				
				
				String targetPrjId = autoInfo.getPrjId();
				String targetDplId = autoInfo.getDplAutoAfterCd();

				
				if(prjId.equals(targetPrjId) && dplId.equals(targetDplId)){
					
					Timer timer = autoInfo.getAutoDplTimer();
					timer.cancel();
					
					
					autoList.remove(j);
					break;
				}
			}
		}
    }
	
	
	@Override
	public int selectDpl1000ListCnt(Dpl1000VO dpl1000VO) throws Exception{
		return dpl1000DAO.selectDpl1000ListCnt(dpl1000VO);
	}
	

	
	@Override
	public void selectDpl1000ExcelList(Dpl1000VO dpl1000vo, ExcelDataListResultHandler resultHandler) throws Exception {
		dpl1000DAO.selectDpl1000ExcelList(dpl1000vo, resultHandler);
	}

	
	@Override
	public List<Dpl1000VO> selectDpl1000BuildInfoList(Dpl1000VO dpl1000VO) throws Exception{
		return dpl1000DAO.selectDpl1000BuildInfoList(dpl1000VO);
	}
	
	
	@Override
	public int selectDpl1000BuildInfoListCnt(Dpl1000VO dpl1000VO) throws Exception{
		return dpl1000DAO.selectDpl1000BuildInfoListCnt(dpl1000VO);
	}
	
	
	@SuppressWarnings({"rawtypes" })
	public Map selectDpl1400DplJobBuildInfo(Map map)  throws Exception{
		return dpl1000DAO.selectDpl1400DplJobBuildInfo(map);
	}
	
	
	@SuppressWarnings({"rawtypes" })
	public Map selectDpl1400DplSelBuildInfoAjax(Map map)  throws Exception{
		return dpl1000DAO.selectDpl1400DplSelBuildInfoAjax(map);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void deleteDpl1300DplJobList(Map paramMap)  throws Exception{
		dpl1000DAO.deleteDpl1300DplJobList(paramMap);
	}
	
	
	public int insertDpl1400DeployJobBuildLogInfo(BuildVO buildVo) throws Exception{
		int bldSeq = dpl1000DAO.insertDpl1400DeployJobBuildLogInfo(buildVo);
		
		
		List<ChangeVO> changeSetList = buildVo.getChangeSetList();
		
		
		if(changeSetList != null) {
			for(ChangeVO changeSetInfo : changeSetList) {
				
				List<ChangePathsVO> changePathsList = changeSetInfo.getPaths();
				
				
				if(changePathsList != null && changePathsList.size() > 0) {
					for(ChangePathsVO changePathInfo : changePathsList) {
						
						changePathInfo.setBldSeq(bldSeq);
						
						changePathInfo.setRevision(changeSetInfo.getRevision());
						
						
						dpl1000DAO.insertDpl1600DeployBuildChgPathLogInfo(changePathInfo);
					}
				}
				
				changeSetInfo.setBldSeq(bldSeq);
				
				
				dpl1000DAO.insertDpl1600DeployBuildChgLogInfo(changeSetInfo);
			}
		}
		
		return bldSeq;
    }
	
	
	@SuppressWarnings({"rawtypes", "unchecked" })
	public Map selectDpl1300ToStm9000JobInfo(Map map)  throws Exception{
		return stm9100Service.selectStm9100JobInfo(map);
	}
	
	
	@SuppressWarnings({"rawtypes" })
	public List selectDpl1000DplHistoryList(Map inputMap)  throws Exception{
		return dpl1000DAO.selectDpl1000DplHistoryList(inputMap);
	}
	
	
	@SuppressWarnings({"rawtypes", "unchecked" })
	public void insertDpl1000DplSignRequestList(Map paramMap)  throws Exception{
		
    	paramMap.put("signRegUsrId", paramMap.get("regUsrId"));
    	
    	paramMap.put("signStsCd", "01");
    	paramMap.put("signTxt", paramMap.get("dplSignTxt"));
    	
    	
    	dpl2100Service.insertDpl2100DplSignWaitInfo(paramMap);
    	
    	
    	String regUsrId = (String)paramMap.get("regUsrId");
    	
    	
    	String signUsrId = (String)paramMap.get("signUsrId");
    	
    	
    	String dplNm = (String)paramMap.get("dplNm");
    	
    	
		if(!signUsrId.equals(regUsrId)){
    		
    		String prjId = (String) paramMap.get("prjId");
    		
    		
    		String dplId = (String) paramMap.get("dplId");
    		
    		
    		Map<String,String> armMap = new HashMap<String,String>();
    		armMap.put("usrId", signUsrId);
    		armMap.put("sendUsrId", regUsrId);
    		armMap.put("title", "["+dplNm+"] 배포계획에 결재자로 지정되었습니다.");
    		armMap.put("content", "["+dplNm+"] 배포계획에 결재자로 지정되었습니다.<br>해당 배포계획을 확인해주세요.");
    		armMap.put("reqIds", "<span name='tagDplId' id='tagDplId' prj-id='"+prjId+"' dpl-id='"+dplId+"' onclick='fnSpanDplDetailOpen(this)'>"+dplNm+"<li class='fa fa-share'></li></span>");
    		armMap.put("armSendTypeCd", "02");
    		
    		
    		arm1000DAO.insertArm1000AlarmInfo(armMap);
    	}
	}
	
		
	@SuppressWarnings("rawtypes")
	public String selectDpl1500NewChgId(Map paramMap) throws Exception{
		return dpl1000DAO.selectDpl1500NewChgId(paramMap);
	}
	
		
	@SuppressWarnings("rawtypes")
	public String insertDpl1500ModifyHistoryInfo(Map paramMap) throws Exception{
		return dpl1000DAO.insertDpl1500ModifyHistoryInfo(paramMap);
	}
	
	
		
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void insertDpl1500DplInfoModifyList(Map paramMap) throws Exception{
		
		Map beforeDplInfo = dpl1000DAO.selectDpl1000DeployVerInfo(paramMap);
		
		
		String newChgId = dpl1000DAO.selectDpl1500NewChgId(paramMap);
		paramMap.put("chgId", newChgId);
		
		
		int chgNum = 0;
		
		for( Object key : paramMap.keySet() ) {
				String jsonVal = "";
				if(paramMap.get(key) instanceof ArrayList){
					jsonVal = paramMap.get(key).toString();
				}else{
					jsonVal = (String) paramMap.get(key);
				}
				
				JSONObject jsonObj = null;
				
				
				Map defaultReqInfo = new HashMap();
				
				
				try{
					jsonObj = new JSONObject(jsonVal);
				}catch(JSONException jsonE){
					defaultReqInfo.put(key, paramMap.get(key).toString());
					continue;
				}catch(Exception e){
					continue;
				}
				
				String modifyset = String.valueOf(jsonObj.get("modifySetCd"));
				
				
				if("02".equals(modifyset)){
					continue;
				}
				
				
				String paramVal = String.valueOf(jsonObj.get("optVal"));
				
				
				String opttarget = String.valueOf(jsonObj.get("chgDetailOptTarget"));
				String dplInfoVal = "";
				String chgTypeCd = "00";
				
				
				if("01".equals(opttarget)){
					
					if(beforeDplInfo.containsKey(key)){
						dplInfoVal = String.valueOf(beforeDplInfo.get(key));
						chgTypeCd = "01";	
					}else{
						continue;
					}
				}
				
				
				if(paramVal == null || "".equals(paramVal) || "undefined".equals(paramVal)){
					
					paramVal = "";
				}
				if(dplInfoVal == null || "".equals(dplInfoVal) || "null".equals(dplInfoVal)){
					dplInfoVal = "";
				}
				
				
				
				if(!(paramVal).equals(dplInfoVal)){
					
					Map<String, Object> map = new HashMap<String, Object>();
					map.putAll(paramMap);
					
					
					map.put("chgNum", chgNum);
					map.put("chgTypeCd", chgTypeCd);
					map.put("chgNm", jsonObj.get("optNm"));	
					map.put("preVal", dplInfoVal); 
					map.put("chgVal", jsonObj.get("optVal"));	
					map.put("chgOptTypeCd", jsonObj.get("chgDetailOptType"));	
					map.put("chgCommonCd", jsonObj.get("chgDetailCommonCd"));	
					map.put("chgUsrId", paramMap.get("regUsrId"));
					
					
					dpl1000DAO.insertDpl1500ModifyHistoryInfo(map);
					
					
					chgNum++;
				}
		}
		
	}
	
	
		
	@SuppressWarnings("rawtypes")
	public List selectDpl1500ModifyHistoryList(Map paramMap) throws Exception{
		return dpl1000DAO.selectDpl1500ModifyHistoryList(paramMap);
	}
	
		
	@SuppressWarnings("rawtypes")
	public List selectDpl1000AllDplList(Map paramMap) throws Exception{
		return dpl1000DAO.selectDpl1000AllDplList(paramMap);
	}
	

	
	public void insertDpl1600DeployBuildChgLogInfo(ChangeVO changeSetInfo) throws Exception{
		dpl1000DAO.insertDpl1600DeployBuildChgLogInfo(changeSetInfo);
	}
	
	public void insertDpl1600DeployBuildChgPathLogInfo(ChangePathsVO ChangePathInfo) throws Exception{
		dpl1000DAO.insertDpl1600DeployBuildChgPathLogInfo(ChangePathInfo);
	}
	

	
	@SuppressWarnings({"rawtypes" })
	public List selectDpl1600SvnChangeLogsList(Map paramMap)  throws Exception{
		return dpl1000DAO.selectDpl1600SvnChangeLogsList(paramMap);
	}
	
	
	@SuppressWarnings({"rawtypes" })
	public List selectDpl1700SvnChangePathList(Map paramMap)  throws Exception{
		return dpl1000DAO.selectDpl1700SvnChangePathList(paramMap);
	}
}
