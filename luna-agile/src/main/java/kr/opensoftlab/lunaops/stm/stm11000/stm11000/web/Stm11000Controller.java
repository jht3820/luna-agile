package kr.opensoftlab.lunaops.stm.stm11000.stm11000.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.property.EgovPropertyService;



@Controller
public class Stm11000Controller {

    
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	
	@RequestMapping(value="/stm/stm10000/stm11000/selectStm11000View.do")
    public String selectStm11000View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {    	
		return "/stm/stm11000/stm11000/stm11000";
    }
}
