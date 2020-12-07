package kr.opensoftlab.lunaops.spr.spr2000.spr2100.service;

import java.util.List;
import java.util.Map;


public interface Spr2100Service {

	
	@SuppressWarnings("rawtypes")
	public int  selectSpr2100MmrListCnt(Map paramMap) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes" })
	public List<Map> selectSpr2100MmrList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes" })
	public Map  selectSpr2100MmrInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes" })
	public void  insertSpr2100MmrInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes"})
	public void updateSpr2100MmrInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes" })
	public void deleteSpr2100MmrList(Map paramMap) throws Exception;

}
