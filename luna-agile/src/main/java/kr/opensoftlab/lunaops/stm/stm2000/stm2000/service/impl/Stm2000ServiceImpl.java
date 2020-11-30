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

/**
 * @Class Name : Stm2000ServiceImpl.java
 * @Description : Stm2000ServiceImpl Business Implement class
 * @Modification Information
 *
 * @author 정형택
 * @since 2016.01.12.
 * @version 1.0
 * @see
 *  
 *  Copyright (C) OpenSoftLab Corp. All right reserved.
 */

@Service("stm2000Service")
public class Stm2000ServiceImpl extends EgovAbstractServiceImpl implements Stm2000Service {

	/** Stm2000DAO DI */
    @Resource(name="stm2000DAO")
    private Stm2000DAO stm2000DAO;

    /** EgovMessageSource */
   	@Resource(name = "egovMessageSource")
   	EgovMessageSource egovMessageSource;
   	
   	/**
	 * Stm2000 라이선스 그룹에 할당된 기본 메뉴정보 목록 가져오기
	 * @param paramMap - Map
	 * @return 메뉴 목록 - List
	 * @exception Exception
	 */
	@SuppressWarnings("rawtypes")
	public List selectStm2000BaseMenuList(Map paramMap) throws Exception {
		return stm2000DAO.selectStm2000BaseMenuList(paramMap) ;
    }
	
	/**
	 * Stm2000 메뉴 정보 단건 조회
	 * @param paramMap - Map
	 * @return 
	 * @exception Exception
	 */
	@SuppressWarnings("rawtypes")
	public Map selectStm2000MenuInfo(Map paramMap) throws Exception{
		return stm2000DAO.selectStm2000MenuInfo(paramMap) ;
	}
	
	/**
	 * Stm2000 메뉴 정보 단건 등록
	 * @param paramMap - Map
	 * @return 
	 * @exception Exception
	 */
	@SuppressWarnings("rawtypes")
	public void insertStm2000MenuInfo(Map paramMap) throws Exception{
		
		// 메뉴 등록
		String insMenuId = stm2000DAO.insertStm2000MenuInfo(paramMap);
		
		// 메뉴 등록 시 생성된 아이디가 없으면 튕겨낸다.
		if(insMenuId == null || "".equals(insMenuId)){
			throw new UserDefineException(egovMessageSource.getMessage("stm2000.fail.menu.insert"));
		}
	}
	
	/**
	 * Stm2000 메뉴 정보 단건 삭제
	 * @param paramMap - Map
	 * @return 
	 * @exception Exception
	 */
	@SuppressWarnings({ "rawtypes" })
	public void deleteStm2000MenuInfo(Map paramMap) throws Exception{
		
		//메뉴정보 삭제
		int delCnt = stm2000DAO.deleteStm2000MenuInfo(paramMap);
		
		//삭제된 건이 없으면 튕겨냄
		if(delCnt == 0 ){
			throw new UserDefineException(egovMessageSource.getMessage("fail.common.delete"));
		}
	}
	
	/**
	 * Stm2000 메뉴 정보 단건 수정
	 * @param paramMap - Map
	 * @return 
	 * @exception Exception
	 */
	@SuppressWarnings({ "rawtypes" })
	public void updateStm2000MenuInfo(Map paramMap) throws Exception{
		
		//메뉴정보 수정
		int upCnt = stm2000DAO.updateStm2000MenuInfo(paramMap);
		
		/* 수정이슈 처리 안함
		String prjType = paramMap.get("prjType") == null ? "" :(String) paramMap.get("prjType");
		List<Map> menuList = null;
		if( "01".equals( prjType) || "02".equals( prjType)  ){
			menuList = stm2000DAO.selectStm2000deleteMenuList(paramMap);
			for(Map menuMap :menuList ){
				stm2000DAO.deleteStm2000projectTypeAuth(menuMap);
			}
		}*/
				
		//수정된 건이 없으면 튕겨냄
		if(upCnt == 0 ){
			throw new UserDefineException(egovMessageSource.getMessage("fail.common.update"));
		}
	}

	/**
	 * 메뉴별 권한정보 저장
	 * @param 
	 * @return 
	 * @exception Exception
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void saveStm2000AuthGrpMenuAuthInfo(Map paramMap) throws Exception{
		String upupMenuId = "";
		String upMenuId = "";
		String upupAccessYn = "";
		String upAccessYn = "";
		int cnt = -1;
		
		//temp Map
		String licGrpId = (String)paramMap.get("licGrpId");
		String prjId = (String)paramMap.get("prjId");
		String authGrpId = (String)paramMap.get("authGrpId");
		String modifyUsrId = (String)paramMap.get("modifyUsrId");
		String modifyUsrIp = (String)paramMap.get("modifyUsrIp");
		Map newMap = null;
		
		//menuID로 대메뉴와 중메뉴 ID 얻기
		Map authGrpInfo = stm2000DAO.selectStm2000MenuInfo(paramMap);
		
		//null값 오류 처리
		if(authGrpInfo == null) {
			throw new UserDefineException("메뉴 정보가 없습니다.");
		}
		upupMenuId = (String) authGrpInfo.get("twoUpperMenuId");
		upMenuId = (String) authGrpInfo.get("upperMenuId");
		
		//메뉴 데이터 존재하는지 체크
		cnt = stm2000DAO.selectStm2001AuthMenuAccessCheck(paramMap);
		
		//있으면 update
		if(cnt > 0) {
			int updateFlag = stm2000DAO.updateStm2001AuthMenuAccess(paramMap);
			//수정 레코드 없는 경우 오류
			if(updateFlag == 0) {
				throw new UserDefineException("메뉴 정보 수정에 실패했습니다.");
			}
		}
		//없으면 insert
		else {
			stm2000DAO.insertStm2001AuthMenuAccess(paramMap);
		}
		
		//메뉴정보 저장 후 access_yn 권한에 따라 최상위메뉴 권한 변경처리
		//저장한 메뉴의 최상위 메뉴 밑의 자식들중 하나라도 접근권한이 있으면 접근권한 'Y' 처리
		
		//최 상위메뉴에 배정된 하위메뉴중 Y값이 있는지 체크
		paramMap.put("upMenuId", upupMenuId);
		cnt = stm2000DAO.selectStm2001AuthUpMenuAccessCheck(paramMap);
		if(cnt > 0) {
			upupAccessYn = "Y";
		}else {
			upupAccessYn = "N";
		}
		
		//최상위 권한 데이터 존재하는지 체크
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
		
		//있으면 udpate
		if(cnt > 0) {
			int updateFlag = stm2000DAO.updateStm2001AuthMenuAccess(newMap);
			//수정 레코드 없는 경우 오류
			if(updateFlag == 0) {
				throw new UserDefineException();
			}
		}
		//없으면 insert
		else {
			stm2000DAO.insertStm2001AuthMenuAccess(newMap);
		}
		
		//메뉴정보 저장 후 access_yn 권한에 따라 상위메뉴(중메뉴) 권한 변경처리
		//저장한 메뉴의 상위메뉴(중메뉴) 밑의 자식들중 하나라도 접근권한이 있으면 접근권한 'Y' 처리
		
		//상위메뉴에 배정된 하위메뉴중 Y값이 있는지 체크
		paramMap.put("upMenuId", upMenuId);
		cnt = stm2000DAO.selectStm2001AuthUpMenuAccessCheck(paramMap);
		if(cnt > 0) {
			upAccessYn = "Y";
		}else {
			upAccessYn = "N";
		}
		
		//상위 권한 데이터 존재하는지 체크
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
		
		//있으면 update
		if(cnt > 0) {
			int updateFlag = stm2000DAO.updateStm2001AuthMenuAccess(newMap);
			//수정 레코드 없는 경우 오류
			if(updateFlag == 0) {
				throw new UserDefineException();
			}
		}
		//없으면 insert
		else {
			stm2000DAO.insertStm2001AuthMenuAccess(newMap);
		}
		
		//프로젝트 최상위 000 access_yn = 'y' 처리
		//최상위 데이터 존재하는지 체크
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
		
		//있으면 udpate
		if(cnt > 0) {
			int updateFlag = stm2000DAO.updateStm2001AuthMenuAccess(newMap);
			//수정 레코드 없는 경우 오류
			if(updateFlag == 0) {
				throw new UserDefineException();
			}
		}
		//없으면 insert
		else {
			stm2000DAO.insertStm2001AuthMenuAccess(newMap);
		}
	}
	
	/********* begin::권한그룹 관련 코드, 시스템 권한 관리 메뉴 추가 후 코드 분리 *********/
	
	/**
	 * 기초데이터로 세팅된 ROOTSYSTEM_PRJ 권한그룹(시스템 기본 권한그룹) 목록 조회 (Paging)
	 * @param paramMap - Map
	 * @return 시스템 기본 권한그룹 목록
	 * @exception Exception
	 */
	@SuppressWarnings("rawtypes")
	public List<Map> selectStm2000StmAuthGrpList(Map paramMap) throws Exception{
		return stm2000DAO.selectStm2000StmAuthGrpList(paramMap) ;
    }
	
	/**
	 * 기초데이터로 세팅된 ROOTSYSTEM_PRJ 권한그룹(시스템 기본 권한그룹) 목록 총 건수 조회
	 * @param paramMap - Map
	 * @return 시스템 기본 권한그룹 목록 총건수 
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	public int selectStm2000StmAuthGrpListCnt(Map paramMap) throws Exception {
		 return stm2000DAO.selectStm2000StmAuthGrpListCnt(paramMap);
	}
	
	/**
	 * 기초데이터로 세팅된 ROOTSYSTEM_PRJ 권한그룹(시스템 기본 권한그룹) 목록 조회 (No Paging)
	 * <br/> 권한그룹 영역 상단에 세팅될 권한그룹 목록을 가져온다.
	 * @param paramMap - Map
	 * @return 시스템 기본 권한그룹 목록
	 * @exception Exception
	 */
	@SuppressWarnings("rawtypes")
	public List<Map> selectStm2000StmAuthGrpNoPagingList(Map paramMap) throws Exception{
		return stm2000DAO.selectStm2000StmAuthGrpNoPagingList(paramMap);
    }
	
	/**
	 * 기초데이터로 세팅된 ROOTSYSTEM_PRJ 권한그룹(시스템 기본 권한그룹) 단건 조회
	 * @param paramMap - Map
	 * @return 시스템 기본 권한그룹 정보
	 * @exception Exception
	 */
	@SuppressWarnings("rawtypes")
	public Map selectStm2000StmAuthGrpInfo(Map paramMap) throws Exception{
		return stm2000DAO.selectStm2000StmAuthGrpInfo(paramMap);
	}
	
	/**
	 * 시스템 권한 그룹 추가 시 현재 ROOTSYSTEM_PRJ의 권한그룹 최고 순번+1 값을 을 가져온다.
	 * <br/> 시스템 권한 그룹 등록 팝업에 사용
	 * @param paramMap - Map
	 * @return 권한그룹 다음 순번
	 * @exception Exception
	 */
	@SuppressWarnings("rawtypes")
	public int selectStm2000StmAuthGrpNextOrd(Map paramMap) throws Exception{
		return stm2000DAO.selectStm2000StmAuthGrpNextOrd(paramMap);
	}
	
	/**
	 * 신규 시스템 권한그룹 단건 등록
	 * @param paramMap Map
	 * @throws Exception
	 */
	@SuppressWarnings("rawtypes")
	public void insertStm2000StmAuthGrpInfo(Map paramMap) throws Exception{
		stm2000DAO.insertStm2000StmAuthGrpInfo(paramMap);
	}
	
	/**
	 * 시스템 권한그룹 단건 수정
	 * @param paramMap
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings({ "rawtypes" })
	public void updateStm2000StmAuthGrpInfo(Map paramMap) throws Exception{
		int uCnt = stm2000DAO.updateStm2000StmAuthGrpInfo(paramMap);
		// 수정된 건이 없으면 튕겨낸다
		if(uCnt == 0){
			throw new Exception(egovMessageSource.getMessage("fail.common.update"));
		}
	}
	
	/**
	 * 시스템 권한그룹 다건 삭제
	 * <br/> 시스템 권한그룹 삭제시 연결되어 있는 메뉴별접근권한 정보도 같이 삭제한다.
	 * @param paramMap - Map
	 * @return int
	 * @exception Exception
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void deleteStm2000StmAuthGrpInfo(Map<String, String> paramMap) throws Exception{
		
		String licGrpId = paramMap.get("licGrpId");
		String deleteDataList = paramMap.get("deleteDataList");
		
		//JSON파서 선언
		JSONParser jsonParser = new JSONParser();
		JSONArray jsonArray = (JSONArray) jsonParser.parse(deleteDataList);
		
		// 시스템 권한그룹 전체 건수 조회
		int totalCnt = stm2000DAO.selectStm2000StmAuthGrpListCnt(paramMap);
		// 삭제건수
		int deleteCnt = jsonArray.size();
		
		// 삭제건수가 전체건수와 같거나 클 경우 튕겨낸다.
		if(deleteCnt >= totalCnt){
			throw new UserDefineException(egovMessageSource.getMessage("stm2000.fail.stmAuth.minAuthCnt"));
		}
		
		// 권한그룹 다건 삭제
		for(int i=0;i<deleteCnt;i++) {
			
			JSONObject jsonObj = (JSONObject) jsonArray.get(i);
			//json to Map
			Map authInfoMap = new Gson().fromJson(jsonObj.toJSONString(), new HashMap().getClass());
			authInfoMap.put("licGrpId", licGrpId);
			
			// 시스템 권한 그룹 삭제
			stm2000DAO.deleteStm2000StmAuthGrpInfo(authInfoMap);
			
			// 시스템 권한그룹에 연결되어 있는 메뉴별접근권한 정보 삭제
			stm2000DAO.deleteStm2000StmAuthMenuList(authInfoMap);
		}
	}
	
	/**
	 * 선택한 시스템 권한 그룹에 해당하는 메뉴별 권한 정보 목록 조회
	 * @param paramMap - Map
	 * @return 메뉴 권한 목록
	 * @exception Exception
	 */
	@SuppressWarnings("rawtypes")
	public List<Map> selectStm2000AuthGrpSmallMenuList(Map paramMap) throws Exception{
		return stm2000DAO.selectStm2000AuthGrpSmallMenuList(paramMap) ;
    }
	
	/**
	 * Stm2000 메뉴권한 수정(다건) AJAX
	 * 메뉴권한 수정
	 * @param 
	 * @return 
	 * @exception Exception
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void saveStm2000AuthGrpMenuAuthList(List paramList) throws Exception{
		for(Map paramMap : (List<Map>)paramList){
			
			String strStatus = (String) paramMap.get("status");
			
			//만약 맵의 상태가 U 업데이트 상태이면
			if("U".equals(strStatus)){
				saveStm2000AuthGrpMenuAuthInfo(paramMap);
			}	
		}
	}
	
	/********* end::권한그룹 관련 코드, 시스템 권한 관리 메뉴 추가 후 코드 분리 *********/
}
