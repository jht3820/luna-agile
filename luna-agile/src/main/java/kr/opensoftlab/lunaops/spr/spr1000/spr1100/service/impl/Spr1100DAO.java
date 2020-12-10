package kr.opensoftlab.lunaops.spr.spr1000.spr1100.service.impl;

import java.util.List;
import java.util.Map;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;

import org.springframework.stereotype.Repository;




@Repository("spr1100DAO")
public class Spr1100DAO  extends ComOslitsAbstractDAO {
	
	
	@SuppressWarnings("rawtypes")
	public int  selectSpr1100ReqListCnt(Map paramMap) throws Exception {
		return  (Integer)select("spr1100DAO.selectSpr1100ReqListCnt", paramMap);
	} 
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map>  selectSpr1100ReqList(Map paramMap) throws Exception {
		return  (List<Map>) list("spr1100DAO.selectSpr1100ReqList", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void insertSpr1100ReqInfo(Map paramMap) throws Exception {
		insert("spr1100DAO.insertSpr1100ReqInfo", paramMap);
	} 
	
	
	@SuppressWarnings("rawtypes")
	public void deleteSpr1100ReqInfo(Map paramMap) throws Exception {
		delete("spr1100DAO.deleteSpr1100ReqInfo", paramMap);
	} 
	
	
	@SuppressWarnings("rawtypes")
	public int updateSpr1100ReqSprPointInfo(Map paramMap) throws Exception {
		return update("spr1100DAO.updateSpr1100ReqSprPointInfo", paramMap);
	} 
	
	
	@SuppressWarnings("rawtypes")
	public int updateSpr1100ReqResultInfo(Map paramMap) throws Exception {
		return update("spr1100DAO.updateSpr1100ReqResultInfo", paramMap);
	} 
	
	
	@SuppressWarnings({ "rawtypes" })
	public Map  selectSpr1100ReqResultInfo(Map paramMap) throws Exception {
		return  (Map) select("spr1100DAO.selectSpr1100ReqResultInfo", paramMap);
	}
	
	
	
	public int selectSpr1101SprReqListCnt(Map<String, String> paramMap) throws Exception {
		return  (Integer)select("spr1100DAO.selectSpr1100SprReqListCnt", paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List selectSpr1101SprReqList(Map<String, String> paramMap) throws Exception {
		return  (List<Map>) list("spr1100DAO.selectSpr1100SprReqList", paramMap);
	}
	
	
}