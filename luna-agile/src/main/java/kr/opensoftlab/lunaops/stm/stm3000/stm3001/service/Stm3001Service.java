package kr.opensoftlab.lunaops.stm.stm3000.stm3001.service;

import java.util.List;
import java.util.Map;



public interface Stm3001Service {

	
	@SuppressWarnings("rawtypes")
	List selectStm3001UsrOptList(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	Map selectStm3001UsrOptInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	int selectStm3001UsrOptCnt(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	String insertStm3001UsrOptInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	int updateStm3001UsrOptInfo(Map paramMap) throws Exception;
}
