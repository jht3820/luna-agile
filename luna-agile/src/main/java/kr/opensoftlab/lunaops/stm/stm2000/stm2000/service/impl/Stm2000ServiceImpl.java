package kr.opensoftlab.lunaops.stm.stm2000.stm2000.service.impl;

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
import kr.opensoftlab.lunaops.stm.stm2000.stm2000.service.Stm2000Service;



@Service("stm2000Service")
public class Stm2000ServiceImpl extends EgovAbstractServiceImpl implements Stm2000Service {

	
    @Resource(name="stm2000DAO")
    private Stm2000DAO stm2000DAO;

    
   	@Resource(name = "egovMessageSource")
   	EgovMessageSource egovMessageSource;
   	
   	
	@SuppressWarnings("rawtypes")
	public List selectStm2000BaseMenuList(Map paramMap) throws Exception {
		return stm2000DAO.selectStm2000BaseMenuList(paramMap) ;
    }
	
	
	@SuppressWarnings("rawtypes")
	public Map selectStm2000MenuInfo(Map paramMap) throws Exception{
		return stm2000DAO.selectStm2000MenuInfo(paramMap) ;
	}
	
	
	@SuppressWarnings("rawtypes")
	public void insertStm2000MenuInfo(Map paramMap) throws Exception{
		
		
		String insMenuId = stm2000DAO.insertStm2000MenuInfo(paramMap);
		
		
		if(insMenuId == null || "".equals(insMenuId)){
			throw new UserDefineException(egovMessageSource.getMessage("stm2000.fail.menu.insert"));
		}
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public void deleteStm2000MenuInfo(Map paramMap) throws Exception{
		
		
		int delCnt = stm2000DAO.deleteStm2000MenuInfo(paramMap);
		
		
		if(delCnt == 0 ){
			throw new UserDefineException(egovMessageSource.getMessage("fail.common.delete"));
		}
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public void updateStm2000MenuInfo(Map paramMap) throws Exception{
		
		
		int upCnt = stm2000DAO.updateStm2000MenuInfo(paramMap);
		
		
				
		
		if(upCnt == 0 ){
			throw new UserDefineException(egovMessageSource.getMessage("fail.common.update"));
		}
	}

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void saveStm2000AuthGrpMenuAuthInfo(Map paramMap) throws Exception{
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
		
		
		Map authGrpInfo = stm2000DAO.selectStm2000MenuInfo(paramMap);
		
		
		if(authGrpInfo == null) {
			throw new UserDefineException("메뉴 정보가 없습니다.");
		}
		upupMenuId = (String) authGrpInfo.get("twoUpperMenuId");
		upMenuId = (String) authGrpInfo.get("upperMenuId");
		
		
		cnt = stm2000DAO.selectStm2001AuthMenuAccessCheck(paramMap);
		
		
		if(cnt > 0) {
			int updateFlag = stm2000DAO.updateStm2001AuthMenuAccess(paramMap);
			
			if(updateFlag == 0) {
				throw new UserDefineException("메뉴 정보 수정에 실패했습니다.");
			}
		}
		
		else {
			stm2000DAO.insertStm2001AuthMenuAccess(paramMap);
		}
		
		
		
		
		
		paramMap.put("upMenuId", upupMenuId);
		cnt = stm2000DAO.selectStm2001AuthUpMenuAccessCheck(paramMap);
		if(cnt > 0) {
			upupAccessYn = "Y";
		}else {
			upupAccessYn = "N";
		}
		
		
		paramMap.put("menuId", upupMenuId);
		cnt = stm2000DAO.selectStm2001AuthMenuAccessCheck(paramMap);
		
		newMap = new HashMap<>();
		newMap.put("licGrpId", licGrpId);
		newMap.put("prjId", prjId);
		newMap.put("authGrpId", authGrpId);
		newMap.put("menuId", upupMenuId);
		newMap.put("accessYn", upupAccessYn);
		newMap.put("modifyUsrId", modifyUsrId);
		newMap.put("modifyUsrIp", modifyUsrIp);
		
		
		if(cnt > 0) {
			int updateFlag = stm2000DAO.updateStm2001AuthMenuAccess(newMap);
			
			if(updateFlag == 0) {
				throw new UserDefineException();
			}
		}
		
		else {
			stm2000DAO.insertStm2001AuthMenuAccess(newMap);
		}
		
		
		
		
		
		paramMap.put("upMenuId", upMenuId);
		cnt = stm2000DAO.selectStm2001AuthUpMenuAccessCheck(paramMap);
		if(cnt > 0) {
			upAccessYn = "Y";
		}else {
			upAccessYn = "N";
		}
		
		
		paramMap.put("menuId", upMenuId);
		cnt = stm2000DAO.selectStm2001AuthMenuAccessCheck(paramMap);
		
		newMap = new HashMap<>();
		newMap.put("licGrpId", licGrpId);
		newMap.put("prjId", prjId);
		newMap.put("authGrpId", authGrpId);
		newMap.put("menuId", upMenuId);
		newMap.put("accessYn", upAccessYn);
		newMap.put("modifyUsrId", modifyUsrId);
		newMap.put("modifyUsrIp", modifyUsrIp);
		
		
		if(cnt > 0) {
			int updateFlag = stm2000DAO.updateStm2001AuthMenuAccess(newMap);
			
			if(updateFlag == 0) {
				throw new UserDefineException();
			}
		}
		
		else {
			stm2000DAO.insertStm2001AuthMenuAccess(newMap);
		}
		
		
		
		paramMap.put("menuId", "000");
		cnt = stm2000DAO.selectStm2001AuthMenuAccessCheck(paramMap);
		
		newMap = new HashMap<>();
		newMap.put("licGrpId", licGrpId);
		newMap.put("prjId", prjId);
		newMap.put("authGrpId", authGrpId);
		newMap.put("menuId", "000");
		newMap.put("accessYn", "Y");
		newMap.put("modifyUsrId", modifyUsrId);
		newMap.put("modifyUsrIp", modifyUsrIp);
		
		
		if(cnt > 0) {
			int updateFlag = stm2000DAO.updateStm2001AuthMenuAccess(newMap);
			
			if(updateFlag == 0) {
				throw new UserDefineException();
			}
		}
		
		else {
			stm2000DAO.insertStm2001AuthMenuAccess(newMap);
		}
	}
	
}
