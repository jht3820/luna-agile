package kr.opensoftlab.lunaops.stm.stm1000.stm1000.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.cmmn.trace.LeaveaTrace;
import kr.opensoftlab.lunaops.stm.stm1000.stm1000.service.Stm1000Service;
import kr.opensoftlab.sdf.util.RequestConvertor;



@Controller
public class Stm1000Controller {
	
	
	private static final Logger Log = Logger.getLogger(Stm1000Controller.class);
	
	
    @Resource(name = "stm1000Service")
    private Stm1000Service stm1000Service;
    
    
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	
	@Resource(name = "leaveaTrace")
	LeaveaTrace leaveaTrace;
	

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/stm/stm1000/stm1000/selectStm1000LicencePrjAllListAjax.do")
	public ModelAndView selectStm1000LicencePrjAllListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		try{			
			
			Map paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
    		List<Map> allPrjList = (List)stm1000Service.selectStm1000LicencePrjAllList(paramMap);
			
    		
			model.addAttribute("list", allPrjList);
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
    		
			return new ModelAndView("jsonView");
			
		}catch(Exception ex){
			Log.error("selectStm1000LicencePrjAllListAjax()", ex);

			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
}
