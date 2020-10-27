package kr.opensoftlab.lunaops.cmm.cmm9000.cmm9200.service;

import java.util.List;
import java.util.Map;


public interface Cmm9200Service {
	
	@SuppressWarnings("rawtypes")
	List selectCmm9200PrjUsrList(Map param) throws Exception;
	
	
}
