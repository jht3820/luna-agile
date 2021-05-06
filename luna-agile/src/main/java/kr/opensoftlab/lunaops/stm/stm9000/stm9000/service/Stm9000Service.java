package kr.opensoftlab.lunaops.stm.stm9000.stm9000.service;

import java.util.List;
import java.util.Map;


public interface Stm9000Service {

	
	@SuppressWarnings("rawtypes")
	List<Map> selectStm9000JenkinsList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	int selectStm9000JenkinsListCnt(Map paramMap) throws Exception;

	
	@SuppressWarnings({ "rawtypes" })
	List<Map> selectStm9000JenkinsNormalList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	Map selectStm9000JenkinsInfo(Map<String, String> paramMap) throws Exception;
	
	
	String insertStm9000JenkinsInfo(Map<String, String> paramMap) throws Exception;
	
	
	int updateStm9000JenkinsInfo(Map<String, String> paramMap) throws Exception;
	
	
	void deleteStm9000JenkinsInfo(Map<String, String> paramMap) throws Exception;
	
	
	Object saveStm9000JenkinsInfo(Map<String, String> paramMap)  throws Exception;
	
}
