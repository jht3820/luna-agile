package kr.opensoftlab.lunaops.stm.stm9000.stm9000.service;

import java.util.List;
import java.util.Map;

import kr.opensoftlab.lunaops.stm.stm9000.stm9000.vo.Stm9000VO;
import kr.opensoftlab.lunaops.stm.stm9000.stm9000.vo.Stm9001VO;



public interface Stm9000Service {

	
	@SuppressWarnings({ "rawtypes" })
	List<Map> selectStm9000JenkinsNormalList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings({  "rawtypes" })
	List<Map> selectStm9000JobNormalList(Map paramMap) throws Exception;
	
	
	List<Stm9000VO> selectStm9000JenkinsList(Stm9000VO stm9000VO) throws Exception;
	
	
	List<Stm9001VO> selectStm9000JobList(Stm9001VO jen1100VO) throws Exception;
	
	
	int selectStm9000JenkinsListCnt(Stm9000VO stm9000VO) throws Exception;
	
	
	int selectStm9000JobListCnt(Stm9001VO jen1100VO) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	Map selectStm9000JenkinsInfo(Map<String, String> paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	Map selectStm9000JobInfo(Map<String, String> paramMap) throws Exception;
	
	
	String insertStm9000JenkinsInfo(Map<String, String> paramMap) throws Exception;
	
	
	String insertStm9000JobInfo(Map<String, String> paramMap) throws Exception;

	
	int updateStm9000JenkinsInfo(Map<String, String> paramMap) throws Exception;
	
	
	int updateStm9000JobInfo(Map<String, String> paramMap) throws Exception;
	
	
	void deleteStm9000JenkinsInfo(Map<String, String> paramMap) throws Exception;
	
	
	void deleteStm9000JobInfo(Map<String, String> paramMap) throws Exception;
	
	
	int selectStm9000JenkinsUseCountInfo(Map<String, String> paramMap) throws Exception;
	
	
	int selectStm9000JobUseCountInfo(Map<String, String> paramMap) throws Exception;
	
	
	Object saveStm9000JenkinsInfo(Map<String, String> paramMap)  throws Exception;
	
	
	Object saveStm9000JobInfo(Map<String, String> paramMap)  throws Exception;
	
	
	@SuppressWarnings({"rawtypes"})
	List<Map> selectStm9000JenkinsUserList(Map map) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	int insertStm9000JenAuthGrpList(Map paramMap) throws Exception;
	
	@SuppressWarnings("rawtypes")
	void deleteStm9000JenAuthGrpList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void insertStm9000JenAuthGrpInfo(Map paramMap) throws Exception;
	
	@SuppressWarnings("rawtypes")
	void deleteStm9000JenAuthGrpInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	List selectStm9000JenAuthGrpList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	int selectStm9000JenAuthGrpCnt(Map paramMap) throws Exception;
}
