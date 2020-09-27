package kr.opensoftlab.lunaops.req.req6000.req6000.service.impl;

import java.util.List;
import java.util.Map;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;

import org.springframework.stereotype.Repository;



@Repository("req6000DAO")
public class Req6000DAO extends ComOslitsAbstractDAO {
	
		
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Map> selectReq6000ChgDetailList(Map paramMap) throws Exception{
		return (List<Map>) list("req6000DAO.selectReq6000ChgDetailList", paramMap);
	}
	
		
	@SuppressWarnings("rawtypes")
	public String selectReq6000NewChgDetailId(Map paramMap) throws Exception{
		return (String)select("req6000DAO.selectReq6000NewChgDetailId", paramMap);
	}
	
		
	@SuppressWarnings("rawtypes")
	public String insertReq6000ModifyHistoryInfo(Map paramMap) throws Exception{
		return (String)insert("req6000DAO.insertReq6000ModifyHistoryInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int deleteReq6000ReqHistoryInfo(Map paramMap) throws Exception{
		return (int) delete("req6000DAO.deleteReq6000ReqHistoryInfo", paramMap);
	}
	
}
