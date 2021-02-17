package kr.opensoftlab.lunaops.stm.stm9000.stm9200.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.opensoftlab.lunaops.stm.stm9000.stm9200.service.Stm9200Service;


@Service("stm9200Service")
public class Stm9200ServiceImpl extends EgovAbstractServiceImpl implements Stm9200Service{
	
	
	@Resource(name="stm9200DAO")
    private Stm9200DAO stm9200DAO;
	
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectStm9200PrjAssignJenkinsJobList(Map paramMap) throws Exception{
		return stm9200DAO.selectStm9200PrjAssignJenkinsJobList(paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public int selectStm9200PrjAssignJenkinsJobListCnt(Map paramMap) throws Exception{
		return stm9200DAO.selectStm9200PrjAssignJenkinsJobListCnt(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectStm9200PrjNotAssignJenkinsJobList(Map paramMap) throws Exception{
		return stm9200DAO.selectStm9200PrjNotAssignJenkinsJobList(paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public int selectStm9200PrjNotAssignJenkinsJobListCnt(Map paramMap) throws Exception{
		return stm9200DAO.selectStm9200PrjNotAssignJenkinsJobListCnt(paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void insertStm9200JenkinsJobInfo(Map paramMap) throws Exception {
		
		String licGrpId = (String)paramMap.get("licGrpId");
		String prjGrpId = (String)paramMap.get("prjGrpId");
		String prjId = (String)paramMap.get("prjId");
		
		
    	JSONArray selJobList = new JSONArray(paramMap.get("dataList").toString());
		
    	
    	for(int i=0; i < selJobList.length(); i++){
    		
    		JSONObject jsonObj = selJobList.getJSONObject(i);
    		
    		
    		HashMap<String, Object> assignJobInfoMap = new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ;
			
    		
    		assignJobInfoMap.put("licGrpId", licGrpId);
    		assignJobInfoMap.put("prjGrpId", prjGrpId);
    		assignJobInfoMap.put("prjId", prjId);
    		assignJobInfoMap.put("jenId", String.valueOf(jsonObj.get("jenId")));
    		assignJobInfoMap.put("jobId", String.valueOf(jsonObj.get("jobId"))); 
    		assignJobInfoMap.put("regUsrId", paramMap.get("regUsrId")); 
    		assignJobInfoMap.put("regUsrIp", paramMap.get("regUsrIp")); 
    		assignJobInfoMap.put("modifyUsrId", paramMap.get("regUsrId")); 
    		assignJobInfoMap.put("modifyUsrIp", paramMap.get("regUsrId")); 
    		
    		
    		stm9200DAO.insertStm9200JenkinsJobInfo(assignJobInfoMap);
    	}
	} 
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void deleteStm9200JenkinsJobInfo(Map paramMap) throws Exception {
		
		String licGrpId = (String)paramMap.get("licGrpId");
		String prjGrpId = (String)paramMap.get("prjGrpId");
		String prjId = (String)paramMap.get("prjId");
		
		
    	JSONArray selJobList = new JSONArray(paramMap.get("dataList").toString());
		
    	
    	for(int i=0; i < selJobList.length(); i++){
    		
    		JSONObject jsonObj = selJobList.getJSONObject(i);
    		
    		
    		HashMap<String, Object> delJobInfoMap = new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ;
			
    		
    		delJobInfoMap.put("licGrpId", licGrpId);
    		delJobInfoMap.put("prjGrpId", prjGrpId);
    		delJobInfoMap.put("prjId", prjId);
    		delJobInfoMap.put("jenId", String.valueOf(jsonObj.get("jenId")));
    		delJobInfoMap.put("jobId", String.valueOf(jsonObj.get("jobId"))); 
    		
    		
    		stm9200DAO.deleteStm9200JenkinsJobInfo(delJobInfoMap);
    	}
	} 
}
