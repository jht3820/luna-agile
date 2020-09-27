package kr.opensoftlab.lunaops.stm.stm3000.stm3001.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;



@Repository("stm3001DAO")
public class Stm3001DAO extends ComOslitsAbstractDAO {

	
	@SuppressWarnings("rawtypes")
	public List selectStm3001UsrOptList(Map paramMap) throws Exception {
		return(List) list("stm3001DAO.selectStm3001UsrOptList", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public Map selectStm3001UsrOptInfo(Map paramMap) throws Exception {
		return(Map) select("stm3001DAO.selectStm3001UsrOptInfo", paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public int selectStm3001UsrOptCnt(Map paramMap) throws Exception {
		return (int)select("stm3001DAO.selectStm3001UsrOptCnt", paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public String insertStm3001UsrOptInfo(Map paramMap) throws Exception {
		return (String)insert("stm3001DAO.insertStm3001UsrOptInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int updateStm3001UsrOptInfo(Map paramMap) throws Exception{
		return (int) update("stm3001DAO.updateStm3001UsrOptInfo", paramMap);
	}
}