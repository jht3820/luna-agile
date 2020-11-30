package kr.opensoftlab.lunaops.prj.prj1000.prj1000.service;

import java.util.List;
import java.util.Map;


/**
 * @Class Name : Prj1000Service.java
 * @Description : Prj1000Service Business class
 * @Modification Information
 *
 * @author 진주영
 * @since 2020.08.13.
 * @version 1.0
 * @see
 *  
 *  Copyright (C) OpenSoftLab Corp. All right reserved.
 */
public interface Prj1000Service {
	/**
	 * Prj1000  프로젝트 그룹 전체 목록 조회
	 * @param param - Map
	 * @return 
	 * @exception Exception
	 */
	@SuppressWarnings("rawtypes")
	List selectPrj1000PrjGrpAllList(Map paramMap) throws Exception;
	
	/**
	 * Prj1000  프로젝트 그룹 목록 조회
	 * @param param - Map
	 * @return 
	 * @exception Exception
	 */
	@SuppressWarnings("rawtypes")
	List selectPrj1000PrjGrpList(Map paramMap) throws Exception;
	/**
	 * Prj1000 프로젝트 그룹 목록 수 조회
	 * @param param - Map
	 * @return 
	 * @exception Exception
	 */
	@SuppressWarnings("rawtypes")
	int selectPrj1000PrjGrpListCnt(Map paramMap) throws Exception;

	/**
	 * Prj1000  프로젝트 목록 조회
	 * @param param - Map
	 * @return 
	 * @exception Exception
	 */
	@SuppressWarnings("rawtypes")
	List selectPrj1000PrjList(Map paramMap) throws Exception;
	
	/**
	 * Prj1000 프로젝트 목록 수 조회
	 * @param param - Map
	 * @return 
	 * @exception Exception
	 */
	@SuppressWarnings("rawtypes")
	int selectPrj1000PrjListCnt(Map paramMap) throws Exception;

	/**
	 * Prj1000  프로젝트 담당자 조회
	 * @param param - Map
	 * @return 
	 * @exception Exception
	 */
	@SuppressWarnings("rawtypes")
	List selectPrj1000PrjAuthUsrList(Map paramMap) throws Exception;
	/**
	 * Prj1000 프로젝트 담당자 수 조회
	 * @param param - Map
	 * @return 
	 * @exception Exception
	 */
	@SuppressWarnings("rawtypes")
	int selectPrj1000PrjAuthUsrListCnt(Map paramMap) throws Exception;
	
	/**
	 * Prj1000  프로젝트 미  담당자 조회
	 * @param param - Map
	 * @return 
	 * @exception Exception
	 */
	@SuppressWarnings("rawtypes")
	List selectPrj2100PrjAuthNoneUsrList(Map paramMap) throws Exception;
	
	/**
	 * Prj1000 프로젝트 미 담당자 수 조회
	 * @param param - Map
	 * @return 
	 * @exception Exception
	 */
	@SuppressWarnings("rawtypes")
	int selectPrj2100PrjAuthNoneUsrListCnt(Map paramMap) throws Exception;
	
	/**
	 * Prj1000 프로젝트 생성관리 단건 조회
	 * @param param - Map
	 * @return 
	 * @exception Exception
	 */
	@SuppressWarnings("rawtypes")
	Map selectPrj1000Info(Map paramMap) throws Exception;

	/**
	 * Prj1000 프로젝트 그룹 담당자 조회
	 * @param param - Map
	 * @return 
	 * @exception Exception
	 */
	@SuppressWarnings("rawtypes")
	List selectPrj1001PrjGrpAuthList(Map paramMap) throws Exception;
	
	/**
	 * Prj1000 프로젝트 그룹 존재하는지 체크
	 * @param param - Map
	 * @return 
	 * @exception Exception
	 */
	@SuppressWarnings("rawtypes")
	List selectPrj1000PrjGrpExistCheck(Map paramMap) throws Exception;
	
	/**
	 * Prj1000 프로젝트 그룹 ID에 해당하는 프로젝트가 존재하는지 체크
	 * @param param - Map
	 * @return 
	 * @exception Exception
	 */
	@SuppressWarnings("rawtypes")
	List selectPrj1000PrjGrpIdExistCheck(Map paramMap) throws Exception;
	
	/**
	 * Prj1000 프로젝트 그룹 생성(insert) AJAX
	 * @param Map
	 * @exception Exception
	 */
	@SuppressWarnings("rawtypes")
	String insertPrj1000PrjGrpAjax(Map paramMap) throws Exception;

	/**
	 * Prj1000 프로젝트 생성(insert) AJAX
	 * @param Map
	 * @exception Exception
	 */
	@SuppressWarnings("rawtypes")
	String insertPrj1000PrjAjax(Map paramMap) throws Exception;
	
	/**
	 * Prj1000 프로젝트 그룹 수정(update)
	 * @param Map
	 * @exception Exception
	 */
	@SuppressWarnings("rawtypes")
	int updatePrj1000PrjGrp(Map paramMap) throws Exception;
	
	/**
	 * Prj1000 프로젝트 생성관리 등록(insert) AJAX
	 * @param Map
	 * @return 프로젝트 ID
	 * @exception Exception
	 */
	@SuppressWarnings("rawtypes")
	String insertPrj1001Ajax(Map paramMap) throws Exception;
	
	/**
	 * Prj1000 프로젝트 생성관리 등록(update) AJAX
	 * @param Map
	 * @return update row
	 * @exception Exception
	 */
	@SuppressWarnings("rawtypes")
	int updatePrj1000Ajax(Map paramMap) throws Exception;
	
	/**
	 * Prj1000 프로젝트 그룹&단위  제거
	 * @param Map
	 * @return delete row
	 * @exception Exception
	 */
	@SuppressWarnings("rawtypes")
	void deletePrj1000PrjAjax(Map paramMap) throws Exception;
	
	/**
	 * Prj1000 프로젝트 그룹 일괄&단건 삭제유무 변경
	 * @param Map
	 * @return delete row
	 * @exception Exception
	 */
	@SuppressWarnings("rawtypes")
	void updatePrj1000PrjGrpTrashListAjax(Map paramMap) throws Exception;
	
	/**
	 * Prj1000 프로젝트 생성관리 등록(delete) AJAX
	 * @param Map
	 * @return delete row
	 * @exception Exception
	 */
	@SuppressWarnings("rawtypes")
	void deletePrj1001Ajax(Map paramMap) throws Exception;
	
	@SuppressWarnings("rawtypes")
	List<Map> selectPrj1000ProjectGroupListAjax(Map<String, String> paramMap);
	
	@SuppressWarnings("rawtypes")
	int selectPrj1000ProjectAcronymCount(Map paramMap) throws Exception;
	

	/**
	 * Prj1000 관리 권한 있는 프로젝트 목록 검색
	 * @param param - Map
	 * @return 
	 * @exception Exception
	 */
	@SuppressWarnings("rawtypes")
	List selectPrj1000AdminPrjList(Map paramMap) throws Exception;
	
	/**
	 * Prj1000 프로젝트 생성 마법사
	 * @param param - Map
	 * @return 
	 * @exception Exception
	 */
	@SuppressWarnings("rawtypes")
	String insertPrj1000WizardProject(Map paramMap) throws Exception;

	/**
	 * Prj1000 프로젝트 담당자 추가
	 * @param Map
	 * @exception Exception
	 */
	@SuppressWarnings("rawtypes")
	String insertPrj1000PrjAuthInfo(Map paramMap) throws Exception;
}
