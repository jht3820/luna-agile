package kr.opensoftlab.lunaops.stm.stm9000.stm9000.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;


@Repository("stm9000DAO")
public class Stm9000DAO extends ComOslitsAbstractDAO {
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map> selectStm9000JenkinsList(Map paramMap) throws Exception {
		return (List<Map>) list("stm9000DAO.selectStm9000JenkinsList", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectStm9000JenkinsListCnt(Map paramMap) throws Exception {
		return (Integer) select("stm9000DAO.selectStm9000JenkinsListCnt", paramMap);
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map> selectStm9000JenkinsNormalList(Map paramMap) throws Exception {
		return (List) list("stm9000DAO.selectStm9000JenkinsNormalList", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public Map selectStm9000JenkinsInfo(Map<String, String> paramMap) throws Exception {
		return (Map) select("stm9000DAO.selectStm9000JenkinsInfo", paramMap);
	}
	
	
	public String insertStm9000JenkinsInfo(Map<String, String> paramMap) throws Exception {
		return (String) insert("stm9000DAO.insertStm9000JenkinsInfo", paramMap);
	}
	
	
	public int updateStm9000JenkinsInfo(Map<String, String> paramMap)  throws Exception{
		return update("stm9000DAO.updateStm9000JenkinsInfo", paramMap);
	}
	
	
	public void deleteStm9000JenkinsInfo(Map<String, String> paramMap)  throws Exception{
		update("stm9000DAO.deleteStm9000JenkinsInfo", paramMap);
	}
	

}
