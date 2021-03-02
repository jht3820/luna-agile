package kr.opensoftlab.lunaops.req.req3000.req3000.service;

import java.util.List;
import java.util.Map;



public interface Req3000Service {
	
	
	@SuppressWarnings("rawtypes")
	public List selectReq3000ReqGrpList(Map<String, String> paramMap) throws Exception;
	
	
	public int selectReq3000ReqGrpListCnt(Map<String, String> paramMap) throws Exception;
	
	
	public Object saveReq3000ReqGrpInfo(Map<String, String> paramMap)  throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	public List selectReq3001ReqGrpLinkReqList(Map<String, String> paramMap) throws Exception;
	
	
	public int selectReq3001ReqGrpLinkReqListCnt(Map<String, String> paramMap) throws Exception;
	
	
	
	@SuppressWarnings("rawtypes")
	public List selectReq3002ReqGrpAddReqList(Map<String, String> paramMap) throws Exception;
	
	
	public int selectReq3002ReqGrpAddReqListCnt(Map<String, String> paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	public Map selectReq3000ReqGrpInfo(Map<String, String> paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectReq3001ReqConList(Map<String, String> paramMap) throws Exception;
	
	
	public void deleteReq3000ReqList(Map<String, String> paramMap) throws Exception;
}
