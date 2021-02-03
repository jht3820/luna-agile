package kr.opensoftlab.lunaops.stm.stm2000.stm2200.service;

import java.util.List;
import java.util.Map;


public interface Stm2200Service {
	
	
	@SuppressWarnings("rawtypes")
	List<Map> selectStm2200StmAuthGrpList(Map paramMap) throws Exception;	
	
	
	@SuppressWarnings("rawtypes")
	int selectStm2200StmAuthGrpListCnt(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	List<Map> selectStm2200StmAuthGrpNoPagingList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	Map selectStm2200StmAuthGrpInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	int selectStm2200StmAuthGrpNextOrd(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void insertStm2200StmAuthGrpInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes" })
	void updateStm2200StmAuthGrpInfo(Map paramMap) throws Exception;
	
	
	void deleteStm2200StmAuthGrpInfo(Map<String, String> paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	List<Map> selectStm2200AuthGrpSmallMenuList(Map paramMap) throws Exception;	
	
	
	@SuppressWarnings("rawtypes")
	void saveStm2200AuthGrpMenuAuthList(List paramList) throws Exception;
}
