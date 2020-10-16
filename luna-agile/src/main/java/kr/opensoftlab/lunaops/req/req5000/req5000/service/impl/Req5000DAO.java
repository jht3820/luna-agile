package kr.opensoftlab.lunaops.req.req5000.req5000.service.impl;

import java.util.Map;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;

import org.springframework.stereotype.Repository;



@Repository("req5000DAO")
public class Req5000DAO extends ComOslitsAbstractDAO {
	
		
	@SuppressWarnings("rawtypes")
	public String insertReq5000ReqSignInfo(Map paramMap) throws Exception{
		return (String)insert("req5000DAO.insertReq5000ReqSignInfo", paramMap);
	}
	
}
