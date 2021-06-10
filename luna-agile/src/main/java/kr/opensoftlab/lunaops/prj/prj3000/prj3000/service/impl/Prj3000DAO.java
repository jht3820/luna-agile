package kr.opensoftlab.lunaops.prj.prj3000.prj3000.service.impl;

import java.util.List;
import java.util.Map;


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
	public String insertPrj3000RootMenuInfo(Map paramMap) throws Exception{
		return (String) insert("prj3000DAO.insertPrj3000RootMenuInfo", paramMap);
	}
	

	
	@SuppressWarnings("rawtypes")
	public Map selectPrj3000WizardMenuInfo(Map paramMap) throws Exception{
		return (Map) select("prj3000DAO.selectPrj3000WizardMenuInfo", paramMap);
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

	
	public void updatePrj3000FileType(Map<String, String> paramMap) throws Exception{
		update("prj3000DAO.updatePrj3000FileId", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj3000MenuTree(Map paramMap) throws Exception{
		return (List)list("prj3000DAO.selectPrj3000MenuTree",paramMap);
	}
	
	
	
	
	
	public int selectPrj3002DocConListCnt(Map<String, String> paramMap) throws Exception{
		return (Integer) select("prj3000DAO.selectPrj3002DocConCnt", paramMap);
	}

	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map> selectPrj3002DocConList(Map<String, String> paramMap) throws Exception{
		return (List<Map>) list("prj3000DAO.selectPrj3002DocConList",paramMap);
	}

	
	public int selectPrj3002ConTargetCnt(Map<String, String> paramMap) {
		return (Integer) select("prj3000DAO.selectPrj3002ConTargetCnt", paramMap);
	}

	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List selectPrj3002ConTargetList(Map<String, String> paramMap) {
		return (List<Map>) list("prj3000DAO.selectPrj3000ConTargetList", paramMap);
	}

	
	public void insertPrj3002DocConInfo(Map<String, String> paramMap) throws Exception{
		insert("prj3000DAO.selectPrj3002DocConInfo", paramMap);
	}

	
	public void deletePrj3002DocConInfo(Map<String, String> paramMap) throws Exception{
		delete("prj3000DAO.deletePrj3002DocConInfo", paramMap);
		
	}
	
	
	
	
	
	
	
	
	
	@SuppressWarnings("rawtypes")
	public int deletePrj3000DocList(Map paramMap) throws Exception{
		return delete("prj3000DAO.deletePrj3000DocList", paramMap);
	}
	
	@SuppressWarnings("rawtypes")
	public List selectPrj3000RootMenuList(Map paramMap) throws Exception{
		return (List)list("prj3000DAO.selectPrj3000RootMenuList",paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public String insertPrj3000ParamMenuInfo(Map paramMap) throws Exception{
		return (String) insert("prj3000DAO.insertPrj3000ParamMenuInfo", paramMap);
	}
}
