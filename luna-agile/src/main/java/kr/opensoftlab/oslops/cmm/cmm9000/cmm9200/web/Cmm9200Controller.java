package kr.opensoftlab.lunaops.cmm.cmm9000.cmm9200.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.opensoftlab.lunaops.cmm.cmm9000.cmm9200.service.Cmm9200Service;
import kr.opensoftlab.sdf.util.RequestConvertor;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;



@Controller
public class Cmm9200Controller {

	
    @Resource(name = "cmm9200Service")
    private Cmm9200Service cmm9200Service;

    
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
    
    @SuppressWarnings({ "rawtypes", "unchecked", "finally" })
    @RequestMapping(method=RequestMethod.POST, value="/cmm/cmm9000/cmm9200/selectCmm9200PrjUsrList.do")
    public ModelAndView selectCmm9200PrjUsrList(HttpServletRequest request, HttpServletResponse response, ModelMap model)	throws Exception {

    	String code = "";
    	String text = "";
    	
    	Map rtnMap = new HashMap();
    	
    	try{
    		Map<String, String> param = RequestConvertor.requestParamToMapAddSelInfo(request, true);
    		
    		List<Map> prjUsrList = cmm9200Service.selectCmm9200PrjUsrList(param);
    		
    		for(Map usrMap : prjUsrList){
				code += usrMap.get("usrId") + "|";
       			text += usrMap.get("usrNm") + "|";
    		}
			
			
			if(code.length() > 0){
				code = code.substring(0,code.length()-1);
				text = text.substring(0,text.length()-1);
			}
			
    		rtnMap.put("usrIdcode", code);
    		rtnMap.put("usrNmtext", text);
    		
    		rtnMap.put("prjUsrList", prjUsrList);
    		rtnMap.put("ERROR_CODE","1");
    		rtnMap.put("ERROR_MSG",egovMessageSource.getMessage("cmm9200.success.prjUsr.select"));
    		
    	}catch(Exception ex){
    		ex.printStackTrace();
    		rtnMap = new HashMap();
    		rtnMap.put("ERROR_CODE","-1");
    		rtnMap.put("ERROR_MSG",egovMessageSource.getMessage("cmm9200.fail.prjUsr.select"));
    		
    	}finally{
    		return new ModelAndView("jsonView", rtnMap);
    	}
    }
    

}
