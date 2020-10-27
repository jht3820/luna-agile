package kr.opensoftlab.lunaops.stm.stm9000.stm9100.service.impl;

import java.util.List;
import java.util.Map;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;
import kr.opensoftlab.lunaops.stm.stm9000.stm9100.vo.Stm9100VO;

import org.springframework.stereotype.Repository;



@Repository("stm9100DAO")
public class Stm9100DAO extends ComOslitsAbstractDAO {
	
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Stm9100VO> selectStm9100JenkinsProjectList(Stm9100VO stm9100VO) throws Exception{
		return (List) list("stm9100DAO.selectStm9100JenkinsProjectList", stm9100VO);
	}
	
	
	public int selectStm9100JenkinsProjectListCnt(Stm9100VO stm9100VO) throws Exception {
		return (Integer) select("stm9100DAO.selectStm9100JenkinsProjectListCnt", stm9100VO);
	}

	
	@SuppressWarnings("rawtypes")
	public List selectStm9100JenkinsProjectAuthList(Stm9100VO stm9100VO) throws Exception {
		return (List) list("stm9100DAO.selectStm9100JenkinsProjectAuthList", stm9100VO);
	}
		
	
	public int selectStm9100JenkinsProjectAuthListCnt(Stm9100VO stm9100VO) throws Exception {
		return (Integer) select("stm9100DAO.selectStm9100JenkinsProjectAuthListCnt", stm9100VO);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void insertStm9100ProjectAddJob(Map paramMap) throws Exception{
		insert("stm9100DAO.insertJen1200ProjectAddJob",paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public void deleteStm9100ProjectDelJob(Map paramMap) throws Exception{
		delete("stm9100DAO.deleteJen1200ProjectDelJob",paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectJen1300JenkinsJobAuthGrpNormalList(Map paramMap) throws Exception {
		return (List) list("stm9100DAO.selectJen1300JenkinsJobAuthGrpNormalList", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectStm9100JenkinsJobAuthGrpList(Stm9100VO stm9100VO) throws Exception {
		return (List) list("stm9100DAO.selectJen1300JenkinsJobAuthGrpList", stm9100VO);
	}
	
	
	public int selectStm9100JenkinsJobAuthGrpListCnt(Stm9100VO stm9100VO) throws Exception {
		return (Integer) select("stm9100DAO.selectJen1300JenkinsJobAuthGrpListCnt", stm9100VO);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectStm9100JenkinsJobAuthGrpCnt(Map paramMap) throws Exception {
		return (int) select("stm9100DAO.selectJen1300JenkinsJobAuthGrpCnt", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void insertStm9100JenkinsJobAuthGrpInfo(Map paramMap) throws Exception {
		insert("stm9100DAO.insertJen1300JenkinsJobAuthGrpInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void deleteStm9100JenkinsJobAuthGrpInfo(Map paramMap) throws Exception {
		delete("stm9100DAO.deleteJen1300JenkinsJobAuthGrpInfo", paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public void updateJen1100JenkinsJobRestoreInfo(Map paramMap) throws Exception {
		update("stm9100DAO.updateJen1100JenkinsJobRestoreInfo", paramMap);
	}
}
