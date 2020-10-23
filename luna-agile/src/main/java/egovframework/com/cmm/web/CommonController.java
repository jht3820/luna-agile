package egovframework.com.cmm.web;


import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.annotation.DefaultAnnotationHandlerMapping;

import egovframework.com.cmm.service.CommonService;
import kr.opensoftlab.sdf.util.RequestConvertor;




@SuppressWarnings("deprecation")
@Controller
public class CommonController  {
	
	protected Logger Log = Logger.getLogger(this.getClass());
	
    @Resource(name = "commonService")
    private CommonService commonService;
    
    @Autowired
    private ApplicationContext ac;
    


    
    @RequestMapping(value="/cmm/selectSelectServerTimeAjax.do")
	public ModelAndView selectSelectServerTimeAjax( HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			String serverTime=commonService.selectServerTime(paramMap);
						
			model.addAttribute("serverTime", serverTime);
						
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectSelectServerTimeAjax()", ex);
			throw new Exception(ex.getMessage());
		}
	}
    
    @RequestMapping(value="/cmm/selectApiKeyAjax.do")
	public ModelAndView selectApiKeyAjax( HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{
			
			
			String apiKey= UUID.randomUUID().toString().toUpperCase();
						
			model.addAttribute("apiKey", apiKey);
						
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectApiKeyAjax()", ex);
			throw new Exception(ex.getMessage());
		}
	}
    
    
 

    
    @SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/cmm/selectUrlListAjax.do")
	public ModelAndView selectUrlListAjax( HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{
			
			DefaultAnnotationHandlerMapping mapping = ac.getBean(DefaultAnnotationHandlerMapping.class);
			
			Map map = mapping.getHandlerMap();
			
			List urlList = new ArrayList();
			
			Set<String> keySet=map.keySet();
			
			for( String  key   : keySet) {
				urlList.add(key);	
			}
									
			model.addAttribute("urlList", urlList);
						
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectUrlListAjax()", ex);
			throw new Exception(ex.getMessage());
		}
	}
    
    
    @SuppressWarnings("rawtypes")
	@RequestMapping(value="/cmm/selectDynamicComboBoxAjax.do")
	public ModelAndView selectDynamicComboBoxAjax( HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			List<Map> comboList=commonService.selectDynamicComboBoxAjax(paramMap);
						
			model.addAttribute("comboList", comboList);
						
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectDynamicComboBoxAjax()", ex);
			throw new Exception(ex.getMessage());
		}
	}
    
    
}
