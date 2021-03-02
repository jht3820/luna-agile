package kr.opensoftlab.lunaops.prj.prj1000.prj1000.service;

import java.util.List;
import java.util.Map;



public interface Prj1000Service {
	
	@SuppressWarnings("rawtypes")
	List selectPrj1000PrjGrpAllList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	List selectPrj1000PrjGrpList(Map paramMap) throws Exception;
	
	@SuppressWarnings("rawtypes")
	int selectPrj1000PrjGrpListCnt(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	List selectPrj1000PrjList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	int selectPrj1000PrjListCnt(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	List selectPrj1000PrjAuthUsrList(Map paramMap) throws Exception;
	
	@SuppressWarnings("rawtypes")
	int selectPrj1000PrjAuthUsrListCnt(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	List selectPrj1000PrjAuthNoneUsrList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	int selectPrj1000PrjAuthNoneUsrListCnt(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	Map selectPrj1000GrpInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	Map selectPrj1000Info(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	List selectPrj1001PrjGrpAuthList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	List selectPrj1000PrjGrpExistCheck(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	List selectPrj1000PrjGrpIdExistCheck(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	String insertPrj1000PrjGrpAjax(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	String insertPrj1000PrjAjax(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	int updatePrj1000PrjGrp(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	String insertPrj1001Ajax(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	int updatePrj1000Ajax(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void deletePrj1000PrjAjax(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void updatePrj1000PrjGrpTrashListAjax(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void deletePrj1001Ajax(Map paramMap) throws Exception;
	
	@SuppressWarnings("rawtypes")
	List<Map> selectPrj1000ProjectGroupListAjax(Map<String, String> paramMap);
	
	@SuppressWarnings("rawtypes")
	int selectPrj1000ProjectAcronymCount(Map paramMap) throws Exception;
	

	
	@SuppressWarnings("rawtypes")
	List selectPrj1000AdminPrjList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	String insertPrj1000WizardProject(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	String insertPrj1000PrjAuthInfo(Map paramMap) throws Exception;
}
