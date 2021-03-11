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
	
	
	
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectStm2000StmAuthGrpList(Map paramMap) throws Exception{
		return stm2000DAO.selectStm2000StmAuthGrpList(paramMap) ;
    }
	
	
	@SuppressWarnings("rawtypes")
	public int selectStm2000StmAuthGrpListCnt(Map paramMap) throws Exception {
		 return stm2000DAO.selectStm2000StmAuthGrpListCnt(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectStm2000StmAuthGrpNoPagingList(Map paramMap) throws Exception{
		return stm2000DAO.selectStm2000StmAuthGrpNoPagingList(paramMap);
    }
	
	
	@SuppressWarnings("rawtypes")
	public Map selectStm2000StmAuthGrpInfo(Map paramMap) throws Exception{
		return stm2000DAO.selectStm2000StmAuthGrpInfo(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectStm2000StmAuthGrpNextOrd(Map paramMap) throws Exception{
		return stm2000DAO.selectStm2000StmAuthGrpNextOrd(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void insertStm2000StmAuthGrpInfo(Map paramMap) throws Exception{
		stm2000DAO.insertStm2000StmAuthGrpInfo(paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public void updateStm2000StmAuthGrpInfo(Map paramMap) throws Exception{
		int uCnt = stm2000DAO.updateStm2000StmAuthGrpInfo(paramMap);
		
		if(uCnt == 0){
			throw new Exception(egovMessageSource.getMessage("fail.common.update"));
		}
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void deleteStm2000StmAuthGrpInfo(Map<String, String> paramMap) throws Exception{
		
		String licGrpId = paramMap.get("licGrpId");
		String deleteDataList = paramMap.get("deleteDataList");
		
		
		JSONParser jsonParser = new JSONParser();
		JSONArray jsonArray = (JSONArray) jsonParser.parse(deleteDataList);
		
		
		int totalCnt = stm2000DAO.selectStm2000StmAuthGrpListCnt(paramMap);
		
		int deleteCnt = jsonArray.size();
		
		
		if(deleteCnt >= totalCnt){
			throw new UserDefineException(egovMessageSource.getMessage("stm2000.fail.stmAuth.minAuthCnt"));
		}
		
		
		for(int i=0;i<deleteCnt;i++) {
			
			JSONObject jsonObj = (JSONObject) jsonArray.get(i);
			
			Map authInfoMap = new Gson().fromJson(jsonObj.toJSONString(), new HashMap().getClass());
			authInfoMap.put("licGrpId", licGrpId);
			
			
			stm2000DAO.deleteStm2000StmAuthGrpInfo(authInfoMap);
			
			
			stm2000DAO.deleteStm2000StmAuthMenuList(authInfoMap);
		}
	}
	
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectStm2000AuthGrpSmallMenuList(Map paramMap) throws Exception{
		return stm2000DAO.selectStm2000AuthGrpSmallMenuList(paramMap) ;
    }
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void saveStm2000AuthGrpMenuAuthList(List paramList) throws Exception{
		for(Map paramMap : (List<Map>)paramList){
			
			String strStatus = (String) paramMap.get("status");
			
			
			if("U".equals(strStatus)){
				saveStm2000AuthGrpMenuAuthInfo(paramMap);
			}	
		}
	}
	


	
	@SuppressWarnings({ "rawtypes"})
	public List<Map> selectStm2002FavoritesList(Map paramMap) throws Exception{
		return stm2000DAO.selectStm2002FavoritesList(paramMap);
	}
	

	
	@SuppressWarnings("rawtypes")
	public int selectStm2002FvrTypeCntInfo(Map paramMap) throws Exception{
		return stm2000DAO.selectStm2002FvrTypeCntInfo(paramMap);
	}
	
	
	public String insertStm2002FavoritesInfo(Map<String, String> paramMap) throws Exception {
		return stm2000DAO.insertStm2002FavoritesInfo(paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public int updateStm2002FavoritesInfo(Map paramMap) throws Exception{
		return stm2000DAO.updateStm2002FavoritesInfo(paramMap);
	}
}
