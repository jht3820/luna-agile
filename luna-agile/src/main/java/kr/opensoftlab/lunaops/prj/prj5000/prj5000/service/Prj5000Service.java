package kr.opensoftlab.lunaops.prj.prj5000.prj5000.service;

import java.util.List;
import java.util.Map;



public interface Prj5000Service {
	
	@SuppressWarnings("rawtypes")
	List selectPrj5000EvtList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	Map selectPrjEvt5000Info(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	String insertPrj5000PrjEvtAjax(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	int updatePrj5000PrjEvtAjax(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void deletePrj5000PrjEvtInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes" })
	public List selectPrj5000ReqList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes" })
	public Map selectPrj5000ReqInfo(Map paramMap) throws Exception;
}
