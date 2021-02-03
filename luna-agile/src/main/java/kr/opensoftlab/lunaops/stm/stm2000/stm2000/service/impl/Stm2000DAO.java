package kr.opensoftlab.lunaops.stm.stm2000.stm2000.service.impl;

import java.util.List;
import java.util.Map;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;

import org.springframework.stereotype.Repository;



@Repository("stm2000DAO")
public class Stm2000DAO extends ComOslitsAbstractDAO {
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map> selectStm2000BaseMenuList(Map paramMap) throws Exception {
		 return (List<Map>) list("stm2000DAO.selectStm2000BaseMenuList", paramMap);
    }
	
	
	@SuppressWarnings("rawtypes")
	public Map selectStm2000MenuInfo(Map paramMap) throws Exception{
		return (Map) select("stm2000DAO.selectStm2000MenuInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public String insertStm2000MenuInfo(Map paramMap) throws Exception{
		return (String) insert("stm2000DAO.insertStm2000MenuInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int deleteStm2000MenuInfo(Map paramMap) throws Exception{
		return (int) delete("stm2000DAO.deleteStm2000MenuInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int updateStm2000MenuInfo(Map paramMap) throws Exception{
		return (int) update("stm2000DAO.updateStm2000MenuInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectStm2000deleteMenuList(Map paramMap) throws Exception{
		return (List) list("stm2000DAO.selectStm2000deleteMenuList", paramMap);
    }	
	
	
	@SuppressWarnings("rawtypes")
	public int deleteStm2000projectTypeAuth(Map paramMap) throws Exception{
		return (int) delete("stm2000DAO.deleteStm2000projectTypeAuth", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectStm2001AuthMenuAccessCheck(Map paramMap) throws Exception{
		return (int) select("stm2000DAO.selectStm2001AuthMenuAccessCheck",paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void insertStm2001AuthMenuAccess(Map paramMap) throws Exception{
		insert("stm2000DAO.insertStm2001AuthMenuAccess", paramMap);
	}	
	
	
	@SuppressWarnings({ "rawtypes" })
	public int updateStm2001AuthMenuAccess(Map paramMap) throws Exception{
		return update("stm2000DAO.updateStm2001AuthMenuAccess", paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public int selectStm2001AuthUpMenuAccessCheck(Map paramMap) throws Exception{
		return (int) select("stm2000DAO.selectStm2001AuthUpMenuAccessCheck",paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public void insertStm2001MenuRootAuthList(Map paramMap) throws Exception{
		insert("stm2000DAO.insertStm2001MenuRootAuthList", paramMap);
	}
	
}
