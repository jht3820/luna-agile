package kr.opensoftlab.lunaops.prj.prj3000.prj3200.service;

import java.util.List;
import java.util.Map;


public interface Prj3200Service {

	
	int selectPrj3200DocConListCnt(Map<String, String> paramMap) throws Exception;

	
	@SuppressWarnings({ "rawtypes" })
	List<Map> selectPrj3200DocConList(Map<String, String> paramMap) throws Exception;

	
	int selectPrj3200ConTargetCnt(Map<String, String> paramMap) throws Exception;

	
	@SuppressWarnings({ "rawtypes" })
	List selectPrj3200ConTargetList(Map<String, String> paramMap) throws Exception;

	
	void insertPrj3200DocConInfo(Map<String, String> paramMap) throws Exception;

	
	void deletePrj3200DocConInfo(Map<String, String> paramMap) throws Exception;

}
