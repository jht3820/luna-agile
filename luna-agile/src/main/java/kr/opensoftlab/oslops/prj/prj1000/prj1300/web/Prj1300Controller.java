package kr.opensoftlab.lunaops.prj.prj1000.prj1300.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.cmmn.trace.LeaveaTrace;
import egovframework.rte.fdl.property.EgovPropertyService;
import kr.opensoftlab.lunaops.cmm.cmm4000.cmm4000.service.Cmm4000Service;
import kr.opensoftlab.lunaops.prj.prj1000.prj1000.service.Prj1000Service;
import kr.opensoftlab.lunaops.prj.prj1000.prj1100.service.Prj1100Service;
import kr.opensoftlab.lunaops.prj.prj1000.prj1300.service.Prj1300Service;
import kr.opensoftlab.lunaops.stm.stm4000.stm4000.service.Stm4000Service;
import kr.opensoftlab.sdf.util.ModuleUseCheck;
import kr.opensoftlab.sdf.util.RequestConvertor;



@Controller
public class Prj1300Controller {
	
	private static final Logger Log = Logger.getLogger(Prj1300Controller.class);
	
	
    @Resource(name = "cmm4000Service")
    private Cmm4000Service cmm4000Service;
    
    
    @Resource(name = "stm4000Service")
    private Stm4000Service stm4000Service;

	
    @Resource(name = "prj1000Service")
    private Prj1000Service prj1000Service;
    
	
    @Resource(name = "prj1100Service")
    private Prj1100Service prj1100Service;
    
	
    @Resource(name = "prj1300Service")
    private Prj1300Service prj1300Service;
    
    
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	
	@Resource(name = "moduleUseCheck")
	private ModuleUseCheck moduleUseCheck;
	
	
	@Resource(name = "leaveaTrace")
	LeaveaTrace leaveaTrace;
	
	
	@RequestMapping(value="/prj/prj1000/prj1300/selectPrj1300View.do")
    public String selectPrj1300View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/prj/prj1000/prj1300/prj1300";
    }
	
	
	@RequestMapping(value="/prj/prj1000/prj1300/selectPrj1301View.do")
    public String selectPrj1101View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/prj/prj1000/prj1300/prj1301";
    }
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value="/prj/prj1000/prj1300/selectPrj1300PrjProcessListAjax.do")
	public ModelAndView selectPrj1300PrjProcessListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);

			HttpSession ss = request.getSession();

			String prjId = (String) ss.getAttribute("selPrjId");
			paramMap.put("prjId", prjId);
			paramMap.put("selPrjId", prjId);
			
			
			Map selPrjInfo = prj1000Service.selectPrj1000Info(paramMap);
			
			
			List<Map> prjProcessList = prj1100Service.selectPrj1100ProcessList(paramMap);
			
			model.addAttribute("prjProcessList", prjProcessList);
			
			
			model.addAttribute("prjId", prjId);
			model.addAttribute("prjNm", selPrjInfo.get("prjNm"));
			
			
			
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectPrj1300PrjProcessListAjax()", ex);

			
			model.addAttribute("saveYN", "N");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/prj/prj1000/prj1300/selectPrj1300PrjProOptListAjax.do")
	public ModelAndView selectPrj1300PrjProOptListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
    		HttpSession ss = request.getSession();
    		if(paramMap.get("prjId") == null){
    			paramMap.put("prjId", (String) ss.getAttribute("selPrjId"));
    		}

			
			List<Map> commonMstList = stm4000Service.selectStm4000CommonCodeMasterList(paramMap);
			model.addAttribute("commonMstList", commonMstList);
			
    		
			List<Map> prjProOptList = prj1300Service.selectPrj1300PrjProOptList(paramMap);
			model.addAttribute("prjProOptList", prjProOptList);
			
			
			model.addAttribute("errorYN", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectPrj1300PrjProOptListAjax()", ex);

			
			model.addAttribute("errorYN", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	@RequestMapping(value="/prj/prj1000/prj1300/selectPrj1300PrjProOptInfoAjax.do")
	public ModelAndView selectPrj1300PrjProOptInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			if(paramMap.get("prjId") == null){
				paramMap.put("prjId", (String) ss.getAttribute("selPrjId"));
			}
			
			
			Map prjProOptInfo = prj1300Service.selectPrj1300PrjProOptInfo(paramMap);
			
			model.addAttribute("prjProOptInfo", prjProOptInfo);
			
			
			model.addAttribute("errorYN", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectPrj1300PrjProOptInfoAjax()", ex);
			
			
			model.addAttribute("errorYN", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/prj/prj1000/prj1300/insertPrj1301OptInfoAjax.do")
	public ModelAndView insertPrj1301OptInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
    		HttpSession ss = request.getSession();
    		if(paramMap.get("prjId") == null){
    			paramMap.put("prjId", (String) ss.getAttribute("selPrjId"));
    		}
    		
    		prj1300Service.insertPrj1300PrjProOptInfo(paramMap);
			
			
			model.addAttribute("errorYN", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("insertPrj1301OptInfoAjax()", ex);

			
			model.addAttribute("errorYN", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/prj/prj1000/prj1300/updatePrj1301OptInfoAjax.do")
	public ModelAndView updatePrj1301OptInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);

			
    		HttpSession ss = request.getSession();
    		if(paramMap.get("prjId") == null){
    			paramMap.put("prjId", (String) ss.getAttribute("selPrjId"));
    		}
    		
    		
    		prj1300Service.updatePrj1300PrjPrpOptInfo(paramMap);
			
			
			model.addAttribute("errorYN", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("updatePrj1301OptInfoAjax()", ex);

			
			model.addAttribute("errorYN", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.update"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/prj/prj1000/prj1300/deletePrj1301OptInfoAjax.do")
	public ModelAndView deletePrj1301OptInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{
			
			Map<String, Object> paramMap = RequestConvertor.requestParamToMapAddSelInfoList(request, true,"itemId");
			
			
			prj1300Service.deletePrj1300PrjProOptList(paramMap);
			
			
			model.addAttribute("errorYN", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("deletePrj1301OptInfoAjax()", ex);

			
			model.addAttribute("errorYN", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
			return new ModelAndView("jsonView");
		}
	}
}
