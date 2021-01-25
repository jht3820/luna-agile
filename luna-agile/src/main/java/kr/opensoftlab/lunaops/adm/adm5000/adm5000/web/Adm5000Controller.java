package kr.opensoftlab.lunaops.adm.adm5000.adm5000.web;


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
import egovframework.rte.fdl.cmmn.trace.LeaveaTrace;
import kr.opensoftlab.lunaops.adm.adm5000.adm5000.service.Adm5000Service;
import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.sdf.util.RequestConvertor;



@Controller
public class Adm5000Controller {
	
	private static final Logger Log = Logger.getLogger(Adm5000Controller.class);
	
	
    @Resource(name = "adm5000Service")
    private Adm5000Service adm5000Service;
    
	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
    
	
	
	@Resource(name = "leaveaTrace")
	LeaveaTrace leaveaTrace;
	
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/adm/adm5000/adm5000/selectAdm5000HoliListAjax.do")
    public ModelAndView selectAdm5000HoliListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	
		try{
			
        	Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
        	
			List holiList = adm5000Service.selectAdm5000HoliList(paramMap);
        	
			model.addAttribute("holiList", holiList);
        	
			model.addAttribute("errorYn", "N");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        	
        	return new ModelAndView("jsonView");
        	
		}catch(Exception e){
			Log.error("insertAdm5000HoliListAjax()", e);
			
    		model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		
    		return new ModelAndView("jsonView");
		}
    }
	
	
	@RequestMapping(value="/adm/adm5000/adm5000/insertAdm5000HoliListAjax.do")
	public ModelAndView insertAdm5000HoliListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);

			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			
			adm5000Service.insertAdm5000HoliList(paramMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
			
			return new ModelAndView("jsonView");
			
		}catch(Exception e){
			Log.error("insertAdm5000HoliListAjax()", e);
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
			
			return new ModelAndView("jsonView");
		}
	}
	
}
