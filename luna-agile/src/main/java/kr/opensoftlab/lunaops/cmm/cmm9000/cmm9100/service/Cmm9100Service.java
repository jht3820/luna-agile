package kr.opensoftlab.lunaops.cmm.cmm9000.cmm9100.service;

import java.util.List;
import java.util.Map;


public interface Cmm9100Service {
	
	@SuppressWarnings("rawtypes")
	List selectCmm9100MultiCommonCodeList(Map param) throws Exception;
}
