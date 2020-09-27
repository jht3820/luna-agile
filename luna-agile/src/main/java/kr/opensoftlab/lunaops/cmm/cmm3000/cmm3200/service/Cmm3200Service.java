package kr.opensoftlab.lunaops.cmm.cmm3000.cmm3200.service;

import java.util.Map;



public interface Cmm3200Service {

	
	@SuppressWarnings("rawtypes")
	int selectCmm3200idChk(Map paramMap)  throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	String insertCmm3200JoinIng(Map paramMap) throws Exception;
	
	
}
