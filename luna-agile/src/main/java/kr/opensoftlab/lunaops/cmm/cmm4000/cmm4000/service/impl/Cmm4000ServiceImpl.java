package kr.opensoftlab.lunaops.cmm.cmm4000.cmm4000.service.impl;

import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.naming.AuthenticationException;
import javax.naming.Context;
import javax.naming.InvalidNameException;
import javax.naming.NamingEnumeration;
import javax.naming.NamingException;
import javax.naming.directory.DirContext;
import javax.naming.directory.InitialDirContext;
import javax.naming.directory.SearchControls;

import org.springframework.stereotype.Service;

import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.utl.sim.service.EgovFileScrty;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.opensoftlab.lunaops.cmm.cmm4000.cmm4000.service.Cmm4000Service;
import kr.opensoftlab.lunaops.com.vo.LicVO;
import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.lunaops.stm.stm3000.stm3000.service.impl.Stm3000DAO;
import kr.opensoftlab.lunaops.stm.stm3000.stm3003.service.impl.Stm3003DAO;



@Service("cmm4000Service")
public class Cmm4000ServiceImpl extends EgovAbstractServiceImpl implements Cmm4000Service {

	
	@Resource(name="cmm4000DAO")
	private Cmm4000DAO cmm4000DAO;
	
	
	@Resource(name="stm3003DAO")
	private Stm3003DAO stm3003DAO;
	
	
	@Resource(name="stm3000DAO")
	private Stm3000DAO stm3000DAO;
	
	
	public final static int LOGIN_SUCCESS = 1000;
	
	public final static int NO_SEARCH_ID = 1001;
	
	public final static int ACCOUNT_LOCK = 1002;
	
	public final static int WRONG_PASSWORD = 1003;
	
	public final static int NO_USE_USER = 1004;
	
	public final static int DUPULICATE_USER_LOGIN = 1005;
	
	public final static int NOT_USED_3_MONTHS = 1006;
	
	public final static int PW_EXPORED = 1007;
	
	public final static int INITIAL_ACCOUNT_WAIT_MINUTE_AFTER = 1008;
	
	public final static int INITIAL_PASSWORD_CHANGE = 1009;
	
	public final static int MAX_WRONG_PASSWORD_LIMIT_COUNT = 5;
	
	public final static int INITIAL_ACCOUNT_WAIT_MINUTE = 10;

	
	@SuppressWarnings({ "rawtypes", "unused" })
	public LoginVO selectCmm4000LdapLoginAction(LoginVO loginVO) throws Exception {
		
        LoginVO rtnLoginVO = cmm4000DAO.selectCmm4000LoginAction(loginVO);

        
 		if(rtnLoginVO == null){
 			rtnLoginVO = new LoginVO();
 			rtnLoginVO.setLoginStatus(NO_SEARCH_ID);
 			
 		}else {
 			
 			if("01".equals(rtnLoginVO.getUseCd())){
 				
 				if("02".equals( rtnLoginVO.getBlock() )){
					rtnLoginVO.setLoginStatus(ACCOUNT_LOCK);
				
				}else {
					
					String usrId = loginVO.getUsrId();
					String usrPw = loginVO.getUsrPw();
					
					
					String basedn = EgovProperties.getProperty("Globals.lunaops.ldap.searchBase");
					String domain = EgovProperties.getProperty("Globals.lunaops.ldap.domain");
			        String ldapServer = EgovProperties.getProperty("Globals.lunaops.ldap.server");
			        String searchFilter = EgovProperties.getProperty("Globals.lunaops.ldap.searchFilter");
					
			        DirContext ctx;
			
			        
			    	Hashtable<String, String> property = new Hashtable<String, String>();
			    	property.put(Context.INITIAL_CONTEXT_FACTORY, "com.sun.jndi.ldap.LdapCtxFactory");
			    	property.put(Context.PROVIDER_URL,ldapServer);
			    	property.put(Context.SECURITY_AUTHENTICATION, "simple");
			    	property.put(Context.SECURITY_PRINCIPAL, domain+"\\"+usrId);
			    	property.put(Context.SECURITY_CREDENTIALS, usrPw);
			    	
			    	
					boolean loginSuccess = false;

					
			    	try {
				    	ctx = new InitialDirContext(property);
				
				    	SearchControls cons = new SearchControls();
						cons.setSearchScope(SearchControls.SUBTREE_SCOPE);
						NamingEnumeration result = ctx.search(basedn, searchFilter+usrId, cons);
				        
						
						loginSuccess = true;
					}catch(AuthenticationException ae) {	
						System.out.println(ae);
						loginSuccess = false;
						rtnLoginVO.setLoginStatus(WRONG_PASSWORD);
						
					}catch(InvalidNameException e) { 
						System.out.println(e);
						loginSuccess = false;
						rtnLoginVO.setLoginStatus(NO_SEARCH_ID);
						
					}catch(NamingException e) { 
						System.out.println(e);
						loginSuccess = false;
						rtnLoginVO.setLoginStatus(NO_SEARCH_ID);
						
					}catch(Exception e) { 
						System.out.println(e);
						loginSuccess = false;
						rtnLoginVO.setLoginStatus(NO_SEARCH_ID);
					}
					
					if(loginSuccess) { 
						
						rtnLoginVO.setBlock("01"); 
						rtnLoginVO.setLoginStatus(LOGIN_SUCCESS);
					}else { 
						loginSuccess = false;
						rtnLoginVO.setLoginStatus(NO_SEARCH_ID);
					}
				}
 			}else { 
 				rtnLoginVO.setLoginStatus(NO_USE_USER);
 			}
 			
 		}

		return rtnLoginVO;
	}
	
	public LoginVO selectCmm4000LoginAction(LoginVO loginVO) throws Exception {
		String paramUsrPw = loginVO.getUsrPw();
		
		
		LoginVO rtnLoginVO = cmm4000DAO.selectCmm4000LoginAction(loginVO);

		
		if(rtnLoginVO==null){
			rtnLoginVO = new LoginVO();
			rtnLoginVO.setLoginStatus(NO_SEARCH_ID);
		}else{
			
			String enUsrPw = EgovFileScrty.encryptPassword(paramUsrPw, rtnLoginVO.getUsrId());
			loginVO.setUsrPw(enUsrPw);
			
			
			if("01".equals(rtnLoginVO.getUseCd())){
				
				if("02".equals( rtnLoginVO.getBlock() )){
					rtnLoginVO.setLoginStatus(ACCOUNT_LOCK);
				
				}else{
					Map<String, String> paramMap = new HashMap<String, String>();
					paramMap.put("licGrpId", rtnLoginVO.getLicGrpId());
			    	paramMap.put("usrId", rtnLoginVO.getUsrId());	
			    	
					int pwFailCnt =0;
					
					
					if(! enUsrPw.equals( rtnLoginVO.getUsrPw() ) ){
						
						pwFailCnt = rtnLoginVO.getPwFailCnt();
						pwFailCnt += 1;
						
						if(pwFailCnt >=  MAX_WRONG_PASSWORD_LIMIT_COUNT){
							
							rtnLoginVO.setBlock("02"); 
							paramMap.put("blkLog", "비밀번호 입력 오류 횟수 초과");	
						}else{
							rtnLoginVO.setBlock("01"); 
						}
						
						rtnLoginVO.setPwFailCnt(pwFailCnt);
						rtnLoginVO.setLoginStatus(WRONG_PASSWORD);
					
					}else{

						
				    	String loginExprYN = cmm4000DAO.selectCmm4000LastLoginChk(rtnLoginVO);

						
						int limitDay = stm3003DAO.selectStm3003PwChangeDateCheck(paramMap);
						
						
						if( "Y".equals(loginExprYN) ){
							
							rtnLoginVO.setBlock("02");
							rtnLoginVO.setLoginStatus(NOT_USED_3_MONTHS);
							paramMap.put("blkLog", "시스템에 로그인하지 않은지 3개월 이상으로 차단");
						
						}else if( limitDay <= 0 ){	
							
							
							rtnLoginVO.setLoginStatus(PW_EXPORED);
							paramMap.put("blkLog", "비밀번호 사용기간 만료로 차단");
						}else {
							
							if("Y".equals( rtnLoginVO.getIniYn() ) && rtnLoginVO.getModMin() >= INITIAL_ACCOUNT_WAIT_MINUTE ){
								rtnLoginVO.setBlock("02"); 
								paramMap.put("blkLog", "비밀번호 초기화 재접속 대기시간 초과");
								rtnLoginVO.setLoginStatus(INITIAL_ACCOUNT_WAIT_MINUTE_AFTER);								
							}else{
								
								String nowUsrPw = EgovFileScrty.encryptPassword(rtnLoginVO.getUsrId(),rtnLoginVO.getUsrId());
								
								
								if(nowUsrPw.equals(rtnLoginVO.getUsrPw()) ){
									
									rtnLoginVO.setLoginStatus(INITIAL_PASSWORD_CHANGE);
								
								}else{
									pwFailCnt = 0;
									rtnLoginVO.setPwFailCnt(pwFailCnt);
									rtnLoginVO.setBlock("01"); 
									rtnLoginVO.setLoginStatus(LOGIN_SUCCESS);
								}
							}
						}
					}
					
					
					if(rtnLoginVO.getLoginStatus() != INITIAL_PASSWORD_CHANGE){
						
						rtnLoginVO.setModifyUsrId(rtnLoginVO.getUsrId());
						rtnLoginVO.setModifyUsrIp(loginVO.getModifyUsrIp());
						
						
						if("02".equals( rtnLoginVO.getBlock()) ){
							paramMap.put("regUsrId", rtnLoginVO.getUsrId());
							paramMap.put("regUsrIp", loginVO.getModifyUsrIp());
							
							stm3000DAO.insertStm3002BlockLog(paramMap);				  
						}
						
						cmm4000DAO.updateCmm4000LoginCnt(rtnLoginVO);
					}
				}
			}else{
				rtnLoginVO.setLoginStatus(NO_USE_USER);
			}
		}


		return rtnLoginVO;
	}

	
	public LicVO selectCmm4000LicInfo(LoginVO loginVO) throws Exception{
		return cmm4000DAO.selectCmm4000LicInfo(loginVO);
	}

	
	@SuppressWarnings("rawtypes")
	public Map selectCmm4000PrjChk(LoginVO loginVO) throws Exception{
		return cmm4000DAO.selectCmm4000PrjChk(loginVO);
	}

	
	@SuppressWarnings("rawtypes")
	public List selectCmm4000UsrPrjAuthList(Map prjMap) throws Exception{
		return (List) cmm4000DAO.selectCmm4000UsrPrjAuthList(prjMap);
	}

	
	@SuppressWarnings("rawtypes")
	public List selectCmm4000UsrAuthList(Map paramMap) throws Exception{
		return (List) cmm4000DAO.selectCmm4000UsrAuthList(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectCmm4000MenuList(Map paramMap) throws Exception{
		return (List) cmm4000DAO.selectCmm4000MenuList(paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public String selectCmm4000NameEmailChk(Map paramMap) throws Exception {
		return cmm4000DAO.selectCmm4000NameEmailChk(paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public String selectCmm4000IdEmailChk(Map paramMap) throws Exception{
		return cmm4000DAO.selectCmm4000IdEmailChk(paramMap);
	}
	
	@SuppressWarnings("rawtypes")
	public void updateCmm4000NewPwe(Map paramMap) throws Exception{
		cmm4000DAO.updateCmm4000NewPw(paramMap);
	}

	
	@Override
	public void updateCmm4000RecentLoginDate(LoginVO loginVO) throws Exception {
		cmm4000DAO.updateCmm4000RecentLoginDate(loginVO);
	}

	@SuppressWarnings("rawtypes")
	@Override
	public List selectCmm4000LoginMainMenuList(Map paramMap) throws Exception {
		return cmm4000DAO.selectCmm4000LoginMainMenuList(paramMap);
	}

	
	@Override
	public String selectCmm4000RecentLoginDate(LoginVO loginVO) throws Exception{
		return cmm4000DAO.selectCmm4000RecentLoginDate(loginVO);
	}

	
	@Override
	public String updateCmm4000AccountInit(Map<String, String> param) throws Exception {
		
		String usrId 		= (String) param.get("usrId");
		String usrPw 		= (String) param.get("usrPw");
		
		String enUsrPw 	= EgovFileScrty.encryptPassword(usrPw, usrId);	
		
		param.put("enUsrPw", enUsrPw);
		param.put("iniYn", "N");
		if(stm3000DAO.updateStm3000AccountInit(param) > 0 ){
			
			
			param.put("logState", "U");
			param.put("pwChangeState", "Y");
			stm3003DAO.insertStm3003UserChangeLog(param);
			
			return enUsrPw;
		}
		return "";
	}
	
	
	@Override
	public String updateCmm4000PasswordExprInit(Map<String, String> param) throws Exception {

		String usrId 		= (String) param.get("usrId");
		String usrPw 		= (String) param.get("usrPw");
		
		String enUsrPw 	= EgovFileScrty.encryptPassword(usrPw, usrId);	
		
		
		param.put("enUsrPw", enUsrPw);
		param.put("block", "01");
		
		if(stm3000DAO.updateStm3000PasswordExprInit(param) > 0 ){
			
			
			param.put("logState", "U");
			param.put("pwChangeState", "Y");
			stm3003DAO.insertStm3003UserChangeLog(param);
			
			return enUsrPw;
		}
		return "";
	}
	
	
	@SuppressWarnings("rawtypes")
	@Override
	public Map selectCmm4000LoginUsrInfo(LoginVO loginVO) throws Exception {
		return cmm4000DAO.selectCmm4000LoginUsrInfo(loginVO);
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked"})
	public int selectCmm4000CurtPwChk(Map paramMap) throws Exception{
		
		String usrId = (String)paramMap.get("usrId");
		
		String usrPw = (String)paramMap.get("usrCurtPw");
		
		
		String enUsrPw 	= EgovFileScrty.encryptPassword(usrPw, usrId);	
		
		paramMap.put("usrCurtPw", enUsrPw);
		
		
		int pwChkVal = cmm4000DAO.selectCmm4000CurtPwChk(paramMap);
		
		return pwChkVal;
	}
}

