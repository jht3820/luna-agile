package kr.opensoftlab.lunaops.stm.stm8000.stm8000.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;


@Repository("stm8000DAO")
public class Stm8000DAO extends ComOslitsAbstractDAO {

	
	public int selectStm8000ServerListCnt(Map<String, String> paramMap) throws Exception {
		return  (int) select("stm8000DAO.selectStm8000ServerListCnt", paramMap);
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map> selectStm8000ServerList(Map<String, String> paramMap) throws Exception {
		return  (List<Map>) list("stm8000DAO.selectStm8000ServerList", paramMap);
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public Map selectStm8000ServerInfo(Map<String, String> paramMap) throws Exception {
		return  (Map) select("stm8000DAO.selectStm8000ServerInfo", paramMap);
	}
	
	
	public String insertStm8000ServerInfo(Map<String, String> paramMap) throws Exception {
		return  (String) insert("stm8000DAO.insertStm8000ServerInfo", paramMap);
	}
	
	
	public void updateStm8000ServerPwInfo(Map<String, String> paramMap) throws Exception {
		update("stm8000DAO.updateStm8000ServerPwInfo", paramMap);
	}
	
	
	public void updateStm8000ServerInfo(Map<String, String> paramMap) throws Exception {
		update("stm8000DAO.updateStm8000ServerInfo", paramMap);
	}
	
	
	public void deleteStm8000ServerInfo(Map<String, String> paramMap) throws Exception {
		delete("stm8000DAO.deleteStm8000ServerInfo", paramMap);
	}

}
