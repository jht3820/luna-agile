package kr.opensoftlab.lunaops.stm.stm4000.stm4000.service;

import java.util.List;
import java.util.Map;

import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.sdf.excel.ExcelDataListResultHandler;


public interface Stm4000Service {

	
	@SuppressWarnings("rawtypes")
	List<Map> selectStm4000CommonCodeMasterList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	int selectStm4000CommonCodeMasterListCnt(Map paramMap) throws Exception;
	
	
    @SuppressWarnings("rawtypes")
	Map selectStm4000CommonCodeMasterInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	List<Map> selectStm4000CommonCodeDetailList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	int selectStm4000CommonCodeDetailListCnt(Map paramMap) throws Exception;
	
	
    @SuppressWarnings("rawtypes")
	Map selectStm4000CommonCodeDetailInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	public void saveStm4000CommonCodeMaster(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	void saveStm4000CommonCodeDetail(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	int deleteStm4000CommonCodeDetail(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	int deleteStm4000CommonCodeMaster(Map paramMap) throws Exception;
	
	
	void selectStm4000MasterExcelList(LoginVO loginVO,ExcelDataListResultHandler resultHandler) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void selectStm4000DetailExcelList(Map paramMap,ExcelDataListResultHandler resultHandler) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	public int selectStm4000CommonCodeCount(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	int selectStm4000CommonDetailCodeCount(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	int selectStm4000MstCodeNextOrd(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	int selectStm4000DetailCodeNextOrd(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	Map selectStm4000MultiCommonCodeList(Map paramMap) throws Exception;
}
