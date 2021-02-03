package kr.opensoftlab.lunaops.spr.spr1000.spr1000.service.impl;

import java.util.List;
import java.util.Map;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;

import org.springframework.stereotype.Repository;




@Repository("spr1000DAO")
public class Spr1000DAO  extends ComOslitsAbstractDAO {
	
	
	@SuppressWarnings("rawtypes")
	public int  selectSpr1000SprListCnt(Map paramMap) throws Exception {
		return  (Integer)select("spr1000DAO.selectSpr1000SprListCnt", paramMap);
	} 
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map>  selectSpr1000SprList(Map paramMap) throws Exception {
		return  (List<Map>) list("spr1000DAO.selectSpr1000SprList", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public String insertSpr1000SprInfo(Map paramMap) throws Exception{
		return (String) insert("spr1000DAO.insertSpr1000SprInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int updateSpr1000Info(Map paramMap) throws Exception{
		return (int) update("spr1000DAO.updateSpr1000Info", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int deleteSpr1000SprInfo(Map paramMap) throws Exception{
		return (int) update("spr1000DAO.deleteSpr1000SprInfo", paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public Map  selectSpr1000SprInfo(Map paramMap) throws Exception {
		return  (Map) select("spr1000DAO.selectSpr1000SprInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int  selectSpr1000SprReqListCnt(Map paramMap) throws Exception {
		return  (Integer)select("spr1000DAO.selectSpr1000SprReqListCnt", paramMap);
	} 
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map>  selectSpr1000SprReqList(Map paramMap) throws Exception {
		return  (List<Map>) list("spr1000DAO.selectSpr1000SprReqList", paramMap);
	}
}