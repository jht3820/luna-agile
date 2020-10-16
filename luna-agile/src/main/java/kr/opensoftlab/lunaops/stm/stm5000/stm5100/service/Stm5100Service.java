package kr.opensoftlab.lunaops.stm.stm5000.stm5100.service;

import java.util.List;
import java.util.Map;

import kr.opensoftlab.lunaops.stm.stm5000.stm5100.vo.Stm5100VO;
import kr.opensoftlab.sdf.excel.ExcelDataListResultHandler;


public interface Stm5100Service {
	
	
	@SuppressWarnings("rawtypes")
	List<Map> selectStm5100List(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	int selectStm5100ListCnt(Map paramMap) throws Exception;

	
	void selectStm5100ExcelList(Stm5100VO stm5100vo, ExcelDataListResultHandler resultHandler) throws Exception;	
	
	
	@SuppressWarnings("rawtypes")
	void insertStm5100AuthLoginLog(Map paramMap) throws Exception;
}
