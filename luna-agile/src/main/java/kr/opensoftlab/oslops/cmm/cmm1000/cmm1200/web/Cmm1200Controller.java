package kr.opensoftlab.lunaops.cmm.cmm1000.cmm1200.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.property.EgovPropertyService;



@Controller
public class Cmm1200Controller {
	
	
	protected Logger Log = Logger.getLogger(this.getClass());
	
	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	
	@RequestMapping(value="/cmm/cmm1000/cmm1200/selectCmm1200View.do")
    public String selectCmm1200View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/cmm/cmm1000/cmm1200/cmm1200";
	}
	

}
