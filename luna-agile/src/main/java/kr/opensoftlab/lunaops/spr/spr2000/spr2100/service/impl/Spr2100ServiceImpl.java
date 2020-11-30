package kr.opensoftlab.lunaops.spr.spr2000.spr2100.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.opensoftlab.lunaops.spr.spr2000.spr2100.service.Spr2100Service;




@Service("spr2100Service")
public class Spr2100ServiceImpl extends EgovAbstractServiceImpl implements Spr2100Service {

	
    @Resource(name="spr2100DAO")
    private Spr2100DAO spr2100DAO;

    
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;


	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private Map<String, String> selectSpr2100JsonToMap(Map paramMap){
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
				JSONParser jsonParser = new JSONParser();
				jsonObj = (JSONObject) jsonParser.parse(jsonVal);
				rtnMap.put(key, jsonObj.get("optVal"));
			}catch(Exception e){
				rtnMap.put(key, jsonVal);
			}
		}
		return rtnMap;
	}
	
	
	@SuppressWarnings("rawtypes")
	public int  selectSpr2100MmrListCnt(Map paramMap) throws Exception {
		return  spr2100DAO.selectSpr2100MmrListCnt(paramMap);
	} 
	
	
	@SuppressWarnings({ "rawtypes" })
	public List<Map> selectSpr2100MmrList(Map paramMap) throws Exception {
		return  spr2100DAO.selectSpr2100MmrList(paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public Map  selectSpr2100MmrInfo(Map paramMap) throws Exception {
		return  spr2100DAO.selectSpr2100MmrInfo(paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes"})
	public void  insertSpr2100MmrInfo(Map paramMap) throws Exception {
		Map<String, String> convertParamMap = selectSpr2100JsonToMap(paramMap);
		
		
		spr2100DAO.insertSpr2100MmrInfo(convertParamMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public void updateSpr2100MmrInfo(Map paramMap) throws Exception {
		
		Map<String, String> convertParamMap = selectSpr2100JsonToMap(paramMap);
		
		
		spr2100DAO.updateSpr2100MmrInfo(convertParamMap);
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void deleteSpr2100MmrList(Map paramMap) throws Exception {
		String deleteDataList = (String) paramMap.get("dataList");
		
		
		JSONParser jsonParser = new JSONParser();
		JSONArray jsonArray = (JSONArray) jsonParser.parse(deleteDataList);

		
		for(int i=0;i<jsonArray.size();i++) {
			JSONObject jsonObj = (JSONObject) jsonArray.get(i);
			
			
			Map infoMap = new Gson().fromJson(jsonObj.toJSONString(), new HashMap().getClass());
			
			
			infoMap.put("licGrpId", paramMap.get("licGrpId"));
			infoMap.put("prjGrpId", paramMap.get("prjGrpId"));
			infoMap.put("prjId", paramMap.get("prjId"));
			
			
			spr2100DAO.deleteSpr2100MmrInfo(infoMap);
		}
	}
}
