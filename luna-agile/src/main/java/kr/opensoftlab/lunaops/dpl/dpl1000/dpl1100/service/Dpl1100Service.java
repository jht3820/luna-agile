package kr.opensoftlab.lunaops.dpl.dpl1000.dpl1100.service;

import java.util.List;
import java.util.Map;

import kr.opensoftlab.lunaops.dpl.dpl1000.dpl1100.vo.Dpl1100VO;



public interface Dpl1100Service {

	
	@SuppressWarnings("rawtypes")
	List<Map> selectDpl1100ExistDplList(Dpl1100VO dpl1100VO) throws Exception;

	
	int selectDpl1100ExistDplListCnt(Dpl1100VO dpl1100VO) throws Exception ;
	
	
	@SuppressWarnings("rawtypes")
	List<Map> selectDpl1100NotExistDplList(Dpl1100VO dpl1100VO) throws Exception;
	
	
	
	int selectDpl1100NotExistDplListCnt(Dpl1100VO dpl1100VO) throws Exception;
	
	
	void updateDpl1100Dpl(Map<String, Object> paramMap) throws Exception;

	@SuppressWarnings("rawtypes")
	String selectDpl1100ExistBuildInfo(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	List selectDpl1100ReqDplList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void insertDpl1100ReqDplInfo(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	void deleteDpl1100ReqDplInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	int updateDpl1200ReqDplInfo(Map paramMap) throws Exception;
	
	
}
