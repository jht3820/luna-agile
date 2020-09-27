package kr.opensoftlab.lunaops.prj.prj2000.prj2000.web;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

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
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.opensoftlab.lunaops.com.exception.UserDefineException;
import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.lunaops.prj.prj2000.prj2000.service.Prj2000Service;
import kr.opensoftlab.lunaops.stm.stm2000.stm2000.web.Stm2000Controller;
import kr.opensoftlab.sdf.util.ModuleUseCheck;
import kr.opensoftlab.sdf.util.OslStringUtil;
import kr.opensoftlab.sdf.util.PagingUtil;
import kr.opensoftlab.sdf.util.RequestConvertor;



@Controller
public class Prj2000Controller {

	
	private final Logger Log = Logger.getLogger(this.getClass());
	
	
    @Resource(name = "prj2000Service")
    private Prj2000Service prj2000Service;
    
    
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	
	@Resource(name = "moduleUseCheck")
	private ModuleUseCheck moduleUseCheck;
	
	
	@Resource(name = "leaveaTrace")
	LeaveaTrace leaveaTrace;
    
	
	@RequestMapping(value="/prj/prj2000/prj2000/selectPrj2000View.do")
    public String selectPrj2000View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {    	
		return "/prj/prj2000/prj2000/prj2000";
    }
	
	
	@RequestMapping(value="/prj/prj2000/prj2000/selectPrj2001View.do")
    public String selectPrj2001View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	
    	try{
    		
        	Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
    		
        	
        	String type = paramMap.get("type");
        	
        	
        	if("insert".equals(type)) {
               
    			HttpSession ss = request.getSession();
    			String prjId = (String) ss.getAttribute("selPrjId");
    			
    			
            	String paramPrjId = paramMap.get("prjId");
            	if(paramPrjId != null && !"".equals(paramPrjId)){
            		prjId = paramPrjId;
            	}
        		
        		
               	paramMap.put("prjId", prjId);
               	
               	
               	paramMap.put("view", "prj2000");
               	
        		
               	int nextOrd = prj2000Service.selectPrj2000AuthGrpNextOrd(paramMap);
               	model.addAttribute("nextOrd", nextOrd);
    		}
           	
        	model.addAttribute("type", type);
        	
        	return "/prj/prj2000/prj2000/prj2001";
    	}
    	catch(Exception ex){
    		Log.error("selectPrj2001View()", ex);
    		throw new Exception(ex.getMessage());
    	}
    }
	
	
	@RequestMapping(value="/prj/prj2000/prj2000/selectPrj2002View.do")
    public String selectPrj2002View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	return "/prj/prj2000/prj2000/prj2002";
    }
	
	
    @SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/prj/prj2000/prj2000/selectPrj2000PrjAuthGrpList.do")
    public ModelAndView selectPrj2000PrjAuthGrpList(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	
    	try{
    		
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			HttpSession ss = request.getSession();
			String prjId = (String) ss.getAttribute("selPrjId");
			
			
        	String paramPrjId = paramMap.get("prjId");
        	if(paramPrjId != null && !"".equals(paramPrjId)){
        		prjId = paramPrjId;
        	}
    		
    		
           	paramMap.put("prjId", prjId);

    		
        	paramMap.put("view", "prj2000");
        	
        	
        	List<Map> prjAuthGrpList = (List) prj2000Service.selectPrj2000PrjAuthGrpList(paramMap);
        	
        	model.addAttribute("prjAuthGrpList", prjAuthGrpList);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
    	}
    	catch(Exception ex){
    		Log.error("selectPrj2000PrjAuthGrpList()", ex);
    		
    		
    		model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		return new ModelAndView("jsonView");
    	}
    }
    
    
    @SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/prj/prj2000/prj2000/selectPrj2000PrjAuthGrpPageList.do")
    public ModelAndView selectPrj2000PrjAuthGrpPageList(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	
    	try{
    		
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			
			String _pageNo_str = paramMap.get("pagination[page]");
			String _pageSize_str = paramMap.get("pagination[perpage]");
			
			
			String paramPrjId = (String) paramMap.get("dtParamPrjId");
			HttpSession ss = request.getSession();
			
			
			if(paramPrjId == null || "".equals(paramPrjId)) {
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
			paramMap.put("prjId", paramPrjId);
			
			
			String sortFieldId = (String) paramMap.get("sortFieldId");
			sortFieldId = OslStringUtil.replaceRegex(sortFieldId,"[^A-Za-z0-9+]*");
			String sortDirection = (String) paramMap.get("sortDirection");
			String paramSortFieldId = OslStringUtil.convertUnderScope(sortFieldId);
			paramMap.put("paramSortFieldId", paramSortFieldId);
			
			
			
        	paramMap.put("view", "prj2000");

			
			
			int totCnt = prj2000Service.selectPrj2000PrjAuthGrpListCnt(paramMap);

			
			PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(_pageNo_str, _pageSize_str);

			
			paginationInfo.setTotalRecordCount(totCnt);
			paramMap = PagingUtil.getPageSettingMap(paramMap, paginationInfo);

			
			/
			
			Map<String, Object> metaMap = PagingUtil.getPageReturnMap(paginationInfo);
			
			
			metaMap.put("sort", sortDirection);
			metaMap.put("field", sortFieldId);
			
			model.addAttribute("data", prj2000List);
			model.addAttribute("meta", metaMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
    	}
    	catch(Exception ex){
    		Log.error("selectPrj2000PrjAuthGrpPageList()", ex);
    		
    		
    		model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		return new ModelAndView("jsonView");
    	}
    }
    
    
    @SuppressWarnings("rawtypes")
   	@RequestMapping(value="/prj/prj2000/prj2100/selectPrj2000AuthGrpInfoAjax.do")
       public ModelAndView selectPrj2000AuthGrpInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
       	
       	try{
       		
        	Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
        	
        	HttpSession ss = request.getSession();
			String prjId = (String) ss.getAttribute("selPrjId");
			
			
        	String paramPrjId = paramMap.get("prjId");
        	if(paramPrjId != null && !"".equals(paramPrjId)){
        		prjId = paramPrjId;
        	}
    		
    		
           	paramMap.put("prjId", prjId);
        	
        	
        	if("adm1000".equals(paramMap.get("view") ) ){
        		paramMap.put("prjId", Stm2000Controller.ROOTSYSTEM_PRJ);
        	}
       		
           	
           	Map prjAuthGrpInfoMap = (Map) prj2000Service.selectPrj2000AuthGrpInfoAjax(paramMap);
           	
           	model.addAttribute("prjAuthGrpInfoMap", prjAuthGrpInfoMap);
           	
           	
           	model.addAttribute("errorYn", "N");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        	
        	return new ModelAndView("jsonView");
    	}
    	catch(Exception ex){
    		Log.error("selectPrj2000UsrAddListAjax()", ex);
    		
    		
    		model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		return new ModelAndView("jsonView");
    	}
    }
    
    @SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/prj/prj2000/prj2000/selectPrj2000AuthGrpMenuListAjax.do")
    public ModelAndView selectPrj2000AuthGrpMenuListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	
    	try{
    		
    		Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
    		
        	HttpSession ss = request.getSession();
       		LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
       		paramMap.put("adminYn", loginVO.getAdmYn());

       		
        	List<Map> menuAuthList = (List) prj2000Service.selectPrj2000AuthGrpSmallMenuList(paramMap);

        	
        	menuAuthList = moduleUseCheck.moduleUseMenuList(menuAuthList);
        	
        	model.addAttribute("menuAuthList", menuAuthList);
        	
        	
        	model.addAttribute("errorYn", "N");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        	
        	return new ModelAndView("jsonView");
    	}
    	catch(Exception ex){
    		Log.error("selectPrj2000AuthGrpMenuListAjax()", ex);
    		
    		
    		model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		return new ModelAndView("jsonView");
    	}
    }
    
    
	
	@RequestMapping(value="/prj/prj2000/prj2000/insertPrj2000AuthGrpInfoAjax.do")
    public ModelAndView insertPrj2000AuthGrpInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	
    	try{
    		
        	Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
        	
        	HttpSession ss = request.getSession();
			String prjId = (String) ss.getAttribute("selPrjId");
			
			
        	String paramPrjId = paramMap.get("prjId");
        	if(paramPrjId != null && !"".equals(paramPrjId)){
        		prjId = paramPrjId;
        	}
    		
    		
           	paramMap.put("prjId", prjId);
        	
        	
        	if("adm1000".equals(paramMap.get("view") ) ){
        		paramMap.put("prjId", Stm2000Controller.ROOTSYSTEM_PRJ);
        	}
        	
        	
        	String newAuthGrpId = prj2000Service.insertPrj2000AuthGrpInfoAjax(paramMap);
        	model.addAttribute("newAuthGrpId", newAuthGrpId);
        	
        	
        	model.addAttribute("errorYn", "N");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
        	
        	return new ModelAndView("jsonView");
    	}
    	catch(Exception ex){
    		Log.error("insertAdm1000AuthGrpInfoAjax()", ex);

    		
    		model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
    		return new ModelAndView("jsonView");
    	}
    }
	
    
    @RequestMapping(value="/prj/prj2000/prj2000/updatePrj2000AuthGrpInfoAjax.do")
    public ModelAndView updatePrj2000AuthGrpInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	
    	try{
    		
        	Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
        	
        	HttpSession ss = request.getSession();
			String prjId = (String) ss.getAttribute("selPrjId");
			
			
        	String paramPrjId = paramMap.get("prjId");
        	if(paramPrjId != null && !"".equals(paramPrjId)){
        		prjId = paramPrjId;
        	}
    		
    		
           	paramMap.put("prjId", prjId);
        	
        	
        	if("adm1000".equals(paramMap.get("view") ) ){
        		paramMap.put("prjId", Stm2000Controller.ROOTSYSTEM_PRJ);
        	}
        	
        	prj2000Service.updatePrj2000AuthGrpInfoAjax(paramMap);
        	
        	
        	model.addAttribute("errorYn", "N");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));
        	
        	return new ModelAndView("jsonView");
    	}
    	catch(Exception ex){
    		Log.error("updatePrj2000AuthGrpInfoAjax()", ex);

    		
    		model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.update"));
    		return new ModelAndView("jsonView");
    	}
    }
	
	
	@RequestMapping(value="/prj/prj2000/prj2000/deletePrj2000AuthGrpInfoAjax.do")
    public ModelAndView deletePrj2000AuthGrpInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	try{
    		
        	Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
           	
        	HttpSession ss = request.getSession();
			String prjId = (String) ss.getAttribute("selPrjId");
			
			
        	String paramPrjId = paramMap.get("prjId");
        	if(paramPrjId != null && !"".equals(paramPrjId)){
        		prjId = paramPrjId;
        	}
        	
        	paramMap.put("prjId", prjId);
        	
        	
        	prj2000Service.deletePrj2000AuthGrpInfoAjax(paramMap);
        	
        	
        	model.addAttribute("errorYn", "N");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
        	
        	return new ModelAndView("jsonView");
    	}
    	catch(UserDefineException ude) {
			Log.error("deletePrj2000AuthGrpInfoAjax()", ude);

			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", ude);

			return new ModelAndView("jsonView");
		}
    	catch(Exception ex){
    		Log.error("deletePrj2000AuthGrpInfoAjax()", ex);

    		
    		model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
    		return new ModelAndView("jsonView");
    	}
    }
	
	
    @SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/prj/prj2000/prj2000/savePrj2000AuthGrpMenuAuthListAjax.do")
    public ModelAndView savePrj2000AuthGrpMenuAuthListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	try{
    		
    		List<Map> list = new ArrayList<Map>();
        	Enumeration enu = request.getParameterNames();
        	String authGrpId = request.getParameter("authGrpId");
        	String mainMenuId = request.getParameter("mainMenuId");
                	
        	String strStatusMenuId = "";
    		String strStatus = "";
        	
        	Map<String, Map> menuIdMap = new HashMap<String, Map>();
        	
        	while(enu.hasMoreElements()){
        		String strKeys = (String) enu.nextElement();
        		String menuId = "";
        		String colNm = "";
        		
        		
        		if(strKeys.length() < 18){
        			continue;
        		}
        		
        		
        		if("status".equals(strKeys.substring(0,6))){
        			strStatusMenuId = strKeys.substring(6,18);
        			strStatus = request.getParameter(strKeys);
        			
        			
        			if(!menuIdMap.containsKey(strStatusMenuId)) {
        				
        				Map<String, String> menuDataMap = new HashMap<String, String>();
        				
        				
        				RequestConvertor.mapAddCommonInfo(request, menuDataMap);
        				
        				
        				menuIdMap.put(strStatusMenuId, menuDataMap);
        				
        				
        				menuIdMap.get(strStatusMenuId).put("authGrpId", authGrpId);
        				menuIdMap.get(strStatusMenuId).put("mainMenuId", mainMenuId);
        				menuIdMap.get(strStatusMenuId).put("menuId", strStatusMenuId);
        			}
        			
        			
        			menuIdMap.get(strStatusMenuId).put("status", strStatus);
        		}
        		
        		
        		if( "hidden".equals(strKeys.substring(0,6)) ){
        			menuId = strKeys.substring(6,18);
        			colNm = strKeys.substring(18);
        			
        			
        			if(!menuIdMap.containsKey(menuId)) {
        				
        				Map<String, String> menuDataMap = new HashMap<String, String>();
        				
        				
        				RequestConvertor.mapAddCommonInfo(request, menuDataMap);
        				
        				
        				menuIdMap.put(menuId, menuDataMap);
        				
        				
        				menuIdMap.get(menuId).put("authGrpId", authGrpId);
        				menuIdMap.get(menuId).put("mainMenuId", mainMenuId);
        				menuIdMap.get(menuId).put("menuId", menuId);
        			}
        			
        			
        			menuIdMap.get(menuId).put(colNm, request.getParameter("hidden" + menuId + colNm));
        		}
        	}
        	
        	
        	for(Entry<String, Map> mapInfo : menuIdMap.entrySet()) {
        		Map newMap = mapInfo.getValue();
        		list.add(newMap);
        	}

        	
        	prj2000Service.savePrj2000AuthGrpMenuAuthListAjax(list);
        	
        	
        	model.addAttribute("errorYn", "N");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.save"));
        	
        	return new ModelAndView("jsonView");
    	}
    	catch(UserDefineException ude) {
			Log.error("savePrj2000AuthGrpMenuAuthListAjax()", ude);

			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", ude);

			return new ModelAndView("jsonView");
		}
    	catch(Exception ex){
    		Log.error("savePrj2000AuthGrpMenuAuthListAjax()", ex);
    		
    		
    		model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.save"));
    		return new ModelAndView("jsonView");
    	}
    }
    
    

	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value="/prj/prj2000/prj2000/selectPrj2000AuthGrpCopyList.do")
	public ModelAndView selectPrj2000AuthGrpCopyList(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
    		paramMap.put("usrId", loginVO.getUsrId());

			List<Map> authGrpCopyList = prj2000Service.selectPrj2000AuthGrpCopyList(paramMap);
			model.addAttribute("authGrpCopyList", authGrpCopyList);
			
			paramMap.remove("prjId");
			paramMap.put("prjId", "ROOTSYSTEM_PRJ");
			
			
			List<Map> rootAuthGrpList = prj2000Service.selectPrj2000PrjAuthGrpList(paramMap);
			model.addAttribute("rootAuthGrpList", rootAuthGrpList);
			
			
			model.addAttribute("errorYN", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectPrj2000AuthGrpCopyList()", ex);
			
			
			model.addAttribute("errorYN", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
}
