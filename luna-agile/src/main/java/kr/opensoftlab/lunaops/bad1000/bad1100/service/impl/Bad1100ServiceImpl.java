package kr.opensoftlab.lunaops.bad.bad1000.bad1100.service.impl;

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
import kr.opensoftlab.lunaops.bad.bad1000.bad1100.service.Bad1100Service;



@Service("bad1100Service")
public class Bad1100ServiceImpl extends EgovAbstractServiceImpl implements Bad1100Service{

	
	@Resource(name="bad1100DAO")
	private Bad1100DAO bad1100DAO;
	
	
	@SuppressWarnings("rawtypes")
	public int selectBad1100CmtListCnt(Map paramMap) throws Exception{
		return bad1100DAO.selectBad1100CmtListCnt(paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public List<Map> selectBad1100CmtList(Map paramMap) throws Exception{
		return bad1100DAO.selectBad1100CmtList(paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public void insertBad1100CmtInfo(Map paramMap) throws Exception{
		bad1100DAO.insertBad1100CmtInfo(paramMap);
	}

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void deleteBad1100CmtInfo(Map paramMap) throws Exception{
		
		String deleteDataList = (String) paramMap.get("deleteDataList");
		Map deleteDataType =  new Gson().fromJson((String) paramMap.get("deleteDataType"), new HashMap().getClass());
		
		
		JSONParser jsonParser = new JSONParser();
		JSONArray jsonArray = (JSONArray) jsonParser.parse(deleteDataList);

		JSONObject jsonObj = null;
		
		
		for(int i=0; i<jsonArray.size(); i++) {
			jsonObj = (JSONObject) jsonArray.get(i);
			
			Map infoMap = new Gson().fromJson(jsonObj.toJSONString(), new HashMap().getClass());
			
			infoMap.put("delTypeCd", deleteDataType.get("delTypeCd"));
			infoMap.put("delTxt", deleteDataType.get("delTxt"));
		
			
			infoMap.put("menuId", paramMap.get("menuId"));
			infoMap.put("licGrpId", paramMap.get("licGrpId"));
			infoMap.put("modifyUsrId", paramMap.get("modifyUsrId"));
			infoMap.put("modifyUsrIp", paramMap.get("modifyUsrIp"));
			
			
			bad1100DAO.deleteBad1100CmtInfo(infoMap);
		}
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void deleteBad1100CmtDelInfo(Map paramMap) throws Exception{
		
		String deleteDataList = (String) paramMap.get("deleteDataList");
		
		
		JSONParser jsonParser = new JSONParser();
		JSONArray jsonArray = (JSONArray) jsonParser.parse(deleteDataList);
		
		JSONObject jsonObj = null;
		
		
		for(int i=0; i<jsonArray.size(); i++) {
			jsonObj = (JSONObject) jsonArray.get(i);
			
			Map infoMap = new Gson().fromJson(jsonObj.toJSONString(), new HashMap().getClass());
			
			
			infoMap.put("menuId", paramMap.get("menuId"));
			infoMap.put("licGrpId", paramMap.get("licGrpId"));
			infoMap.put("modifyUsrId", paramMap.get("modifyUsrId"));
			infoMap.put("modifyUsrIp", paramMap.get("modifyUsrIp"));
			
			
			bad1100DAO.deleteBad1100CmtDelInfo(infoMap);
		}
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void updateBad1100CmtRestore(Map paramMap) throws Exception{
		
		bad1100DAO.updateBad1100CmtRestore(paramMap);
	}
}
