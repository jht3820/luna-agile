package kr.opensoftlab.lunaops.stm.stm2000.stm2000.web;

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
import kr.opensoftlab.lunaops.stm.stm2000.stm2000.service.Stm2000Service;
import kr.opensoftlab.sdf.util.ModuleUseCheck;
import kr.opensoftlab.sdf.util.PagingUtil;
import kr.opensoftlab.sdf.util.RequestConvertor;



@Controller
public class Stm2000Controller {

	
	private static final Logger Log = Logger.getLogger(Stm2000Controller.class);
	
	
    @Resource(name = "stm2000Service")
    private Stm2000Service stm2000Service;
    
    
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	
	@Resource(name = "moduleUseCheck")
	private ModuleUseCheck moduleUseCheck;
	
	
	@Resource(name = "leaveaTrace")
	LeaveaTrace leaveaTrace;
    
	public final static String ROOTSYSTEM_PRJ = "ROOTSYSTEM_PRJ";
	
	
    @SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/stm/stm2000/stm2000/selectStm2000View.do")
    public String selectStm2000View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	
    	try{
    		
    		HttpSession ss = request.getSession();
    		LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
        	
        	Map paramMap = new HashMap<String, String>();
        	
        	paramMap.put("prjId", ROOTSYSTEM_PRJ);
        	paramMap.put("authGrpId", ss.getAttribute("selAuthGrpId"));
        	paramMap.put("usrId", loginVO.getUsrId());
        	paramMap.put("licGrpId", loginVO.getLicGrpId());
        	
        	
        	List<Map> baseMenuList = (List) stm2000Service.selectStm2000BaseMenuList(paramMap);
        	
        	model.addAttribute("baseMenuList", baseMenuList);
        	return "/stm/stm2000/stm2000/stm2000";
    	}
    	catch(Exception ex){
    		Log.error("selectStm2000View()", ex);
    		throw new Exception(ex.getMessage());
    	}
    }
    
    
	@RequestMapping(value="/stm/stm2000/stm2000/selectStm2001View.do")
    public String selectStm2001View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	try{
			
	    	Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
	    	String type = paramMap.get("type");
	    	model.addAttribute("type",type);
	    	
	    	
        	
        		
               	
               	
    		
	    	
        	return "/stm/stm2000/stm2000/stm2001";
    	}
    	catch(Exception ex){
    		Log.error("selectStm2001View()", ex);
    		throw new Exception(ex.getMessage());
    	}
    }
    
	
    @SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/stm/stm2000/stm2000/selectStm2000MenuListAjax.do")
    public ModelAndView selectStm2000MenuListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	
    	try{
    		
        	Map paramMap = RequestConvertor.requestParamToMap(request, true);
        	HttpSession ss = request.getSession();
    		LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
        	
        	paramMap.put("adminYn", loginVO.getAdmYn());
        	
        	
        	List<Map> baseMenuList = (List<Map>) stm2000Service.selectStm2000BaseMenuList(paramMap);

        	
        	baseMenuList = moduleUseCheck.moduleUseMenuList(baseMenuList);
        	model.addAttribute("list", baseMenuList);
        	
        	
        	model.addAttribute("errorYn", "N");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        	
        	return new ModelAndView("jsonView");
    	}
    	catch(Exception ex){
    		Log.error("selectStm2000MenuListAjax()", ex);
    		
    		
    		model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		return new ModelAndView("jsonView");
    	}
    }
    
    
    @SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/stm/stm2000/stm2000/selectStm2000MenuInfoAjax.do")
    public ModelAndView selectStm2000MenuInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	
    	try{
    		
        	Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
        	
        	
        	Map<String, String> menuInfoMap = (Map) stm2000Service.selectStm2000MenuInfo(paramMap);
        	model.addAttribute("menuInfoMap", menuInfoMap);
        	
        	
        	model.addAttribute("errorYn", "N");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        	
        	return new ModelAndView("jsonView");
    	}
    	catch(Exception ex){
    		Log.error("selectStm2000MenuInfoAjax()", ex);

    		
    		model.addAttribute("errorYn", "N");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		return new ModelAndView("jsonView");
    	}
    }
    
    
	@RequestMapping(value="/stm/stm2000/stm2000/insertStm2000MenuInfoAjax.do")
    public ModelAndView insertStm2000MenuInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	
    	try{
    		
        	Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
        	
        	
        	stm2000Service.insertStm2000MenuInfo(paramMap);
        	
        	
        	model.addAttribute("errorYn", "N");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
        	
        	return new ModelAndView("jsonView");
        	
        
    	}catch(UserDefineException ude) {
			Log.error("insertStm2000MenuInfoAjax()", ude);

			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", ude);

			return new ModelAndView("jsonView");
			
		}catch(Exception ex){
    		Log.error("insertStm2000MenuInfoAjax()", ex);

    		
    		model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
    		return new ModelAndView("jsonView");
    	}
    }
	
	
	@RequestMapping(value="/stm/stm2000/stm2000/deleteStm2000MenuInfoAjax.do")
    public ModelAndView deleteStm2000MenuInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	
    	try{
    		
        	Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
        	
        	
        	if(paramMap.get("upperMenuId") == null){
        		model.addAttribute("errorYn", "Y");
        		model.put("message", egovMessageSource.getMessage("stm2000.fail.delete.root"));
        		return new ModelAndView("jsonView");
			}
        	
        	
        	stm2000Service.deleteStm2000MenuInfo(paramMap);
        	
        	
        	model.addAttribute("errorYn", "N");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
        	return new ModelAndView("jsonView");
    	
    	}catch(UserDefineException ude) {
			Log.error("insertStm2000MenuInfoAjax()", ude);

			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", ude);
			return new ModelAndView("jsonView");
			
    	}catch(Exception ex){
    		Log.error("deleteStm2000MenuInfoAjax()", ex);

    		
    		model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
    		return new ModelAndView("jsonView");
    	}
    }
	
	
	@RequestMapping(value="/stm/stm2000/stm2000/updateStm2000MenuInfoAjax.do")
    public ModelAndView updateStm2000MenuInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	
    	try{
        	
    		
        	Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
        	
        	
        	
        	
        	
        	stm2000Service.updateStm2000MenuInfo(paramMap);
        	
        	
			model.addAttribute("errorYn", "N");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));
        	
        	return new ModelAndView("jsonView");
        	
		}catch(UserDefineException ude) {
			Log.error("updateStm2000MenuInfoAjax()", ude);
	
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", ude);
	
			return new ModelAndView("jsonView");
			
		}catch(Exception ex){
    		Log.error("updateStm2000MenuInfoAjax()", ex);

    		
    		model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.update"));
    		return new ModelAndView("jsonView");
    	}
    }
    

	
	
    
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/stm/stm2000/stm2000/selectStm2000StmAuthGrpListAjax.do")
	public ModelAndView selectStm2000StmAuthGrpListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
	   	
		try{
	       	
	     	Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
	       	
	     	
			
			String _pageNo_str = paramMap.get("pagination[page]");
			String _pageSize_str = paramMap.get("pagination[perpage]");
			
			
			
			int totCnt = stm2000Service.selectStm2000StmAuthGrpListCnt(paramMap);
	       	
			
			PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(_pageNo_str, _pageSize_str);
			
			
			paginationInfo.setTotalRecordCount(totCnt);
			paramMap = PagingUtil.getPageSettingMap(paramMap, paginationInfo);
			
			
			
			List<Map> stmAuthGrpList = stm2000Service.selectStm2000StmAuthGrpList(paramMap);
			
			
			
			Map<String, Integer> pageMap = PagingUtil.getPageReturnMap(paginationInfo);
			
			model.addAttribute("data", stmAuthGrpList);
			model.addAttribute("meta", pageMap);
	       	
	       	
	       	model.addAttribute("errorYn", "N");
	       	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
	        	
	       	return new ModelAndView("jsonView");
	    }
	    catch(Exception ex){
	    	Log.error("selectStm2000StmAuthGrpListAjax()", ex);
	    		
	    	
	    	model.addAttribute("errorYn", "Y");
	    	model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
	    	return new ModelAndView("jsonView");
	    }
	}
	
	
    @SuppressWarnings("rawtypes")
	@RequestMapping(value="/stm/stm2000/stm2000/selectStm2000StmAuthGrpNoPagingListAjax.do")
    public ModelAndView selectStm2000StmAuthGrpNoPagingListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	
    	try{
    		
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
        	
        	
        	List<Map> stmAuthGrpList = stm2000Service.selectStm2000StmAuthGrpNoPagingList(paramMap);
        	
        	model.addAttribute("stmAuthGrpList", stmAuthGrpList);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
    	}
    	catch(Exception ex){
    		Log.error("selectStm2000StmAuthGrpNoPagingListAjax()", ex);
    		
    		
    		model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		return new ModelAndView("jsonView");
    	}
    }
	
    
    @SuppressWarnings("rawtypes")
   	@RequestMapping(value="/stm/stm2000/stm2000/selectStm2000StmAuthGrpInfoAjax.do")
       public ModelAndView selectStm2000StmAuthGrpInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
       	
       	try{
       		
        	Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
       		
           	
           	Map stmAuthGrpInfoMap = (Map) stm2000Service.selectStm2000StmAuthGrpInfo(paramMap);
           	
           	model.addAttribute("stmAuthGrpInfoMap", stmAuthGrpInfoMap);
           	
           	
           	model.addAttribute("errorYn", "N");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        	
        	return new ModelAndView("jsonView");
    	}
    	catch(Exception ex){
    		Log.error("selectStm2000StmAuthGrpInfoAjax()", ex);
    		
    		
    		model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		return new ModelAndView("jsonView");
    	}
    }
    
    
	@RequestMapping(value="/stm/stm2000/stm2000/insertStm2000StmAuthGrpInfoAjax.do")
    public ModelAndView insertStm2000StmAuthGrpInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	
    	try{
    		
        	Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
        	
        	
        	stm2000Service.insertStm2000StmAuthGrpInfo(paramMap);
        	
        	
        	model.addAttribute("errorYn", "N");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
        	
        	return new ModelAndView("jsonView");
    	}
    	catch(Exception ex){
    		Log.error("insertStm2000StmAuthGrpInfoAjax()", ex);

    		
    		model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
    		return new ModelAndView("jsonView");
    	}
    }
	
	
    @RequestMapping(value="/stm/stm2000/stm2000/updateStm2000StmAuthGrpInfoAjax.do")
    public ModelAndView updateStm2000StmAuthGrpInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	
    	try{
    		
        	Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
        	
        	
        	stm2000Service.updateStm2000StmAuthGrpInfo(paramMap);
        	
        	
        	model.addAttribute("errorYn", "N");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));
        	
        	return new ModelAndView("jsonView");
    	}
    	catch(Exception ex){
    		Log.error("updateStm2000StmAuthGrpInfoAjax()", ex);

    		
    		model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.update"));
    		return new ModelAndView("jsonView");
    	}
    }
	
	
	@RequestMapping(value="/stm/stm2000/stm2000/deleteStm2000StmAuthGrpInfoAjax.do")
    public ModelAndView deleteStm2000StmAuthGrpInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	
    	try{
    		
        	Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
        	
        	
        	stm2000Service.deleteStm2000StmAuthGrpInfo(paramMap);
        	
        	
        	model.addAttribute("errorYn", "N");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
        	
        	return new ModelAndView("jsonView");
    	
    	}catch(UserDefineException ude) {
			Log.error("deleteStm2000StmAuthGrpInfoAjax()", ude);

			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", ude);

			return new ModelAndView("jsonView");
		
    	}catch(Exception ex){
    		Log.error("deleteStm2000StmAuthGrpInfoAjax()", ex);

    		
    		model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
    		return new ModelAndView("jsonView");
    	}
    }
	
	
    @SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/stm/stm2000/stm2000/selectStm2000AuthGrpMenuListAjax.do")
    public ModelAndView selectStm2000AuthGrpMenuListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	
    	try{
    		
        	Map paramMap = RequestConvertor.requestParamToMap(request, true);
        	
        	HttpSession ss = request.getSession();
    		LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
    		
    		
    		paramMap.put("adminYn", loginVO.getAdmYn());
    		paramMap.put("prjId", ROOTSYSTEM_PRJ);
    		
        	
        	List<Map> menuAuthList = (List) stm2000Service.selectStm2000AuthGrpSmallMenuList(paramMap);

        	
        	menuAuthList = moduleUseCheck.moduleUseMenuList(menuAuthList);
        	
        	model.addAttribute("menuAuthList", menuAuthList);
        	
        	
        	model.addAttribute("errorYn", "N");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        	
        	return new ModelAndView("jsonView");
    	}
    	catch(Exception ex){
    		Log.error("selectStm2000AuthGrpMenuListAjax()", ex);
    		
    		
    		model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		return new ModelAndView("jsonView");
    	}
    }
    
    
    @SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/stm/stm2000/stm2000/saveStm2000AuthGrpMenuAuthListAjax.do")
    public ModelAndView saveStm2000AuthGrpMenuAuthListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	try{
    		
    		List<Map> list = new ArrayList<Map>();
        	Enumeration enu = request.getParameterNames();
        	String authGrpId = request.getParameter("authGrpId");
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
        				
        				
        				menuDataMap.put("prjId", "ROOTSYSTEM_PRJ");
        				
        				
        				menuIdMap.put(strStatusMenuId, menuDataMap);
        				
        				
        				menuIdMap.get(strStatusMenuId).put("authGrpId", authGrpId);
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
        				
        				
        				menuDataMap.put("prjId", "ROOTSYSTEM_PRJ");
        				
        				
        				menuIdMap.put(menuId, menuDataMap);
        				
        				
        				menuIdMap.get(menuId).put("authGrpId", authGrpId);
        				menuIdMap.get(menuId).put("menuId", menuId);
        			}
        			
        			
        			menuIdMap.get(menuId).put(colNm, request.getParameter("hidden" + menuId + colNm));
        			
        			
        		}
        	}

        	
        	for(Entry<String, Map> mapInfo : menuIdMap.entrySet()) {
        		Map newMap = mapInfo.getValue();
        		list.add(newMap);
        	}
        	
        	
        	stm2000Service.saveStm2000AuthGrpMenuAuthList(list);
        	
        	
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.save"));
        	
        	return new ModelAndView("jsonView");
    	}
    	catch(Exception ex){
    		Log.error("saveStm2000AuthGrpMenuAuthListAjax()", ex);
    		
    		
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.save"));
    		return new ModelAndView("jsonView");
    	}
    }
	
	
}
