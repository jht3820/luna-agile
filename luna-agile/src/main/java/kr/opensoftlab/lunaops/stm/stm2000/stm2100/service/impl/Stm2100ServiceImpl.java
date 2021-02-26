package kr.opensoftlab.lunaops.stm.stm2000.stm2100.service.impl;

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
import kr.opensoftlab.lunaops.bad.bad1000.bad1000.service.impl.Bad1000DAO;
import kr.opensoftlab.lunaops.bad.bad1000.bad1100.service.impl.Bad1100DAO;
import kr.opensoftlab.lunaops.stm.stm2000.stm2100.service.Stm2100Service;
import kr.opensoftlab.lunaops.tag.tag1000.tag1000.service.impl.Tag1000DAO;



@Service("stm2100Service")
public class Stm2100ServiceImpl extends EgovAbstractServiceImpl implements Stm2100Service {

	
	@Resource(name = "stm2100DAO")
	private Stm2100DAO stm2100DAO;
	
	
	@Resource(name = "bad1000DAO")
	private Bad1000DAO bad1000DAO;
	
	
	@Resource(name = "bad1100DAO")
	private Bad1100DAO bad1100DAO;
	
	
	@Resource(name = "tag1000DAO")
	private Tag1000DAO tag1000DAO;

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Map> selectStm2100BadList(Map paramMap) throws Exception {
		return stm2100DAO.selectStm2100BadList(paramMap);
	}

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Map<String, String> selectStm2100BadInfo(Map paramMap) throws Exception {
		return stm2100DAO.selectStm2100BadInfo(paramMap);
	}

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Map> selectStm2110BadAdmList(Map paramMap) throws Exception {
		return stm2100DAO.selectStm2110BadAdmList(paramMap);
	}

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Map> selectStm2120BadWtList(Map paramMap) throws Exception {
		return stm2100DAO.selectStm2120BadWtList(paramMap);
	}

	
	@SuppressWarnings({ "rawtypes" })
	public List<Map> selectStm2100BadGrpList(Map<String, String> paramMap) throws Exception {
		return stm2100DAO.selectStm2100BadGrpList(paramMap);
	}

	
	@SuppressWarnings({"rawtypes" })
	public List<Map> selectStm2100BadUsrList(Map<String, String> paramMap) throws Exception {
		return stm2100DAO.selectStm2100BadUsrList(paramMap);
	}

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void updateStm2100BadOptions(Map<String, String> paramMap) throws Exception{

		
		String str = paramMap.get("stmAdmList");
		str = str.replace("managerNum", "stmAdminCd");
		str = str.replace("managerId", "stmAdminId");
		str = str.replace("managerPrjId", "prjId");
		paramMap.put("stmAdmList", str);
		
		str = paramMap.get("stmWtList");
		str = str.replace("managerNum", "stmWtCd");
		str = str.replace("managerId", "stmWtId");
		str = str.replace("managerPrjId", "prjId");
		paramMap.put("stmWtList", str);
		
		
		
		stm2100DAO.updateStm2100BadOptions(paramMap);
		
		
		Map<String, String> idMap = new HashMap<String, String>();
		idMap.put("licGrpId", paramMap.get("licGrpId"));
		idMap.put("menuId", paramMap.get("menuId"));
		
		
		stm2100DAO.deleteStm2110BadAdmin(idMap);

		
		String listStr = paramMap.get("stmAdmList");
		
		
		JSONParser jsonParser = new JSONParser();
		JSONArray jsonArray = null;
		Map infoMap = null;
		JSONObject jsonObj = null;
		
		jsonArray = (JSONArray) jsonParser.parse(listStr);
	
		for(int i=0; i<jsonArray.size(); i++)
		{
			jsonObj = (JSONObject) jsonArray.get(i);
			
			
			infoMap = new Gson().fromJson(jsonObj.toJSONString(), new HashMap().getClass());
			
			
			infoMap.put("licGrpId", paramMap.get("licGrpId"));
			infoMap.put("menuId", paramMap.get("menuId"));
			infoMap.put("regUsrId", paramMap.get("modifyUsrId"));
			infoMap.put("regUsrIp", paramMap.get("modifyUsrIp"));
			infoMap.put("modifyUsrId", paramMap.get("modifyUsrId"));
			infoMap.put("modifyUsrIp", paramMap.get("modifyUsrIp"));
			
			
			stm2100DAO.insertStm2110BadAdmin(infoMap);
		}
		
		
		stm2100DAO.deleteStm2120BadWriter(idMap);
		
		
		listStr = paramMap.get("stmWtList");
		
		if(listStr.equals("[]")) {}
		
		
		if(!"[]".equals(listStr)) {
			jsonArray = (JSONArray) jsonParser.parse(listStr);
			for(int i=0; i<jsonArray.size(); i++)
			{
				jsonObj = (JSONObject) jsonArray.get(i);
				
				
				infoMap = new Gson().fromJson(jsonObj.toJSONString(), new HashMap().getClass());
				
				
				infoMap.put("licGrpId", paramMap.get("licGrpId"));
				infoMap.put("menuId", paramMap.get("menuId"));
				infoMap.put("regUsrId", paramMap.get("modifyUsrId"));
				infoMap.put("regUsrIp", paramMap.get("modifyUsrIp"));
				infoMap.put("modifyUsrId", paramMap.get("modifyUsrId"));
				infoMap.put("modifyUsrIp", paramMap.get("modifyUsrIp"));
				
				
				stm2100DAO.insertStm2120BadWriter(infoMap);
			}
		}
	}
	
	
	public String selectBad1000NtcCnt(Map<String, String> paramMap) throws Exception {
		return bad1000DAO.selectBad1000NtcCnt(paramMap);
	}
	
	
	@SuppressWarnings({"rawtypes" })
	public Map selectBad1000NtcCurrent(Map<String, String> paramMap) throws Exception {
		return bad1000DAO.selectBad1000NtcCurrent(paramMap);
	}
	
	
	@SuppressWarnings({"rawtypes" })
	public Map selectBad1000WriteCntInfo(Map<String, String> paramMap) throws Exception {
		return bad1000DAO.selectBad1000WriteCntInfo(paramMap);
	}
	
	
	@SuppressWarnings({"rawtypes" })
	public Map selectBad1000HitMaxInfo(Map<String, String> paramMap) throws Exception {
		return bad1000DAO.selectBad1000HitMaxInfo(paramMap);
	}
	
	
	public String selectBad1000PwCnt(Map<String, String> paramMap) throws Exception {
		return bad1000DAO.selectBad1000PwCnt(paramMap);
	}
	
	
	@SuppressWarnings({"rawtypes" })
	public Map selectBad1000FileSummery(Map<String, String> paramMap) throws Exception {
		return bad1000DAO.selectBad1000FileSummery(paramMap);
	}
	
	
	public int selectBad1100CmtAllCnt(Map<String, String> paramMap) throws Exception {
		return bad1100DAO.selectBad1100CmtAllCnt(paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public Map selectBad1100CmtMaxInfo(Map<String, String> paramMap) throws Exception {
		return bad1100DAO.selectBad1100CmtMaxInfo(paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public List<Map> selectTag1000TopInfo(Map<String, String> paramMap) throws Exception {
		return tag1000DAO.selectTag1000TopInfo(paramMap);
	}
	
	
	@SuppressWarnings({"rawtypes" })
	public Map selectStm2100UserCheck(Map<String, String> paramMap) throws Exception {
		Map<String, String> result = new HashMap<>();
		result.put("resultManager", stm2100DAO.selectStm2100AdminCheck(paramMap));
		result.put("resultWriter", stm2100DAO.selectStm2100WriterCheck(paramMap));
		return result;
	}
	
	
	@SuppressWarnings("rawtypes")
	public  List<Map> selectStm2100MonthChart(Map<String, String> paramMap) throws Exception {
		return  stm2100DAO.selectStm2100MonthChart(paramMap);
	}
}
