package kr.opensoftlab.lunaops.spr.spr1000.spr1100.service;

import java.util.List;
import java.util.Map;



public interface Spr1100Service {
	
	@SuppressWarnings("rawtypes")
	public int  selectSpr1100ReqListCnt(Map paramMap) throws Exception; 
	
	
	@SuppressWarnings({ "rawtypes" })
	public List<Map> selectSpr1100ReqList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	public void insertSpr1100ReqList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	public void deleteSpr1100ReqList(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	int updateSpr1100ReqResultInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes" })
	public Map selectSpr1100ReqResultInfo(Map paramMap) throws Exception;
}
