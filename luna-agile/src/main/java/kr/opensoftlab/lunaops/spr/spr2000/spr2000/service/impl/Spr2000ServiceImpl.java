package kr.opensoftlab.lunaops.spr.spr2000.spr2000.service.impl;

import java.util.ArrayList;
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
import kr.opensoftlab.lunaops.spr.spr2000.spr2000.service.Spr2000Service;



@Service("spr2000Service")
public class Spr2000ServiceImpl extends EgovAbstractServiceImpl implements Spr2000Service {

	
    @Resource(name="spr2000DAO")
    private Spr2000DAO spr2000DAO;
    
    
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private Map<String, String> selectSpr2000JsonToMap(Map paramMap){
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
	public int  selectSpr2000RptListCnt(Map paramMap) throws Exception {
		return  spr2000DAO.selectSpr2000RptListCnt(paramMap);
	} 
	
	
	@SuppressWarnings({ "rawtypes" })
	public List<Map> selectSpr2000RptList(Map paramMap) throws Exception {
		return  spr2000DAO.selectSpr2000RptList(paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public Map  selectSpr2000RptInfo(Map paramMap) throws Exception {
		return  spr2000DAO.selectSpr2000RptInfo(paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes"})
	public void  insertSpr2000RptInfo(Map paramMap) throws Exception {
		
		Map<String, String> convertParamMap = selectSpr2000JsonToMap(paramMap);
		
		
		String rptId = spr2000DAO.insertSpr2000RptInfo(convertParamMap);
		convertParamMap.put("rptId", rptId);
		
		
		
		String idStr = (String) convertParamMap.get("idList");

		
		if(idStr != null && !"[]".equals(idStr)) {
			idStr = idStr.substring(1, idStr.length()-1);
			idStr = idStr.replaceAll("\"", "");
			String[] usrId = idStr.split(",");
			
			if(usrId.length>0 && usrId[0] != "") {
				
				for(int i=0; i<usrId.length; i++) {
					convertParamMap.put("usrId", usrId[i]);
					convertParamMap.put("usrNo", Integer.toString(i));
					spr2000DAO.insertSpr2001RptMemList(convertParamMap);
				}
			}
		}
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public void updateSpr2000RptInfo(Map paramMap) throws Exception {
		
		Map<String, String> convertParamMap = selectSpr2000JsonToMap(paramMap);
		
		
		spr2000DAO.updateSpr2000RptInfo(convertParamMap);
		
		
		spr2000DAO.deleteSpr2001RptMemList(convertParamMap);
		
		
		
		String idStr = (String) convertParamMap.get("idList");

		
		if(idStr != null && !"[]".equals(idStr)) {
			idStr = idStr.substring(1, idStr.length()-1);
			idStr = idStr.replaceAll("\"", "");
			String[] usrId = idStr.split(",");
			
			if(usrId.length>0 && usrId[0] != "") {
				
				for(int i=0; i<usrId.length; i++) {
					convertParamMap.put("usrId", usrId[i]);
					convertParamMap.put("usrNo", Integer.toString(i));
					spr2000DAO.insertSpr2001RptMemList(convertParamMap);
				}
			}
		}
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void deleteSpr2000RptList(Map paramMap) throws Exception {
		String deleteDataList = (String) paramMap.get("dataList");
		
		
		JSONParser jsonParser = new JSONParser();
		JSONArray jsonArray = (JSONArray) jsonParser.parse(deleteDataList);

		
		for(int i=0;i<jsonArray.size();i++) {
			JSONObject jsonObj = (JSONObject) jsonArray.get(i);
			
			
			Map infoMap = new Gson().fromJson(jsonObj.toJSONString(), new HashMap().getClass());
			
			
			infoMap.put("licGrpId", paramMap.get("licGrpId"));
			infoMap.put("prjGrpId", paramMap.get("prjGrpId"));
			infoMap.put("prjId", paramMap.get("prjId"));
			
			
			spr2000DAO.deleteSpr2000RptInfo(infoMap);
			
			
			spr2000DAO.deleteSpr2001RptMemList(infoMap);
		}
	}

	
	@SuppressWarnings({ "rawtypes" })
	public List<Map>  selectSpr2001RptMemList(Map paramMap) throws Exception {
		return  spr2000DAO.selectSpr2001RptMemList(paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public void insertSpr2001RptMemList(Map paramMap) throws Exception {
		spr2000DAO.insertSpr2001RptMemList(paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public void deleteSpr2001RptMemList(Map paramMap) throws Exception {
		spr2000DAO.deleteSpr2001RptMemList(paramMap);
	}
}
