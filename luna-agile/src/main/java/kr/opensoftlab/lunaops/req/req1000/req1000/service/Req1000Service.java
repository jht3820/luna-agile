package kr.opensoftlab.lunaops.req.req1000.req1000.service;



import java.util.List;
import java.util.Map;

import kr.opensoftlab.lunaops.req.req1000.req1000.vo.Req1000VO;
import kr.opensoftlab.sdf.excel.ExcelDataListResultHandler;

public interface Req1000Service {

	
	@SuppressWarnings({ "rawtypes" })
	List<Map>  selectReq1000ReqList(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	int selectReq1000ReqListCnt(Map paramMap) throws Exception;
	
	
	List<Req1000VO>  selectReq1000AllList(Req1000VO req1000VO) throws Exception;
	
	
	List<Req1000VO> selectReq1000List(Req1000VO req1000VO) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	Map selectReq1000ReqInfo(Map paramMap) throws Exception;
	
	
	int selectReq1000ListCnt(Req1000VO req1000VO) throws Exception;	
	
	
	@SuppressWarnings({ "rawtypes" })
	void updateReq1001ReqSubInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes" })
	public Object saveReq1000ReqInfo(Map paramMap) throws Exception;

	void selectReq1000ExcelList(Req1000VO req1000vo,
			ExcelDataListResultHandler resultHandler) throws Exception;
	
	
	public void deleteReq1000ReqList(Map<String, String> paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	public Map selectReq1000ReqUserInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	public Map selectReq1000ReqPrjInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectReq1000IntegratedDshAcceptReqList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	public int selectReq1000IntegratedDshAcceptReqListCnt(Map paramMap) throws Exception;
}
