package kr.opensoftlab.lunaops.cmm.cmm4000.cmm4000.service;

import java.util.List;
import java.util.Map;

import kr.opensoftlab.lunaops.com.vo.LicVO;
import kr.opensoftlab.lunaops.com.vo.LoginVO;


public interface Cmm4000Service {
	
	
	
	LoginVO selectCmm4000LoginAction(LoginVO loginVO) throws Exception;	
	
	
	LoginVO selectCmm4000LdapLoginAction(LoginVO loginVO) throws Exception;	
	
	
	LicVO selectCmm4000LicInfo(LoginVO loginVO) throws Exception;	
	
	
	@SuppressWarnings("rawtypes")
	Map selectCmm4000PrjChk(LoginVO loginVO) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	List selectCmm4000UsrPrjAuthList(Map prjMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	List selectCmm4000UsrAuthList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	List selectCmm4000MenuList(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	String selectCmm4000NameEmailChk(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	String selectCmm4000IdEmailChk(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void updateCmm4000NewPwe(Map paramMap) throws Exception;
	
	
	public void updateCmm4000RecentLoginDate(LoginVO loginVO) throws Exception;
	
	@SuppressWarnings("rawtypes")
	public List selectCmm4000LoginMainMenuList(Map paramMap) throws Exception;
	
	
	
	public String selectCmm4000RecentLoginDate(LoginVO loginVO) throws Exception;

	String updateCmm4000AccountInit(Map<String, String> param)  throws Exception ;
	
	
	
	@SuppressWarnings("rawtypes")
	public Map selectCmm4000LoginUsrInfo(LoginVO loginVO) throws Exception;

	
	@SuppressWarnings("rawtypes")
	int selectCmm4000CurtPwChk(Map paramMap) throws Exception;
	
	
	String updateCmm4000PasswordExprInit(Map<String, String> param) throws Exception;
}
