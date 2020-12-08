package kr.opensoftlab.lunaops.spr.spr2000.spr2100.service.impl;

import java.util.List;
import java.util.Map;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;

import org.springframework.stereotype.Repository;


@Repository("spr2100DAO")
public class Spr2100DAO  extends ComOslitsAbstractDAO {
	
	
	@SuppressWarnings("rawtypes")
	public int  selectSpr2100MmrListCnt(Map paramMap) throws Exception {
		return  (Integer)select("spr2100DAO.selectSpr2100MmrListCnt", paramMap);
	} 
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map>  selectSpr2100MmrList(Map paramMap) throws Exception {
		return  (List<Map>) list("spr2100DAO.selectSpr2100MmrList", paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public Map  selectSpr2100MmrInfo(Map paramMap) throws Exception {
		return  (Map) select("spr2100DAO.selectSpr2100MmrInfo", paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public String  insertSpr2100MmrInfo(Map paramMap) throws Exception {
		return  (String) insert("spr2100DAO.insertSpr2100MmrInfo", paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public void updateSpr2100MmrInfo(Map paramMap) throws Exception {
		update("spr2100DAO.updateSpr2100MmrInfo", paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public void deleteSpr2100MmrInfo(Map paramMap) throws Exception {
		delete("spr2100DAO.deleteSpr2100MmrInfo", paramMap);
	}
}