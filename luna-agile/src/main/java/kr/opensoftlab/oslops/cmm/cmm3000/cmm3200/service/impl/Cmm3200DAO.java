package kr.opensoftlab.lunaops.cmm.cmm3000.cmm3200.service.impl;

import java.util.Map;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;

import org.springframework.stereotype.Repository;



@Repository("cmm3200DAO")
public class Cmm3200DAO extends ComOslitsAbstractDAO {

	
	@SuppressWarnings({ "deprecation", "rawtypes" })
	public int selectCmm3200idChk(Map paramMap)  throws Exception{
		return (int) getSqlMapClientTemplate().queryForObject("cmm3200DAO.selectCmm3200idChk", paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public String insertStm2000MenuBegin(Map paramMap)  throws Exception{
		return (String) insert("cmm3200DAO.insertStm2000MenuBegin", paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public String insertStm3000UserInfo(Map paramMap)  throws Exception{
		return (String) insert("cmm3200DAO.insertStm3000UserInfo", paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public String insertAdm3100LicenceGroup(Map paramMap)  throws Exception{
		return (String) insert("cmm3200DAO.insertAdm3100LicenceGroup", paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public String insertStm11000LicenceInfo(Map paramMap)  throws Exception{
		return (String) insert("cmm3200DAO.insertStm11000LicenceInfo", paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public String insertStm4000CodeM(Map paramMap)  throws Exception{
		return (String) insert("cmm3200DAO.insertStm4000CodeM", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public String insertStm4001CodeD(Map paramMap)  throws Exception{
		return (String) insert("cmm3200DAO.insertStm4001CodeD", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public String insertStm4001MenuAuthInfo(Map paramMap)  throws Exception{
		return (String) insert("cmm3200DAO.insertStm4001MenuAuthInfo", paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public String insertStm4001AuthGroupInfo(Map paramMap)  throws Exception{
		return (String) insert("cmm3200DAO.insertStm4001AuthGroupInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public String insertStm4001RootDeptInfo(Map paramMap)  throws Exception{
		return (String) insert("cmm3200DAO.insertStm4001RootDeptInfo", paramMap);
	}


	


}
