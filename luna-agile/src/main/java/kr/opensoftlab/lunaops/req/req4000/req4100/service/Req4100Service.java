package kr.opensoftlab.lunaops.req.req4000.req4100.service;

import java.util.List;
import java.util.Map;


public interface Req4100Service {

	
	@SuppressWarnings("rawtypes")
	public int  selectReq4100ReqListCnt(Map paramMap) throws Exception;

	
	@SuppressWarnings({ "rawtypes" })
	public List<Map>  selectReq4100ReqList(Map paramMap) throws Exception;

	
	
	@SuppressWarnings("rawtypes")
	public int  selectReq4100PrepListCnt(Map paramMap) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes" })
	public List<Map>  selectReq4100PrepList(Map paramMap) throws Exception;
	
	
	public String selectReq4100UserCheck(Map<String, String> paramMap) throws Exception;
	
	
	public String selectReq4100ReqPwCheck(Map<String, String> paramMap) throws Exception;
	
	
	public String insertReq4100ReqCopy(Map<String, String> paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	public Map selectReq4100ReqInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes" })
	public void updateReq4101ReqSubInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes" })
	public Object saveReq4100ReqInfo(Map paramMap) throws Exception;

	
	public void deleteReq4100ReqList(Map<String, String> paramMap)  throws Exception;
	
	
	
	@SuppressWarnings("rawtypes")
	public Map selectReq4100ReqUserInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	public Map selectReq4100ReqPrjInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectReq4100IntegratedDshAcceptReqList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	public int selectReq4100IntegratedDshAcceptReqListCnt(Map paramMap) throws Exception;
	
	
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectReq4100ReqProTypeOrdList(Map paramMap) throws Exception;
}
