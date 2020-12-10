package kr.opensoftlab.lunaops.spr.spr1000.spr1100.service.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.codehaus.jettison.json.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.opensoftlab.lunaops.req.req4000.req4100.service.impl.Req4100DAO;
import kr.opensoftlab.lunaops.spr.spr1000.spr1100.service.Spr1100Service;



@Service("spr1100Service")
public class Spr1100ServiceImpl extends EgovAbstractServiceImpl implements Spr1100Service {

	
    @Resource(name="spr1100DAO")
    private Spr1100DAO spr1100DAO;
    
    
    @Resource(name="req4100DAO")
    private Req4100DAO req4100DAO;
    
    
    
	
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
		
		String insertParam = (String) paramMap.get("insertParam");
		if(insertParam != null) {
			
			List<String> listStr = (List<String>) paramMap.get("dataList");
			
			JSONParser jsonParser = new JSONParser();
			JSONArray jsonArray = null;
			Map infoMap = null;
			org.json.simple.JSONObject jsonObj = null;
			
			jsonArray = (JSONArray) jsonParser.parse(listStr.get(0));
			for(int i=0; i<jsonArray.size(); i++)
			{
				jsonObj = (org.json.simple.JSONObject) jsonArray.get(i);
				
				
				infoMap = new Gson().fromJson(jsonObj.toString(), new HashMap().getClass());
				
				
				paramMap.put("reqId", infoMap.get("reqId"));
				
				
				spr1100DAO.insertSpr1100ReqInfo(paramMap);
				
			}
			
			JSONObject insertJsonParam = new JSONObject(insertParam); 
			
			
			JSONObject sprPointList = insertJsonParam.getJSONObject("reqSprPointList");
			
			if(sprPointList != null) {
				
				Iterator reqKey = sprPointList.keys();
				
				
				while(reqKey.hasNext())
				{
					String reqId = reqKey.next().toString();
					int sprPoint = sprPointList.getInt(reqId);
					
					paramMap.put("reqId", reqId);
					paramMap.put("sprPoint", sprPoint);
					
					spr1100DAO.updateSpr1100ReqSprPointInfo(paramMap);
				}
			}
			
			JSONObject reqChargerList = insertJsonParam.getJSONObject("reqUsrList");
			if(reqChargerList != null) {
				
				Iterator reqKey = (Iterator) reqChargerList.keys();
				
				
				while(reqKey.hasNext())
				{
					String reqId = reqKey.next().toString();
					JSONObject usrInfo = (JSONObject) reqChargerList.get(reqId);
					
					paramMap.put("reqId", reqId);
					paramMap.put("reqChargerId", (String) usrInfo.get("usrId"));
					req4100DAO.updateReq4101ReqSubInfo(paramMap);
				}
			}
		}else {
			String listStr = (String) paramMap.get("dataList");
			
			JSONParser jsonParser = new JSONParser();
			JSONArray jsonArray = null;
			Map infoMap = null;
			org.json.simple.JSONObject jsonObj = null;
			
			jsonArray = (JSONArray) jsonParser.parse(listStr);
			for(int i=0; i<jsonArray.size(); i++)
			{
				jsonObj = (org.json.simple.JSONObject) jsonArray.get(i);
				
				
				infoMap = new Gson().fromJson(jsonObj.toString(), new HashMap().getClass());
				
				
				paramMap.put("reqId", infoMap.get("reqId"));
				
				
				spr1100DAO.insertSpr1100ReqInfo(paramMap);
				
			}
			
		} 
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void deleteSpr1100ReqList(Map paramMap) throws Exception {
		
		String listStr = (String) paramMap.get("dataList");
		
		
		JSONParser jsonParser = new JSONParser();
		JSONArray jsonArray = null;
		Map infoMap = null;
		org.json.simple.JSONObject jsonObj = null;
		
		jsonArray = (JSONArray) jsonParser.parse(listStr);
	
		for(int i=0; i<jsonArray.size(); i++)
		{
			jsonObj = (org.json.simple.JSONObject) jsonArray.get(i);
			
			
			infoMap = new Gson().fromJson(jsonObj.toString(), new HashMap().getClass());
			
			
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
	
	
	@Override
	public int selectSpr1101SprReqListCnt(Map<String, String> paramMap) throws Exception {
		return spr1100DAO.selectSpr1101SprReqListCnt(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	@Override
	public List selectSpr1101SprReqList(Map<String, String> paramMap) throws Exception {
		return spr1100DAO.selectSpr1101SprReqList(paramMap);
	}
	
	
	@Override
	@SuppressWarnings({"rawtypes", "unchecked" })
	public void updateSpr1100ReqListAjax(Map paramMap) throws Exception {
		
		String insertParam = (String) paramMap.get("insertParam");
		
		
		JSONObject insertJsonParam = new JSONObject(insertParam); 
		
		
		JSONObject sprPointList = insertJsonParam.getJSONObject("reqSprPointList");
		if(sprPointList != null) {
			
			Iterator reqKey = sprPointList.keys();
			
			
			while(reqKey.hasNext())
			{
				String reqId = reqKey.next().toString();
				int sprPoint = sprPointList.getInt(reqId);
				
				paramMap.put("reqId", reqId);
				paramMap.put("sprPoint", sprPoint);
				
				spr1100DAO.updateSpr1100ReqSprPointInfo(paramMap);
			}
		}
		
		JSONObject reqChargerList = insertJsonParam.getJSONObject("reqUsrList");
		if(reqChargerList != null) {
			
			Iterator reqKey = (Iterator) reqChargerList.keys();
			
			
			while(reqKey.hasNext())
			{
				String reqId = reqKey.next().toString();
				JSONObject usrInfo = (JSONObject) reqChargerList.get(reqId);
				
				paramMap.put("reqId", reqId);
				paramMap.put("reqChargerId", (String) usrInfo.get("usrId"));
				req4100DAO.updateReq4101ReqSubInfo(paramMap);
			}
		}
	}
}
