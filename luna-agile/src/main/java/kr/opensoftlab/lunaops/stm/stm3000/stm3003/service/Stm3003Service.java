package kr.opensoftlab.lunaops.stm.stm3000.stm3003.service;


import java.util.Map;



public interface Stm3003Service {

	
	@SuppressWarnings("rawtypes")
	public void insertStm3003UserChangeLog(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	public int selectStm3003PwChangeDateCheck(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	public String selectStm3003BeforeUsedPwCheck(Map paramMap) throws Exception;
	
}
