package kr.opensoftlab.lunaops.prj.prj1000.prj1300.service;


import java.util.List;
import java.util.Map;



public interface Prj1300Service {

	
	@SuppressWarnings("rawtypes")
	List selectPrj1300PrjReqOptList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	List selectPrj1300PrjProOptList(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	Map selectPrj1300PrjProOptInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	int selectPrj1300PrjProOptCnt(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	void insertPrj1300PrjProOptInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void updatePrj1300PrjPrpOptInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void deletePrj1300PrjProOptInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void deletePrj1300PrjProOptList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void insertPrj1300PrjProOptValueInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void updatePrj1300PrjProOptValueInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	List selectPrj1300PrjProOptExistFileIdList(Map paramMap) throws Exception;
}
