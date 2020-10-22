package kr.opensoftlab.lunaops.req.req6000.req6000.service;

import java.util.List;
import java.util.Map;

public interface Req6000Service {
		
	@SuppressWarnings("rawtypes")
	List<Map> selectReq6000ChgDetailList(Map paramMap) throws Exception;
	
		
	@SuppressWarnings("rawtypes")
	void insertReq6000ModifyHistoryList(Map paramMap) throws Exception;
		
		
	@SuppressWarnings("rawtypes")
	String insertReq6000ModifyHistoryInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	int deleteReq6000ReqHistoryInfo(Map paramMap) throws Exception;
	
}
