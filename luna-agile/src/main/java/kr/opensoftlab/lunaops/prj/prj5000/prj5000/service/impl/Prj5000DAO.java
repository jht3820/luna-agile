package kr.opensoftlab.lunaops.prj.prj5000.prj5000.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;



@Repository("prj5000DAO")
public class Prj5000DAO extends ComOslitsAbstractDAO {
	
	@SuppressWarnings("rawtypes")
	public List selectPrj5000EvtList(Map paramMap) throws Exception {
		 return (List) list("prj5000DAO.selectPrj5000EvtList", paramMap);
    }
	
	
	@SuppressWarnings("rawtypes")
	public Map selectPrjEvt5000Info(Map paramMap) throws Exception {
		 return (Map) select("prj5000DAO.selectPrjEvt5000Info", paramMap);
    }
	

	
	@SuppressWarnings("rawtypes")
	public String insertPrj5000PrjEvtAjax(Map paramMap) throws Exception {
		 return (String) insert("prj5000DAO.insertPrj5000PrjEvtAjax", paramMap);
    }
	

	
	@SuppressWarnings("rawtypes")
	public int updatePrj5000PrjEvtAjax(Map paramMap) throws Exception {
		 return update("prj5000DAO.updatePrj5000PrjEvtAjax", paramMap);
    }

	
	@SuppressWarnings("rawtypes")
	public void deletePrj5000PrjEvtInfo(Map paramMap) throws Exception {
		 delete("prj5000DAO.deletePrj5000PrjEvtInfo", paramMap);
    }
	
	
	@SuppressWarnings({ "rawtypes" })
	public List selectPrj5000ReqList(Map paramMap) throws Exception{
		return list("prj5000DAO.selectPrj5000ReqList",paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public Map selectPrj5000ReqInfo(Map paramMap) throws Exception{
		return (Map) select("prj5000DAO.selectPrj5000ReqList",paramMap);
	}
}
