package kr.opensoftlab.lunaops.req.req2000.req2000.service;

import java.util.List;
import java.util.Map;

import kr.opensoftlab.sdf.excel.ExcelDataListResultHandler;


public interface Req2000Service {
	
	
	@SuppressWarnings("rawtypes")
	List selectReq2000ReqClsList(Map paramMap) throws Exception;	
	
	
	
	@SuppressWarnings("rawtypes")
	Map selectReq2000ReqClsInfo(Map paramMap) throws Exception;	
	
	
	@SuppressWarnings("rawtypes")
	Map insertReq2000ReqClsInfo(Map paramMap) throws Exception;
	

	
	@SuppressWarnings("rawtypes")
	List<String> deleteReq2000ReqClsAssignChk(Map paramMap) throws Exception;
	
	
	
	@SuppressWarnings("rawtypes")
	void deleteReq2000ReqClsInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void updateReq2000ReqClsInfo(Map paramMap) throws Exception;


	@SuppressWarnings("rawtypes")
	void selectReq2000ExcelList(Map paramMap,
			ExcelDataListResultHandler resultHandler) throws Exception;
}
