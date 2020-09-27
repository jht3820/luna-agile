package kr.opensoftlab.lunaops.usr.usr1000.usr1000.web;


import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.utl.fcc.service.EgovStringUtil;
import egovframework.rte.fdl.cmmn.trace.LeaveaTrace;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import kr.opensoftlab.lunaops.com.exception.UserDefineException;
import kr.opensoftlab.lunaops.com.fms.web.service.FileMngService;
import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.lunaops.usr.usr1000.usr1000.service.Usr1000Service;
import kr.opensoftlab.sdf.util.RequestConvertor;



@Controller
public class Usr1000Controller {
	
	protected Logger Log = Logger.getLogger(this.getClass());
	
	
	@Resource(name = "usr1000Service")
	private Usr1000Service usr1000Service;
    
    
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	
   	@Resource(name="fileMngService")
   	private FileMngService fileMngService;
   	
	
	@Resource(name="EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;
	
	@Resource(name = "egovFileIdGnrService")
	private EgovIdGnrService idgenService;
	
	
	@Resource(name = "leaveaTrace")
	LeaveaTrace leaveaTrace;
	
	
	@RequestMapping(value="/usr/usr1000/usr1000/selectUsr1000View.do")
    public String selectUsr1000View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		try{
			
	    	Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
			
			
			String ldapUse = EgovProperties.getProperty("Globals.lunaops.ldap");
			model.addAttribute("ldapUse", ldapUse);
			model.put("usrId", paramMap.get("usrId"));
    		
    		return "/usr/usr1000/usr1000/usr1000";
		}
    	catch(Exception ex){
    		Log.error("selectUsr1000View()", ex);
    		throw new Exception(ex.getMessage());
    	}
    }
    
	
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/usr/usr1000/usr1000/selectUsr1000UsrInfoAjxa.do")
    public ModelAndView selectUsr1000UsrInfoAjxa(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	try{
    		
    		Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
    		
    		
    		Map usrInfoMap = usr1000Service.selectUsr1000UsrInfo(paramMap);
    		
    		
        	model.addAttribute("usrInfoMap", usrInfoMap);
        	
        	if(usrInfoMap != null) {
        		
        		String usrImgFileExist = "N"; 
        		
        		
        		FileVO fileVo = new FileVO();
        		fileVo.setAtchFileId((String)usrInfoMap.get("usrImgId"));
        		fileVo.setFileSn("0");
        		
        		
        		fileVo = fileMngService.selectFileInf(fileVo);
        		if(fileVo != null){
        			usrImgFileExist = "Y";
        		}
        		
        		
        		model.addAttribute("usrImgFileExist", usrImgFileExist);
        	}
        	
        	
        	model.addAttribute("errorYn", "N");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        	return new ModelAndView("jsonView");
    	}
    	catch(Exception ex){
    		Log.error("selectUsr1000UsrInfoAjxa()", ex);
    		
    		model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		return new ModelAndView("jsonView");
    	}
    }
    
	
	@RequestMapping(value="/usr/usr1000/usr1000/selectUsr1000emailChRepAjax.do")
    public ModelAndView selectUsr1000emailChRepAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);

			
			String usrEmail = paramMap.get("email");

			
			if( "".equals(EgovStringUtil.isNullToString(usrEmail)) ) {
				model.put("emailChkYn", "Y");
				model.addAttribute("message", egovMessageSource.getMessage("fail.required.email"));
				return new ModelAndView("jsonView");
			}
			
			
			int emaildChkCnt =  usr1000Service.selectUsr1000emailChRepAjax(paramMap);
			
			
			if( emaildChkCnt == 0) {
				
				model.put("emailChkYn", "N");
				model.addAttribute("message", egovMessageSource.getMessage("success.common.email"));
			}else{
				model.put("emailChkYn", "Y");
				model.addAttribute("message", egovMessageSource.getMessage("fail.common.email"));
			}
			
			return new ModelAndView("jsonView");
    	}
    	catch(Exception ex){
    		Log.error("selectUsr1000emailChRepAjax()", ex);
    		
    		model.put("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		return new ModelAndView("jsonView");
    	}
    }
    
    
	
	@RequestMapping(value="/usr/usr1000/usr1000/updateUsr1000UsrProfileAjax.do")
    public ModelAndView updateUsr1000UsrProfileAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	try{

    		MultipartHttpServletRequest mptRequest = (MultipartHttpServletRequest)request;
			
			
        	Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
    		
        	String orgEmail = paramMap.get("orgEmail"); 
    		String email = paramMap.get("email"); 
    		
    		
    		if(orgEmail != null && email != null && !orgEmail.equals(email)) {
    			
        		int emailChkCnt = usr1000Service.selectUsr1000emailChRepAjax(paramMap);
        		if(emailChkCnt > 0){
        			model.put("errorYn", "N");
        			model.addAttribute("message", egovMessageSource.getMessage("fail.common.email"));
        			return new ModelAndView("jsonView");
        		}
    		}
    		
    		
			String atchFileId = (String) paramMap.get("usrImgId");
			
			
			if(atchFileId == null || "".equals(atchFileId)) {
				String atchFileIdString = idgenService.getNextStringId();
				fileMngService.insertFileMasterInfo(atchFileIdString);
				paramMap.put("usrImgId",atchFileIdString);
			}
        	
			int updateCnt = usr1000Service.updateUsr1000UsrInfo(paramMap, mptRequest);
			
			if(updateCnt > 0){
    			LoginVO loginVO = usr1000Service.selectUsr1000LoginVO(paramMap);
    			request.getSession().setAttribute("loginVO", loginVO);
			}
			
        	
        	model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));
    		
        	return new ModelAndView("jsonView");
    	}
    	catch(UserDefineException ude) {
			Log.error("updateUsr1000UsrProfileAjax()", ude);

			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", ude);

			return new ModelAndView("jsonView");
		}
    	catch(Exception ex){
    		Log.error("updateUsr1000UsrProfileAjax()", ex);
    		
    		model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.update"));
    		
    		return new ModelAndView("jsonView");
    	}
    }
	
	
	@RequestMapping(value="/usr/usr1000/usr1000/selectUsr1001View.do")
    public String selectUsr1001View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	return "/usr/usr1000/usr1000/usr1001";
    }
	
	
	@RequestMapping(value="/usr/usr1000/usr1000/updateUsr1000PasswordChangeAjax.do")
    public ModelAndView updateUsr1000PasswordChangeAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
    	try{
    		
    		Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
    		
    		
    		Map<String,String> resultMap = usr1000Service.updateUsr1000PasswordChange(paramMap);
    		
    		
        	if("-1".equals(resultMap.get("code"))) {
        		model.addAttribute("checkYn", "Y");
        		model.addAttribute("message", resultMap.get("message")); 
        		return new ModelAndView("jsonView");
        	}
    		
        	
        	LoginVO loginVO = usr1000Service.selectUsr1000LoginVO(paramMap);
			request.getSession().setAttribute("loginVO", loginVO);
        	
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));
    			
        	return new ModelAndView("jsonView");
    	}
    	catch(Exception ex){
    		Log.error("updateUsr1000PasswordChangeAjax()", ex);
    		
    		
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("usr1000.fail.user.updatePw"));
    		
    		return new ModelAndView("jsonView");
    	}
    }
	
	
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/usr/usr1000/usr1000/selectUsr1002View.do")
    public String selectUsr1002View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
    	try {
    		
    		Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);

    		
    		Map etcInfo = usr1000Service.selectUsr1002(paramMap);
    		
    		
    		model.addAttribute("etcInfo", etcInfo);
    		
    		model.addAttribute("loginUsrId", paramMap.get("regUsrId"));
        	
        	return "/usr/usr1000/usr1000/usr1002";
        	
    	} catch(Exception ex) {
    		
    		Log.error("selectUsr1002View()", ex);
    		
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		throw new Exception(ex.getMessage());
    	}
    }
	
	
	
	@RequestMapping(value="/usr/usr1000/usr1000/updateUsr1002.do")
    public ModelAndView updateUsr1002(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
    	try{
    		
    		Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
    		
    		
    		int dCnt = usr1000Service.updateUsr1002(paramMap);
    		
    		
    		if( dCnt < 1 ){
    			
    			model.addAttribute("errorYn", "Y");
    			model.addAttribute("message", egovMessageSource.getMessage("fail.common.update"));
    			
    		} else {
    			
    			LoginVO loginVO = usr1000Service.selectUsr1000LoginVO(paramMap);;
    			request.getSession().setAttribute("loginVO", loginVO);
    			
    			model.addAttribute("errorYn", "N");
    			model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));
    		}
    		
        	return new ModelAndView("jsonView", model);
    	}
    	catch(Exception ex){
    		Log.error("updateUsr1002()", ex);
    		
    		
			model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.update"));
    		
    		return new ModelAndView("jsonView", model);
    	}
    }
	
}
