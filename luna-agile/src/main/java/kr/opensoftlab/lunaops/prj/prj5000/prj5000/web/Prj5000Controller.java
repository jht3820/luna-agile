package kr.opensoftlab.lunaops.prj.prj5000.prj5000.web;


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
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.opensoftlab.lunaops.adm.adm5000.adm5000.service.Adm5000Service;
import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.lunaops.prj.prj5000.prj5000.service.Prj5000Service;
import kr.opensoftlab.sdf.util.OslStringUtil;
import kr.opensoftlab.sdf.util.PagingUtil;
import kr.opensoftlab.sdf.util.RequestConvertor;



@Controller
public class Prj5000Controller {
	
	private static final Logger Log = Logger.getLogger(Prj5000Controller.class);
	
	
    @Resource(name = "prj5000Service")
    private Prj5000Service prj5000Service;

	
    @Resource(name = "adm5000Service")
    private Adm5000Service adm5000Service;
    
	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
    
	
	
	@Resource(name = "leaveaTrace")
	LeaveaTrace leaveaTrace;
	
	
	@RequestMapping(value="/prj/prj5000/prj5000/selectPrj5000View.do")
    public String selectPrj5000View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
        	return "/prj/prj5000/prj5000/prj5000";
    }
	

	
	@RequestMapping(value="/prj/prj5000/prj5000/selectPrj5001View.do")
    public String selectPrj5001View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
        	return "/prj/prj5000/prj5000/prj5001";
    }
	
	
	@RequestMapping(value="/prj/prj5000/prj5000/savePrj5001PrjEvtInfo.do")
	public ModelAndView savePrj5001PrjEvtInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			HttpSession ss = request.getSession();
			String type = (String) paramMap.get("type");
			
			
			LoginVO loginVo = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVo.getLicGrpId());
			paramMap.put("prjGrpId", (String) ss.getAttribute("selPrjGrpId"));
			paramMap.put("prjId", (String) ss.getAttribute("selPrjId"));
			
			
			if("insert".equals(type)) {
				paramMap.put("usrId", loginVo.getUsrId());
				
				String prjEvtId = prj5000Service.insertPrj5000PrjEvtAjax(paramMap);
				paramMap.put("prjEvtId", prjEvtId);
				Map evtInfo = prj5000Service.selectPrjEvt5000Info(paramMap);
				model.addAttribute("prjEvtId", prjEvtId);
				model.addAttribute("evtInfo", evtInfo);
			}
			
			else if("update".equals(type)) {
				Map evtInfo = prj5000Service.selectPrjEvt5000Info(paramMap);
				
				String usrId = (String)evtInfo.get("usrId");
				
				
				if(!usrId.equals(loginVo.getUsrId())) {
					model.addAttribute("errorYn", "Y");
					model.addAttribute("message", egovMessageSource.getMessage("fail.common.update"));
					return new ModelAndView("jsonView");
				}else {
					
					prj5000Service.updatePrj5000PrjEvtAjax(paramMap);
				}
			}else {
				
				model.addAttribute("errorYn", "Y");
	        	model.addAttribute("message", egovMessageSource.getMessage("fail.common.save"));
	        	return new ModelAndView("jsonView");
			}
			
			
        	model.addAttribute("errorYn", "N");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.save"));
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("savePrj5001PrjEvtInfo()", ex);
			
			
			model.addAttribute("errorYn", "Y");
        	model.addAttribute("message", egovMessageSource.getMessage("fail.common.save"));
			throw new Exception(ex.getMessage());
		}
	}
	
	
	@RequestMapping(value="/prj/prj5000/prj5000/deletePrj5000EvtInfoAjax.do")
	public ModelAndView deletePrj5000EvtInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
			System.out.println(paramMap.get("prjEvtId"));
	       	
	       	HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			paramMap.put("prjGrpId", (String) ss.getAttribute("selPrjGrpId"));
			paramMap.put("prjId", (String) ss.getAttribute("selPrjId"));
			
			Map evtInfo = prj5000Service.selectPrjEvt5000Info(paramMap);
			
			String usrId = (String)evtInfo.get("usrId");
			
			
			if(!usrId.equals(loginVO.getUsrId())) {
				model.addAttribute("errorYn", "Y");
				model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
				return new ModelAndView("jsonView");
			}else {
				prj5000Service.deletePrj5000PrjEvtInfo(paramMap);
			}
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
			
			return new ModelAndView("jsonView");
			
		}catch(Exception e){
			Log.error("deletePrj5000EvtInfoAjax()", e);
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
			
			return new ModelAndView("jsonView");
		}
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/prj/prj5000/prj5000/selectPrj5000EventListAjax.do")
    public ModelAndView selectPrj5000EventListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	
		try{
			
        	Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
        	
        	
        	HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			
        	
			List holiList = adm5000Service.selectAdm5000HoliList(paramMap);
			
			
			String prjGrpId = (String) ss.getAttribute("selPrjGrpId");
			String prjId = (String) ss.getAttribute("selPrjId");
			
			
			String target = (String) paramMap.get("target");
			
			
			paramMap.put("prjId", prjId);
			paramMap.put("usrId", loginVO.getUsrId());
			paramMap.put("target", target);
			
			
			if(!"usrId".equals(target)) {
				paramMap.put("prjGrpId", prjGrpId);
			}
			
			List evtReqList = prj5000Service.selectPrj5000ReqList(paramMap);
			
			
        	List evtList = prj5000Service.selectPrj5000EvtList(paramMap);
        	
        	
        	evtList.addAll(evtReqList);
			model.addAttribute("selPrjId", prjId);
			model.addAttribute("evtList", evtList);
			model.addAttribute("holiList", holiList);
			
        	
			model.addAttribute("errorYn", "N");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        	
        	return new ModelAndView("jsonView");
        	
		}catch(Exception e){
			Log.error("selectPrj5000EventListAjax()", e);
			
    		model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		
    		return new ModelAndView("jsonView");
		}
    }
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/prj/prj5000/prj5000/selectPrj5001PrjEvtInfoAjax.do")
	public ModelAndView selectPrj5001PrjEvtInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			HttpSession ss = request.getSession();
			
			
			LoginVO loginVo = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVo.getLicGrpId());
			paramMap.put("prjGrpId", (String) ss.getAttribute("selPrjGrpId"));
			paramMap.put("prjId", (String) ss.getAttribute("selPrjId"));
			
			Map prjEvtInfo = null;
			if(paramMap.get("evtType").equals("04")) {
				paramMap.put("reqId", paramMap.get("prjEvtId"));
				
				prjEvtInfo = prj5000Service.selectPrj5000ReqInfo(paramMap);
			}else {
				
				prjEvtInfo = prj5000Service.selectPrjEvt5000Info(paramMap);
			}
			model.addAttribute("prjEvtInfo", prjEvtInfo);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception e){
			Log.error("selectPrj5001PrjEvtInfoAjax()", e);
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			
			return new ModelAndView("jsonView");
		}
	}
	
}
