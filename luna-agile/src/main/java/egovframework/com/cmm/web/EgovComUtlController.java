package egovframework.com.cmm.web;

import egovframework.rte.fdl.property.EgovPropertyService;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
public class EgovComUtlController {

    
    

    
    @Resource(name = "propertiesService")
    protected EgovPropertyService propertiesService;

    
	@RequestMapping(value="/EgovPageLink.do")
	public String moveToPage(@RequestParam("link") String linkPage){
		String link = linkPage;
		
		if (linkPage==null || linkPage.equals("")){
			link="egovframework/com/cmm/egovError";
		}
		return link;
	}

    
	@RequestMapping("/validator.do")
	public String validate(){
		return "egovframework/com/cmm/validator";
	}

}