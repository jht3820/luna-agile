package kr.opensoftlab.lunaops.stm.stm3000.stm3000.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.opensoftlab.lunaops.stm.stm3000.stm3000.vo.Stm3000VO;
import kr.opensoftlab.sdf.excel.ExcelDataListResultHandler;



public interface Stm3000Service {
	
	
	@SuppressWarnings("rawtypes")
	List<Map> selectStm3000UsrList(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	int selectStm3000UsrListCnt(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	Map selectStm3000UsrInfo(Map paramMap) throws Exception;	
	
	
	public void insertStm3000UsrInfo(Map<String, String> paramMap) throws Exception;
	
	
	public void updateStm3000UsrInfo(Map<String, String> paramMap, MultipartHttpServletRequest mptRequest) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	int selectCmm2000IdCheck(Map paramMap)  throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	int selectStm3000EmailCheck(Map paramMap)  throws Exception;

	
	@SuppressWarnings("rawtypes")
	void updateStm3000UseCd(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	Map<String, Object> deleteStm3000UsrInfo(Map paramMap) throws Exception;
	
	
	void selectStm3000ExcelList(Stm3000VO Stm3000VO,ExcelDataListResultHandler resultHandler) throws Exception;
	
	
	void insertStm3000AdmInfoListAjax(Map<String, String> paramMap, String prjId) throws Exception ;

	
	@SuppressWarnings("rawtypes")
	public int updateStm3000Block(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	List selectStm3000PrjAuthUserList(Map paramMap) throws Exception;
	
	
	void updateStm3000AccountInit(Map<String, String> paramMap)  throws Exception;
}
