package kr.opensoftlab.lunaops.prj.prj1000.prj1300.service.impl;

import java.util.List;
import java.util.Map;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;

import org.springframework.stereotype.Repository;



@Repository("prj1300DAO")
public class Prj1300DAO  extends ComOslitsAbstractDAO {
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj1300PrjReqOptList(Map paramMap) throws Exception {
		return (List) list("prj1300DAO.selectPrj1300PrjReqOptList", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj1300PrjProOptList(Map paramMap) throws Exception {
		return (List) list("prj1300DAO.selectPrj1300PrjProOptList", paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public Map selectPrj1300PrjProOptInfo(Map paramMap) throws Exception {
		return (Map) select("prj1300DAO.selectPrj1300PrjProOptList", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectPrj1300PrjProOptCnt(Map paramMap) throws Exception {
		 return (int) select("prj1300DAO.selectPrj1300PrjProOptCnt", paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public void insertPrj1300PrjProOptInfo(Map paramMap) throws Exception {
		 insert("prj1300DAO.insertPrj1300PrjProOptInfo", paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public void insertPrj1300PrjProOptCopyInfo(Map paramMap) throws Exception {
		insert("prj1300DAO.insertPrj1300PrjProOptCopyInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void updatePrj1300PrjPrpOptInfo(Map paramMap) throws Exception {
		 update("prj1300DAO.updatePrj1300PrjPrpOptInfo", paramMap);
	}
	
	
	
	
	@SuppressWarnings("rawtypes")
	public void deletePrj1300PrjProOptInfo(Map paramMap) throws Exception {
		update("prj1300DAO.deletePrj1300PrjProOptInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void insertPrj1300PrjProOptValueInfo(Map paramMap) throws Exception {
		 insert("prj1300DAO.insertPrj1300PrjProOptValueInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void updatePrj1300PrjProOptValueInfo(Map paramMap) throws Exception {
		update("prj1300DAO.updatePrj1300PrjProOptValueInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj1300PrjProOptExistFileIdList(Map paramMap) throws Exception {
		return (List) list("prj1300DAO.selectPrj1300PrjProOptExistFileIdList", paramMap);
	}
}