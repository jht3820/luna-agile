package kr.opensoftlab.lunaops.dpl.dpl2000.dpl2000.service;

import java.util.List;
import java.util.Map;

import kr.opensoftlab.lunaops.dpl.dpl2000.dpl2000.vo.Dpl2000VO;



public interface Dpl2000Service {
	
	@SuppressWarnings({"rawtypes" })
	List selectDpl2000SignList(Dpl2000VO dpl2000vo)  throws Exception;
	
	
	int selectDpl2000SignListCnt(Dpl2000VO dpl2000vo) throws Exception;
	
	
	@SuppressWarnings({"rawtypes" })
	Map selectDpl2000SignInfoAjax(Map map)  throws Exception;

}
