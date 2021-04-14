package kr.opensoftlab.lunaops.usr.usr1000.usr1100.web;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.rte.fdl.cmmn.trace.LeaveaTrace;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import kr.opensoftlab.lunaops.com.fms.web.service.FileMngService;
import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.lunaops.usr.usr1000.usr1100.service.Usr1100Service;
import kr.opensoftlab.sdf.util.RequestConvertor;



@Controller
public class Usr1100Controller {
	
	protected Logger Log = Logger.getLogger(this.getClass());
	
	
	@Resource(name = "usr1100Service")
	private Usr1100Service usr1100Service;
    
    
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
	
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/usr/usr1000/usr1100/selectUsr1100ShortcutInfoAjax.do")
    public ModelAndView selectUsr1100ShortcutInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			
			paramMap.put("usrId", loginVO.getUsrId());
			
			
			

			
			List<Map> usr1100List = usr1100Service.selectUsr1100ShortcutList(paramMap);
			model.addAttribute("shortcutInfo", usr1100List);
			
			
			model.addAttribute("errorYn", "N");
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectUsr1100ListView()", ex);
			
			model.addAttribute("errorYn", "Y");
			throw new Exception(ex.getMessage());
		}

    }
    
	
	@RequestMapping(value="/usr/usr1000/usr1100/saveUsr1100ShortcutAjax.do")
    public ModelAndView updateUsr1000PasswordChangeAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
    	try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			
			paramMap.put("usrId", loginVO.getUsrId());
			paramMap.put("regUsrId", loginVO.getUsrId());
			paramMap.put("modifyUsrId", loginVO.getUsrId());
			
			
			usr1100Service.saveUsr1100ShortcutInfo(paramMap);
			
			
			model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));

			return new ModelAndView("jsonView");

    	}
    	catch(Exception ex){
    		
    		Log.error("saveUsr1100ShortcutInfoAjax()", ex);

			
			model.addAttribute("saveYN", "N");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.update"));
			return new ModelAndView("jsonView");

    	}
    }
	
	@RequestMapping(value="/usr/usr1000/usr1100/selectUsr1003View.do")
	public String selectReq1000ListView(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/usr/usr1000/usr1000/usr1003";
	}
	
}
