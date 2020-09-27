package kr.opensoftlab.lunaops.stm.stm9000.stm9100.service;

import java.util.List;
import java.util.Map;

import kr.opensoftlab.lunaops.stm.stm9000.stm9100.vo.Stm9100VO;



public interface Stm9100Service {

	
	List<Stm9100VO> selectStm9100JenkinsProjectList(Stm9100VO stm9100VO) throws Exception;

	
	int selectStm9100JenkinsProjectListCnt(Stm9100VO stm9100VO) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	List selectStm9100JenkinsProjectAuthList(Stm9100VO stm9100VO) throws Exception;

	
	int selectStm9100JenkinsProjectAuthListCnt(Stm9100VO stm9100VO) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void insertStm9100ProjectAddJob(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	void deleteStm9100ProjectDelJob(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	List selectJen1300JenkinsJobAuthGrpNormalList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	List selectStm9100JenkinsJobAuthGrpList(Stm9100VO stm9100VO) throws Exception;
	
	
	int selectStm9100JenkinsJobAuthGrpListCnt(Stm9100VO stm9100VO) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	int selectStm9100JenkinsJobAuthGrpCnt(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	int insertStm9100JenkinsJobAuthGrpInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void deleteStm9100JenkinsJobAuthGrpInfo(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	void updateJen1100JenkinsJobRestoreInfo(Map paramMap) throws Exception;
}
