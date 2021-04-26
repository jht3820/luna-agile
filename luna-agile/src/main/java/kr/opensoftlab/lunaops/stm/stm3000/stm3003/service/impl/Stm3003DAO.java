package kr.opensoftlab.lunaops.stm.stm3000.stm3003.service.impl;

import java.util.Map;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;

import org.springframework.stereotype.Repository;



@Repository("stm3003DAO")
public class Stm3003DAO  extends ComOslitsAbstractDAO {
	

	
	@SuppressWarnings("rawtypes")
	public void insertStm3003UserChangeLog(Map paramMap) throws Exception{
		 insert("stm3003DAO.insertStm3003UserChangeLog", paramMap);
	}
	
	
	
	@SuppressWarnings("rawtypes")
	public int selectStm3003PwChangeDateCheck(Map paramMap) throws Exception{
		return (Integer) select("stm3003DAO.selectStm3003PwChangeDateCheck", paramMap);
	}
	
	
	
	@SuppressWarnings("rawtypes")
	public String selectStm3003BeforeUsedPwCheck(Map paramMap) throws Exception{
		return (String) select("stm3003DAO.selectStm3003BeforeUsedPwCheck", paramMap);
	}

	
	public String selectPrs3000recentPassAjax(Map<String, String> paramMap) {
		return (String) select("stm3003DAO.selectPrs3000recentPassAjax", paramMap);
	}	
}




