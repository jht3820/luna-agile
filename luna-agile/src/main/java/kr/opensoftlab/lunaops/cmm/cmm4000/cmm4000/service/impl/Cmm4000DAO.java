package kr.opensoftlab.lunaops.cmm.cmm4000.cmm4000.service.impl;

import java.util.List;
import java.util.Map;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;
import kr.opensoftlab.lunaops.com.vo.LicVO;
import kr.opensoftlab.lunaops.com.vo.LoginVO;

import org.springframework.stereotype.Repository;



@Repository("cmm4000DAO")
public class Cmm4000DAO extends ComOslitsAbstractDAO {
	
	
    @SuppressWarnings("rawtypes")
	public Map selectCmm4000UsrList(Map param) throws Exception {
        return (Map) select("selectCmm4000UsrInfoCheck", param);    
    }
    
	
	public LoginVO selectCmm4000LoginAction(LoginVO loginVO) throws Exception {
        return (LoginVO) select("cmm4000DAO.selectCmm4000LoginAction", loginVO);    
    }    
	
	
	public LoginVO selectCmm4000SuperLoginAction(LoginVO loginVO) throws Exception {
		return (LoginVO) select("cmm4000DAO.selectCmm4000SuperLoginAction", loginVO);    
	}    
	
	
	public LicVO selectCmm4000LicInfo(LoginVO loginVO) throws Exception{
		return (LicVO) select("cmm4000DAO.selectCmm4000LicInfo", loginVO);
	}
	
	
	@SuppressWarnings("rawtypes")
	public Map selectCmm4000PrjChk(LoginVO loginVO) throws Exception{
		return (Map) select("cmm4000DAO.selectCmm4000PrjChk", loginVO);
	}
	
	
	
	@SuppressWarnings("rawtypes")
	public List selectCmm4000UsrPrjAuthList(Map prjMap) throws Exception{
		return (List) list("cmm4000DAO.selectCmm4000UsrPrjAuthList", prjMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectCmm4000UsrAuthList(Map paramMap) throws Exception{
		return (List) list("cmm4000DAO.selectCmm4000UsrAuthList", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectCmm4000MenuList(Map paramMap) throws Exception{
		return (List) list("cmm4000DAO.selectCmm4000MenuList", paramMap);
	}
	
	@SuppressWarnings("rawtypes")
	public String selectCmm4000NameEmailChk(Map paramMap) throws Exception{
		return (String) select("cmm4000DAO.selectCmm4000NameEmailChk", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	String selectCmm4000IdEmailChk(Map paramMap) throws Exception{
		return (String) select("cmm4000DAO.selectCmm4000IdEmailChk", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void updateCmm4000NewPw(Map paramMap) throws Exception{
		update("cmm4000DAO.updateCmm4000NewPw",paramMap);
	}
	
	
	public void updateCmm4000LoginCnt(LoginVO loginVO) throws Exception{
		update("cmm4000DAO.updateCmm4000LoginCnt",loginVO);
	}
	
	
	
	public void updateCmm4000RecentLoginDate(LoginVO loginVO) throws Exception{
		update("cmm4000DAO.updateCmm4000RecentLoginDate",loginVO);
	}
	
	
	public String selectCmm4000LastLoginChk(LoginVO loginVO) throws Exception{
		return (String) select("cmm4000DAO.selectCmm4000LastLoginChk",loginVO);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectCmm4000LoginMainMenuList(Map paramMap) throws Exception{
		return (List) list("cmm4000DAO.selectCmm4000LoginMainMenuList", paramMap);
	}
	
	
	
	public String selectCmm4000RecentLoginDate(LoginVO loginVO) throws Exception{
		return (String) select("cmm4000DAO.selectCmm4000RecentLoginDate", loginVO);
	}
	
	
	
	@SuppressWarnings("rawtypes")
	public Map selectCmm4000LoginUsrInfo(LoginVO loginVO) throws Exception {
		return (Map) select("cmm4000DAO.selectCmm4000LoginUsrInfo", loginVO);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectCmm4000CurtPwChk(Map paramMap) throws Exception{
		return (int)select("cmm4000DAO.selectCmm4000CurtPwChk", paramMap);
	}	
}
