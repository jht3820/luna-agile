package kr.opensoftlab.lunaops.spr.spr2000.spr2000.service.impl;

import java.util.List;
import java.util.Map;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;

import org.springframework.stereotype.Repository;




@Repository("spr2000DAO")
public class Spr2000DAO  extends ComOslitsAbstractDAO {
	
	
	
	@SuppressWarnings("rawtypes")
	public int  selectSpr2000MmtListCnt(Map paramMap) throws Exception {
		return  (Integer)select("spr2000DAO.selectSpr2000MmtListCnt", paramMap);
	} 
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map>  selectSpr2000MmtList(Map paramMap) throws Exception {
		return  (List<Map>) list("spr2000DAO.selectSpr2000MmtList", paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public Map  selectSpr2000MmtInfo(Map paramMap) throws Exception {
		return  (Map) select("spr2000DAO.selectSpr2000MmtInfo", paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public String  insertSpr2000MmtInfo(Map paramMap) throws Exception {
		return  (String) insert("spr2000DAO.insertSpr2000MmtInfo", paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public void updateSpr2000MmtInfo(Map paramMap) throws Exception {
		update("spr2000DAO.updateSpr2000MmtInfo", paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public void deleteSpr2000MmtInfo(Map paramMap) throws Exception {
		delete("spr2000DAO.deleteSpr2000MmtInfo", paramMap);
	}

	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map>  selectSpr2001MmtMemList(Map paramMap) throws Exception {
		return  (List<Map>) list("spr2000DAO.selectSpr2001MmtMemList", paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public void insertSpr2001MmtMemList(Map paramMap) throws Exception {
		insert("spr2000DAO.insertSpr2001MmtMemList", paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public void deleteSpr2001MmtMemList(Map paramMap) throws Exception {
		delete("spr2000DAO.deleteSpr2001MmtMemList", paramMap);
	}
}