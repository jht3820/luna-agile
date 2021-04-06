package kr.opensoftlab.lunaops.req.req3000.req3000.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;





@Repository("req3000DAO")
public class Req3000DAO extends ComOslitsAbstractDAO {

	
	
	@SuppressWarnings("rawtypes")
	public List selectReq3000ReqGrpList(Map<String, String> paramMap) throws Exception{
		return (List) list("req3000DAO.selectReq3000ReqGrpList", paramMap);
	}
	
	
	public int selectReq3000ReqGrpListCnt(Map<String, String> paramMap) throws Exception{
		
		return (int) select("req3000DAO.selectReq3000ReqGrpListCnt", paramMap);
		
	}
	
	
	@SuppressWarnings("rawtypes")
	public String insertReq3000ReqGrpInfo(Map paramMap) {
	
		return (String) insert("req3000DAO.insertReq3000ReqGrpInfo", paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public int updateReq3000ReqGrpInfo(Map paramMap) {
		
		return (int) update("req3000DAO.updateReq3000ReqGrpInfo", paramMap);
		
	}
	
	
	@SuppressWarnings("rawtypes")
	public String insertReq3001ReqGrpLinkReqInfo(Map paramMap) {
		
		return (String) insert("req3000DAO.insertReq3001ReqGrpLinkReqInfo", paramMap);
		
	}
	
	@SuppressWarnings("rawtypes")
	public List selectReq3001ReqGrpLinkReqList(Map<String, String> paramMap) {
		return (List) list("req3000DAO.selectReq3001ReqGrpLinkReqList", paramMap);
	}
	
	public int selectReq3001ReqGrpLinkReqListCnt(Map<String, String> paramMap) {
		return (int) select("req3000DAO.selectReq3001ReqGrpLinkReqListCnt", paramMap);
	}
	
	@SuppressWarnings("rawtypes")
	public List selectReq3002ReqGrpAddReqList(Map<String, String> paramMap) {
		return (List) list("req3000DAO.selectReq3002ReqGrpAddReqList", paramMap);
	}
	
	public int selectReq3002ReqGrpAddReqListCnt(Map<String, String> paramMap) {
		return (int) select("req3000DAO.selectReq3002ReqGrpAddReqListCnt", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public Map selectReq3000ReqGrpInfo(Map paramMap) throws Exception{
		return (Map) select("req3000DAO.selectReq3000ReqGrpInfo", paramMap);
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Map> selectReq3001ReqConList(Map<String, String> paramMap) {
		return (List<Map>) list("req3000DAO.selectReq3001ReqGrpLinkReqList", paramMap);
		
	}
	
	
	public void deleteReq3001ReqConList(Map<String, String> convertParamMap) {
		delete("req3000DAO.deleteReq3001ReqConList", convertParamMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void deleteReq3000ReqInfo(Map infoMap) {
		delete("req3000DAO.deleteReq3000ReqGrp", infoMap);
	}
	

}
