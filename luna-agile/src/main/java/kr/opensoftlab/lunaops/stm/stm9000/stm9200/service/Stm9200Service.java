package kr.opensoftlab.lunaops.stm.stm9000.stm9200.service;

import java.util.List;
import java.util.Map;



public interface Stm9200Service {

	
	@SuppressWarnings("rawtypes" )
	List<Map> selectStm9200PrjAssignJenkinsJobList(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes" )
	int selectStm9200PrjAssignJenkinsJobListCnt(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes" )
	List<Map> selectStm9200PrjNotAssignJenkinsJobList(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	int selectStm9200PrjNotAssignJenkinsJobListCnt(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void insertStm9200JenkinsJobInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void deleteStm9200JenkinsJobInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	List<Map> selectStm9200PrjAssignDplAuthList(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes" )
	int selectStm9200PrjAssignDplAuthListCnt(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	List<Map> selectStm9200PrjNotAssignDplAuthList(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes" )
	int selectStm9200PrjNotAssignDplAuthListCnt(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void insertStm9200DplAuthInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void deleteStm9200DplAuthInfo(Map paramMap) throws Exception;
}
