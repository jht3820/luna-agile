package kr.opensoftlab.lunaops.dpl.dpl4000.dpl4000.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.opensoftlab.lunaops.com.fms.web.service.FileMngService;
import kr.opensoftlab.lunaops.dpl.dpl1000.dpl1000.service.Dpl1000Service;
import kr.opensoftlab.lunaops.stm.stm3000.stm3000.service.Stm3000Service;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.cmmn.trace.LeaveaTrace;
import egovframework.rte.fdl.property.EgovPropertyService;



@Controller
public class Dpl4000Controller {
	
	
	protected Logger Log = Logger.getLogger(this.getClass());

	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	
	@Resource(name = "leaveaTrace")
	LeaveaTrace leaveaTrace;

	
	@Resource(name="fileMngService")
	private FileMngService fileMngService;
	
	
	@Resource(name="stm3000Service")
	private Stm3000Service stm3000Service;
	
    
    @Resource(name = "dpl1000Service")
    private Dpl1000Service dpl1000Service;

	
	
	@RequestMapping(value="/dpl/dpl4000/dpl4000/selectDpl4000View.do")
	public String selectDpl4000View( HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/dpl/dpl4000/dpl4000/dpl4000";
	}
}
