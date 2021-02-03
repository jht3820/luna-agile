package kr.opensoftlab.lunaops.stm.stm9000.stm9100.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.opensoftlab.lunaops.stm.stm9000.stm9100.service.Stm9100Service;


@Service("stm9100Service")
public class Stm9100ServiceImpl extends EgovAbstractServiceImpl implements Stm9100Service{

	
	@Resource(name="stm9100DAO")
    private Stm9100DAO stm9100DAO;

	
    @SuppressWarnings("rawtypes")
	public List<Map> selectStm9100JobList(Map paramMap) throws Exception {
		return stm9100DAO.selectStm9100JobList(paramMap);
	}
	
    
    @SuppressWarnings("rawtypes")
	public int selectStm9100JobListCnt(Map paramMap) throws Exception {
		return stm9100DAO.selectStm9100JobListCnt(paramMap);
	}
    
	
	@SuppressWarnings({"rawtypes" })
	public List<Map> selectStm9100JobNormalList(Map paramMap) throws Exception {
		return stm9100DAO.selectStm9100JobNormalList(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public Map selectStm9100JobInfo(Map<String, String> paramMap) throws Exception {
		return stm9100DAO.selectStm9100JobInfo(paramMap);
	}
	
	
	public String insertStm9100JobInfo(Map<String, String> paramMap) throws Exception {
		return stm9100DAO.insertStm9100JobInfo(paramMap);
	}
	
	
	public int updateStm9100JobInfo(Map<String, String> paramMap) throws Exception {
		return stm9100DAO.updateStm9100JobInfo(paramMap);
	}
	
	
	public Object saveStm9100JobInfo(Map<String, String> paramMap)  throws Exception{
		String insNewJenId ="";
		int result = 0;
		String type = (String)paramMap.get("type");
		
		if("insert".equals(type)){
			insNewJenId = stm9100DAO.insertStm9100JobInfo(paramMap);
			return insNewJenId;
			
		}else if("update".equals(type)){
			
			String beforeJobTypeCd = (String)paramMap.get("beforeJobTypeCd");
			String jobTypeCd = (String)paramMap.get("jobTypeCd");
			
			
			if("03".equals(beforeJobTypeCd)){
				
				if(!jobTypeCd.equals(beforeJobTypeCd)) {
					
					stm9100DAO.updateJen9100JenkinsJobRestoreInfo(paramMap);
				}
			}
			
			result = stm9100DAO.updateStm9100JobInfo(paramMap);
			return result;
		}
		return null;
	}
    
	
    @SuppressWarnings({"rawtypes", "unchecked"})
	public void deleteStm9100JobInfo(Map<String, String> paramMap) throws Exception {
		
		
		String deleteDataList = paramMap.get("deleteDataList");
		
		
		JSONParser jsonParser = new JSONParser();
		JSONArray jsonArray = (JSONArray) jsonParser.parse(deleteDataList);
		
		
		for(int i=0;i<jsonArray.size();i++) {
			JSONObject jsonObj = (JSONObject) jsonArray.get(i);
			
			
			Map delJobInfoMap = new Gson().fromJson(jsonObj.toJSONString(), new HashMap().getClass());
			delJobInfoMap.put("licGrpId", paramMap.get("licGrpId"));
			
			
			stm9100DAO.deleteStm9100JobInfo(delJobInfoMap);
			
			stm9100DAO.updateJen9100JenkinsJobRestoreInfo(delJobInfoMap);
		}
	}
    
    
	public int selectStm9100JobUseCountInfo(Map<String, String> paramMap) throws Exception {
		return stm9100DAO.selectStm9100JobUseCountInfo(paramMap);
	}

    
	
	@SuppressWarnings("rawtypes")
	public List selectJen1300JenkinsJobAuthGrpNormalList(Map paramMap) throws Exception {
		return stm9100DAO.selectJen1300JenkinsJobAuthGrpNormalList(paramMap);
	}
}
