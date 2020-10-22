package kr.opensoftlab.lunaops.req.req4000.req4100.service;

import java.util.List;
import java.util.Map;

import kr.opensoftlab.lunaops.req.req4000.req4100.vo.Req4100VO;
import kr.opensoftlab.sdf.excel.ExcelDataListResultHandler;
import kr.opensoftlab.sdf.util.ReqHistoryMngUtil;


public interface Req4100Service {


	
	@SuppressWarnings("rawtypes")
	void insertReq4100ReqInfoListAjax(Map<String, String> paramMap, Map prjInfo, ReqHistoryMngUtil historyMng) throws Exception;

	List<Req4100VO> selectReq4100List(Req4100VO req4100vo) throws Exception;

	int selectReq4100ListCnt(Req4100VO req4100vo) throws Exception;

	String insertReq4100ReqInfoAjax(Map<String, String> paramMap) throws Exception;

	@SuppressWarnings("rawtypes")
	Map selectPrj1104ReqInfoAjax(Map<String, String> paramMap) throws Exception;

	@SuppressWarnings("rawtypes")
	void updateReq4100ReqInfoAjax(Map paramMap) throws Exception;

	void deleteReq4100ReqInfoAjax(Map<String, Object> paramMap,String prjId) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void updateReq4106NewReqAccpetInfoAjax(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	List selectReq6001ReqHistoryList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	List selectReq5000ReqSignList(Map paramMap) throws Exception;
	
	void selectReq4100ExcelList(Req4100VO req4100vo,
			ExcelDataListResultHandler resultHandler) throws Exception;
	

	
	@SuppressWarnings("rawtypes")
	List selectReq4100AllList(Req4100VO req4100vo) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes"})
	int selectReq4100ProcessFlowReqCnt(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	List selectReq4100ProcessFlowReqList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	boolean saveReq4100ReqFlowChgAjax(Map paramMap) throws Exception;
	@SuppressWarnings("rawtypes")
	Map selectReq4100ReqInfo(Map<String	, String> paramMap);
	
	
	
	@SuppressWarnings("rawtypes")
	public int selectReq4100ReqUsrChk(Map paramMap) throws Exception;


	
	@SuppressWarnings("rawtypes")
	List<Map> selectReq4100RevisionList(Req4100VO req4100VO) throws Exception;
	
	
	int selectReq4100RevisionListCnt(Req4100VO req4100VO) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes"})
	List<Map> selectReq4100PrjAuthReqList(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	void updateReq4100ReqChargerChgInfoAjax(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void selectReq4100ExcelList(Map paramMap, ExcelDataListResultHandler resultHandler) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes" })
	List<Map> selectReq4100ProcessReqList(Map paramMap) throws Exception;

	
	@SuppressWarnings({ "rawtypes" })
	List<Map> selectReq4100ReqProTypeOrdList(Map paramMap) throws Exception;
	
	
	
	
	@SuppressWarnings("rawtypes")
	void updateReq4111ReqInfo(Map paramMap) throws Exception;
}
