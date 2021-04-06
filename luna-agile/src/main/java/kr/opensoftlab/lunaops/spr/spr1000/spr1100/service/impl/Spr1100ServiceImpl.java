package kr.opensoftlab.lunaops.spr.spr1000.spr1100.service.impl;

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
import kr.opensoftlab.lunaops.spr.spr1000.spr1100.service.Spr1100Service;



@Service("spr1100Service")
public class Spr1100ServiceImpl extends EgovAbstractServiceImpl implements Spr1100Service {

	
    @Resource(name="spr1100DAO")
    private Spr1100DAO spr1100DAO;
    
	
	@SuppressWarnings("rawtypes")
	public int  selectSpr1100ReqListCnt(Map paramMap) throws Exception {
		return spr1100DAO.selectSpr1100ReqListCnt(paramMap);
	} 
	
	
	@SuppressWarnings("rawtypes" )
	public List<Map> selectSpr1100ReqList(Map paramMap) throws Exception {
		return spr1100DAO.selectSpr1100ReqList(paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void insertSpr1100ReqList(Map paramMap) throws Exception {
		
		String listStr = (String) paramMap.get("dataList");
		
		
		JSONParser jsonParser = new JSONParser();
		JSONArray jsonArray = null;
		Map infoMap = null;
		JSONObject jsonObj = null;
		
		jsonArray = (JSONArray) jsonParser.parse(listStr);
	
		for(int i=0; i<jsonArray.size(); i++)
		{
			jsonObj = (JSONObject) jsonArray.get(i);
			
			
			infoMap = new Gson().fromJson(jsonObj.toJSONString(), new HashMap().getClass());
			
			
			paramMap.put("reqId", infoMap.get("reqId"));
			
			
			spr1100DAO.insertSpr1100ReqInfo(paramMap);
		}
	} 
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void deleteSpr1100ReqList(Map paramMap) throws Exception {
		
		String listStr = (String) paramMap.get("dataList");
		
		
		JSONParser jsonParser = new JSONParser();
		JSONArray jsonArray = null;
		Map infoMap = null;
		JSONObject jsonObj = null;
		
		jsonArray = (JSONArray) jsonParser.parse(listStr);
	
		for(int i=0; i<jsonArray.size(); i++)
		{
			jsonObj = (JSONObject) jsonArray.get(i);
			
			
			infoMap = new Gson().fromJson(jsonObj.toJSONString(), new HashMap().getClass());
			
			
			paramMap.put("reqId", infoMap.get("reqId"));
			
			
			spr1100DAO.deleteSpr1100ReqInfo(paramMap);
		}
	}

	
	@SuppressWarnings("rawtypes")
	public int updateSpr1100ReqResultInfo(Map paramMap) throws Exception {
		return spr1100DAO.updateSpr1100ReqResultInfo(paramMap);
	} 
	

	
	@SuppressWarnings("rawtypes" )
	public Map selectSpr1100ReqResultInfo(Map paramMap) throws Exception {
		return spr1100DAO.selectSpr1100ReqResultInfo(paramMap);
	}
}
