package kr.opensoftlab.lunaops.prj.prj2000.prj2100.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;



@Repository("prj2100DAO")
public class Prj2100DAO extends ComOslitsAbstractDAO {
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Map> selectPrj2100InUsrList(Map paramMap) throws Exception{
		return (List<Map>) list("prj2100DAO.selectPrj2100InUsrList", paramMap);
    }
	
	
	@SuppressWarnings("rawtypes")
	public int selectPrj2100InUsrListCnt(Map paramMap) throws Exception {
		return  (Integer)select("prj2100DAO.selectPrj2100InUsrListCnt", paramMap);
	} 
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Map> selectPrj2100AllUsrList(Map paramMap) throws Exception{
		return (List<Map>) list("prj2100DAO.selectPrj2100AllUsrList", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectPrj2100AllUsrListCnt(Map paramMap) throws Exception {
		return  (Integer)select("prj2100DAO.selectPrj2100AllUsrListCnt", paramMap);
	} 
	
	@SuppressWarnings("rawtypes")
	public String insertPrj2100PrjUsrAuthInfo(Map paramMap) throws Exception{
		return (String) insert("prj2100DAO.insertPrj2100PrjUsrAuthInfo", paramMap);
	}	
	
	
	@SuppressWarnings("rawtypes")
	public int deletePrj2100PrjUsrAuthInfo(Map paramMap) throws Exception{
		return (int) delete("prj2100DAO.deletePrj2100PrjUsrAuthInfo", paramMap);
	}
}
