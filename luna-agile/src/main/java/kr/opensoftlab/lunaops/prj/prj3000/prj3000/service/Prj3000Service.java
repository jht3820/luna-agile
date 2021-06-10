package kr.opensoftlab.lunaops.prj.prj3000.prj3000.service;

import java.util.List;
import java.util.Map;


public interface Prj3000Service {

	
	@SuppressWarnings("rawtypes")
	List selectPrj3000BaseMenuList(Map paramMap) throws Exception;	

	
	@SuppressWarnings("rawtypes")
	Map selectPrj3000MenuInfo(Map paramMap) throws Exception;	
	
	
	
	@SuppressWarnings("rawtypes")
	String insertPrj3000RootMenuInfo(Map paramMap) throws Exception;
	

	
	
	
	
	@SuppressWarnings("rawtypes")
	List selectPrj3000MenuTree(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	Map selectPrj3000WizardMenuInfo(Map paramMap) throws Exception;

	
	int selectPrj3000DocNextOrd(Map<String, String> paramMap) throws Exception;

	
	String insertPrj3000DocInfo(Map<String, String> paramMap) throws Exception;

	
	void updatePrj3000DocInfo(Map<String, String> paramMap) throws Exception;

	
	void deletePrj3000DocInfo(Map<String, String> paramMap) throws Exception;

	
	void deletePrj3000File(Map<String, String> paramMap) throws Exception;

	
	void updatePrj3000FileType(Map<String, String> paramMap) throws Exception;
	
	
	
	
	
	int selectPrj3002DocConListCnt(Map<String, String> paramMap) throws Exception;

	
	@SuppressWarnings({ "rawtypes" })
	List<Map> selectPrj3002DocConList(Map<String, String> paramMap) throws Exception;

	
	int selectPrj3002ConTargetCnt(Map<String, String> paramMap) throws Exception;

	
	@SuppressWarnings({ "rawtypes" })
	List selectPrj3002ConTargetList(Map<String, String> paramMap) throws Exception;

	
	void insertPrj3002DocConInfo(Map<String, String> paramMap) throws Exception;

	
	void deletePrj3002DocConInfo(Map<String, String> paramMap) throws Exception;
	
	
	
	
	
	@SuppressWarnings("rawtypes")
	int deletePrj3000DocList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	List selectPrj3000RootMenuList(Map paramMap) throws Exception;
}
