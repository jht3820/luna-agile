package kr.opensoftlab.lunaops.spr.spr2000.spr2000.service;

import java.util.List;
import java.util.Map;



public interface Spr2000Service {

	
	@SuppressWarnings("rawtypes")
	public int  selectSpr2000RptListCnt(Map paramMap) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes" })
	public List<Map> selectSpr2000RptList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes" })
	public Map  selectSpr2000RptInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes" })
	public void  insertSpr2000RptInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes"})
	public void updateSpr2000RptInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes" })
	public void deleteSpr2000RptList(Map paramMap) throws Exception;

	
	@SuppressWarnings({ "rawtypes" })
	public List<Map>  selectSpr2001RptMemList(Map paramMap) throws Exception;
	
	@SuppressWarnings({ "rawtypes" })
	public void insertSpr2001RptMemList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes" })
	public void deleteSpr2001RptMemList(Map paramMap) throws Exception;
}
