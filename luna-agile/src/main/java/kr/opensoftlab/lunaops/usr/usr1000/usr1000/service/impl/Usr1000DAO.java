package kr.opensoftlab.lunaops.usr.usr1000.usr1000.service.impl;

import java.util.Map;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;
import kr.opensoftlab.lunaops.com.vo.LoginVO;

import org.springframework.stereotype.Repository;



@Repository("usr1000DAO")
public class Usr1000DAO extends ComOslitsAbstractDAO {
	
	
	@SuppressWarnings("rawtypes")
	public Map selectUsr1000UsrInfo(Map paramMap) throws Exception {
        return (Map) select("usr1000DAO.selectUsr1000UsrInfo", paramMap);    
    }   
	
	
	@SuppressWarnings("rawtypes")
	public int selectUsr1000emailChRepAjax(Map paramMap) throws Exception {
		 return (int) select("usr1000DAO.selectUsr1000emailChRepAjax", paramMap);
    }
	
	
	@SuppressWarnings("rawtypes")
	public int updateUsr1000UsrInfo(Map paramMap) throws Exception {
		 return (int) update("usr1000DAO.updateUsr1000UsrInfo", paramMap);
    }

	
	@SuppressWarnings("rawtypes")
	public String selectUsr1000BeforePwCheck(Map paramMap) throws Exception {
		return (String) select("usr1000DAO.selectUsr1000BeforePwCheck", paramMap);
	}
	
	
	public int updateUsr1000PasswordChange(Map<String, String> paramMap) throws Exception {
		return (int) update("usr1000DAO.updateUsr1000PasswordChange", paramMap);
	}


	
	@SuppressWarnings("rawtypes")
	public Map selectUsr1002(Map<String, String> paramMap) throws Exception {
		return (Map) select("usr1000DAO.selectUsr1002", paramMap);
	}

	
	public int updateUsr1002(Map<String, String> paramMap) throws Exception  {
		return (int) update("usr1000DAO.updateUsr1002", paramMap);
	}

	
	public LoginVO selectUsr1000LoginVO(Map<String, String> paramMap) throws Exception {
		return (LoginVO) select("usr1000DAO.selectUsr1000LoginVO",paramMap);
	}
}
