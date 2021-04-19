package kr.opensoftlab.lunaops.prj.prj3000.prj3100.service;

import java.util.List;
import java.util.Map;


public interface Prj3100Service {
	
	
	void deletePrj3100File(Map<String, String> paramMap) throws Exception;
	
	
	void updatePrj3100FileType(Map<String, String> paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	List selectPrj3100MenuTree(Map<String, String> paramMap) throws Exception;
}
