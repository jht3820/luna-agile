package kr.opensoftlab.lunaops.stm.stm9000.stm9100.service;

import java.util.List;
import java.util.Map;



public interface Stm9100Service {

	
	@SuppressWarnings("rawtypes")
	List<Map> selectStm9100JobList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	int selectStm9100JobListCnt(Map paramMap) throws Exception;
	
	
	@SuppressWarnings({  "rawtypes" })
	List<Map> selectStm9100JobNormalList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	Map selectStm9100JobInfo(Map<String, String> paramMap) throws Exception;
	
	
	String insertStm9100JobInfo(Map<String, String> paramMap) throws Exception;

	
	int updateStm9100JobInfo(Map<String, String> paramMap) throws Exception;

	
	Object saveStm9100JobInfo(Map<String, String> paramMap)  throws Exception;
	
	
	void deleteStm9100JobInfo(Map<String, String> paramMap) throws Exception;
	
	
	int selectStm9100JobUseCountInfo(Map<String, String> paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	List selectJen1300JenkinsJobAuthGrpNormalList(Map paramMap) throws Exception;
	
}
