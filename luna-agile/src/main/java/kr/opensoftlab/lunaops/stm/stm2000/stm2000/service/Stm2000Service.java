package kr.opensoftlab.lunaops.stm.stm2000.stm2000.service;

import java.util.List;
import java.util.Map;


public interface Stm2000Service {
	
	
	@SuppressWarnings("rawtypes")
	List selectStm2000BaseMenuList(Map paramMap) throws Exception;	
	
	
	@SuppressWarnings("rawtypes")
	Map selectStm2000MenuInfo(Map paramMap) throws Exception;	
	
	
	@SuppressWarnings("rawtypes")
	void insertStm2000MenuInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void deleteStm2000MenuInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void updateStm2000MenuInfo(Map paramMap) throws Exception;
	

	
	@SuppressWarnings({ "rawtypes" })
	void saveStm2000AuthGrpMenuAuthInfo(Map paramMap) throws Exception;
	
}
