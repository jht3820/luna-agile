package kr.opensoftlab.lunaops.stm.stm9000.stm9100.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;



@Repository("stm9100DAO")
public class Stm9100DAO extends ComOslitsAbstractDAO {
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map> selectStm9100JobList(Map paramMap) throws Exception {
		return (List) list("stm9100DAO.selectStm9100JobList", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectStm9100JobListCnt(Map paramMap) throws Exception {
		return (Integer) select("stm9100DAO.selectStm9100JobListCnt", paramMap);
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map> selectStm9100JobNormalList(Map paramMap) throws Exception {
		return (List) list("stm9100DAO.selectStm9100JobNormalList", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public Map selectStm9100JobInfo(Map<String, String> paramMap) throws Exception {
		return (Map) select("stm9100DAO.selectStm9100JobInfo", paramMap);
	}
	
	
	public String insertStm9100JobInfo(Map<String, String> paramMap) throws Exception {
		return (String) insert("stm9100DAO.insertStm9100JobInfo", paramMap);
	}
	
	
	public int updateStm9100JobInfo(Map<String, String> paramMap)  throws Exception{
		return update("stm9100DAO.updateStm9100JobInfo", paramMap);
	}
	
	
	public int selectStm9100JobUseCountInfo(Map<String, String> paramMap)  throws Exception{
		return (Integer) select("stm9100DAO.selectStm9100JobUseCountInfo", paramMap);
	}
	
	
	public void deleteStm9100JobInfo(Map<String, String> paramMap) throws Exception {
		delete("stm9100DAO.deleteStm9100JobInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void updateJen9100JenkinsJobRestoreInfo(Map paramMap) throws Exception {
		update("stm9100DAO.updateJen9100JenkinsJobRestoreInfo", paramMap);
	}
	
	
	
	
	@SuppressWarnings("rawtypes")
	public List selectJen1300JenkinsJobAuthGrpNormalList(Map paramMap) throws Exception {
		return (List) list("stm9100DAO.selectJen1300JenkinsJobAuthGrpNormalList", paramMap);
	}
}
