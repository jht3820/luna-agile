package kr.opensoftlab.lunaops.cmm.cmm4000.cmm4000.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.listener.SesssionEventListener;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cop.ems.service.EgovSndngMailService;
import egovframework.com.cop.ems.service.SndngMailVO;
import egovframework.com.utl.sim.service.EgovFileScrty;
import egovframework.rte.fdl.cmmn.trace.LeaveaTrace;
import egovframework.rte.fdl.property.EgovPropertyService;
import kr.opensoftlab.lunaops.cmm.cmm4000.cmm4000.service.Cmm4000Service;
import kr.opensoftlab.lunaops.cmm.cmm4000.cmm4000.service.impl.Cmm4000ServiceImpl;
import kr.opensoftlab.lunaops.cmm.cmm9000.cmm9000.service.Cmm9000Service;
import kr.opensoftlab.lunaops.com.vo.LicVO;
import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.lunaops.prj.prj1000.prj1000.service.Prj1000Service;
import kr.opensoftlab.lunaops.stm.stm3000.stm3003.service.Stm3003Service;
import kr.opensoftlab.lunaops.stm.stm5000.stm5000.service.Stm5000Service;
import kr.opensoftlab.sdf.util.ModuleUseCheck;
import kr.opensoftlab.sdf.util.RequestConvertor;



@Controller
public class Cmm4000Controller {

	
	private static final Logger Log = Logger.getLogger(Cmm4000Controller.class);
	
	
    @Resource(name = "cmm4000Service")
    private Cmm4000Service cmm4000Service;
    
    
    @Resource(name = "cmm9000Service")
    private Cmm9000Service cmm9000Service;
    
    
    @Resource(name = "stm5000Service")
    private Stm5000Service stm5000Service;
    
    
    @Resource(name = "stm3003Service")
    private Stm3003Service stm3003Service;
    
    
    @Resource(name = "prj1000Service")
    private Prj1000Service prj1000Service;
    
    
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	
	@Resource(name = "moduleUseCheck")
	private ModuleUseCheck moduleUseCheck;
	
	
	@Resource(name = "leaveaTrace")
	LeaveaTrace leaveaTrace;
	
	
	@Resource(name = "egovSndngMailService")
	private EgovSndngMailService egovSndngMailService;
	
	
	
	private static final int ReSendTime = Integer.parseInt(EgovProperties.getProperty("Globals.mail.reSend"));
	
	private static final int SessionTime = Integer.parseInt(EgovProperties.getProperty("Globals.mail.sessionTime"));
	
	private final static String SUCCESS = "01";
	
	private final static String FAIL  = "02";
	
    
    @RequestMapping(value="/cmm/cmm4000/cmm4000/selectCmm4000View.do")
    public String selectCmm4000View(Model model) throws Exception {
		model.addAttribute("joinCheck", EgovProperties.getProperty("Globals.lunaops.userJoin"));
    	return "/cmm/cmm4000/cmm4000/cmm4000";
    }
    	
	
	@RequestMapping(value="/cmm/cmm4000/cmm4000/selectCmm4000Logout.do")
	public String selectCmm4000Logout(HttpServletRequest request, HttpServletResponse response, ModelMap model)	throws Exception {
		try{
			
        	
        	
			
			LoginVO loginVO = (LoginVO) request.getSession().getAttribute("loginVO");
			
			
        	Map<String,String> logoutInfoMap = new HashMap<String,String>();
        	logoutInfoMap.put("licGrpId", loginVO.getLicGrpId());
        	logoutInfoMap.put("loginUsrId", loginVO.getUsrId());
        	stm5000Service.updateStm5000AuthLogoutLog(logoutInfoMap);
        	
        	
			request.getSession().invalidate();

			
    		model.addAttribute("logoutYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("cmm4000.success.logout"));
			model.addAttribute("joinCheck", EgovProperties.getProperty("Globals.lunaops.userJoin"));
        	return "/cmm/cmm4000/cmm4000/cmm4000";
        	
    	}catch(Exception ex){
    		Log.error("selectCmm4000Logout()", ex);
    		throw new Exception(ex.getMessage());
    	}
    }
    
    
	@RequestMapping(method=RequestMethod.POST, value="/cmm/cmm4000/cmm4000/selectCmm4000LoginAction.do")
	public String selectCmm4000LoginAction(@ModelAttribute("loginVO") LoginVO loginVO, HttpServletRequest request, HttpServletResponse response, ModelMap model)	throws Exception {
		
    	try{
    		
        	Map<String, String> param = RequestConvertor.requestParamToMap(request, true);
        	
        	    
    		if (Log.isDebugEnabled()) {
    			Log.debug("\n=====> parameter map : " + param);
    		}

    		
    		String strUsrIp = request.getRemoteAddr();
    		loginVO.setModifyUsrIp(strUsrIp);
    		
    		
    		LoginVO rtnLoginVO = null;
    		
    		
    		String ldapUse = EgovProperties.getProperty("Globals.lunaops.ldap");
    		if(ldapUse != null && "Y".equals(ldapUse)) {
    			
    			rtnLoginVO = cmm4000Service.selectCmm4000LdapLoginAction(loginVO);
    		}
    		else {
	    		
	    		if(param.get("initPassYn") != null 
	    				&& param.get("initPassYn").equals( "Y" )   ){
	    			cmm4000Service.updateCmm4000AccountInit(param);
	    			
	    		}
	    		
	    		rtnLoginVO = cmm4000Service.selectCmm4000LoginAction(loginVO);
    		}
    		
    		String duplicationLoginOption = EgovProperties.getProperty("Globals.lunaops.duplicationLoginOption");
    		
    		
    		if("Y".equals(duplicationLoginOption)){
    			if(param.get("loginSessionYn") != null && "Y".equals(param.get("loginSessionYn"))){
        			if(rtnLoginVO.getLoginStatus()==Cmm4000ServiceImpl.LOGIN_SUCCESS ){
        				rtnLoginVO.setLoginStatus(Cmm4000ServiceImpl.DUPULICATE_USER_LOGIN);
        			}
        		}
    		}

    		String returnPage="";
    		switch(rtnLoginVO.getLoginStatus()){
    			case Cmm4000ServiceImpl.LOGIN_SUCCESS :
    				request.getSession().setAttribute("loginVO", rtnLoginVO);
    				boolean isDuplicate = false;
    				SesssionEventListener listener = null;
    				String sessionId ="";
    				
    				if("Y".equals(duplicationLoginOption)){
    					listener = SesssionEventListener.getInstance();
    					sessionId = request.getSession().getId();
        	    		isDuplicate= listener.isDuplicateLogin(sessionId, loginVO.getUsrId());
    				}
    				
    	    		if(isDuplicate){
    	    			model.addAttribute("loginSessionYn", "Y");
    	    			model.addAttribute("usrId", param.get("usrId"));    	    			
    	    			model.addAttribute("usrPw", param.get("usrPw"));
                		model.addAttribute("message", egovMessageSource.getMessage("common.sessionclose.msg"));
    	    			returnPage ="/cmm/cmm4000/cmm4000/cmm4000";
    	    		}else{
    	    			
    	    			returnPage = insertStm5000AuthLoginLog(rtnLoginVO, request, SUCCESS);
                    	
    	    			rtnLoginVO.setModifyUsrId(rtnLoginVO.getUsrId());
    					rtnLoginVO.setModifyUsrIp(loginVO.getModifyUsrIp());		
    	    		}
                	
    				break;
    			case Cmm4000ServiceImpl.NO_SEARCH_ID :
    				model.addAttribute("loginYn", "N");
    				model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
    				returnPage ="/cmm/cmm4000/cmm4000/cmm4000";
    				break;
    			case Cmm4000ServiceImpl.ACCOUNT_LOCK :
    				model.addAttribute("loginYn", "N");
            		model.addAttribute("message", egovMessageSource.getMessage("fail.common.accountLock"));
            		insertStm5000AuthLoginLog(rtnLoginVO, request, FAIL);
    				returnPage ="/cmm/cmm4000/cmm4000/cmm4000";
    				break;
    			case Cmm4000ServiceImpl.WRONG_PASSWORD :
    				model.addAttribute("loginYn", "N");
    				
    				Object[] params = new Object[2];
    				params[0] = rtnLoginVO.getPwFailCnt();
    				params[1] = Cmm4000ServiceImpl.MAX_WRONG_PASSWORD_LIMIT_COUNT;
    				model.addAttribute("message", egovMessageSource.getMessage("fail.common.login"));
            		insertStm5000AuthLoginLog(rtnLoginVO, request, FAIL);
    				returnPage ="/cmm/cmm4000/cmm4000/cmm4000";
    				break;
    			case Cmm4000ServiceImpl.NO_USE_USER :
    				
    				model.addAttribute("loginYn", "N");
            		model.addAttribute("message", egovMessageSource.getMessage("fail.common.usecd"));
            		insertStm5000AuthLoginLog(rtnLoginVO, request, FAIL);
    				returnPage ="/cmm/cmm4000/cmm4000/cmm4000";
    				break; 
    			case Cmm4000ServiceImpl.NOT_USED_3_MONTHS :
    				
    				model.addAttribute("loginYn", "N");
            		model.addAttribute("message", egovMessageSource.getMessage("fail.common.notUsed3Month"));
            		insertStm5000AuthLoginLog(rtnLoginVO, request, FAIL);
    				returnPage ="/cmm/cmm4000/cmm4000/cmm4000";
    				break;
    			case Cmm4000ServiceImpl.PW_EXPORED :
    				
    				model.addAttribute("loginYn", "N");
    				model.addAttribute("usrId", rtnLoginVO.getUsrId());
    				model.addAttribute("licGrpId", rtnLoginVO.getLicGrpId());
    				model.addAttribute("exprYn", "Y");
            		model.addAttribute("message", egovMessageSource.getMessage("fail.common.pwExpired"));
            		insertStm5000AuthLoginLog(rtnLoginVO, request, FAIL);
    				returnPage ="/cmm/cmm4000/cmm4000/cmm4000";
    				break; 		
    			case Cmm4000ServiceImpl.DUPULICATE_USER_LOGIN:
    				listener = SesssionEventListener.getInstance();
    	    		sessionId = request.getSession().getId();
    	    		isDuplicate= listener.closeDuplicateSession(sessionId, loginVO.getUsrId());
    				returnPage = insertStm5000AuthLoginLog(rtnLoginVO, request, SUCCESS);
    				break;
    			case Cmm4000ServiceImpl.INITIAL_ACCOUNT_WAIT_MINUTE_AFTER:
    				model.addAttribute("loginYn", "N");
    				Object[] initparams = new Object[1];
    				initparams[0] = Cmm4000ServiceImpl.INITIAL_ACCOUNT_WAIT_MINUTE;
            		model.addAttribute("message", egovMessageSource.getMessage("fail.common.initimeblock",initparams));
            		insertStm5000AuthLoginLog(rtnLoginVO, request, FAIL);
            		returnPage ="/cmm/cmm4000/cmm4000/cmm4000";
    				break;
    			case Cmm4000ServiceImpl.INITIAL_PASSWORD_CHANGE :
    				model.addAttribute("usrId", rtnLoginVO.getUsrId());
    				model.addAttribute("licGrpId", rtnLoginVO.getLicGrpId());
    				model.addAttribute("iniYn", "Y");
    				returnPage ="/cmm/cmm4000/cmm4000/cmm4000";
    				break;
    			default :
    				
    				break;
    		}
    		
    		return returnPage;
    	}catch(Exception ex){
    		Log.error("selectCmm4000LoginAction()", ex);
    		throw new Exception(ex.getMessage());
    	}
	}
	
	
	public String insertStm5000AuthLoginLog( LoginVO loginVO ,HttpServletRequest request ,String loginStatus) throws Exception{
		
		Map<String,String> loginInfoMap = new HashMap<String,String>();
		loginInfoMap.put("licGrpId", loginVO.getLicGrpId());
		loginInfoMap.put("loginUsrId", loginVO.getUsrId());
		loginInfoMap.put("loginIp", request.getRemoteAddr());
		loginInfoMap.put("loginStatus", loginStatus);
    	
    	stm5000Service.insertStm5000AuthLoginLog(loginInfoMap);
    	return "forward:/cmm/cmm4000/cmm4000/selectCmm4000LoginAfter.do";
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/cmm/cmm4000/cmm4000/selectCmm4000LoginAfter.do")
	public String selectCmm4000LoginAfter(ModelMap model, HttpServletRequest request, HttpServletResponse response)	throws Exception {
		
    	try{
    		
    		boolean isActLic = false;
    		
    		
    		boolean isPrj = false;
    		
    		    		
    		HttpSession ss = request.getSession();
    		LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
   	
   
    		
    		isActLic = cmm4000LicChk(request, response, loginVO);
    		
    		
    		isPrj = cmm4000PrjChk(request, response, loginVO);
    		
    		
    		
    		if(isActLic){
    			if(!isPrj){
    				
        			model.addAttribute("isPrjYn", "N");
        			
        			
        			
        			if( (loginVO.getUsrId() + "_GRP").equals(loginVO.getLicGrpId()) ) {
        				
        				Map<String,String> param = new HashMap<String,String>();
        				param.put("licGrpId",(String)loginVO.getLicGrpId());
        				List<Map> prjGrpList = prj1000Service.selectPrj1000PrjGrpExistCheck(param);
        				
        				String type = "group";
        				
        				if(prjGrpList != null && prjGrpList.size() > 0){
        					type = "project";
        				}
        				
        				model.addAttribute("message", egovMessageSource.getMessage("fail.common.noprjpo"));
        				model.addAttribute("type", type);
        				return "/prj/prj1000/prj1000/prj1002";
        			}
        			
        			
        			else{
        				ss.invalidate();
        				model.addAttribute("message", egovMessageSource.getMessage("fail.common.noprj"));
        				return "/cmm/cmm4000/cmm4000/cmm4000";
        			}
    			}
    		}else{
    			
    			model.addAttribute("isActLicYn", "N");
    			model.addAttribute("message", egovMessageSource.getMessage("fail.common.licend"));
    			
    			
    			return "/adm/adm3000/adm3000/adm3000";
    		}
    		
    		
    		Map paramMap = new HashMap<String, String>();
    		paramMap.put("usrId", loginVO.getUsrId());
    		paramMap.put("licGrpId", loginVO.getLicGrpId());
    		
    		
    		String recentLogin = cmm4000Service.selectCmm4000RecentLoginDate(loginVO);
    		
    		
    		cmm4000Service.updateCmm4000RecentLoginDate(loginVO);
    		
    		
    		Map loginUsrInfo = cmm4000Service.selectCmm4000LoginUsrInfo(loginVO);
    		
    		
    		int limitDay = 999;
    		
    		
    		String ldapUse = EgovProperties.getProperty("Globals.lunaops.ldap");
    		
    		if(ldapUse == null || "N".equals(ldapUse)) {
    			
    			limitDay = stm3003Service.selectStm3003PwChangeDateCheck(paramMap);
    		}
    		
    		
    		
    		List<Map> prjList = (List)prj1000Service.selectPrj1000PrjGrpAllList(paramMap);

    		
    		boolean prjChk = false;
    		for(Map prjInfo : prjList){
    			if("02".equals(String.valueOf(prjInfo.get("prjTypeCd")))){
    				prjChk = true;
    				break;
    			}
    		}
    		
    		
    		if(!prjChk){
    			ss.invalidate();
    			
    			
    			model.addAttribute("isPrjYn", "N");
				model.addAttribute("message", egovMessageSource.getMessage("fail.common.noaddprj"));
				return "/cmm/cmm4000/cmm4000/cmm4000";
    		}
    		
    		List<Map> authList = getAuthGroupList( loginVO,  prjList ,  ss) ;
    		String prjId = (String)authList.get(0).get("prjId");
    		String authGrpId = (String)authList.get(0).get("authGrpId");
    		String usrTyp = (String)authList.get(0).get("usrTyp");
    		
    		
    		paramMap.put("prjId", prjId);
    		paramMap.put("authGrpId", authGrpId);
    		paramMap.put("adminYn", loginVO.getAdmYn());
    		
    		
    		ss.setAttribute("prjList", prjList);
    		ss.setAttribute("authList", authList);
    		
    		
    		ss.setAttribute("selAuthGrpId", authGrpId);
    		
    		ss.setAttribute("usrTyp", usrTyp);
    		
    		
    		ss.setAttribute("recentLogin", recentLogin);
    		
    		
    		ss.setAttribute("loginUsrInfo", loginUsrInfo);
    		
    		
    		ss.setAttribute("limitDay", limitDay);

    		
    		
    		String strRsltUrl = getLoginAfterMainURL( paramMap ,  ss) ;
    		
    		
        	ss.setAttribute("selMainUrl", strRsltUrl);
    		String returnPage ="redirect:"+strRsltUrl;
    		   
        	return returnPage;
        	
    	}catch(Exception ex){
    		Log.error("selectCmm4000LoginAction()", ex);
    		throw new Exception(ex.getMessage());
    	}
	}
	
	
	@SuppressWarnings("rawtypes")
	public String getLoginAfterMainURL(Map paramMap , HttpSession ss) throws Exception{
		List mainMenuList = cmm4000Service.selectCmm4000LoginMainMenuList(paramMap);
		String strRsltUrl = "";
		String strMenuId = "";
		String strMenuNm = "";
		String strUpMenuNm = "";
		String strUpupMenuNm = "";
		
		if(mainMenuList.size()>1){
			strRsltUrl=(String) ((Map)mainMenuList.get(1)).get("menuUrl");
			strMenuId=(String) ((Map)mainMenuList.get(1)).get("menuId");
			strMenuNm=(String) ((Map)mainMenuList.get(1)).get("menuNm");
			strUpMenuNm=(String) ((Map)mainMenuList.get(1)).get("upMenuNm");
			strUpupMenuNm=(String) ((Map)mainMenuList.get(1)).get("upupMenuNm");
			
			
			ss.setAttribute("selMenuId",strMenuId);
    		ss.setAttribute("selMenuNm", strMenuNm);
    		ss.setAttribute("strUpMenuNm", strUpMenuNm);
    		ss.setAttribute("strUpupMenuNm", strUpupMenuNm);
    		ss.setAttribute("selMenuUrl", strRsltUrl);
    		
    		ss.setAttribute("firstMenuNm", strMenuNm);
    		
		}else{
			strRsltUrl=(String) ((Map)mainMenuList.get(0)).get("menuUrl");
			strMenuId=(String) ((Map)mainMenuList.get(0)).get("menuId");
			strMenuNm=(String) ((Map)mainMenuList.get(0)).get("menuNm");
			strUpMenuNm=(String) ((Map)mainMenuList.get(0)).get("upMenuNm");
			strUpupMenuNm=(String) ((Map)mainMenuList.get(0)).get("upupMenuNm");
			ss.setAttribute("selMenuId",strMenuId);
	    	ss.setAttribute("selMenuNm", strMenuNm);	
	    	ss.setAttribute("strUpMenuNm", strUpMenuNm);
    		ss.setAttribute("strUpupMenuNm", strUpupMenuNm);
	    	ss.setAttribute("selMenuUrl", strRsltUrl);
	    		
	    	
	    	ss.setAttribute("firstMenuNm", strMenuNm);
		}
		return strRsltUrl;
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map> getAuthGroupList(LoginVO loginVO, List<Map> prjList , HttpSession ss) throws Exception{

		
		Map fstPrjMap = null;
		
		
		for(Map<String,String> prjInfo : prjList){
			
			String prjGrpCd = prjInfo.get("prjGrpCd");
			String prjId = prjInfo.get("prjId");
			if( loginVO.getPrjId() == null || loginVO.getPrjId().equals("") ){
				if(prjGrpCd != null && "02".equals(prjGrpCd)){
    				fstPrjMap = prjInfo;
    				break;
    			}
			}else{
				if(loginVO.getPrjId().equals(prjId)){
					fstPrjMap = prjInfo;
    				break;
				}
			}		
				
			
			
		}
		
		
		
		List<Map> authList = (List) cmm4000Service.selectCmm4000UsrPrjAuthList(fstPrjMap);
		
		ss.setAttribute("selPrjId", fstPrjMap.get("prjId"));
		ss.setAttribute("selPrjGrpId", fstPrjMap.get("prjGrpId"));
		
		return authList;
		
	}
	
	
	public boolean cmm4000LicChk(HttpServletRequest request, HttpServletResponse response, LoginVO loginVO)	throws Exception {
		
    	try{
    		
    		
    		LicVO licVO = cmm4000Service.selectCmm4000LicInfo(loginVO);
    		
    		
    		if(licVO != null){
    			request.getSession().setAttribute("licVO", licVO);
    			return true;
    		}
    		
    		else{
    			return false;
    		}
        	
    	}catch(Exception ex){
    		Log.error("cmm4000LicChk()", ex);
    		throw new Exception(ex.getMessage());
    	}
	}
	
	
	@SuppressWarnings("rawtypes")
	public boolean cmm4000PrjChk(HttpServletRequest request, HttpServletResponse response, LoginVO loginVO)	throws Exception {
		
    	try{
    		
    		Map prjMap = cmm4000Service.selectCmm4000PrjChk(loginVO);
    		
    		
    		if("Y".equals(prjMap.get("isPrjYn"))){
    			return true;
    		}
    		else{
    			return false;
    		}
    		
    	}catch(Exception ex){
    		Log.error("cmm4000PrjChk()", ex);
    		throw new Exception(ex.getMessage());
    	}
	}
	
	
	@RequestMapping(value="/cmm/cmm4000/cmm4001/selectCmm4001View.do")
	public String selectCmm4001View() throws Exception {
		
		return "/cmm/cmm4000/cmm4000/cmm4001";
	}
    
	@RequestMapping(value = "/cmm/cmm4000/cmm4001/selectCmm4001MailSend.do", produces="text/plain;charset=UTF-8")
	  public ModelAndView selectCmm4001MailSend (HttpServletRequest request, ModelMap model) throws Exception   {

		
		HashMap<String, String> map = new HashMap<String, String>();
		try{
			
			Map<String, String> param = RequestConvertor.requestParamToMap(request, true);

			    
			if (Log.isDebugEnabled()) {
				Log.debug("\n=====> parameter map : " + param);
			}
			
			
			String UsrInNm = param.get("InNm");
			String UsrInEmail = param.get("InEmail");
			
			
			if(UsrInNm == null) {
				map.put("nmChk", "N");
				
				return new ModelAndView("jsonView", map);
			}
			
			else if(UsrInEmail == null) {
				map.put("emailChk", "N");
				
				return new ModelAndView("jsonView", map);
			}
			
			
			Map<String, String> paramMap = new HashMap<String, String>();
			paramMap.put("usrNm", UsrInNm);
			paramMap.put("email", UsrInEmail);

			
			String returnId = (String) cmm4000Service.selectCmm4000NameEmailChk(paramMap);
			
			
			if(returnId == null) {
				
				map.put("dbChk", "N");
				
				return new ModelAndView("jsonView", map);
			}			
			
			map.put("nmChk", "Y");
			map.put("emailChk", "Y");

			
			map.put("emailSend","");
			map.put("emailSendTime", "N");

			
			if(request.getSession() != null && request.getSession().getAttribute("EmailAuthTime") != null) {
				
				Long unixtimeTemp = (Long)request.getSession().getAttribute("EmailAuthTime");

				
				Long systemTimeTemp = System.currentTimeMillis() / 1000;

				
				if(unixtimeTemp != null && ((unixtimeTemp+ReSendTime) > systemTimeTemp)) {
					
					map.put("emailSendTime",""+((unixtimeTemp+ReSendTime)-systemTimeTemp));
					
					return new ModelAndView("jsonView", map);
				}
			}

			
			StringBuffer buf =new StringBuffer();
			
			buf = randomAuthNumber(10);
			System.out.println(buf);
			
			String enUsrCode = EgovFileScrty.encryptPassword(buf.toString(), "Search");
			
			
			SndngMailVO mailVO = new SndngMailVO();
			mailVO.setDsptchPerson("admin@opensoftlab.kr");		
			mailVO.setRecptnPerson(UsrInEmail);					
			mailVO.setSj(egovMessageSource.getMessage("cmm4000.success.emailTitleId.send"));	
			mailVO.setEmailCn(
					egovMessageSource.getMessage("cmm4000.success.emailContentsId.send")
					+buf
					);
			
			
			boolean sendingMailResult = egovSndngMailService.sndngMail(mailVO);
			if(sendingMailResult){
				
				map.put("emailSend", egovMessageSource.getMessage("cmm3200.success.emailAuthNum.send"));
			}else{
				
				map.put("emailSend", egovMessageSource.getMessage("cmm3200.fail.emailAuthNum.send"));
			}
			 
			
			
			request.getSession().setAttribute("EmailAuthValue", enUsrCode);
			
			
			request.getSession().setAttribute("EmailAuthTime", System.currentTimeMillis() / 1000);
		
			
			request.getSession().setMaxInactiveInterval(SessionTime*60);
			
		}catch(Exception e){
			Log.error("selectCmm4001MailSend", e);
			return new ModelAndView("jsonView", map);
		}
		
		return new ModelAndView("jsonView", map);
    }
	
	
	@RequestMapping(value = "/cmm/cmm4000/cmm4001/selectCmm4001ChkAction.do", produces="text/plain;charset=UTF-8")
	  public ModelAndView selectCmm4001ChkAction (HttpServletRequest request, ModelMap model) throws Exception   {

		
		HashMap<String, String> map = new HashMap<String, String>();
		try{

			
			Map<String, String> param = RequestConvertor.requestParamToMap(request, true);

			    
			if (Log.isDebugEnabled()) {
				Log.debug("\n=====> parameter map : " + param);
			}

			
			String UsrInNm = param.get("InNm");
			String UsrInEmail = param.get("InEmail");
			String UsrInAuthNum = param.get("idAuthSucc");
			
			
			if(UsrInNm == null) {
				map.put("nmChk", "N");

				return new ModelAndView("jsonView", map);
			}
			
			else if(UsrInEmail == null) {
				map.put("emailChk", "N");

				return new ModelAndView("jsonView", map);
			}
			
			else if( UsrInAuthNum == null) {
				map.put("authNum", "N");

				return new ModelAndView("jsonView", map);
			}

			
			Map<String, String> paramMap = new HashMap<String, String>();
			paramMap.put("usrNm", UsrInNm);
			paramMap.put("email", UsrInEmail);

			
			String returnId = (String) cmm4000Service.selectCmm4000NameEmailChk(paramMap);
			
			
			if(returnId == null) {
				
				map.put("dbChk", "N");
				
				return new ModelAndView("jsonView", map);
			}
			
			if(request.getSession() != null && request.getSession().getAttribute("EmailAuthValue") != null){
				map.put("authNum", "Y");

				
				String enUsrInAN = EgovFileScrty.encryptPassword(UsrInAuthNum.toString(), "Search");

				
				String enSessionAuthNum = (String)request.getSession().getAttribute("EmailAuthValue");
				if(enSessionAuthNum != null){
					
					
					if(enUsrInAN.equals(enSessionAuthNum)){
						
						map.put("succId", returnId);
						
						
						request.getSession().removeAttribute("EmailAuthValue");
						request.getSession().removeAttribute("EmailAuthTime");
					}else{
						
						map.put("authNum", "N");
						
						return new ModelAndView("jsonView", map);
					}
				}
			}else{
				
				map.put("authNum", "N");
				
				return new ModelAndView("jsonView", map);
			}
		}catch(Exception e){
			Log.error("selectCmm4001ChkAction", e);
			return new ModelAndView("jsonView", map);
		}
		return new ModelAndView("jsonView", map);
	}
	
	
	@RequestMapping(value = "/cmm/cmm4000/cmm4001/selectCmm4001PwMailSend.do", produces="text/plain;charset=UTF-8")
	  public ModelAndView selectCmm4001PwMailSend (HttpServletRequest request, ModelMap model) throws Exception   {

		
		HashMap<String, String> map = new HashMap<String, String>();
		try{
			
			Map<String, String> param = RequestConvertor.requestParamToMap(request, true);

			    
			if (Log.isDebugEnabled()) {
				Log.debug("\n=====> parameter map : " + param);
			}
			
			
			String UsrInId = param.get("InId");
			String UsrInEmail = param.get("InEmail");
			
			
			if(UsrInId == null) {
				map.put("idChk", "N");
				
				return new ModelAndView("jsonView", map);
			}
			
			else if(UsrInEmail == null) {
				map.put("emailChk", "N");
				
				return new ModelAndView("jsonView", map);
			}
			
			
			Map<String, String> paramMap = new HashMap<String, String>();
			paramMap.put("usrId", UsrInId);
			paramMap.put("email", UsrInEmail);

			
			String returnUse = (String) cmm4000Service.selectCmm4000IdEmailChk(paramMap);
			
			
			if(!"01".equals(returnUse)) {
				
				map.put("dbChk", "N");
				
				return new ModelAndView("jsonView", map);
			}

			
			map.put("idChk", "Y");
			map.put("emailChk", "Y");


			
			map.put("pwEmailSend","");
			map.put("pwEmailSendTime", "N");

			
			if(request.getSession() != null && request.getSession().getAttribute("PwEmailAuthTime") != null) {
				
				Long unixtimeTemp = (Long)request.getSession().getAttribute("PwEmailAuthTime");

				
				Long systemTimeTemp = System.currentTimeMillis() / 1000;

				
				if(unixtimeTemp != null && ((unixtimeTemp+ReSendTime) > systemTimeTemp)) {
					
					map.put("pwEmailSendTime",""+((unixtimeTemp+ReSendTime)-systemTimeTemp));
					
					return new ModelAndView("jsonView", map);
				}
			}
			
			StringBuffer buf =new StringBuffer();
			
			buf = randomAuthNumber(12);
			System.out.println(buf);
			
			String enUsrCode = EgovFileScrty.encryptPassword(buf.toString(), "PwSearch");
			
			
			SndngMailVO mailVO = new SndngMailVO();
			mailVO.setDsptchPerson("admin@opensoftlab.kr");		
			mailVO.setRecptnPerson(UsrInEmail);					
			mailVO.setSj(egovMessageSource.getMessage("cmm4000.success.emailTitlePw.send"));	
			mailVO.setEmailCn(
					egovMessageSource.getMessage("cmm4000.success.emailContentsPw.send")
					+buf
					);
			
			
			boolean sendingMailResult = egovSndngMailService.sndngMail(mailVO);
			if(sendingMailResult){
				
				map.put("pwEmailSend", egovMessageSource.getMessage("cmm3200.success.emailAuthNum.send"));
			}else{
				
				map.put("pwEmailSend", egovMessageSource.getMessage("cmm3200.fail.emailAuthNum.send"));
			}		

			
			
			request.getSession().setAttribute("PwEmailAuthValue", enUsrCode);
			
			
			request.getSession().setAttribute("PwEmailAuthTime", System.currentTimeMillis() / 1000);
		
			
			request.getSession().setMaxInactiveInterval(SessionTime*60);
			
		}catch(Exception e){
			Log.error("selectCmm4001PwMailSend", e);
			return new ModelAndView("jsonView", map);
		}
		
		return new ModelAndView("jsonView", map);
    }
	
	
	@RequestMapping(value = "/cmm/cmm4000/cmm4001/selectCmm4001PwChkAction.do", produces="text/plain;charset=UTF-8")
	  public ModelAndView selectCmm4001PwChkAction (HttpServletRequest request, ModelMap model) throws Exception   {

		
		HashMap<String, String> map = new HashMap<String, String>();
		try{

			
			Map<String, String> param = RequestConvertor.requestParamToMap(request, true);

			    
			if (Log.isDebugEnabled()) {
				Log.debug("\n=====> parameter map : " + param);
			}

			
			String UsrInId = param.get("InId");
			String UsrInEmail = param.get("InEmail");
			String UsrInAuthNum = param.get("idAuthSucc");
			
			
			if(UsrInId == null) {
				map.put("idChk", "N");

				return new ModelAndView("jsonView", map);
			}
			
			else if(UsrInEmail == null) {
				map.put("emailChk", "N");

				return new ModelAndView("jsonView", map);
			}
			
			else if( UsrInAuthNum == null) {
				map.put("authNum", "N");

				return new ModelAndView("jsonView", map);
			}

			
			Map<String, String> paramMap = new HashMap<String, String>();
			paramMap.put("usrId", UsrInId);
			paramMap.put("email", UsrInEmail);

			
			String returnUse = (String) cmm4000Service.selectCmm4000IdEmailChk(paramMap);
			
			
			if(!"01".equals(returnUse)) {
				
				map.put("dbChk", "N");
				
				return new ModelAndView("jsonView", map);
			}

			
			map.put("idChk", "Y");
			map.put("emailChk", "Y");

			
			if(request.getSession() != null && request.getSession().getAttribute("PwEmailAuthValue") != null){
				map.put("authNum", "Y");

				
				String enUsrInAN = EgovFileScrty.encryptPassword(UsrInAuthNum.toString(), "PwSearch");

				
				String enSessionAuthNum = (String)request.getSession().getAttribute("PwEmailAuthValue");
				if(enSessionAuthNum != null){
					
					
					if(enUsrInAN.equals(enSessionAuthNum)){
						
						
						StringBuffer buf =new StringBuffer();
						
						buf = randomAuthNumber(8);
						
						String enSuccCode = EgovFileScrty.encryptPassword(buf.toString(), "SuccCode");
						
						
						map.put("succCode", enSuccCode);
						
						
						request.getSession().setAttribute("PwSuccCode", enSuccCode);
						
						request.getSession().setAttribute("PwSuccId", UsrInId);
						
						
						request.getSession().removeAttribute("PwEmailAuthValue");
						request.getSession().removeAttribute("PwEmailAuthTime");
					}else{
						
						map.put("authNum", "N");
						
						return new ModelAndView("jsonView", map);
					}
				}
			}else{
				
				map.put("authNum", "N");
				
				return new ModelAndView("jsonView", map);
			}
		}catch(Exception e){
			Log.error("selectCmm4001PwChkAction", e);
			return new ModelAndView("jsonView", map);
		}
		return new ModelAndView("jsonView", map);
	}
	
	@RequestMapping(value = "/cmm/cmm4000/cmm4001/selectCmm4001PwNewAction.do", produces="text/plain;charset=UTF-8")
	public ModelAndView selectCmm4001PwNewAction (HttpServletRequest request, ModelMap model) throws Exception   {

		
		HashMap<String, String> map = new HashMap<String, String>();
		try{

			
			Map<String, String> param = RequestConvertor.requestParamToMap(request, true);

			    
			if (Log.isDebugEnabled()) {
				Log.debug("\n=====> parameter map : " + param);
			}

			
			String UsrInAuthCode = param.get("InAuthCode");	
			String UsrInNewPw = param.get("InNewPw");		
			String UsrInNewPw2 = param.get("InNewPw2");		
			
			
			if(UsrInAuthCode == null) {
				map.put("codeChk", "N");

				return new ModelAndView("jsonView", map);
			}
			
			else if(!UsrInNewPw.equals(UsrInNewPw2)) {
				map.put("bothPwChk", "N");

				return new ModelAndView("jsonView", map);
			}
			
			String enSessionAuthCode = (String)request.getSession().getAttribute("PwSuccCode");
			
			String PwSuccId = (String)request.getSession().getAttribute("PwSuccId");
			
			
			if(!UsrInAuthCode.equals(enSessionAuthCode)){
				map.put("bothCodeChk", "N");
				
				return new ModelAndView("jsonView", map);
			}
			
			
			
			String enUsrPw = EgovFileScrty.encryptPassword(UsrInNewPw, PwSuccId);
			
			
			Map<String, String> paramMap = new HashMap<String, String>();
			paramMap.put("newPwIn", enUsrPw);
			paramMap.put("usrId", PwSuccId);
			
			
			cmm4000Service.updateCmm4000NewPwe(paramMap);
			
			map.put("allChk", "Y");
			
			
			request.getSession().removeAttribute("PwSuccCode");
			request.getSession().removeAttribute("PwSuccId");
			
		}catch(Exception e){
			Log.error("selectCmm4001PwNewAction", e);
			map.put("allChk", "N");
			
			return new ModelAndView("jsonView", map);
		}
		return new ModelAndView("jsonView", map);
	}
	
	private StringBuffer randomAuthNumber(int MaxNum) throws Exception   {
		
		if(MaxNum < 0 && MaxNum > 30){
			MaxNum = 10;
		}
		Random rand =new Random();
		StringBuffer buf =new StringBuffer();
		
		
		for(int i=0;i<MaxNum;i++){
			
			if(rand.nextBoolean()){
				
				
				buf.append((char)((int)(rand.nextInt(26))+97));
			}else{
				
				
				buf.append((rand.nextInt(10))); 
			}
		}
		return buf;
	}
	
	
	
	
	@RequestMapping(value="/cmm/cmm4000/cmm4002/selectCmm4002View.do")
	public String selectCmm4002View() throws Exception {
		
		return "/cmm/cmm4000/cmm4000/cmm4002";
	}
	
	
	@RequestMapping(value="/cmm/cmm4000/cmm4000/selectCmm4000BeforeUsedPwChkAjax.do")
	public ModelAndView selectCmm4000BeforeUsedPwChkAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model)	throws Exception {
		try{
			
        	Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);	
        	
        	
        	String isUsedPw = stm3003Service.selectStm3003BeforeUsedPwCheck(paramMap);
        	
        	
        	model.addAttribute("isUsedPw", isUsedPw);
        	
        	
        	model.addAttribute("successYn", "Y");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        	
        	return new ModelAndView("jsonView");
        	
		}catch(Exception e){
			Log.error("selectCmm4000BeforeUsedPwChkAjax()", e);
			
    		model.addAttribute("successYn", "N");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		
    		return new ModelAndView("jsonView");
		}
    }
	
	
	@RequestMapping(value="/cmm/cmm4000/cmm4000/selectCmm4000ExprPwReset.do")
	public ModelAndView selectCmm4000ExprPwReset(HttpServletRequest request, HttpServletResponse response, ModelMap model)	throws Exception {
		try{
			
			Map<String, String> param = RequestConvertor.requestParamToMap(request, true);
			
			String pwChkVal = "Y";
			
			
			int chkVal = cmm4000Service.selectCmm4000CurtPwChk(param);

			
			if(chkVal < 1){
				pwChkVal = "N";
	    		model.addAttribute("pwChkVal", pwChkVal);
	    		return new ModelAndView("jsonView", model);
			}
    			
			
    		cmm4000Service.updateCmm4000PasswordExprInit(param);
    		
    		model.addAttribute("pwChkVal", pwChkVal);
			return new ModelAndView("jsonView", model);
        	
    	}catch(Exception ex){
    		Log.error("selectCmm4000ExprPwReset()", ex);
    		throw new Exception(ex.getMessage());
    	}
    }
}
