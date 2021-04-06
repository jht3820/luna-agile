package kr.opensoftlab.lunaops.dsh.dsh2000.dsh2000.web;

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



@Controller
public class Dsh2000Controller {

	
	protected Logger Log = Logger.getLogger(this.getClass());
    
    
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
	
	@RequestMapping(value="/dsh/dsh2000/dsh2000/selectDsh2000View.do")
	public String selectDsh2000View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		try{
			
			
			
			
			model.addAttribute("topMenuType","01");
			
			return "/dsh/dsh2000/dsh2000/dsh2000";
		}
		catch(Exception ex){
			Log.error("selectDsh2000View()", ex);
			throw new Exception(ex.getMessage());
		}
	}
}
