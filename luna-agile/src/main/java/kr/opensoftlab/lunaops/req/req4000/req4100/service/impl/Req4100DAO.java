package kr.opensoftlab.lunaops.req.req4000.req4100.service.impl;

import java.util.List;
import java.util.Map;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;
import kr.opensoftlab.sdf.excel.ExcelDataListResultHandler;

import org.springframework.stereotype.Repository;

@Repository("req4100DAO")
public class Req4100DAO  extends ComOslitsAbstractDAO {
	
	
	
	@SuppressWarnings("rawtypes")
	public int  selectReq4100ReqListCnt(Map paramMap) throws Exception {
		return  (Integer)select("req4100DAO.selectReq4100ReqListCnt", paramMap);
	} 
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map>  selectReq4100ReqList(Map paramMap) throws Exception {
		return  (List<Map>) list("req4100DAO.selectReq4100ReqList", paramMap);
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map>  selectReq4100AllList(Map paramMap) throws Exception {
		return  (List<Map>) list("req4100DAO.selectReq4100AllList", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int  selectReq4100PrepListCnt(Map paramMap) throws Exception {
		return  (Integer)select("req4100DAO.selectReq4100PrepListCnt", paramMap);
	} 
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map>  selectReq4100PrepList(Map paramMap) throws Exception {
		return  (List<Map>) list("req4100DAO.selectReq4100PrepList", paramMap);
	}

	
	public String selectReq4100UserCheck(Map<String, String> paramMap) throws Exception{
		return (String) select("req4100DAO.selectReq4100UserCheck", paramMap);
	}
	
	
	public String selectReq4100ReqPwInfo(Map<String, String> paramMap) throws Exception{
		return (String) select("req4100DAO.selectReq4100ReqPwInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public Map selectReq4100ReqInfo(Map paramMap) throws Exception{
		return (Map) select("req4100DAO.selectReq4100ReqInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public String insertReq4101ReqInfo(Map paramMap) throws Exception{
		return (String) insert("req4100DAO.insertReq4101ReqInfo", paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public void updateReq4101ReqKey(Map paramMap) throws Exception{
		update("req4100DAO.updateReq4101ReqKey",paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public void updateReq4101ReqPwInfo(Map paramMap) throws Exception{
		update("req4100DAO.updateReq4101ReqPwInfo",paramMap);
	}
	
	
	
	@SuppressWarnings({ "rawtypes" })
	public void updateReq4101ReqSubInfo(Map paramMap) throws Exception{
		update("req4100DAO.updateReq4101ReqSubInfo",paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int updateReq4101ReqInfo(Map paramMap) throws Exception{
		return (int) update("req4100DAO.updateReq4101ReqInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void deleteReq4100ReqInfo(Map paramMap) throws Exception{
		delete("req4100DAO.deleteReq4100ReqInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public Map selectReq4100ReqUserInfo(Map paramMap) throws Exception {
		return	(Map) select("req4100DAO.selectReq4100ReqUserInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public Map selectReq4100ReqPrjInfo(Map paramMap) throws Exception {
		return	(Map) select("req4100DAO.selectReq4100ReqPrjInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public String selectReq4100NextReqOrd(Map paramMap) throws Exception{
		return (String) select("req4100DAO.selectReq4100NextReqOrd", paramMap);
	}	
	
	
	@SuppressWarnings("rawtypes")
	public void updateReq4100ReqAtchFileId(Map paramMap) throws Exception{
		update("req4100DAO.updateReq4100ReqAtchFileId", paramMap);
	}	

	
	@SuppressWarnings("rawtypes")
	public int deleteReq4100ReqAtchFile(Map paramMap) throws Exception{
		return (int) delete("req4100DAO.deleteReq4100ReqAtchFile", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int deleteReq4100ReqAtchFileDetail(Map paramMap) throws Exception{
		return (int) delete("req4100DAO.deleteReq4100ReqAtchFileDetail", paramMap);
	}
	
	
	@SuppressWarnings({"rawtypes", "unchecked"})
	public List<Map> selectReq4100IntegratedDshAcceptReqList(Map paramMap) throws Exception {
		return  (List<Map>) list("req4100DAO.selectReq4100IntegratedDshAcceptReqList", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int  selectReq4100IntegratedDshAcceptReqListCnt(Map paramMap) throws Exception {
		 return  (Integer)select("req4100DAO.selectReq4100IntegratedDshAcceptReqListCnt", paramMap);
	} 
	
	
	@SuppressWarnings("rawtypes")
	public void updateReq4100ReqFlowChgInfo(Map paramMap) throws Exception {
		
		update("req4100DAO.updateReq4100ReqFlowChgInfo", paramMap);
	} 
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Map> selectReq4100ReqProTypeOrdList(Map paramMap) throws Exception {
		
		return (List<Map>) list("req4100DAO.selectReq4100ReqProTypeOrdList", paramMap);
	} 
	
	
	
}