package kr.opensoftlab.lunaops.spr.spr1000.spr1000.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.ibm.icu.text.SimpleDateFormat;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.opensoftlab.lunaops.req.req4000.req4100.service.impl.Req4100DAO;
import kr.opensoftlab.lunaops.spr.spr1000.spr1000.service.Spr1000Service;
import kr.opensoftlab.lunaops.spr.spr1000.spr1100.service.impl.Spr1100DAO;
import kr.opensoftlab.lunaops.spr.spr2000.spr2000.service.impl.Spr2000DAO;
import kr.opensoftlab.lunaops.spr.spr2000.spr2100.service.impl.Spr2100DAO;



@Service("spr1000Service")
public class Spr1000ServiceImpl extends EgovAbstractServiceImpl implements Spr1000Service {

	
    @Resource(name="spr1000DAO")
    private Spr1000DAO spr1000DAO;
    
    
    @Resource(name="spr1100DAO")
    private Spr1100DAO spr1100DAO;
    
    
    @Resource(name="req4100DAO")
    private Req4100DAO req4100DAO;

	
    @Resource(name="spr2000DAO")
    private Spr2000DAO spr2000DAO;

	
    @Resource(name="spr2100DAO")
    private Spr2100DAO spr2100DAO;
    
    
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	
	@SuppressWarnings("rawtypes")
	public int selectSpr1000SprListCnt(Map paramMap) throws Exception {
		return  spr1000DAO.selectSpr1000SprListCnt(paramMap);
	} 
	
	
	@SuppressWarnings({ "rawtypes" })
	public List<Map> selectSpr1000SprList(Map paramMap) throws Exception {
		return  spr1000DAO.selectSpr1000SprList(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public String insertSpr1000SprInfo(Map paramMap) throws Exception{
		return spr1000DAO.insertSpr1000SprInfo(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int updateSpr1000Info(Map paramMap) throws Exception{
		return spr1000DAO.updateSpr1000Info(paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public int deleteSpr1000SprInfo(Map paramMap) throws Exception{
		String deleteDataList = (String) paramMap.get("deleteDataList");

		
		JSONArray jsonArray = new JSONArray(deleteDataList);
		
		int deleteCnt = 0;
		
		
		for(int i=0;i<jsonArray.length();i++) {
			JSONObject jsonObj = (JSONObject) jsonArray.get(i);
			
			
			Map infoMap = new Gson().fromJson(jsonObj.toString(), new HashMap().getClass());
			
			
			infoMap.put("delCd", "01");
			
			
			int resultCnt = spr1000DAO.deleteSpr1000SprInfo(infoMap);
			deleteCnt += resultCnt;
		}
		
		return deleteCnt;
	}

	
	@SuppressWarnings({ "rawtypes" })
	public Map selectSpr1000SprInfo(Map paramMap) throws Exception {
		return spr1000DAO.selectSpr1000SprInfo(paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public int selectSpr1000SprReqListCnt(Map paramMap) throws Exception {
		return spr1000DAO.selectSpr1000SprReqListCnt(paramMap);
	} 
	
	
	@SuppressWarnings({"rawtypes" })
	public List<Map>  selectSpr1000SprReqList(Map paramMap) throws Exception {
		return spr1000DAO.selectSpr1000SprReqList(paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public int selectSpr1000SprReqNotEndListCnt(Map paramMap) throws Exception {
		return spr1000DAO.selectSpr1000SprReqNotEndListCnt(paramMap);
	} 
	
	
	@SuppressWarnings({"rawtypes", "unchecked" })
	public int updateSpr1003SprStart(Map paramMap) throws Exception{
		int rtnValue = 1;
		
		String wizardData = (String) paramMap.get("wizardData");
		
		
		JSONObject wizardJsonData = new JSONObject(wizardData); 
		
		
		String mmtNm = wizardJsonData.getString("mmtNm");
		
		
		String mmtDesc = wizardJsonData.getString("mmtDesc");
		
		
		String usrId = (String) paramMap.get("usrId");
		
		paramMap.put("mmtNm", mmtNm);
		paramMap.put("mmtDesc", mmtDesc);
		paramMap.put("mmtUsrId", usrId);
		
		
		String mmtId = spr2000DAO.insertSpr2000MmtInfo(paramMap);
		paramMap.put("mmtId", mmtId);
		
		
		JSONArray usrList = wizardJsonData.getJSONArray("usrList");
		int usrListSize = usrList.length();
		
		if(usrList != null && usrListSize > 0) {
			for(int i=0;i <usrListSize;i++) {
				String usrInfo = (String)usrList.get(i);
			
				paramMap.put("usrId", usrInfo);
				spr2000DAO.insertSpr2001MmtMemList(paramMap);
			}
		}
		
		
		JSONObject reqSprPointList = wizardJsonData.getJSONObject("reqSprPointList");
		if(reqSprPointList != null) {
			
			Iterator reqKey = reqSprPointList.keys();
			
			
			while(reqKey.hasNext())
			{
				String reqId = reqKey.next().toString();
				int sprPoint = reqSprPointList.getInt(reqId);
				
				paramMap.put("reqId", reqId);
				paramMap.put("sprPoint", sprPoint);
				
				spr1100DAO.updateSpr1100ReqSprPointInfo(paramMap);
			}
		}
		
		
		JSONObject reqUsrList = wizardJsonData.getJSONObject("reqUsrList");
		if(reqUsrList != null) {
			
			Iterator reqKey = reqUsrList.keys();
			
			
			while(reqKey.hasNext())
			{
				String reqId = reqKey.next().toString();
				JSONObject usrInfo = reqUsrList.getJSONObject(reqId);
				
				paramMap.put("reqId", reqId);
				paramMap.put("reqChargerId", usrInfo.getString("usrId"));
				req4100DAO.updateReq4101ReqSubInfo(paramMap);
			}
		}
		
		
		JSONArray sprProcessList = wizardJsonData.getJSONArray("sprProcessList");
		int sprProcessListSize = sprProcessList.length();
		
		if(sprProcessList != null && sprProcessListSize > 0) {
			for(int i=0;i <sprProcessListSize;i++) {
				String processInfo = (String)sprProcessList.get(i);
			
				paramMap.put("processId", processInfo);
				spr1000DAO.insertSpr1003SprProcessList(paramMap);
			}
		}
		
		
		
		Date today = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
		paramMap.put("startDt", sdf.format(today));
		
		
		String endDt = (String)paramMap.get("paramEndDt");
		Date endDate = sdf.parse(endDt);
		
		
		if(today.getTime() >= endDate.getTime()) {
			paramMap.put("endDt", sdf.format(today));
		}
		
		
		paramMap.put("sprTypeCd", "02");
		
		spr1000DAO.updateSpr1000Info(paramMap);
		
		return rtnValue;
	}
	

	
	
	@SuppressWarnings({"rawtypes", "unchecked" })
	public int updateSpr1003SprEnd(Map paramMap) throws Exception{
		int rtnValue = 1;

		
		String usrId = (String) paramMap.get("usrId");
		
		paramMap.put("mmrUsrId", usrId);
		
		
		String mmrId = spr2100DAO.insertSpr2100MmrInfo(paramMap);
		paramMap.put("mmrId", mmrId);
		
		
		paramMap.put("sprTypeCd", "03");
		
		spr1000DAO.updateSpr1000Info(paramMap);
		
		return rtnValue;
	}

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Map selectSpr1000SprInfoStat(Map paramMap) throws Exception {
		Map sprStat = spr1000DAO.selectSpr1000SprInfoStat(paramMap);
		double allCnt = Double.parseDouble(String.valueOf(sprStat.get("allCntSum")));
		double endCnt = Double.parseDouble(String.valueOf(sprStat.get("endCntSum")));
		
		sprStat.put("sprEndPercent", endCnt / allCnt * 100.0);
		return sprStat;
	}
}
