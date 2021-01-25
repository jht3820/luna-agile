package kr.opensoftlab.lunaops.spr.spr1000.spr1000.service;

import java.util.List;
import java.util.Map;



public interface Spr1000Service {
	
	@SuppressWarnings("rawtypes")
	public int selectSpr1000SprListCnt(Map paramMap) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes" })
	public List<Map> selectSpr1000SprList(Map paramMap) throws Exception;
	
	@SuppressWarnings("rawtypes")
	String insertSpr1000SprInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	int updateSpr1000Info(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	int deleteSpr1000SprInfo(Map paramMap) throws Exception;

	
	@SuppressWarnings({ "rawtypes" })
	Map  selectSpr1000SprInfo(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	int selectSpr1000SprReqListCnt(Map paramMap) throws Exception;
	
	
	@SuppressWarnings({"rawtypes" })
	List<Map>  selectSpr1000SprReqList(Map paramMap) throws Exception;
}
