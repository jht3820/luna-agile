package kr.opensoftlab.lunaops.cmm.cmm8000.cmm8000.web;

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
public class Cmm8000Controller {

	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	
	@RequestMapping(value="/cmm/cmm8000/cmm8000/selectCmm8000View.do")
    public String selectCmm8000View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {    	
		return "/cmm/cmm8000/cmm8000/cmm8000";
    }
}
