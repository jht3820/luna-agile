package kr.opensoftlab.lunaops.stm.stm9000.stm9300.service;

import java.util.List;
import java.util.Map;



public interface Stm9300Service {

	
	@SuppressWarnings("rawtypes")
	List<Map> selectStm9300ProjectJenkinsJobAllList(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes" )
	int selectStm9300ProjectJenkinsJobAllListCnt(Map paramMap) throws Exception;
}
