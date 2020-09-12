package kr.opensoftlab.lunaops.stm.stm2000.stm2100.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;


@Repository("stm2100DAO")
public class Stm2100DAO extends ComOslitsAbstractDAO {

	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map> selectStm2100BadList(Map<String, String> paramMap) throws Exception {
		return  (List<Map>) list("stm2100DAO.selectStm2100BadList", paramMap);
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Map<String, String> selectStm2100BadInfo(Map<String, String> paramMap) throws Exception {
		return  (Map) select("stm2100DAO.selectStm2100BadInfo", paramMap);
	}
	
	
	
	public void updateStm2100BadOptions(Map<String, String> paramMap) throws Exception {
		update("stm2100DAO.updateStm2100BadOptions", paramMap);
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map> selectStm2110BadAdmList(Map<String, String> paramMap) throws Exception {
		return  (List<Map>) list("stm2100DAO.selectStm2110BadAdmList", paramMap);
	}
	

	
	public void insertStm2110BadAdmin(Map<String, String> paramMap) throws Exception {
		insert("stm2100DAO.insertStm2110BadAdmin", paramMap);
	}
	
	
	public void deleteStm2110BadAdmin(Map<String, String> paramMap) throws Exception {
		delete("stm2100DAO.deleteStm2110BadAdmin", paramMap);
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map> selectStm2120BadWtList(Map<String, String> paramMap) throws Exception {
		return  (List<Map>) list("stm2100DAO.selectStm2120BadWtList", paramMap);
	}

	
	public void insertStm2120BadWriter(Map<String, String> paramMap) throws Exception {
		insert("stm2100DAO.insertStm2120BadWriter", paramMap);
	}
	
	
	public void deleteStm2120BadWriter(Map<String, String> paramMap) throws Exception {
		delete("stm2100DAO.deleteStm2120BadWriter", paramMap);
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map> selectStm2100BadGrpList(Map<String, String> paramMap) throws Exception {
		return  (List<Map>) list("stm2100DAO.selectStm2100BadGrpList", paramMap);
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map> selectStm2100BadUsrList(Map<String, String> paramMap) throws Exception {
		return  (List<Map>) list("stm2100DAO.selectStm2100BadUsrList", paramMap);
	}
	
	
	public String selectStm2100AdminCheck(Map<String, String> paramMap) throws Exception {
		return  (String) select("stm2100DAO.selectStm2100AdminCheck", paramMap);
	}
	
	
	public String selectStm2100WriterCheck(Map<String, String> paramMap) throws Exception {
		return  (String) select("stm2100DAO.selectStm2100WriterCheck", paramMap);
	}

	
}
