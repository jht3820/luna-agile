package kr.opensoftlab.lunaops.prj.prj1000.prj1100.service;



import java.util.List;
import java.util.Map;


public interface Prj1100Service {

	
	@SuppressWarnings("rawtypes")
	int selectPrj1100ProcessListCnt(Map paramMap) throws Exception;
	
	
	@SuppressWarnings({  "rawtypes" })
	List<Map> selectPrj1100ProcessList(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	Map selectPrj1100ProcessInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void updatePrj1100ProcessInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void updatePrj1100ProcessConfirmInfo(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	void updatePrj1100ProcessConfirmCancle(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	String insertPrj1100ProcessInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void deletePrj1100ProcessInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	List selectPrj1100ProcessAuthUsrList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	int selectPrj1100ProcessAuthUsrListCnt(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	List selectPrj1100ProcessAuthNoneUsrList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	int selectPrj1100ProcessAuthNoneUsrListCnt(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	String insertPrj1100ProcessAuthInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	int deletePrj1100ProcessAuthInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	int selectPrj1100ProcessReqCnt(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	List selectPrj1101FlowList(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	Map selectPrj1101FlowInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void updatePrj1101FlowInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void insertPrj1101FlowInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void deletePrj1101FlowInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	List selectPrj1102ReqOptList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	List selectPrj1102OptList(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	List selectPrj1103OptFileList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	int selectPrj1102OptCntInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void updatePrj1102OtpInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void insertPrj1102OtpInfo(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	void deletePrj1102OtpInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void insertPrj1103OtpValueInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void updatePrj1103OtpValueInfo(Map paramMap) throws Exception;
	

	
	@SuppressWarnings("rawtypes")
	int insertPrj1105RevisionNumList(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	void deletePrj1104RevisionNumList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void deletePrj1104RevisionNumInfo(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	List selectPrj1104ReqRevisionNumList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	int selectPrj1104ReqRevisionNumListCnt(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	int selectPrj1104ReqRevisionNumCnt(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	int insertPrj1105FlowAuthGrpList(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	void deletePrj1105FlowAuthGrpList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void insertPrj1105FlowAuthGrpInfo(Map paramMap) throws Exception;
	
	@SuppressWarnings("rawtypes")
	void deletePrj1105FlowAuthGrpInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	List selectPrj1105FlowAuthGrpList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	int selectPrj1105FlowAuthGrpCnt(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	List selectPrj1100ProcessCopyList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void insertPrj1100ProcessCopyInfo(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	List selectPrj1102FlwOptExistFileIdList(Map paramMap) throws Exception;
}
