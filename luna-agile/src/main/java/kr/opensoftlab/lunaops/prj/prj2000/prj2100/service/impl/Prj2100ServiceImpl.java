package kr.opensoftlab.lunaops.prj.prj2000.prj2100.service.impl;

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
import kr.opensoftlab.lunaops.prj.prj2000.prj2100.service.Prj2100Service;



@Service("prj2100Service")
public class Prj2100ServiceImpl extends EgovAbstractServiceImpl implements Prj2100Service {

	
    @Resource(name="prj2100DAO")
    private Prj2100DAO prj2100DAO;

    
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	
	@SuppressWarnings({ "rawtypes" })
	public List<Map> selectPrj2100InUsrList(Map paramMap) throws Exception{
		return prj2100DAO.selectPrj2100InUsrList(paramMap);
    }
	
	
	@SuppressWarnings("rawtypes")
	public int selectPrj2100InUsrListCnt(Map paramMap) throws Exception {
		return prj2100DAO.selectPrj2100InUsrListCnt(paramMap);
	} 
	
	
	@SuppressWarnings({ "rawtypes" })
	public List<Map> selectPrj2100AllUsrList(Map paramMap) throws Exception{
		return prj2100DAO.selectPrj2100AllUsrList(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectPrj2100AllUsrListCnt(Map paramMap) throws Exception {
		return  prj2100DAO.selectPrj2100AllUsrListCnt(paramMap);
	} 
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void insertPrj2100PrjUsrAuthList(Map paramMap) throws Exception{
		String dataList = (String) paramMap.get("dataList");
		String prjId = (String) paramMap.get("prjId");
		String paramAuthGrpId = (String) paramMap.get("paramAuthGrpId");
		String regUsrId = (String) paramMap.get("regUsrId");
		String regUsrIp = (String) paramMap.get("regUsrIp");
		String modifyUsrId = (String) paramMap.get("modifyUsrId");
		String modifyUsrIp = (String) paramMap.get("modifyUsrIp");
		
		
		JSONParser jsonParser = new JSONParser();
		JSONArray jsonArray = (JSONArray) jsonParser.parse(dataList);
		
		
		for(int i=0;i<jsonArray.size();i++) {
			JSONObject jsonObj = (JSONObject) jsonArray.get(i);

			
			Map infoMap = new Gson().fromJson(jsonObj.toJSONString(), new HashMap().getClass());
			
			
			infoMap.put("prjId", prjId);
			infoMap.put("authGrpId", paramAuthGrpId);
			infoMap.put("regUsrId", regUsrId);
			infoMap.put("regUsrIp", regUsrIp);
			infoMap.put("modifyUsrId", modifyUsrId);
			infoMap.put("modifyUsrIp", modifyUsrIp);
			
			
			prj2100DAO.insertPrj2100PrjUsrAuthInfo(infoMap);
		}
	}	
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void deletePrj2100PrjUsrAuthList(Map paramMap) throws Exception{
		String dataList = (String) paramMap.get("dataList");
		String prjId = (String) paramMap.get("prjId");
		String paramAuthGrpId = (String) paramMap.get("paramAuthGrpId");
		
		
		JSONParser jsonParser = new JSONParser();
		JSONArray jsonArray = (JSONArray) jsonParser.parse(dataList);
		
		
		for(int i=0;i<jsonArray.size();i++) {
			JSONObject jsonObj = (JSONObject) jsonArray.get(i);

			
			Map infoMap = new Gson().fromJson(jsonObj.toJSONString(), new HashMap().getClass());
			
			
			infoMap.put("prjId", prjId);
			infoMap.put("authGrpId", paramAuthGrpId);
			
			
			prj2100DAO.deletePrj2100PrjUsrAuthInfo(infoMap);
		}
		
	}
}
