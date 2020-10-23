package kr.opensoftlab.lunaops.bad.bad1000.bad1200.service.impl;

import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;



@Repository("bad1200DAO")
public class Bad1200DAO extends ComOslitsAbstractDAO {
	
	
	public void insertBad1200BadInfo(Map<String, String> paramMap) {
		insert("bad1200DAO.insertBad1200BadInfo", paramMap);
	}
	
}
