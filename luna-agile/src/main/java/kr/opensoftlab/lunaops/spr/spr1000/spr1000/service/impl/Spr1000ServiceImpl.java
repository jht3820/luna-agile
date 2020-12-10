package kr.opensoftlab.lunaops.spr.spr1000.spr1000.service.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.ibm.icu.text.DateFormat;
import com.ibm.icu.text.SimpleDateFormat;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.opensoftlab.lunaops.prj.prj1000.prj1100.service.impl.Prj1100DAO;
import kr.opensoftlab.lunaops.req.req3000.req3000.service.impl.Req3000DAO;
import kr.opensoftlab.lunaops.req.req4000.req4100.service.impl.Req4100DAO;
import kr.opensoftlab.lunaops.req.req6000.req6000.service.Req6000Service;
import kr.opensoftlab.lunaops.req.req6000.req6000.service.impl.Req6000DAO;
import kr.opensoftlab.lunaops.req.req6000.req6000.vo.Req6001VO;
import kr.opensoftlab.lunaops.spr.spr1000.spr1000.service.Spr1000Service;
import kr.opensoftlab.lunaops.spr.spr1000.spr1100.service.impl.Spr1100DAO;
import kr.opensoftlab.lunaops.spr.spr2000.spr2000.service.impl.Spr2000DAO;
import kr.opensoftlab.lunaops.spr.spr2000.spr2100.service.impl.Spr2100DAO;
import kr.opensoftlab.lunaops.stm.stm3000.stm3000.service.impl.Stm3000DAO;



@Service("spr1000Service")
public class Spr1000ServiceImpl extends EgovAbstractServiceImpl implements Spr1000Service {

	
	@Resource(name="prj1100DAO")
	private Prj1100DAO prj1100DAO;
	
	
	@Resource(name="stm3000DAO")
	private Stm3000DAO stm3000DAO;
	
	
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
    
    
    @Resource(name="req3000DAO")
    private Req3000DAO req3000DAO;
    
    
    @Resource(name="req6000DAO")
    private Req6000DAO req6000DAO;
    
    
	@Resource(name = "req6000Service")
	private Req6000Service req6000Service;
	
    
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	
	@SuppressWarnings("rawtypes")
	public int selectSpr1000SprListCnt(Map paramMap) throws Exception {
		return  spr1000DAO.selectSpr1000SprListCnt(paramMap);
	} 
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Map> selectSpr1000SprList(Map paramMap) throws Exception {
		List<Map> sprList= spr1000DAO.selectSpr1000SprList(paramMap);
		
		for(Map spr : sprList) {
			spr.put("firstIndex", 0);
			spr.put("lastIndex", spr.get("reqAllCnt"));
			List<Map> reqList = selectSpr1000SprReqList(spr);
			spr.put("reqList", reqList);
			
			Map sprStat = spr1000DAO.selectSpr1000SprInfoStat(spr);
			
			double allCnt = Double.parseDouble(String.valueOf(sprStat.get("allCntSum")));
			
			double endCnt = Double.parseDouble(String.valueOf(sprStat.get("endCntSum")));
			
			double avgEndTime = Double.parseDouble(String.valueOf(sprStat.get("avgEndTimeRequired")));
			
			spr.put("sprPoint", sprStat.get("sprPoint"));
			
			spr.put("avgTime", avgEndTime);
			
			if("01".equals(spr.get("sprTypeCd"))) {
				
				spr.put("sprEndPercent", 0);
			}else {
				
				spr.put("sprEndPercent", endCnt / allCnt * 100.0);
			}
		}
		return  sprList;
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
	
	
	@SuppressWarnings({"rawtypes"})
	public List<Map>  selectSpr1000SprReqList(Map paramMap) throws Exception {
		List<Map> reqList = spr1000DAO.selectSpr1000SprReqList(paramMap);
		return reqList;
	}

	
	@SuppressWarnings("rawtypes")
	public int selectSpr1000SprReqNotEndListCnt(Map paramMap) throws Exception {
		return spr1000DAO.selectSpr1000SprReqNotEndListCnt(paramMap);
	} 
	
	
	@SuppressWarnings({"rawtypes", "unchecked" })
	public int updateSpr1003SprStart(Map paramMap) throws Exception{
		int rtnValue = 1;
		
		String licGrpId = (String) paramMap.get("licGrpId");
		String prjId = (String) paramMap.get("prjId");
		String regUsrId = (String) paramMap.get("regUsrId");
		String regUsrIp = (String) paramMap.get("regUsrIp");
		
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
				
				if("".equals(reqUsrList.get(reqId))) {
					paramMap.put("reqId", reqId);
					paramMap.put("reqChargerId", null);
				}else {
					
					paramMap.put("reqId", reqId);
					paramMap.put("reqChargerId", usrInfo.getString("usrId"));
				}
				
				
				Map beforeReqInfo = req4100DAO.selectReq4100ReqInfo(paramMap);
				
				String beforeReqChargerId = (String) beforeReqInfo.get("reqChargerId");
				
				String reqChargerId = (String) usrInfo.getString("usrId");
				
				
				if(!reqChargerId.equals(beforeReqChargerId)) {
					
					Req6001VO req6001Vo = new Req6001VO(licGrpId, prjId, reqId, "02", beforeReqChargerId, reqChargerId, regUsrId);
					req6001Vo.setRegUsrId(regUsrId);
					req6001Vo.setRegUsrIp(regUsrIp);
					req6001Vo.setModifyUsrId(regUsrId);
					req6001Vo.setModifyUsrIp(regUsrIp);
					
					paramMap.put("req6001Vo", req6001Vo);
					req6000Service.insertReq6001ReqChgInfo(paramMap);
				}
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
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd", Locale.KOREA);
		paramMap.put("sprStDt", sdf.format(today));
		
		
		String endDt = (String)paramMap.get("paramEndDt");
		Date endDate = sdf.parse(endDt);
		
		
		if(today.after(endDate)) {
			paramMap.put("sprEdDt", sdf.format(today));
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
		Date today = new Date();
		SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
		
		paramMap.put("sprEdDt", dateformat.format(today));
		spr1000DAO.updateSpr1000Info(paramMap);

		
		
		
		spr1000DAO.insertStm3000SnapShot(paramMap);
		
		spr1000DAO.insertReq4100SnapShot(paramMap);
		
		spr1000DAO.insertReq6001SnapShot(paramMap);
		
		spr1000DAO.insertReq3000SnapShot(paramMap);
		
		spr1000DAO.insertReq3001SnapShot(paramMap);
		
		spr1000DAO.insertPrj1100SnapShot(paramMap);
		
		spr1000DAO.insertPrj1101SnapShot(paramMap);
		
		spr1000DAO.insertPrj1102SnapShot(paramMap);
		
		spr1000DAO.insertPrj1103SnapShot(paramMap);
		
		spr1000DAO.insertPrj1106SnapShot(paramMap);
		
		spr1000DAO.insertPrj1107SnapShot(paramMap);
		
		
		
		return rtnValue;
	}

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Map selectSpr1000SprInfoStat(Map paramMap) throws Exception {
		Map sprStat = null;
		
		
		
		sprStat = spr1000DAO.selectSpr1000SprInfoStat(paramMap);
		
		double allCnt = Double.parseDouble(String.valueOf(sprStat.get("allCntSum")));
		double endCnt = Double.parseDouble(String.valueOf(sprStat.get("endCntSum")));
		
		double endTimeRequired = Double.parseDouble(String.valueOf(sprStat.get("totalEndTime")));
		double avgEndTime = Double.parseDouble(String.valueOf(sprStat.get("avgEndTimeRequired")));
		double endSprPoint = Double.parseDouble(String.valueOf(sprStat.get("endSprPoint")));
		
		
		sprStat.put("sprEndPercent", endCnt / allCnt * 100.0);
		
		sprStat.put("avgTime", avgEndTime);
		
		sprStat.put("sprPerTime", endTimeRequired / endSprPoint);
		
		return sprStat;
	}
	
	@Override
	@SuppressWarnings({ "rawtypes" })
	public List<Map> selectSpr1000ChartInfo(Map paramMap) throws Exception {
		return spr1000DAO.selectSpr1000ChartInfo(paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public List<Map> selectSpr1000VelocityChartInfo(Map<String, String> paramMap) throws Exception {
		Calendar cal = Calendar.getInstance();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
		
		Map termInfo = spr1000DAO.selectSpr1000SprTerm(paramMap);
		Double totalSprPoint = Double.parseDouble(String.valueOf(paramMap.get("totalSprPoint")));
		Double endSprPoint = Double.parseDouble(String.valueOf(paramMap.get("endSprPoint")));
		Integer term = Integer.parseInt(String.valueOf(termInfo.get("distance")));
		Integer interval = term/4;
		
		Double commitSprPoint = (double) (totalSprPoint/4);
		Double endVelocity = (double) (endSprPoint/4);
		Date stDt = (Date) termInfo.get("sprStDt");
		Date edDt = (Date) termInfo.get("sprEdDt");
		List<Map> velocityData = new ArrayList();
		
		cal.setTime(stDt);
		for(int i = 1; i<5 ; i++) {
			String startD = "";
			if(i == 1) {
				
				startD = df.format(cal.getTime());
			}else {
				cal.add(Calendar.DATE, 1);
				startD = df.format(cal.getTime());
			}
			if(i==4) {
				cal.setTime(edDt);
			}else {
				cal.add(Calendar.DATE, interval);
			}
			
			String endD = df.format(cal.getTime());
			
			paramMap.put("startD", startD);
			paramMap.put("endD", endD);
			Map data = spr1000DAO.selectSpr1000VelocityChartInfo(paramMap);
			data.put("term", startD + "~" + endD);
			data.put("commitSprPoint", commitSprPoint);
			data.put("commitVelocity", commitSprPoint);
			data.put("actualVelocity", endVelocity);
			
			velocityData.add(data);
		}
		return velocityData;
	}
	
	
}
