package kr.opensoftlab.lunaops.stm.stm9000.stm9000.service.impl;

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
import kr.opensoftlab.lunaops.stm.stm9000.stm9000.service.Stm9000Service;


@Service("stm9000Service")
public class Stm9000ServiceImpl  extends EgovAbstractServiceImpl implements Stm9000Service{

	
    @Resource(name="stm9000DAO")
    private Stm9000DAO stm9000DAO;   

    
    @SuppressWarnings("rawtypes")
	public List<Map> selectStm9000JenkinsList(Map paramMap) throws Exception {
		return stm9000DAO.selectStm9000JenkinsList(paramMap);
	}
	
	
    @SuppressWarnings("rawtypes")
	public int selectStm9000JenkinsListCnt(Map paramMap) throws Exception {
		return stm9000DAO.selectStm9000JenkinsListCnt(paramMap);
	}
    
	
	@SuppressWarnings({ "rawtypes" })
	public List<Map> selectStm9000JenkinsNormalList(Map paramMap) throws Exception {
		return stm9000DAO.selectStm9000JenkinsNormalList(paramMap);
	}
    
    
	@SuppressWarnings("rawtypes")
	public Map selectStm9000JenkinsInfo(Map<String, String> paramMap) throws Exception {
		return stm9000DAO.selectStm9000JenkinsInfo(paramMap);
	}
	
	
	public String insertStm9000JenkinsInfo(Map<String, String> paramMap) throws Exception {
		return stm9000DAO.insertStm9000JenkinsInfo(paramMap);
	}
	
	
	public int updateStm9000JenkinsInfo(Map<String, String> paramMap) throws Exception {
		return stm9000DAO.updateStm9000JenkinsInfo(paramMap);
	}
	
	
	public Object saveStm9000JenkinsInfo(Map<String, String> paramMap)  throws Exception{
		String insNewJenId ="";
		int result = 0;
		String type = (String)paramMap.get("type");
		
		if("insert".equals(type)){
			insNewJenId = stm9000DAO.insertStm9000JenkinsInfo(paramMap);
			return insNewJenId;
		}else if("update".equals(type)){
			result = stm9000DAO.updateStm9000JenkinsInfo(paramMap);
			return result;
		}
		return null;
	}

	
	@SuppressWarnings({"rawtypes", "unchecked"})
	public void deleteStm9000JenkinsInfo(Map<String, String> paramMap)  throws Exception{
		
		
		String deleteDataList = paramMap.get("deleteDataList");
		
		
		JSONParser jsonParser = new JSONParser();
		JSONArray jsonArray = (JSONArray) jsonParser.parse(deleteDataList);
		
		
		for(int i=0;i<jsonArray.size();i++) {
			JSONObject jsonObj = (JSONObject) jsonArray.get(i);
			
			
			Map delJenInfoMap = new Gson().fromJson(jsonObj.toJSONString(), new HashMap().getClass());
			
			delJenInfoMap.put("delCd", "01");
			
			
			stm9000DAO.deleteStm9000JenkinsInfo(delJenInfoMap);
		}
	}
	
}
