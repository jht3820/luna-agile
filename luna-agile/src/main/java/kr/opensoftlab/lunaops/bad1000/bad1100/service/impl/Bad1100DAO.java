package kr.opensoftlab.lunaops.bad.bad1000.bad1100.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;



@Repository("bad1100DAO")
public class Bad1100DAO extends ComOslitsAbstractDAO {

	
	@SuppressWarnings({ "rawtypes" })
	public int selectBad1100CmtListCnt(Map paramMap) throws Exception {
		return (int) select("bad1100DAO.selectBad1100CmtListCnt", paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Map> selectBad1100CmtList(Map paramMap) throws Exception {
		return (List<Map>) list("bad1100DAO.selectBad1100CmtList", paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public void insertBad1100CmtInfo(Map paramMap) throws Exception {
		insert("bad1100DAO.insertBad1100CmtInfo", paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public void deleteBad1100CmtInfo(Map paramMap) throws Exception {
		delete("bad1100DAO.deleteBad1100CmtInfo", paramMap);
	}

	
	@SuppressWarnings({ "rawtypes" })
	public void deleteBad1100CmtDelInfo(Map paramMap) throws Exception {
		delete("bad1100DAO.deleteBad1100CmtDelInfo", paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public void updateBad1100CmtRestore(Map paramMap) throws Exception {
		update("bad1100DAO.updateBad1100CmtRestore", paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public int selectBad1100CmtAllCnt(Map paramMap) throws Exception {
		return (int) select("bad1100DAO.selectBad1100CmtAllCnt", paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public Map selectBad1100CmtMaxInfo(Map paramMap) throws Exception {
		return (Map) select("bad1100DAO.selectBad1100CmtMaxInfo", paramMap);
	}
	
}
