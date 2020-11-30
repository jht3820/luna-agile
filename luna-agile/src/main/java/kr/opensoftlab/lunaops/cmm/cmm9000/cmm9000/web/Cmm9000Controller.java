package kr.opensoftlab.lunaops.cmm.cmm9000.cmm9000.web;

import java.util.HashMap;
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
import egovframework.rte.fdl.property.EgovPropertyService;
import kr.opensoftlab.lunaops.arm.arm1000.arm1000.service.Arm1000Service;
import kr.opensoftlab.lunaops.cmm.cmm4000.cmm4000.service.Cmm4000Service;
import kr.opensoftlab.lunaops.cmm.cmm9000.cmm9000.service.Cmm9000Service;
import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.lunaops.prj.prj1000.prj1000.service.Prj1000Service;
import kr.opensoftlab.lunaops.stm.stm3000.stm3000.service.Stm3000Service;
import kr.opensoftlab.lunaops.stm.stm3000.stm3001.service.Stm3001Service;
import kr.opensoftlab.lunaops.stm.stm4000.stm4000.service.Stm4000Service;
import kr.opensoftlab.sdf.util.ModuleUseCheck;
import kr.opensoftlab.sdf.util.RequestConvertor;



@Controller
public class Cmm9000Controller {

	
	private static final Logger Log = Logger.getLogger(Cmm9000Controller.class);
	
	
    @Resource(name = "cmm4000Service")
    private Cmm4000Service cmm4000Service;
    
	
    @Resource(name = "cmm9000Service")
    private Cmm9000Service cmm9000Service;  
    
    
    @Resource(name = "prj1000Service")
    private Prj1000Service prj1000Service;
    
    
    @Resource(name = "arm1000Service")
    private Arm1000Service arm1000Service;
    
    
    @Resource(name = "stm3000Service")
    private Stm3000Service stm3000Service;
    
    
    @Resource(name = "stm3001Service")
    private Stm3001Service stm3001Service;

	
    @Resource(name = "stm4000Service")
    private Stm4000Service stm4000Service;
    
	
	@Resource(name = "moduleUseCheck")
	private ModuleUseCheck moduleUseCheck;
	
    
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	
	@RequestMapping(value="/cmm/cmm9000/cmm9000/selectCmm9000MainMove.do")
    public String selectCmm9000MainMove(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {
    	try{
    		
    		
    		String strRsltUrl = "/index";
    		
    		
    		HttpSession ss = request.getSession();

    		
    		strRsltUrl = "redirect:"+ss.getAttribute("selMainUrl");
    		
    		
    		
        	return strRsltUrl;
        	
    	}catch(Exception ex){
    		Log.error("selectCmm9000MainMove()", ex);
    		throw new Exception(ex.getMessage());
    	}
    }

    
    @SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/cmm/cmm9000/cmm9000/selectCmm9000PageChgView.do")
    public String selectCmm9000PrjGrpChgView(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {
    	try{
    		
        	Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
        	
    		
    		String paramPrjGrpId = paramMap.get("prjGrpId");
    		
    		
    		String paramPrjId = paramMap.get("prjId");
    		
    		
    		String paramAuthGrpId = paramMap.get("authGrpId");
    		
    		
    		String moveType = paramMap.get("moveType");
    		
    		
    		
    		if(paramPrjGrpId == null){
    			return "forward:/cmm/cmm4000/cmm4000/selectCmm4000LoginAfter.do";
    		}

    		
    		HttpSession ss = request.getSession();
    		LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
    		String usrId = (String) loginVO.getUsrId();
    		paramMap.put("usrId", usrId);
    		
    		
    		String prjId = null;
    		String prjTypeCd = "01";
    		String prjDevTypeCd = "01";
    		
    		
    		List<Map> prjList = prj1000Service.selectPrj1000AdminPrjList(paramMap);
    		
    		
    		if("01".equals(moveType)) {
	    		
	    		for(Map prjInfo : prjList) {
	    			String prjGrpId = (String) prjInfo.get("prjGrpId");
	    			if(paramPrjGrpId.equals(prjGrpId)){
	    				prjId = (String) prjInfo.get("prjId");
	    				prjTypeCd = (String) prjInfo.get("prjTypeCd");
	    				prjDevTypeCd = (String) prjInfo.get("prjDevTypeCd");
	    				break;
	    			}
	    		}
    		}else {
    			prjId = paramPrjId;
	    		
	    		
	    		for(Map prjInfo : prjList) {
	    			String mapPrjId = (String) prjInfo.get("prjId");
	    			if(paramPrjId.equals(mapPrjId)){
	    				prjTypeCd = (String) prjInfo.get("prjTypeCd");
	    				prjDevTypeCd = (String) prjInfo.get("prjDevTypeCd");
	    				break;
	    			}
	    		}
    		}
    		
    		System.out.println("#################1");
    		System.out.println(prjTypeCd);
    		System.out.println(prjDevTypeCd);
    		
    		if(prjId == null){
    			return "forward:/cmm/cmm4000/cmm4000/selectCmm4000LoginAfter.do";
    		}
    		
    		paramMap.put("prjId", prjId);
    		
    		
    		String authGrpId = null;
    		
    		
    		
    		List<Map> authList = (List) cmm4000Service.selectCmm4000UsrPrjAuthList(paramMap);
    		if(authList != null){
    			
    			if("03".equals(moveType)) {
	    			
	    			for(Map authInfo : authList){
	    				if(paramAuthGrpId.equals(authInfo.get("authGrpId"))){
	    					ss.setAttribute("usrTyp", authInfo.get("usrTyp"));
	    					authGrpId = (String) authInfo.get("authGrpId");
	    					break;
	    				}
	    			}
    			}else {
    				ss.setAttribute("usrTyp", authList.get(0).get("usrTyp"));
    				
    				
    	    		authGrpId = (String)authList.get(0).get("authGrpId");
    			}
    		}else {
    			return "forward:/cmm/cmm4000/cmm4000/selectCmm4000LoginAfter.do";
    		}
    		
    		
    		if(authGrpId == null){
    			return "forward:/cmm/cmm4000/cmm4000/selectCmm4000LoginAfter.do";
    		}
    		
    		paramMap.put("authGrpId", authGrpId);
    		
    		
    		Map newMap = new HashMap<String, String>();
    		newMap.put("usrId", loginVO.getUsrId());
    		newMap.put("prjId", prjId);
    		newMap.put("prjTypeCd", prjTypeCd);
    		newMap.put("authGrpId", authGrpId);
    		newMap.put("licGrpId", loginVO.getLicGrpId());
    		newMap.put("adminYn", loginVO.getAdmYn());
    		
    		List<Map> menuList = (List) cmm4000Service.selectCmm4000MenuList(newMap);
    		
    		
    		menuList = moduleUseCheck.moduleUseMenuList(menuList);
    		
    		
    		ss.setAttribute("selPrjGrpId", paramPrjGrpId);
    		ss.setAttribute("selPrjId", prjId);
    		ss.setAttribute("selPrjTypeCd", prjTypeCd);
    		ss.setAttribute("selPrjDevTypeCd", prjDevTypeCd);
    		ss.setAttribute("selAuthGrpId", authGrpId);

    		
    		
    		paramMap.put("usrOptMstCd", "OPT00003");
    		Map userOptInfo = stm3001Service.selectStm3001UsrOptInfo(paramMap);
    		String movePageFixedCd = null;
    		if(userOptInfo != null) {
    			movePageFixedCd = (String) userOptInfo.get("usrOptCd");
    		}

    		
    		String selMenuId = (String) ss.getAttribute("selMenuId");
    		
    		
    		String selMoveUrl = null;
    		
    		boolean isMain = false;
    		if(movePageFixedCd != null && "02".equals(movePageFixedCd)) {
	    		for (Map menuMap : menuList) {
	    			
	    			if(selMenuId.equals(menuMap.get("menuId")) && "Y".equals(menuMap.get("accessYn"))) {
	    				
    					ss.setAttribute("selMenuId", menuMap.get("menuId"));
        	    		ss.setAttribute("selMenuNm", menuMap.get("menuNm")); 
        	    		ss.setAttribute("selMenuUrl", menuMap.get("menuUrl"));
        	    		ss.setAttribute("strUpMenuNm", menuMap.get("upMenuNm"));
    					ss.setAttribute("strUpupMenuNm", menuMap.get("upupMenuNm"));
    					ss.setAttribute("firstMenuNm", menuMap.get("menuNm"));
        	    		ss.setAttribute("selAcceptUseCd", menuMap.get("acceptUseCd"));
        	    		selMoveUrl = (String) menuMap.get("menuUrl");
        	    		isMain = true;
        	    		break;
	    			}
				}
    		}
    		
    		
    		if(!isMain) {
	    		for (Map menuMap : menuList) {
	    			
	    			if("Y".equals(  menuMap.get("mainYn") ) ){
	    				ss.setAttribute("selMenuId", menuMap.get("menuId"));
	    				ss.setAttribute("selMenuNm", menuMap.get("menuNm")); 
	    				ss.setAttribute("selMenuUrl", menuMap.get("menuUrl"));
	    				ss.setAttribute("strUpMenuNm", menuMap.get("upMenuNm"));
	    				ss.setAttribute("strUpupMenuNm", menuMap.get("upupMenuNm"));
	    				ss.setAttribute("firstMenuNm", menuMap.get("menuNm"));
	    				ss.setAttribute("selAcceptUseCd", menuMap.get("acceptUseCd"));
	    				selMoveUrl = (String) menuMap.get("menuUrl");
	    				isMain = true;
	    				break;
	    			}
	    		}
    		}
    		
    		
    		if(!isMain){
    			List mainMenuList = cmm4000Service.selectCmm4000LoginMainMenuList(paramMap);
    			String strMenuNm = "";
    			String strMenuId = "";
    			String strMenuUrl = "";
    			String strUpMenuNm = "";
    			String strUpupMenuNm = "";
    			String firstMenuNm = "";
    			
    			if(mainMenuList.size()>1){
    				strMenuNm=(String) ((Map)mainMenuList.get(1)).get("menuNm");
    				strMenuId=(String) ((Map)mainMenuList.get(1)).get("menuId");
    				strMenuUrl=(String) ((Map)mainMenuList.get(1)).get("menuUrl");
    				selMoveUrl = strMenuUrl;
    				strUpMenuNm=(String) ((Map)mainMenuList.get(1)).get("upMenuNm");
    				strUpupMenuNm=(String) ((Map)mainMenuList.get(1)).get("upupMenuNm");
    				firstMenuNm=(String) ((Map)mainMenuList.get(1)).get("menuNm");
    				
    				
    				ss.setAttribute("selMenuId", strMenuId);
    	    		ss.setAttribute("selMenuNm", strMenuNm); 
    	    		ss.setAttribute("selMenuUrl", strMenuUrl);
    	    		ss.setAttribute("selMainUrl", strMenuUrl);
    	    		ss.setAttribute("strUpMenuNm", strUpMenuNm);
					ss.setAttribute("strUpupMenuNm", strUpupMenuNm);
					ss.setAttribute("firstMenuNm", firstMenuNm);	
					
    	    		ss.setAttribute("selAcceptUseCd", ((Map)mainMenuList.get(1)).get("acceptUseCd"));
    			}else{
    				strMenuNm=(String) ((Map)mainMenuList.get(0)).get("menuNm");
    				strMenuId=(String) ((Map)mainMenuList.get(0)).get("menuId");
    				strMenuUrl=(String) ((Map)mainMenuList.get(0)).get("menuUrl");
    				selMoveUrl = strMenuUrl;
    				strUpMenuNm=(String) ((Map)mainMenuList.get(0)).get("upMenuNm");
    				strUpupMenuNm=(String) ((Map)mainMenuList.get(0)).get("upupMenuNm");
    				firstMenuNm=(String) ((Map)mainMenuList.get(0)).get("menuNm");
    				
    				
    				ss.setAttribute("selMenuId", strMenuId);
    	    		ss.setAttribute("selMenuNm", strMenuNm); 
    	    		ss.setAttribute("selMenuUrl", strMenuUrl);
    	    		ss.setAttribute("selMainUrl", strMenuUrl);
    	    		ss.setAttribute("strUpMenuNm", strUpMenuNm);
					ss.setAttribute("strUpupMenuNm", strUpupMenuNm);
					ss.setAttribute("firstMenuNm", firstMenuNm);	
    	    		
    	    		ss.setAttribute("selAcceptUseCd", ((Map)mainMenuList.get(0)).get("acceptUseCd"));
    			}
    		}
    		return "redirect:"+selMoveUrl;
        	
    	}catch(Exception ex){
    		Log.error("selectCmm9000PrjGrpChgView()", ex);
    		throw new Exception(ex.getMessage());
    	}
    }
    
    
    @SuppressWarnings({ "rawtypes", "unchecked" })
    @RequestMapping(value="/cmm/cmm9000/cmm9000/selectCmm9000MenuChgView.do")
    public String selectCmm9000MenuChgView(ModelMap model, HttpServletRequest request, HttpServletResponse response) throws Exception {
    	try{
    		
    		Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
    		
    		
    		String strRsltUrl = paramMap.get("menuUrl");
    		
    		
    		if(strRsltUrl == null){
    			return "forward:/cmm/cmm4000/cmm4000/selectCmm4000LoginAfter.do";
    		}
    		
    		
    		HttpSession ss = request.getSession();
    		LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
    		
    		String prjId = (String) ss.getAttribute("selPrjId");
    		String selAuthGrpId = (String) ss.getAttribute("selAuthGrpId");
    		String usrId = (String) loginVO.getUsrId();
    		String selMenuId = paramMap.get("menuId");
    		
    		paramMap.put("prjId", prjId);
    		paramMap.put("authGrpId", selAuthGrpId);
    		paramMap.put("usrId", usrId);
    		
    		List<Map> menuList = (List) cmm4000Service.selectCmm4000MenuList(paramMap);
    		
    		
    		menuList = moduleUseCheck.moduleUseMenuList(menuList);
    		
    		
    		boolean menuAuthChk = false;
    		
    		
    		if(menuList != null){
    			for(Map menuInfo : menuList){
    				String menuId = (String) menuInfo.get("menuId");
    				if(selMenuId.equals(menuId)){
    					menuAuthChk = true;
    					
    					ss.setAttribute("selMenuId", menuInfo.get("menuId"));
    					ss.setAttribute("selMenuNm", menuInfo.get("menuNm"));
    					ss.setAttribute("selMenuUrl", menuInfo.get("menuUrl"));
    					ss.setAttribute("strUpMenuNm", menuInfo.get("upMenuNm"));
    					ss.setAttribute("strUpupMenuNm", menuInfo.get("upupMenuNm"));
    					ss.setAttribute("firstMenuNm", menuInfo.get("menuNm"));
    					break;
    				}
    			}
    		}
    		
    		if(!menuAuthChk){
    			return "forward:/cmm/cmm4000/cmm4000/selectCmm4000LoginAfter.do";
    		}
    		return "forward:" + strRsltUrl;
    		
    	}catch(Exception ex){
    		Log.error("selectCmm9000MenuChgView()", ex);
    		throw new Exception(ex.getMessage());
    	}
    }
    
    
    @SuppressWarnings({ "rawtypes", "unchecked"})
    @RequestMapping(value="/cmm/cmm9000/cmm9000/selectCmm9000InitHeaderData.do")
    public ModelAndView selectCmm9000InitHeaderData(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
    	
    	try{
    		
    		Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
    		
    		HttpSession ss = request.getSession();
    		LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
    		List<Map> fvrList = null;
    		List<Map> prjList = null;
    		List<Map> authList = null;
    		List<Map> menuList = null;
    		List<Map> usrOptList = null;
    		List<Map> langList = null;
    		Map usrInfo = null;
    		
    		
    		Map<String, String> btnAuthMap = new HashMap<String, String>();
    		
    		if(loginVO != null) {
	    		
	    		paramMap.put("usrId", loginVO.getUsrId());
	    		
	    		
	    		paramMap.put("prjId", (String) ss.getAttribute("selPrjId"));
	
	    		
	    		fvrList = cmm9000Service.selectCmm9000FavoritesList(paramMap); 
	    		
	    		
	    		prjList = (List)prj1000Service.selectPrj1000PrjGrpAllList(paramMap);
	    		
	    		
	    		authList = cmm4000Service.selectCmm4000UsrAuthList(paramMap);
	    		
	    		
	    		paramMap.put("authGrpId", (String)ss.getAttribute("selAuthGrpId"));
	    		paramMap.put("prjTypeCd", (String)ss.getAttribute("selPrjTypeCd"));
	    		paramMap.put("prjDevTypeCd", (String)ss.getAttribute("selPrjDevTypeCd"));
	    		paramMap.put("adminYn", loginVO.getAdmYn());
	    				
	    		
	    		menuList = (List) cmm4000Service.selectCmm4000MenuList(paramMap);

	        	
	    		menuList = moduleUseCheck.moduleUseMenuList(menuList);
	    		
	    		
	    		String selMenuId = (String) ss.getAttribute("selMenuId");
	    		
	    		
				if(menuList != null){
					for(Map menuInfo : menuList){
						String menuId = (String) menuInfo.get("menuId");
						if(selMenuId.equals(menuId)){
							btnAuthMap.put("authAccessYn", (String) menuInfo.get("accessYn"));
							btnAuthMap.put("btnAuthSelectYn", (String) menuInfo.get("selectYn"));
							btnAuthMap.put("btnAuthInsertYn", (String) menuInfo.get("regYn"));
							btnAuthMap.put("btnAuthUpdateYn", (String) menuInfo.get("modifyYn"));
							btnAuthMap.put("btnAuthDeleteYn", (String) menuInfo.get("delYn"));
							btnAuthMap.put("btnAuthExcelYn", (String) menuInfo.get("excelYn"));
							btnAuthMap.put("btnAuthPrintYn", (String) menuInfo.get("printYn"));
						}
					}
				}
				
	    		
	    		usrOptList = stm3001Service.selectStm3001UsrOptList(paramMap);
	    		
	    		
	    		usrInfo = stm3000Service.selectStm3000UsrInfo(paramMap);
	    		
	    		usrInfo.remove("usrPw");
	    		
	    		paramMap.put("mstCd", "OPT00004");
	    		
	    		int langTotalCnt = stm4000Service.selectStm4000CommonCodeDetailListCnt(paramMap);
	    		
	    		paramMap.put("firstIndex", "0");
	    		paramMap.put("lastIndex", String.valueOf(langTotalCnt));
	    		
	    		langList = stm4000Service.selectStm4000CommonCodeDetailList(paramMap);
    		}
    		
    		model.addAttribute("btnAuthMap", btnAuthMap);
    		model.addAttribute("usrOptList", usrOptList);
    		model.addAttribute("fvrList", fvrList);
    		model.addAttribute("prjList", prjList);
    		model.addAttribute("authList", authList);
    		model.addAttribute("menuList", menuList);
    		model.addAttribute("usrInfo", usrInfo);
    		model.addAttribute("langList", langList);
    		model.addAttribute("errorYn", "N");
    		model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
    		return new ModelAndView("jsonView");
    		
    	}catch(Exception ex){
    		Log.error("selectCmm9000InitHeaderData()", ex);
    		model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		return new ModelAndView("jsonView");
    	}
    }
    
    @RequestMapping(value="/cmm/cmm9000/cmm9000/saveCmm9000FavoriteInfo.do")
    public ModelAndView saveCmm9000FavoriteInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
    	
    	try{
    		
    		Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
    		
    		HttpSession ss = request.getSession();
    		LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
    		
    		
    		paramMap.put("usrId", loginVO.getUsrId());
    		
    		
    		paramMap.put("prjId", (String) ss.getAttribute("selPrjId"));
    		
    		String fvrId = (String) paramMap.get("fvrId");
    		
    		
    		int fvrInfoCnt = cmm9000Service.selectCmm9000FvrTypeCntInfo(paramMap);
    		
    		if(fvrInfoCnt > 0) {
    			
    			cmm9000Service.updateCmm9000FavoritesInfo(paramMap);
    		}else {
    			
    			fvrId = cmm9000Service.insertCmm9000FavoritesInfo(paramMap);
    		}
    		
    		model.addAttribute("fvrId", fvrId);
    		model.addAttribute("errorYn", "N");
    		model.addAttribute("message", egovMessageSource.getMessage("success.common.save"));
    		return new ModelAndView("jsonView");
    		
    	}catch(Exception ex){
    		Log.error("saveCmm9000FavoriteInfo()", ex);
    		model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.save"));
    		return new ModelAndView("jsonView");
    	}
    }

}
