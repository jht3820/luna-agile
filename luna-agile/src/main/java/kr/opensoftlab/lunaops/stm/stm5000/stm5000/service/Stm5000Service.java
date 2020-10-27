package kr.opensoftlab.lunaops.stm.stm5000.stm5000.service;

import java.util.List;
import java.util.Map;

import kr.opensoftlab.lunaops.stm.stm5000.stm5000.vo.Stm5000VO;
import kr.opensoftlab.sdf.excel.ExcelDataListResultHandler;


public interface Stm5000Service {
	
	
	@SuppressWarnings("rawtypes")
	List<Map> selectStm5000List(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	int selectStm5000ListCnt(Map paramMap) throws Exception;

	
	void selectStm5000ExcelList(Stm5000VO stm5000vo,ExcelDataListResultHandler resultHandler) throws Exception;	
	
	
	@SuppressWarnings("rawtypes")
	void insertStm5000AuthLoginLog(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void updateStm5000AuthLogoutLog(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	public Map selectStm5000LastLogin(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	public Map selectStm5000RecentLogin(Map paramMap) throws Exception;
}
