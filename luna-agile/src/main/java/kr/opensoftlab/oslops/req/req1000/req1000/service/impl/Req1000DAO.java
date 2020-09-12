package kr.opensoftlab.lunaops.req.req1000.req1000.service.impl;

import java.util.List;
import java.util.Map;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;
import kr.opensoftlab.lunaops.req.req1000.req1000.vo.Req1000VO;
import kr.opensoftlab.sdf.excel.ExcelDataListResultHandler;

import org.springframework.stereotype.Repository;

@Repository("req1000DAO")
public class Req1000DAO  extends ComOslitsAbstractDAO {
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map>  selectReq1000ReqList(Map paramMap) throws Exception {
		return  (List<Map>) list("req1000DAO.selectReq1000ReqList", paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public int  selectReq1000ReqListCnt(Map paramMap) throws Exception {
		 return  (Integer)select("req1000DAO.selectReq1000ReqListCnt", paramMap);
	} 
	
	
	@SuppressWarnings({ "unchecked" })
	public List<Req1000VO>  selectReq1000AllList(Req1000VO req1000vo) throws Exception {
		 return  (List<Req1000VO>) list("req1000DAO.selectReq1000AllList", req1000vo);
	}
	
	
	@SuppressWarnings("unchecked")
	public List<Req1000VO>  selectReq1000List(Req1000VO req1000vo) throws Exception {
		return  (List<Req1000VO>) list("req1000DAO.selectReq1000List", req1000vo);
	}
	
	
	public int  selectReq1000ListCnt(Req1000VO req1000vo) throws Exception {
		 return  (Integer)select("req1000DAO.selectReq1000ListCnt", req1000vo);
	} 
	
	
	@SuppressWarnings("rawtypes")
	public Map selectReq1000ReqInfo(Map paramMap) throws Exception{
		return (Map) select("req1000DAO.selectReq1000ReqInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public String insertReq1001ReqInfo(Map paramMap) throws Exception{
		return (String) insert("req1000DAO.insertReq1001ReqInfo", paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public void updateReq1000ReqKey(Map paramMap) throws Exception{
		update("req1000DAO.updateReq1000ReqKey",paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public void updateReq1001ReqSubInfo(Map paramMap) throws Exception{
		update("req1000DAO.updateReq1001ReqSubInfo",paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int updateReq1001ReqInfo(Map paramMap) throws Exception{
		return (int) update("req1000DAO.updateReq1001ReqInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int deleteReq1001ReqInfo(Map paramMap) throws Exception{
		return (int) update("req1000DAO.deleteReq1001ReqInfo", paramMap);
	}

	public void selectReq1000ExcelList(Req1000VO req1000vo,
			ExcelDataListResultHandler resultHandler) throws Exception {
		listExcelDownSql("req1000DAO.selectReq1000ExcelList", req1000vo, resultHandler);
	}
	
	
	
	@SuppressWarnings("rawtypes")
	public Map selectReq1000ReqUserInfo(Map paramMap) throws Exception {
		return	(Map) select("req1000DAO.selectReq1000ReqUserInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public Map selectReq1000ReqPrjInfo(Map paramMap) throws Exception {
		return	(Map) select("req1000DAO.selectReq1000ReqPrjInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public String selectReq1000NextReqOrd(Map paramMap) throws Exception{
		return (String) select("req1000DAO.selectReq1000NextReqOrd", paramMap);
	}	
	
	
	@SuppressWarnings("rawtypes")
	public int deleteReq1000ReqAtchFile(Map paramMap) throws Exception{
		return (int) delete("req1000DAO.deleteReq1000ReqAtchFile", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int deleteReq1000ReqAtchFileDetail(Map paramMap) throws Exception{
		return (int) delete("req1000DAO.deleteReq1000ReqAtchFileDetail", paramMap);
	}
	
	
	@SuppressWarnings({"rawtypes", "unchecked"})
	public List<Map>  selectReq1000IntegratedDshAcceptReqList(Map paramMap) throws Exception {
		return  (List<Map>) list("req1000DAO.selectReq1000IntegratedDshAcceptReqList", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int  selectReq1000IntegratedDshAcceptReqListCnt(Map paramMap) throws Exception {
		 return  (Integer)select("req1000DAO.selectReq1000IntegratedDshAcceptReqListCnt", paramMap);
	} 
	
}