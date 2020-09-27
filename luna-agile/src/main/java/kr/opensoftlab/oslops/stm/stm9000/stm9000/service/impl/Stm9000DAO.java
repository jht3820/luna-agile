package kr.opensoftlab.lunaops.stm.stm9000.stm9000.service.impl;

import java.util.List;
import java.util.Map;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;
import kr.opensoftlab.lunaops.stm.stm9000.stm9000.vo.Stm9000VO;
import kr.opensoftlab.lunaops.stm.stm9000.stm9000.vo.Stm9001VO;

import org.springframework.stereotype.Repository;



@Repository("stm9000DAO")
public class Stm9000DAO extends ComOslitsAbstractDAO {
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map> selectStm9000JenkinsNormalList(Map paramMap) throws Exception {
		return (List) list("stm9000DAO.selectStm9000JenkinsNormalList", paramMap);
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map> selectStm9000JobNormalList(Map paramMap) throws Exception {
		return (List) list("stm9000DAO.selectStm9000JobNormalList", paramMap);
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Stm9000VO> selectStm9000JenkinsList(Stm9000VO stm9000VO) throws Exception {
		return (List) list("stm9000DAO.selectStm9000JenkinsList", stm9000VO);
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Stm9001VO> selectStm9000JobList(Stm9001VO jen1100VO) throws Exception {
		return (List) list("stm9000DAO.selectStm9000JobList", jen1100VO);
	}
	
	
	public int selectStm9000JenkinsListCnt(Stm9000VO stm9000VO) throws Exception {
		return (Integer) select("stm9000DAO.selectStm9000JenkinsListCnt", stm9000VO);
	}
	
	
	public int selectStm9000JobListCnt(Stm9001VO jen1100VO) throws Exception {
		return (Integer) select("stm9000DAO.selectStm9000JobListCnt", jen1100VO);
	}
	
	
	@SuppressWarnings("rawtypes")
	public Map selectStm9000JenkinsInfo(Map<String, String> paramMap) throws Exception {
		return (Map) select("stm9000DAO.selectStm9000JenkinsInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public Map selectStm9000JobInfo(Map<String, String> paramMap) throws Exception {
		return (Map) select("stm9000DAO.selectStm9000JobInfo", paramMap);
	}
	
	
	public String insertStm9000JenkinsInfo(Map<String, String> paramMap) throws Exception {
		return (String) insert("stm9000DAO.insertStm9000JenkinsInfo", paramMap);
	}
	
	
	public String insertStm9000JobInfo(Map<String, String> paramMap) throws Exception {
		return (String) insert("stm9000DAO.insertStm9000JobInfo", paramMap);
	}

	
	public int updateStm9000JenkinsInfo(Map<String, String> paramMap)  throws Exception{
		return update("stm9000DAO.updateStm9000JenkinsInfo", paramMap);
	}
	
	
	public int updateStm9000JobInfo(Map<String, String> paramMap)  throws Exception{
		return update("stm9000DAO.updateStm9000JobInfo", paramMap);
	}
	
	
	public void deleteStm9000JenkinsInfo(Map<String, String> paramMap)  throws Exception{
		update("stm9000DAO.deleteStm9000JenkinsInfo", paramMap);
	}
	
	
	public void deleteStm9000JobInfo(Map<String, String> paramMap) throws Exception {
		delete("stm9000DAO.deleteStm9000JobInfo", paramMap);
	}
	
	
	public int selectStm9000JenkinsUseCountInfo(Map<String, String> paramMap)  throws Exception{
		return (Integer) select("stm9000DAO.selectStm9000JenkinsUseCountInfo", paramMap);
	}
	
	
	public int selectStm9000JobUseCountInfo(Map<String, String> paramMap)  throws Exception{
		return (Integer) select("stm9000DAO.selectStm9000JobUseCountInfo", paramMap);
	}

	
	@SuppressWarnings({"rawtypes", "unchecked" })
	public List<Map> selectStm9000JenkinsUserList(Map map) throws Exception{
		return (List) list("stm9000DAO.selectStm9000JenkinsUserList", map);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void insertStm9000JenAuthGrpInfo(Map paramMap) throws Exception {
		insert("stm9000DAO.insertStm9000JenAuthGrpInfo", paramMap);
	}
	
	@SuppressWarnings("rawtypes")
	public void deleteStm9000JenAuthGrpInfo(Map paramMap) throws Exception {
		delete("stm9000DAO.deleteStm9000JenAuthGrpInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectStm9000JenAuthGrpList(Map paramMap) throws Exception {
		return (List) list("stm9000DAO.selectStm9000JenAuthGrpList", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectStm9000JenAuthGrpCnt(Map paramMap) throws Exception {
		return (int) select("stm9000DAO.selectStm9000JenAuthGrpCnt", paramMap);
	}
}
