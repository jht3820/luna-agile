package kr.opensoftlab.lunaops.cmm.cmm10000.cmm17000.service.Impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;

@Repository("cmm17000DAO")
public class Cmm17000DAO extends ComOslitsAbstractDAO {
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map>  selectCmm17000PrjList(Map paramMap) throws Exception {
		return  (List<Map>) list("cmm17000DAO.selectCmm17000PrjList", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int  selectCmm17000PrjListCnt(Map paramMap) throws Exception {
		 return  (Integer) select("cmm17000DAO.selectCmm17000PrjListCnt", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void  updateCmm17000UsrMainPrj(Map paramMap) throws Exception {
		update("cmm17000DAO.updateCmm17000UsrMainPrj", paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Map>  selectCmm17000UsrMainPrj(Map paramMap) throws Exception {
		return (List<Map>) list("cmm17000DAO.selectCmm17000UsrMainPrj", paramMap);
	}
	
	
}
