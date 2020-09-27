package kr.opensoftlab.lunaops.stm.stm2000.stm2100.service;

import java.util.List;
import java.util.Map;


public interface Stm2100Service {

	
	@SuppressWarnings("rawtypes")
	List<Map> selectStm2100BadList(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	Map<String, String> selectStm2100BadInfo(Map paramMap) throws Exception;
	
	
	void updateStm2100BadOptions(Map<String, String> paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	List<Map> selectStm2110BadAdmList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes" })
	List<Map> selectStm2100BadGrpList(Map<String, String> paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	List<Map> selectStm2120BadWtList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes" })
	List<Map> selectStm2100BadUsrList(Map<String, String> paramMap) throws Exception;

	
	public String selectBad1000NtcCnt(Map<String, String> paramMap) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes" })
	public Map selectBad1000NtcCurrent(Map<String, String> paramMap) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes" })
	public Map selectBad1000WriteCntInfo(Map<String, String> paramMap) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes" })
	public Map selectBad1000HitMaxInfo(Map<String, String> paramMap) throws Exception;
	
	
	public String selectBad1000PwCnt(Map<String, String> paramMap) throws Exception;
	
	
	@SuppressWarnings({"rawtypes" })
	public Map selectBad1000FileSummery(Map<String, String> paramMap) throws Exception;
	
	
	public int selectBad1100CmtAllCnt(Map<String, String> paramMap) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes" })
	public Map selectBad1100CmtMaxInfo(Map<String, String> paramMap) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes" })
	public List<Map> selectTag1000TopInfo(Map<String, String> paramMap) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes" })
	public Map selectStm2100UserCheck(Map<String, String> paramMap) throws Exception;
}
