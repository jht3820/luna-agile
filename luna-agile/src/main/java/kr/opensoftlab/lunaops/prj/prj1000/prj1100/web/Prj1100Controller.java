package kr.opensoftlab.lunaops.prj.prj1000.prj1100.web;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.cmmn.trace.LeaveaTrace;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.opensoftlab.lunaops.cmm.cmm4000.cmm4000.service.Cmm4000Service;
import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.lunaops.prj.prj1000.prj1100.service.Prj1100Service;
import kr.opensoftlab.lunaops.prj.prj1000.prj1100.vo.Prj1100VO;
import kr.opensoftlab.lunaops.stm.stm4000.stm4000.service.Stm4000Service;
import kr.opensoftlab.sdf.util.ModuleUseCheck;
import kr.opensoftlab.sdf.util.PagingUtil;
import kr.opensoftlab.sdf.util.RequestConvertor;



@Controller
public class Prj1100Controller {
	
	private static final Logger Log = Logger.getLogger(Prj1100Controller.class);
	
	
    @Resource(name = "cmm4000Service")
    private Cmm4000Service cmm4000Service;
    
    
    @Resource(name = "stm4000Service")
    private Stm4000Service stm4000Service;
    
	
    @Resource(name = "prj1100Service")
    private Prj1100Service prj1100Service;
    
    
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	
	@Resource(name = "moduleUseCheck")
	private ModuleUseCheck moduleUseCheck;
	
	
	@Resource(name = "leaveaTrace")
	LeaveaTrace leaveaTrace;
	
	
	@RequestMapping(value="/prj/prj1000/prj1100/selectPrj1100View.do")
    public String selectPrj1100View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/prj/prj1000/prj1100/prj1100";
    }
	
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/prj/prj1000/prj1100/selectPrj1101View.do")
    public String selectPrj1101View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			String processId = paramMap.get("processId");
			String flowId = paramMap.get("flowId");

			
    		HttpSession ss = request.getSession();
    		paramMap.put("prjId", (String) ss.getAttribute("selPrjId"));
    		
			
			Map processInfo = (Map) prj1100Service.selectPrj1100ProcessInfo(paramMap);
			
			String processConfirmCd = (String) processInfo.get("processConfirmCd");
			model.addAttribute("processConfirmCd",processConfirmCd);
			
			model.addAttribute("processId",processId);
			model.addAttribute("flowId",flowId);
		}catch(Exception ex){
			Log.error("selectPrj1101View()", ex);

			
			model.addAttribute("errorYN", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return "/err/error";
		}
		return "/prj/prj1000/prj1100/prj1101";
    }
	
	
	@RequestMapping(value="/prj/prj1000/prj1100/selectPrj1102View.do")
    public String selectPrj1102View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			String processId = paramMap.get("processId");
			String flowId = paramMap.get("flowId");
			String type = paramMap.get("type");
			
			
			boolean jenkinsModuleUseChk = moduleUseCheck.isJenkinsModuleUseChk();
			
			boolean svnModuleUseChk = moduleUseCheck.isSvnKitModuleUseChk();
			
			model.addAttribute("processId",processId);
			model.addAttribute("flowId",flowId);
			model.addAttribute("type",type);
			model.addAttribute("jenkinsModuleUseChk",jenkinsModuleUseChk);
			model.addAttribute("svnModuleUseChk",svnModuleUseChk);
			
			
		}catch(Exception ex){
			Log.error("selectPrj1102View()", ex);

			
			model.addAttribute("errorYN", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return "/err/error";
		}
		return "/prj/prj1000/prj1100/prj1102";
    }
	
	
	@RequestMapping(value="/prj/prj1000/prj1100/selectPrj1103View.do")
    public String selectPrj1103View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			String processId = paramMap.get("processId");
			String flowId = paramMap.get("flowId");
			String type = paramMap.get("type");
			
			model.addAttribute("processId",processId);
			model.addAttribute("flowId",flowId);
			model.addAttribute("type",type);
		}catch(Exception ex){
			Log.error("selectPrj1103View()", ex);

			
			model.addAttribute("errorYN", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return "/err/error";
		}
		return "/prj/prj1000/prj1100/prj1103";
    }
	
	
	@RequestMapping(value="/prj/prj1000/prj1100/selectPrj1104View.do")
	public String selectPrj1104View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			

		}catch(Exception ex){
			Log.error("selectPrj1104View()", ex);
			
			
			model.addAttribute("errorYN", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return "/err/error";
		}
		return "/prj/prj1000/prj1100/prj1104";
	}
	
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/prj/prj1000/prj1100/selectPrj1105View.do")
	public String selectPrj1105View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
    		HttpSession ss = request.getSession();
    		paramMap.put("prjId", (String) ss.getAttribute("selPrjId"));
    		
			
			String popupGb = (String)paramMap.get("popupGb");
			
			
			if("update".equals(popupGb)) {
				Map processInfo = (Map)prj1100Service.selectPrj1100ProcessInfo(paramMap);
				model.addAttribute("processInfo", processInfo);
			}
			
		}catch(Exception ex){
			Log.error("selectPrj1105View()", ex);
			
			
			model.addAttribute("errorYN", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return "/err/error";
		}
		return "/prj/prj1000/prj1100/prj1105";
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/prj/prj1000/prj1100/selectPrj1100ProcessListAjax.do")
	public ModelAndView selectPrj1100ProcessListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
    		HttpSession ss = request.getSession();
    		paramMap.put("prjId", (String) ss.getAttribute("selPrjId"));
    		
			List<Map> processList = prj1100Service.selectPrj1100ProcessList(paramMap);
			
			model.addAttribute("processList", processList);
        	
			
			model.addAttribute("errorYN", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectPrj1100ProcessListAjax()", ex);

			
			model.addAttribute("errorYN", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/prj/prj1000/prj1100/insertPrj1100ProcessInfoAjax.do")
	public ModelAndView insertPrj1100ProcessInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
    		HttpSession ss = request.getSession();
    		paramMap.put("prjId", (String) ss.getAttribute("selPrjId"));
    		
    		String newProcessId = prj1100Service.insertPrj1100ProcessInfo(paramMap);
			model.addAttribute("newProcessId", newProcessId);
			
			
			model.addAttribute("errorYN", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("insertPrj1100ProcessInfoAjax()", ex);

			
			model.addAttribute("errorYN", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/prj/prj1000/prj1100/updatePrj1100ProcessInfoAjax.do")
	public ModelAndView updatePrj1100ProcessInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
    		HttpSession ss = request.getSession();
    		paramMap.put("prjId", (String) ss.getAttribute("selPrjId"));
    		
			prj1100Service.updatePrj1100ProcessInfo(paramMap);
			
			
			model.addAttribute("errorYN", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("updatePrj1100ProcessInfoAjax()", ex);

			
			model.addAttribute("errorYN", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.update"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/prj/prj1000/prj1100/updatePrj1100ProcessConfirmInfo.do")
	public ModelAndView updatePrj1100ProcessConfirmInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			paramMap.put("prjId", (String) ss.getAttribute("selPrjId"));

			prj1100Service.updatePrj1100ProcessConfirmInfo(paramMap);
			
			
			model.addAttribute("errorYN", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("updatePrj1100ProcessConfirmInfo()", ex);
			
			
			model.addAttribute("errorYN", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.update"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/prj/prj1000/prj1100/deletePrj1100ProcessInfoAjax.do")
	public ModelAndView deletePrj1100ProcessInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
    		HttpSession ss = request.getSession();
    		paramMap.put("prjId", (String) ss.getAttribute("selPrjId"));
    		
			prj1100Service.deletePrj1100ProcessInfo(paramMap);
			
			
			model.addAttribute("errorYN", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("deletePrj1100ProcessInfoAjax()", ex);

			
			model.addAttribute("errorYN", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/prj/prj1000/prj1100/selectPrj1100ProcessReqCntAjax.do")
	public ModelAndView selectPrj1100ProcessReqCntAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			paramMap.put("prjId", (String) ss.getAttribute("selPrjId"));
			
			int proReqCnt = prj1100Service.selectPrj1100ProcessReqCnt(paramMap);
			
			model.addAttribute("proReqCnt", proReqCnt);
			
			
			model.addAttribute("errorYN", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectPrj1100ProcessReqCntAjax()", ex);
			
			
			model.addAttribute("errorYN", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/prj/prj1000/prj1100/insertPrj1100FlowInfoAjax.do")
	public ModelAndView insertPrj1100FlowInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
    		HttpSession ss = request.getSession();
    		paramMap.put("prjId", (String) ss.getAttribute("selPrjId"));
    		
			prj1100Service.insertPrj1101FlowInfo(paramMap);
			
			
			model.addAttribute("errorYN", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("insertPrj1100FlowInfoAjax()", ex);

			
			model.addAttribute("errorYN", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/prj/prj1000/prj1100/updatePrj1100FlowInfoAjax.do")
	public ModelAndView updatePrj1100FlowInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
    		HttpSession ss = request.getSession();
    		paramMap.put("prjId", (String) ss.getAttribute("selPrjId"));
    		
			prj1100Service.updatePrj1101FlowInfo(paramMap);
			
			
			model.addAttribute("errorYN", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("updatePrj1100FlowInfoAjax()", ex);

			
			model.addAttribute("errorYN", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.update"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/prj/prj1000/prj1100/deletePrj1100FlowInfoAjax.do")
	public ModelAndView deletePrj1100FlowInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
    		HttpSession ss = request.getSession();
    		paramMap.put("prjId", (String) ss.getAttribute("selPrjId"));
    		
			prj1100Service.deletePrj1101FlowInfo(paramMap);
			
			
			model.addAttribute("errorYN", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("deletePrj1100FlowInfoAjax()", ex);

			
			model.addAttribute("errorYN", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/prj/prj1000/prj1100/selectPrj1100OptListAjax.do")
	public ModelAndView selectPrj1100OptListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			String type = paramMap.get("type");
			
			
    		HttpSession ss = request.getSession();
    		if(paramMap.get("prjId") == null){
    			paramMap.put("prjId", (String) ss.getAttribute("selPrjId"));
    		}
    		
    		
			List<Map> optList = prj1100Service.selectPrj1102OptList(paramMap);
			model.addAttribute("optList", optList);
			
			if("prj1101".equals(type)){
				
				List<Map> commonMstList = stm4000Service.selectStm4000CommonCodeMasterList(paramMap);
				model.addAttribute("commonMstList", commonMstList);
			}else{
				model.addAttribute("commonMstList", null);
			}
			
			
			
			model.addAttribute("errorYN", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectPrj1100OptListAjax()", ex);

			
			model.addAttribute("errorYN", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/prj/prj1000/prj1100/insertPrj1100OptInfoAjax.do")
	public ModelAndView insertPrj1100OptInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
    		HttpSession ss = request.getSession();
    		paramMap.put("prjId", (String) ss.getAttribute("selPrjId"));
    		
			prj1100Service.insertPrj1102OtpInfo(paramMap);
			
			
			model.addAttribute("errorYN", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("insertPrj1100OptInfoAjax()", ex);

			
			model.addAttribute("errorYN", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/prj/prj1000/prj1100/updatePrj1100OptInfoAjax.do")
	public ModelAndView updatePrj1100OptInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
    		HttpSession ss = request.getSession();
    		paramMap.put("prjId", (String) ss.getAttribute("selPrjId"));
    		
			prj1100Service.updatePrj1102OtpInfo(paramMap);
			
			
			model.addAttribute("errorYN", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("updatePrj1100OptInfoAjax()", ex);

			
			model.addAttribute("errorYN", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.update"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/prj/prj1000/prj1100/deletePrj1100OptInfoAjax.do")
	public ModelAndView deletePrj1100OptInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
    		HttpSession ss = request.getSession();
    		paramMap.put("prjId", (String) ss.getAttribute("selPrjId"));
    		
			prj1100Service.deletePrj1102OtpInfo(paramMap);
			
			
			model.addAttribute("errorYN", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("deletePrj1100OptInfoAjax()", ex);

			
			model.addAttribute("errorYN", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/prj/prj1000/prj1100/selectPrj1100FlwListAjax.do")
	public ModelAndView selectPrj1100FlwListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
    		HttpSession ss = request.getSession();
    		paramMap.put("prjId", (String) ss.getAttribute("selPrjId"));
    		
			List<Map> flowList = prj1100Service.selectPrj1101FlowList(paramMap);
			
			
			String flowId = (String) flowList.get(0).get("flowId");
			paramMap.put("flowId", flowId);
			
			
			List<Map> optList = prj1100Service.selectPrj1102OptList(paramMap);
			
			model.addAttribute("optList", optList);
			model.addAttribute("flowList", flowList);
			
			
			model.addAttribute("errorYN", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectPrj1100FlwListAjax()", ex);

			
			model.addAttribute("errorYN", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/prj/prj1000/prj1100/selectPrj1100ReqRepRevisionListAjax.do")
	public ModelAndView selectPrj1100ReqRepRevisionListAjax(@ModelAttribute("prj1100VO") Prj1100VO prj1100VO, HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);

			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");

			prj1100VO.setLicGrpId(loginVO.getLicGrpId());
			prj1100VO.setPrjId((String)paramMap.get("selPrjId"));
			
			
			String _pageNo_str = paramMap.get("pageNo");
			String _pageSize_str = paramMap.get("pageSize");
					
			int _pageNo = 1;
			int _pageSize = 10;
						
			
			if(_pageNo_str != null && !"".equals(_pageNo_str)){
				_pageNo = Integer.parseInt(_pageNo_str)+1;  
			}
			if(_pageSize_str != null && !"".equals(_pageSize_str)){
				_pageSize = Integer.parseInt(_pageSize_str);  
			}
			
			
			prj1100VO.setPageIndex(_pageNo);
			prj1100VO.setPageSize(_pageSize);
			prj1100VO.setPageUnit(_pageSize);
			
			PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(prj1100VO);  
			
			
			int totCnt = 0;
			
			
			totCnt = prj1100Service.selectPrj1104ReqRevisionNumListCnt(prj1100VO);
			
			
			paginationInfo.setTotalRecordCount(totCnt);
						
			
			List<Map> reqRevisionList = prj1100Service.selectPrj1104ReqRevisionNumList(prj1100VO);
			
			
			model.addAttribute("reqRevisionList", reqRevisionList);
			
			
			Map<String, Integer> pageMap = new HashMap<String, Integer>();
			pageMap.put("pageNo",prj1100VO.getPageIndex());
			pageMap.put("listCount", reqRevisionList.size());
			pageMap.put("totalPages", paginationInfo.getTotalPageCount());
			pageMap.put("totalElements", totCnt);
			pageMap.put("pageSize", _pageSize);
			
			
			model.addAttribute("page", pageMap);
			
			
			model.addAttribute("errorYN", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectPrj1100ReqRepRevisionListAjax()", ex);
			
			
			model.addAttribute("errorYN", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/prj/prj1000/prj1100/insertPrj1100RevisionNumList.do")
	public ModelAndView insertReq4100RevisionNumInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model )	throws Exception {
		try{
			
			Map paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			paramMap.put("prjId", paramMap.get("selPrjId"));
			
			
			int selRepNumCnt = Integer.parseInt((String)paramMap.get("selRepNumCnt"));
			
			
			int addFailRepNumCnt = prj1100Service.insertPrj1105RevisionNumList(paramMap);
			
			
			if(selRepNumCnt == addFailRepNumCnt){
				
				model.addAttribute("errorYn", "Y");
				model.addAttribute("message", "선택된 모든 리비전이 중복됩니다.");
			}
			
			else if(addFailRepNumCnt > 0){
				
				model.addAttribute("errorYn", "N");
				model.addAttribute("message", egovMessageSource.getMessage("success.common.insert")+"</br>"+addFailRepNumCnt+"건의 중복 선택 리비전은 제외되었습니다.");
			}else{
				
				model.addAttribute("errorYn", "N");
				model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
			}
			
			
			
			return new ModelAndView("jsonView");

		}catch(Exception e){
			Log.error("insertReq4100RevisionNumInfo()", e);
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
			return new ModelAndView("jsonView");
		}
	}
	

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/prj/prj1000/prj1100/deletePrj1100RevisionNumList.do")
	public ModelAndView deletePrj1100RevisionNumList(HttpServletRequest request, HttpServletResponse response, ModelMap model )	throws Exception {
		try{
			
			Map paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			paramMap.put("prjId", paramMap.get("selPrjId"));
			
			
			prj1100Service.deletePrj1104RevisionNumList(paramMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
			
			return new ModelAndView("jsonView");

		}catch(Exception e){
			Log.error("deletePrj1100RevisionNumList()", e);
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
			return new ModelAndView("jsonView");
		}
	}
	

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/prj/prj1000/prj1100/selectPrj1100FlowAuthGrpListAjax.do")
	public ModelAndView selectPrj1100FlowAuthGrpListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			if(paramMap.get("prjId") == null){
    			paramMap.put("prjId", (String) paramMap.get("selPrjId"));
    		}
			
			
			List<Map> flowAuthGrpList = prj1100Service.selectPrj1105FlowAuthGrpList(paramMap);
			model.addAttribute("flowAuthGrpList", flowAuthGrpList);
			
			
			model.addAttribute("errorYN", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectPrj1100FlowAuthGrpListAjax()", ex);
			
			
			model.addAttribute("errorYN", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/prj/prj1000/prj1100/insertPrj1100FlowAuthGrpList.do")
	public ModelAndView insertPrj1100FlowAuthGrpList(HttpServletRequest request, HttpServletResponse response, ModelMap model )	throws Exception {
		try{
			
			Map paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			paramMap.put("prjId", paramMap.get("selPrjId"));
			
			
			int selAuthCnt = Integer.parseInt((String)paramMap.get("selAuthCnt"));
			
			
			int addFailAuthCnt = prj1100Service.insertPrj1105FlowAuthGrpList(paramMap);
			
			
			if(selAuthCnt == addFailAuthCnt){
				
				model.addAttribute("errorYn", "Y");
				model.addAttribute("message", "선택된 모든 역할그룹이 중복됩니다.");
			}
			
			else if(addFailAuthCnt > 0){
				
				model.addAttribute("errorYn", "N");
				model.addAttribute("message", egovMessageSource.getMessage("success.common.insert")+"</br>"+addFailAuthCnt+"건의 중복 선택 역할그룹은 제외되었습니다.");
			}else{
				
				model.addAttribute("errorYn", "N");
				model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
			}
			
			return new ModelAndView("jsonView");

		}catch(Exception e){
			Log.error("insertPrj1100FlowAuthGrpList()", e);
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
			return new ModelAndView("jsonView");
		}
	}
	

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/prj/prj1000/prj1100/deletePrj1100FlowAuthGrpList.do")
	public ModelAndView deletePrj1100FlowAuthGrpList(HttpServletRequest request, HttpServletResponse response, ModelMap model )	throws Exception {
		try{
			
			Map paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			paramMap.put("prjId", paramMap.get("selPrjId"));
			
			
			prj1100Service.deletePrj1105FlowAuthGrpList(paramMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
			
			return new ModelAndView("jsonView");

		}catch(Exception e){
			Log.error("deletePrj1100FlowAuthGrpList()", e);
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/prj/prj1000/prj1100/updatePrj1100ProcessConfirmCancelAjax.do")
	public ModelAndView updatePrj1100ProcessConfirmCancelAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model )	throws Exception {
		try{
			
			Map paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			paramMap.put("prjId", (String) ss.getAttribute("selPrjId"));
			
			
			int proReqCnt = prj1100Service.selectPrj1100ProcessReqCnt(paramMap);
			
			
			if(proReqCnt > 0) {
				model.addAttribute("errorYn", "Y");
				model.addAttribute("message", "프로세스에 배정된 요구사항이 존재합니다.<br>확정 취소 할 수 없습니다.");
				return new ModelAndView("jsonView");
			}
			
			
			String endFlowId = "";
			
			
			String prevFlowId = "";
			
			
			String processJsonDataStr = (String) paramMap.get("processJsonDataTmp");
			
			
			JSONObject processJsonData = new JSONObject(processJsonDataStr);
			
			
			if(processJsonData == null || processJsonData.isNull("operators")) {
				model.addAttribute("errorYn", "Y");
				model.addAttribute("message", "데이터에 문제가 발생했습니다.</br>확정 취소 할 수 없습니다.");
				return new ModelAndView("jsonView");
			}
			
			
			JSONObject operatorsData = processJsonData.getJSONObject("operators");
			
			
			boolean searchFlag = false;
			
			
			Iterator processDataKeys = operatorsData.keys();
			while(processDataKeys.hasNext()) {
				
				String dataKey = (String) processDataKeys.next();
				
				
				JSONObject propertiesData = operatorsData.getJSONObject(dataKey).getJSONObject("properties");
				
				
				if(propertiesData.isNull("flowNextId")) {
					
					endFlowId = dataKey;
					searchFlag = true;
					
					break;
				}
			}
			
			
			if(!searchFlag) {
				model.addAttribute("errorYn", "Y");
				model.addAttribute("message", "최종완료 작업흐름이 존재하지 않습니다.</br>확정 취소 할 수 없습니다.");
				return new ModelAndView("jsonView");
			}
			
			
			searchFlag = false;
			
			
			processDataKeys = operatorsData.keys();
			while(processDataKeys.hasNext()) {
				
				String dataKey = (String) processDataKeys.next();
				
				
				JSONObject propertiesData = operatorsData.getJSONObject(dataKey).getJSONObject("properties");
				
				
				if(!propertiesData.isNull("flowNextId") && endFlowId.equals(propertiesData.getString("flowNextId"))) {
					
					prevFlowId = dataKey;
					searchFlag = true;
					
					break;
				}
			}

			
			if(!searchFlag) {
				model.addAttribute("errorYn", "Y");
				model.addAttribute("message", "최종완료 작업흐름이 존재하지 않습니다.</br>확정 취소 할 수 없습니다.");
				return new ModelAndView("jsonView");
			}
			
			
			operatorsData.remove(endFlowId);
			
			
			JSONObject linksData = processJsonData.getJSONObject("links");
			
			
			searchFlag = false;
			
			
			Iterator linkDataKeys = linksData.keys();
			while(linkDataKeys.hasNext()) {
				
				String dataKey = (String) linkDataKeys.next();
				
				
				JSONObject linkData = linksData.getJSONObject(dataKey);
				
				if(linkData.has("toOperator") && endFlowId.equals(linkData.getString("toOperator"))) {
					
					linksData.remove(dataKey);
					searchFlag = true;
					break;
				}
			}
			
			if(!searchFlag) {
				model.addAttribute("errorYn", "Y");
				model.addAttribute("message", "최종완료 링크가 존재하지 않습니다.</br>확정 취소 할 수 없습니다.");
				return new ModelAndView("jsonView");
			}
			
			
			operatorsData.getJSONObject(prevFlowId).getJSONObject("properties").put("flowNextId", "null");
			
			
			paramMap.put("processJsonData", processJsonData.toString());
			paramMap.put("endFlowId", endFlowId);
			paramMap.put("prevFlowId", prevFlowId);
			
			
			prj1100Service.updatePrj1100ProcessConfirmCancle(paramMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("processJsonData", processJsonData.toString());
			model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));
			
			return new ModelAndView("jsonView");
			
		}catch(Exception e){
			Log.error("updatePrj1100ProcessConfirmCancelAjax()", e);
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.update"));
			return new ModelAndView("jsonView");
		}
	}

	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value="/prj/prj1000/prj1100/selectPrj1100ProcessCopyList.do")
	public ModelAndView selectPrj1100ProcessCopyList(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
    		paramMap.put("usrId", loginVO.getUsrId());

			List<Map> processCopyList = prj1100Service.selectPrj1100ProcessCopyList(paramMap);
			model.addAttribute("processCopyList", processCopyList);
			
			paramMap.remove("prjId");
			paramMap.put("prjId", "ROOTSYSTEM_PRJ");
			paramMap.put("dshType", "dsh1000");
			
			
			List<Map> rootProcessList = prj1100Service.selectPrj1100ProcessList(paramMap);
			model.addAttribute("rootProcessList", rootProcessList);
			
			
			model.addAttribute("errorYN", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectPrj1100ProcessCopyList()", ex);
			
			
			model.addAttribute("errorYN", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/prj/prj1000/prj1100/insertPrj1100ProcessCopyInfoAjax.do")
	public ModelAndView insertPrj1100ProcessCopyInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			prj1100Service.insertPrj1100ProcessCopyInfo(paramMap);
			
			
			model.addAttribute("errorYN", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("insertPrj1100ProcessCopyInfoAjax()", ex);
			
			
			model.addAttribute("errorYN", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
			return new ModelAndView("jsonView");
		}
	}
}
