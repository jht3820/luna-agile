package kr.opensoftlab.lunaops.prj.prj2000.prj2100.service;

import java.util.List;
import java.util.Map;


public interface Prj2100Service {

	
	@SuppressWarnings({ "rawtypes" })
	public List<Map> selectPrj2100InUsrList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	public int selectPrj2100InUsrListCnt(Map paramMap) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes"})
	public List<Map> selectPrj2100AllUsrList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	public int selectPrj2100AllUsrListCnt(Map paramMap) throws Exception;
	
	@SuppressWarnings("rawtypes")
	public void insertPrj2100PrjUsrAuthList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	public void deletePrj2100PrjUsrAuthList(Map paramMap) throws Exception;
}
