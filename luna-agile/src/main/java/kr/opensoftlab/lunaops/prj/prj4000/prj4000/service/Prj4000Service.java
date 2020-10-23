package kr.opensoftlab.lunaops.prj.prj4000.prj4000.service;



import java.util.List;
import java.util.Map;

import kr.opensoftlab.lunaops.prj.prj4000.prj4000.vo.Prj4000VO;


public interface Prj4000Service {

	
	List<Prj4000VO>  selectPrj4000PrjWhkList(Prj4000VO prj4000vo) throws Exception;
	
	
	int  selectPrj4000PrjWhkListCnt(Prj4000VO prj4000vo) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes"})
	List<Map> selectPrj4000PrjWhkAllList(Map paramMap) throws Exception;

	
	@SuppressWarnings({ "rawtypes" })
	Map selectPrj4000PrjWhkInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	String insertPrj4000PrjWhkInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes" })
	void updatePrj4000PrjWhkInfo(Map paramMap) throws Exception;
	
	@SuppressWarnings("rawtypes")
	int deletePrj4000PrjWhkInfo(Map paramMap) throws Exception;
	

	
	@SuppressWarnings("rawtypes")
	void deletePrj4000PrjWhkList(Map paramMap) throws Exception;
}
