package kr.opensoftlab.lunaops.req.req4000.req4100.service.impl;

import java.util.List;
import java.util.Map;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;
import kr.opensoftlab.lunaops.req.req4000.req4100.vo.Req4100VO;
import kr.opensoftlab.sdf.excel.ExcelDataListResultHandler;

import org.springframework.stereotype.Repository;



@Repository("req4100DAO")
public class Req4100DAO extends ComOslitsAbstractDAO {

		
	public String insertReq4100ReqInfoAjax(Map<String, String> reqMap) throws Exception{
		return (String)insert("req4100DAO.insertReq4100ReqInfoAjax", reqMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public void updateReq4100ReqKey(Map paramMap) throws Exception{
		update("req4100DAO.updateReq4100ReqKey",paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectReq4100ReqUsrChk(Map paramMap) throws Exception{
		return (int)select("req4100DAO.selectReq4100ReqUsrChk", paramMap);
	}

	@SuppressWarnings("unchecked")
	public List<Req4100VO> selectReq4100List(Req4100VO req4100vo) throws Exception{
		return (List<Req4100VO>)list("req4100DAO.selectReq4100List", req4100vo);
	}

	public int selectReq4100ListCnt(Req4100VO req4100vo) throws Exception {
		return (Integer) select("req4100DAO.selectReq4100ListCnt", req4100vo);
	}

	@SuppressWarnings("rawtypes")
	public Map selectPrj1104ReqInfoAjax(Map<String, String> paramMap) throws Exception {
		return (Map) select("req4100DAO.selectPrj1104ReqInfoAjax", paramMap);
	}

	public void updateReq4100ReqInfoAjax(Map<String, String> paramMap) throws Exception {
		update("req4100DAO.updateReq4100ReqInfoAjax", paramMap);
		
	}

	public void deleteReq4100ReqInfoAjax(Map<String, String> reqMap) throws Exception {
		delete("req4100DAO.deleteReq4100ReqInfoAjax", reqMap);
		
	}
	
	
	@SuppressWarnings("rawtypes")
	public void updateReq4106NewReqAccpetInfoAjax(Map paramMap) throws Exception{
		update("req4100DAO.updateReq4106NewReqAccpetInfoAjax",paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void updateReq4100ReqFlowChgInfoAjax(Map paramMap) throws Exception{
		update("req4100DAO.updateReq4100ReqFlowChgInfoAjax",paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void updateReq4100ReqMiddleDoneInfoAjax(Map paramMap) throws Exception{
		update("req4100DAO.updateReq4100ReqMiddleDoneInfoAjax",paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectReq6001ReqHistoryList(Map paramMap) throws Exception{
		return (List) list("req4100DAO.selectReq6001ReqHistoryList",paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectReq5000ReqSignList(Map paramMap) throws Exception{
		return (List) list("req4100DAO.selectReq5000ReqSignList",paramMap);
	}
	
	public void selectReq4100ExcelList(Req4100VO req4100vo,
			ExcelDataListResultHandler resultHandler) throws Exception {
		listExcelDownSql("req4100DAO.selectReq4100AllList", req4100vo,resultHandler);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectReq4100AllList(Req4100VO req4100vo) throws Exception {
		return (List) list("req4100DAO.selectReq4100AllList",req4100vo);
	}
	
	
	@SuppressWarnings({ "rawtypes"})
	public int selectReq4100ProcessFlowReqCnt(Map paramMap) throws Exception {
		return (int) select("req4100DAO.selectReq4100ProcessFlowReqCnt",paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Map> selectReq4100ProcessFlowReqList(Map paramMap) throws Exception {
		return (List<Map>) list("req4100DAO.selectReq4100ProcessFlowReqList",paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public Map selectReq4100ReqUserInfo(Map paramMap) throws Exception {
		return	(Map) select("req4100DAO.selectReq4100ReqUserInfo", paramMap);
	}

	@SuppressWarnings("rawtypes")
	public Map selectReq4100ReqInfo(Map<String, String> paramMap) {
		return (Map) select("req4100DAO.selectReq4100ReqInfo", paramMap);
	}
	
	public String insertReq4100ReqInfo(Map<String, String> paramMap) throws Exception {
		return (String)insert("req4100DAO.insertReq4100ReqInfo", paramMap);	
	}

	@SuppressWarnings("rawtypes")
	public int updateReq4100ReqInfo(Map paramMap) throws Exception{
		return update("req4100DAO.updateReq4100ReqInfo",paramMap);
	}

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Map> selectReq4100RevisionList(Req4100VO req4100VO) throws Exception{
		return (List<Map>) list("req4100DAO.selectReq4100RevisionList",req4100VO);
	}
	
	
	public int selectReq4100RevisionListCnt(Req4100VO req4100VO) throws Exception {
		return (Integer) select("req4100DAO.selectReq4100RevisionListCnt", req4100VO);
	}
	
	
	@SuppressWarnings("rawtypes")
	public String selectReq4100NextReqOrd(Map paramMap) throws Exception{
		return (String) select("req4100DAO.selectReq4100NextReqOrd", paramMap);
	}	
	
	
	@SuppressWarnings("rawtypes")
	public int deleteReq4100ReqAtchFile(Map paramMap) throws Exception{
		return (int) delete("req4100DAO.deleteReq4100ReqAtchFile", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int deleteReq4100ReqAtchFileDetail(Map paramMap) throws Exception{
		return (int) delete("req4100DAO.deleteReq4100ReqAtchFileDetail", paramMap);
	}

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Map> selectReq4100PrjAuthReqList(Map paramMap) throws Exception {
		return (List<Map>) list("req4100DAO.selectReq4100PrjAuthReqList",paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public void updateReq4100ReqChargerChgInfoAjax(Map paramMap) throws Exception{
		update("req4100DAO.updateReq4100ReqChargerChgInfoAjax",paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void selectReq4100ExcelList(Map paramMap, ExcelDataListResultHandler resultHandler) throws Exception {
		listExcelDownSql("req4100DAO.selectReq4100ExcelList", paramMap, resultHandler);
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Map> selectReq4100ProcessReqList(Map paramMap) throws Exception {
		return (List<Map>) list("req4100DAO.selectReq4100ProcessReqList",paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public Map selectReq4110ReqInfo(Map paramMap) throws Exception {
		return (Map) select("req4100DAO.selectReq4110ReqInfo", paramMap);
	}
}