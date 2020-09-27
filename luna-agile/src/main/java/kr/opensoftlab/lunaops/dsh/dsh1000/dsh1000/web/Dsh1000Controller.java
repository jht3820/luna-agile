package kr.opensoftlab.lunaops.dsh.dsh1000.dsh1000.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.cmmn.trace.LeaveaTrace;
import egovframework.rte.fdl.property.EgovPropertyService;
import kr.opensoftlab.lunaops.com.fms.web.service.FileMngService;
import kr.opensoftlab.lunaops.dsh.dsh1000.dsh1000.service.Dsh1000Service;



@Controller
public class Dsh1000Controller {

	
	protected Logger Log = Logger.getLogger(this.getClass());
	
	
    @Resource(name = "dsh1000Service")
    private Dsh1000Service dsh1000Service;
    
    
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	
   	@Resource(name="fileMngService")
   	private FileMngService fileMngService;
	
	@Value("${Globals.fileStorePath}")
	private String tempPath;
	
	
	@Resource(name = "leaveaTrace")
	LeaveaTrace leaveaTrace;
	
	@RequestMapping(value="/dsh/dsh1000/dsh1000/selectDsh1000View.do")
	public String selectDsh1000View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		try{
			model.addAttribute("topMenuType","01");
			
			return "/dsh/dsh1000/dsh1000/dsh1000";
		}
		catch(Exception ex){
			Log.error("selectDsh1000View()", ex);
			throw new Exception(ex.getMessage());
		}
	}
}
