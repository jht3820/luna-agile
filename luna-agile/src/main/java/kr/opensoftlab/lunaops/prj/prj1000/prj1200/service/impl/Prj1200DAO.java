package kr.opensoftlab.lunaops.prj.prj1000.prj1200.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;



@Repository("prj1200DAO")
public class Prj1200DAO extends ComOslitsAbstractDAO {
	
	@SuppressWarnings("rawtypes")
	public List selectPrj1200PrjList(Map paramMap) throws Exception {
		 return (List) list("prj1200DAO.selectPrj1200PrjList", paramMap);
    }
	
	
	@SuppressWarnings("rawtypes")
	public int selectPrj1200PrjListCnt(Map paramMap) throws Exception {
		 return (int) select("prj1200DAO.selectPrj1200PrjListCnt", paramMap);
    }
	
	
	@SuppressWarnings("rawtypes")
	public Map selectPrjSet1200Info(Map paramMap) throws Exception {
		 return (Map) select("prj1200DAO.selectPrjSet1200Info", paramMap);
    }
	

	
	@SuppressWarnings("rawtypes")
	public int insertPrj1200PrjSetAjax(Map paramMap) throws Exception {
		 return update("prj1200DAO.insertPrj1200PrjSetAjax", paramMap);
    }
	

	
	@SuppressWarnings("rawtypes")
	public int updatePrj1200PrjSetAjax(Map paramMap) throws Exception {
		 return update("prj1200DAO.updatePrj1200PrjSetAjax", paramMap);
    }
	
}
