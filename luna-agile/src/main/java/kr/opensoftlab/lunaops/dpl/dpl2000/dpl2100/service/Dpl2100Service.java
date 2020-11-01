package kr.opensoftlab.lunaops.dpl.dpl2000.dpl2100.service;

import java.util.List;
import java.util.Map;

import kr.opensoftlab.lunaops.dpl.dpl2000.dpl2100.vo.Dpl2100VO;



public interface Dpl2100Service {
	
	@SuppressWarnings({"rawtypes" })
	List selectDpl2100SignList(Dpl2100VO dpl2100vo)  throws Exception;
	
	
	int selectDpl2100SignListCnt(Dpl2100VO dpl2100vo) throws Exception;
	
	
	@SuppressWarnings({"rawtypes" })
	Map selectDpl2100SignInfoAjax(Map map)  throws Exception;

	
	@SuppressWarnings("rawtypes")
	void insertDpl2100DplSignWaitInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void insertDpl2100DplSignInfo(Map paramMap) throws Exception;
}
