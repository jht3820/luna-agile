package kr.opensoftlab.lunaops.stm.stm2000.stm2200.service.impl;

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
import kr.opensoftlab.lunaops.com.exception.UserDefineException;
import kr.opensoftlab.lunaops.stm.stm2000.stm2200.service.Stm2200Service;


@Service("stm2200Service")
public class Stm2200ServiceImpl extends EgovAbstractServiceImpl implements Stm2200Service {

	
    @Resource(name="stm2200DAO")
    private Stm2200DAO stm2200DAO;

    
   	@Resource(name = "egovMessageSource")
   	EgovMessageSource egovMessageSource;
   	
	
	
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectStm2200StmAuthGrpList(Map paramMap) throws Exception{
		return stm2200DAO.selectStm2200StmAuthGrpList(paramMap) ;
    }
	
	
	@SuppressWarnings("rawtypes")
	public int selectStm2200StmAuthGrpListCnt(Map paramMap) throws Exception {
		 return stm2200DAO.selectStm2200StmAuthGrpListCnt(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectStm2200StmAuthGrpNoPagingList(Map paramMap) throws Exception{
		return stm2200DAO.selectStm2200StmAuthGrpNoPagingList(paramMap);
    }
	
	
	@SuppressWarnings("rawtypes")
	public Map selectStm2200StmAuthGrpInfo(Map paramMap) throws Exception{
		return stm2200DAO.selectStm2200StmAuthGrpInfo(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectStm2200StmAuthGrpNextOrd(Map paramMap) throws Exception{
		return stm2200DAO.selectStm2200StmAuthGrpNextOrd(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void insertStm2200StmAuthGrpInfo(Map paramMap) throws Exception{
		stm2200DAO.insertStm2200StmAuthGrpInfo(paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public void updateStm2200StmAuthGrpInfo(Map paramMap) throws Exception{
		int uCnt = stm2200DAO.updateStm2200StmAuthGrpInfo(paramMap);
		
		if(uCnt == 0){
			throw new Exception(egovMessageSource.getMessage("fail.common.update"));
		}
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void deleteStm2200StmAuthGrpInfo(Map<String, String> paramMap) throws Exception{
		
		String licGrpId = paramMap.get("licGrpId");
		String deleteDataList = paramMap.get("deleteDataList");
		
		
		JSONParser jsonParser = new JSONParser();
		JSONArray jsonArray = (JSONArray) jsonParser.parse(deleteDataList);
		
		
		int totalCnt = stm2200DAO.selectStm2200StmAuthGrpListCnt(paramMap);
		
		int deleteCnt = jsonArray.size();
		
		
		if(deleteCnt >= totalCnt){
			throw new UserDefineException(egovMessageSource.getMessage("stm2200.fail.stmAuth.minAuthCnt"));
		}
		
		
		for(int i=0;i<deleteCnt;i++) {
			
			JSONObject jsonObj = (JSONObject) jsonArray.get(i);
			
			Map authInfoMap = new Gson().fromJson(jsonObj.toJSONString(), new HashMap().getClass());
			authInfoMap.put("licGrpId", licGrpId);
			
			
			stm2200DAO.deleteStm2200StmAuthGrpInfo(authInfoMap);
			
			
			stm2200DAO.deleteStm2200StmAuthMenuList(authInfoMap);
		}
	}
	
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectStm2200AuthGrpSmallMenuList(Map paramMap) throws Exception{
		return stm2200DAO.selectStm2200AuthGrpSmallMenuList(paramMap) ;
    }
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void saveStm2200AuthGrpMenuAuthList(List paramList) throws Exception{
		for(Map paramMap : (List<Map>)paramList){
			
			String strStatus = (String) paramMap.get("status");
			
			
			if("U".equals(strStatus)){
				saveStm2200AuthGrpMenuAuthInfo(paramMap);
			}	
		}
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void saveStm2200AuthGrpMenuAuthInfo(Map paramMap) throws Exception{
		String upupMenuId = "";
		String upMenuId = "";
		String upupAccessYn = "";
		String upAccessYn = "";
		int cnt = -1;
		
		
		String licGrpId = (String)paramMap.get("licGrpId");
		String prjId = (String)paramMap.get("prjId");
		String authGrpId = (String)paramMap.get("authGrpId");
		String modifyUsrId = (String)paramMap.get("modifyUsrId");
		String modifyUsrIp = (String)paramMap.get("modifyUsrIp");
		Map newMap = null;
		
		
		Map authGrpInfo = stm2200DAO.selectStm2200MenuInfo(paramMap);
		
		
		if(authGrpInfo == null) {
			throw new UserDefineException("메뉴 정보가 없습니다.");
		}
		upupMenuId = (String) authGrpInfo.get("twoUpperMenuId");
		upMenuId = (String) authGrpInfo.get("upperMenuId");
		
		
		cnt = stm2200DAO.selectStm2201AuthMenuAccessCheck(paramMap);
		
		
		if(cnt > 0) {
			int updateFlag = stm2200DAO.updateStm2201AuthMenuAccess(paramMap);
			
			if(updateFlag == 0) {
				throw new UserDefineException("메뉴 정보 수정에 실패했습니다.");
			}
		}
		
		else {
			stm2200DAO.insertStm2201AuthMenuAccess(paramMap);
		}
		
		
		
		
		
		paramMap.put("upMenuId", upupMenuId);
		cnt = stm2200DAO.selectStm2201AuthUpMenuAccessCheck(paramMap);
		if(cnt > 0) {
			upupAccessYn = "Y";
		}else {
			upupAccessYn = "N";
		}
		
		
		paramMap.put("menuId", upupMenuId);
		cnt = stm2200DAO.selectStm2201AuthMenuAccessCheck(paramMap);
		
		newMap = new HashMap<>();
		newMap.put("licGrpId", licGrpId);
		newMap.put("prjId", prjId);
		newMap.put("authGrpId", authGrpId);
		newMap.put("menuId", upupMenuId);
		newMap.put("accessYn", upupAccessYn);
		newMap.put("modifyUsrId", modifyUsrId);
		newMap.put("modifyUsrIp", modifyUsrIp);
		
		
		if(cnt > 0) {
			int updateFlag = stm2200DAO.updateStm2201AuthMenuAccess(newMap);
			
			if(updateFlag == 0) {
				throw new UserDefineException();
			}
		}
		
		else {
			stm2200DAO.insertStm2201AuthMenuAccess(newMap);
		}
		
		
		
		
		
		paramMap.put("upMenuId", upMenuId);
		cnt = stm2200DAO.selectStm2201AuthUpMenuAccessCheck(paramMap);
		if(cnt > 0) {
			upAccessYn = "Y";
		}else {
			upAccessYn = "N";
		}
		
		
		paramMap.put("menuId", upMenuId);
		cnt = stm2200DAO.selectStm2201AuthMenuAccessCheck(paramMap);
		
		newMap = new HashMap<>();
		newMap.put("licGrpId", licGrpId);
		newMap.put("prjId", prjId);
		newMap.put("authGrpId", authGrpId);
		newMap.put("menuId", upMenuId);
		newMap.put("accessYn", upAccessYn);
		newMap.put("modifyUsrId", modifyUsrId);
		newMap.put("modifyUsrIp", modifyUsrIp);
		
		
		if(cnt > 0) {
			int updateFlag = stm2200DAO.updateStm2201AuthMenuAccess(newMap);
			
			if(updateFlag == 0) {
				throw new UserDefineException();
			}
		}
		
		else {
			stm2200DAO.insertStm2201AuthMenuAccess(newMap);
		}
		
		
		
		paramMap.put("menuId", "000");
		cnt = stm2200DAO.selectStm2201AuthMenuAccessCheck(paramMap);
		
		newMap = new HashMap<>();
		newMap.put("licGrpId", licGrpId);
		newMap.put("prjId", prjId);
		newMap.put("authGrpId", authGrpId);
		newMap.put("menuId", "000");
		newMap.put("accessYn", "Y");
		newMap.put("modifyUsrId", modifyUsrId);
		newMap.put("modifyUsrIp", modifyUsrIp);
		
		
		if(cnt > 0) {
			int updateFlag = stm2200DAO.updateStm2201AuthMenuAccess(newMap);
			
			if(updateFlag == 0) {
				throw new UserDefineException();
			}
		}
		
		else {
			stm2200DAO.insertStm2201AuthMenuAccess(newMap);
		}
	}
	
}
