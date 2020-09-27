package kr.opensoftlab.lunaops.bad.bad1000.bad1000.service;

import java.util.List;
import java.util.Map;


public interface Bad1000Service {

	
	@SuppressWarnings("rawtypes")
	int selectBad1000BadListCnt(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	List<Map> selectBad1000BadList(Map paramMap) throws Exception;

	
	String selectBad1000BadPwInfo(Map<String, String> paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	Map selectBad1000BadInfo(Map paramMap) throws Exception;

	
	@SuppressWarnings({ "rawtypes"})
	void insertBad1000Badinfo(Map paramMap) throws Exception;

	
	@SuppressWarnings({ "rawtypes" })
	List<Map> selectBad1000BadListTagList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes" })
	List<String> selectBad1000BadTagList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void updateBad1000BadInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void deleteBad1000BadList(Map paramMap) throws Exception;

	
	void updateBad1000BadRestore(Map<String, String> paramMap) throws Exception;
}
