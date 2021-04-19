package kr.opensoftlab.lunaops.prj.prj3000.prj3100.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;


@Repository("prj3100DAO")
public class Prj3100DAO extends ComOslitsAbstractDAO {

	
	public void updatePrj3100FileType(Map<String, String> paramMap) throws Exception {
		update("prj3100DAO.updatePrj3100FileId", paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public List selectPrj3100MenuTree(Map<String, String> paramMap) throws Exception {
		return (List)list("prj3100DAO.selectPrj3100MenuTree",paramMap);
	}

	
	public String insertPrj3001CngInf(Map<String, String> paramMap) throws Exception{
		return (String) insert("prj3100DAO.insertPrj3001CngInf", paramMap);
	}

	
	public void deletePrj3001CngInf(Map<String, String> paramMap) throws Exception{
		delete("prj3100DAO.deletePrj3001CngInf", paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public Map selectPrj3001CngInf(Map<String, String> paramMap) throws Exception{
		return (Map)select("prj3100DAO.selectPrj3001CngInf", paramMap);
	}

}
