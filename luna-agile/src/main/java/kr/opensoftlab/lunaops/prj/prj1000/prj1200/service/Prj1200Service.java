package kr.opensoftlab.lunaops.prj.prj1000.prj1200.service;

import java.util.List;
import java.util.Map;



public interface Prj1200Service {
	
	@SuppressWarnings("rawtypes")
	List selectPrj1200PrjList(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	int selectPrj1200PrjListCnt(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	Map selectPrjSet1200Info(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	int insertPrj1200PrjSetAjax(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	int updatePrj1200PrjSetAjax(Map paramMap) throws Exception;
}
