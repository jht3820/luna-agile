package kr.opensoftlab.lunaops.bad.bad1000.bad1100.service;

import java.util.List;
import java.util.Map;


public interface Bad1100Service {

	
	@SuppressWarnings("rawtypes")
	int selectBad1100CmtListCnt(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	List<Map> selectBad1100CmtList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes" })
	 void insertBad1100CmtInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void deleteBad1100CmtInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void deleteBad1100CmtDelInfo(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	void updateBad1100CmtRestore(Map paramMap) throws Exception;
	
}
