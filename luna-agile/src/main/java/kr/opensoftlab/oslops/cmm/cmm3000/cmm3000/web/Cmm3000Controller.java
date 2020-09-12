package kr.opensoftlab.lunaops.cmm.cmm3000.cmm3000.web;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
public class Cmm3000Controller {

	
	@SuppressWarnings("unused")
	private static final Logger Log = Logger.getLogger(Cmm3000Controller.class);
	
	
    
    @RequestMapping(value="/cmm/cmm3000/cmm3000/selectCmm3000View.do")
    public String selectCmm3000View() throws Exception {
    	return "/cmm/cmm3000/cmm3000/cmm3000";
    }
    
    
    @RequestMapping(value="/cmm/cmm3000/cmm3100/selectCmm3100View.do")
    public String selectCmm3100View() throws Exception {
    	return "/cmm/cmm3000/cmm3100/cmm3100";
    }
    
    

}
