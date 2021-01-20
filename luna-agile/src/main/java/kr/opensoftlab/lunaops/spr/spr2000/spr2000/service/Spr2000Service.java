package kr.opensoftlab.lunaops.spr.spr2000.spr2000.service;

import java.util.List;
import java.util.Map;



public interface Spr2000Service {

	
	@SuppressWarnings("rawtypes")
	public int  selectSpr2000MmtListCnt(Map paramMap) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes" })
	public List<Map> selectSpr2000MmtList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes" })
	public Map  selectSpr2000MmtInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes" })
	public void  insertSpr2000MmtInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes"})
	public void updateSpr2000MmtInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes" })
	public void deleteSpr2000MmtList(Map paramMap) throws Exception;

	
	@SuppressWarnings({ "rawtypes" })
	public List<Map>  selectSpr2001MmtMemList(Map paramMap) throws Exception;
	
	@SuppressWarnings({ "rawtypes" })
	public void insertSpr2001MmtMemList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes" })
	public void deleteSpr2001MmtMemList(Map paramMap) throws Exception;
}
