package kr.opensoftlab.lunaops.dsh.dsh1000.dsh1000.service;



import java.util.List;
import java.util.Map;

import kr.opensoftlab.lunaops.dsh.dsh1000.dsh1000.vo.Dsh1000VO;


public interface Dsh1000Service {
	
	
	@SuppressWarnings("rawtypes")
	List selectDsh1000ProcessReqCntList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	List selectDsh1000MonthProcessReqCntList(Map paramMap) throws Exception;

	@SuppressWarnings("rawtypes")
	List selectDsh1000ReqList(Dsh1000VO dsh1000vo) throws Exception;

	int selectDsh1000ReqListCnt(Dsh1000VO dsh1000vo) throws Exception;

	
	@SuppressWarnings("rawtypes")
	List selectDsh1000SortDataList(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	void insertDsh1000SortDataList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void deleteDsh1000SortDataList(Map paramMap) throws Exception;
}
