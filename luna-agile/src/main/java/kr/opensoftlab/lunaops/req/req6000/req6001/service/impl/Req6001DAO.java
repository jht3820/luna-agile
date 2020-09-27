package kr.opensoftlab.lunaops.req.req6000.req6001.service.impl;

import java.util.Map;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;

import org.springframework.stereotype.Repository;



@Repository("req6001DAO")
public class Req6001DAO extends ComOslitsAbstractDAO {
	
		
	@SuppressWarnings("rawtypes")
	public String insertReq6001ReqChangeLogInfo(Map paramMap) throws Exception{
		return (String)insert("req6001DAO.insertReq6001ReqChangeLogInfo", paramMap);
	}
	
}
