package kr.opensoftlab.lunaops.usr.usr4000.usr4000.service;



import java.util.List;
import java.util.Map;

import kr.opensoftlab.lunaops.usr.usr4000.usr4000.vo.Usr4000VO;


public interface Usr4000Service {

	
	List<Usr4000VO>  selectUsr4000UsrWhkList(Usr4000VO usr4000Vo) throws Exception;
	
	
	int  selectUsr4000UsrWhkListCnt(Usr4000VO usr4000Vo) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes"})
	List<Map> selectUsr4000UsrWhkAllList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes" })
	Map selectUsr4000UsrWhkInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	String insertUsr4000UsrWhkInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes" })
	void updateUsr4000UsrWhkInfo(Map paramMap) throws Exception;
	
	@SuppressWarnings("rawtypes")
	void deleteUsr4000UsrWhkList(Map paramMap) throws Exception;
}
