package kr.opensoftlab.lunaops.prj.prj3000.prj3000.service.impl;

import java.util.List;
import java.util.Map;

import javax.persistence.criteria.CriteriaBuilder.In;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;

import org.springframework.stereotype.Repository;



@Repository("prj3000DAO")
public class Prj3000DAO extends ComOslitsAbstractDAO {

	
	@SuppressWarnings("rawtypes")
	public List selectPrj3000BaseMenuList(Map paramMap) throws Exception{
		return (List)list("prj3000DAO.selectPrj3000BaseMenuList",paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public Map selectPrj3000MenuInfo(Map paramMap) throws Exception{
		return (Map) select("prj3000DAO.selectPrj3000MenuInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public String insertPrj3000MenuInfo(Map paramMap) throws Exception{
		return (String) insert("prj3000DAO.insertPrj3000MenuInfo", paramMap);
	}
	
	@SuppressWarnings("rawtypes")
	public String insertPrj3000RootMenuInfo(Map paramMap) throws Exception{
		return (String) insert("prj3000DAO.insertPrj3000RootMenuInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int deletePrj3000MenuInfo(Map paramMap) throws Exception{
		return delete("prj3000DAO.deletePrj3000MenuInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int deletePrj3000DocList(Map paramMap) throws Exception{
		return delete("prj3000DAO.deletePrj3000DocList", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int updatePrj3000MenuInfo(Map paramMap) throws Exception{
		return update("prj3000DAO.updatePrj3000MenuInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int updatePrj3000FileSnSelect(Map paramMap) throws Exception{
		return update("prj3000DAO.updatePrj3000FileSnSelect", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj3000MenuTree(Map paramMap) throws Exception{
		return (List)list("prj3000DAO.selectPrj3000MenuTree",paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj3000RootMenuList(Map paramMap) throws Exception{
		return (List)list("prj3000DAO.selectPrj3000RootMenuList",paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public Map selectPrj3000WizardMenuInfo(Map paramMap) throws Exception{
		return (Map) select("prj3000DAO.selectPrj3000WizardMenuInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public String insertPrj3000ParamMenuInfo(Map paramMap) throws Exception{
		return (String) insert("prj3000DAO.insertPrj3000ParamMenuInfo", paramMap);
	}

	
	public int selectPrj3000DocNextOrd(Map<String, String> paramMap) throws Exception{
		return (Integer) select("prj3000DAO.selectPrj3000DocNextOrd", paramMap);
	}

	
	public String insertPrj3000DocInfo(Map<String, String> paramMap) throws Exception{
		return (String) insert("prj3000DAO.insertPrj3000DocInfo",paramMap);
		
	}

	
	public int updatePrj3000DocInfo(Map<String, String> paramMap) throws Exception{
		return (int) update("prj3000DAO.updatePrj3000DocInfo", paramMap);
	}

	
	public void deletePrj3000DocInfo(Map infoMap) throws Exception{
		delete("prj3000DAO.deletePrj3000DocInfo", infoMap);
	}
}
