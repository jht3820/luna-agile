package kr.opensoftlab.lunaops.stm.stm7000.stm7000.service;

import java.util.List;
import java.util.Map;

import kr.opensoftlab.lunaops.stm.stm7000.stm7000.vo.Stm7000VO;




public interface Stm7000Service {
	
		
	List<Stm7000VO> selectStm7000List(Stm7000VO stm7000vo) throws Exception;

		
	int selectStm7000ListCnt(Stm7000VO stm7000vo) throws Exception;

	
	Object saveStm7000Info(Map<String, String> paramMap) throws Exception;

		
	@SuppressWarnings("rawtypes")
	Map selectStm7000Info(Map<String, String> paramMap) throws Exception;

	
	void deleteStm7000Info(Map<String, String> paramMap) throws Exception;

	
	int selectStm7000UseCountInfo(Map<String, String> paramMap)throws Exception;

	
	List<Map<String, String>> selectStm7000ApiUrlList(Map<String, String> paramMap)throws Exception;

}
