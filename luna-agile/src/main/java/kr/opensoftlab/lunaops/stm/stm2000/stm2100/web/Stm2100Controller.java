package kr.opensoftlab.lunaops.stm.stm2000.stm2100.web;

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
import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.lunaops.stm.stm2000.stm2100.service.Stm2100Service;
import kr.opensoftlab.sdf.util.RequestConvertor;



@Controller
public class Stm2100Controller {

	
	private static final Logger Log = Logger.getLogger(Stm2100Controller.class);

	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	
	@Resource(name = "stm2100Service")
	private Stm2100Service stm2100Service;


	
	@RequestMapping(value="/stm/stm2000/stm2100/selectStm2104View.do")
	public String selectStm2104View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/stm/stm2000/stm2100/stm2104";
	}
	
	
	@RequestMapping(value="/stm/stm2000/stm2100/selectStm2100View.do")
	public String selectStm2100View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/stm/stm2000/stm2100/stm2100";
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/stm/stm2000/stm2100/selectStm2100UserCheckAjax.do")
	public ModelAndView selectStm2100UserCheckAjax( HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);

			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("usrId", loginVO.getUsrId());
			paramMap.put("prjId", (String) ss.getAttribute("selPrjId"));
			paramMap.put("prjGrpId", (String) ss.getAttribute("selPrjGrpId"));
			paramMap.put("licGrpId", loginVO.getLicGrpId());

			
			Map result = stm2100Service.selectStm2100UserCheck(paramMap);
			
			
			int len = stm2100Service.selectStm2120BadWtList(paramMap).size();
			if(len == 0) {
				
				result.put("resultWriter", "B");
			}
			model.addAttribute("result", result);

			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectStm2100BadList()", ex);
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/stm/stm2000/stm2100/selectStm2100ListAjax.do")
	public ModelAndView selectStm2100ListAjax( HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);

			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());

			
			List<Map> stm2100List = stm2100Service.selectStm2100BadList(paramMap);
			
			
			model.addAttribute("data", stm2100List);

			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectStm2100BadList()", ex);
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}

	
	@RequestMapping(value="/stm/stm2000/stm2100/selectStm2101View.do")
	public String selectStm2101View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/stm/stm2000/stm2100/stm2101";
	}

	
	@RequestMapping(value="/stm/stm2000/stm2100/selectStm2101BadInfoAjax.do")
	public ModelAndView selectStm2101BadInfoAjax( HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
	
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("prjId", (String) ss.getAttribute("selPrjId"));
			paramMap.put("licGrpId", loginVO.getLicGrpId());
	
			
			Map<String, String> stm2100Info = stm2100Service.selectStm2100BadInfo(paramMap);
	
			model.addAttribute("badInfo", stm2100Info); 
						
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
	
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectStm2101BadInfoAjax()", ex);
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/stm/stm2000/stm2100/selectStm2101BadChargerListAjax.do")
	public ModelAndView selectStm2101BadChargerListAjax( HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			
			
			List<Map> stm2110List = stm2100Service.selectStm2110BadAdmList(paramMap);
			
			model.addAttribute("badChargerList", stm2110List); 
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectStm2101BadChargerListAjax()", ex);
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/stm/stm2000/stm2100/selectStm2101BadWriterListAjax.do")
	public ModelAndView selectStm2101BadWriterListAjax( HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("prjId", (String) ss.getAttribute("selPrjId"));
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			
			
			List<Map> stm2120List = stm2100Service.selectStm2120BadWtList(paramMap);
			
			model.addAttribute("badWriterList", stm2120List); 
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectStm2101BadWriterListAjax()", ex);
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}

	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/stm/stm2000/stm2100/selectStm2101BadGrpAndUsrListAjax.do")
	public ModelAndView selectStm2101BadGrpAndUsrListAjax( HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("prjId", (String) ss.getAttribute("selPrjId"));
			paramMap.put("prjGrpId", (String) ss.getAttribute("selPrjGrpId"));
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			
			List<Map> stmGrpList = stm2100Service.selectStm2100BadGrpList(paramMap);
			List<Map> stmUsrList = stm2100Service.selectStm2100BadUsrList(paramMap);
			
			
			model.addAttribute("badGrpList", stmGrpList);
			model.addAttribute("badUsrList", stmUsrList);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectStm2101BadGrpAndUsrListAjax()", ex);
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/stm/stm2000/stm2100/updateStm2100BadTypeAjax.do")
	public ModelAndView updateStm2100BadTypeAjax( HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			
			
			String str = paramMap.get("stmAdmList");
			str = str.replace("managerNum", "stmAdminCd");
			str = str.replace("managerId", "stmAdminId");
			str = str.replace("managerPrjId", "prjId");
			paramMap.put("stmAdmList", str);
			
			str = paramMap.get("stmWtList");
			str = str.replace("managerNum", "stmWtCd");
			str = str.replace("managerId", "stmWtId");
			str = str.replace("managerPrjId", "prjId");
			paramMap.put("stmWtList", str);
			
			
			stm2100Service.updateStm2100BadOptions(paramMap);
			
			
			model.addAttribute("errorYn", "N"); 
			model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("updateStm2100BadTypeAjax()", ex);
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.update"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/stm/stm2000/stm2100/selectStm2102View.do")
	public String selectStm2102View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/stm/stm2000/stm2100/stm2102";
	}

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/stm/stm2000/stm2100/selectStm2102BadSummeryInfoAjax.do")
	public ModelAndView selectStm2102BadSummeryInfoAjax( HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
        	Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
        	
        	
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());

			
        	
        	Map<String, String> ntcInfo = new HashMap<>();
        	ntcInfo = stm2100Service.selectBad1000NtcCurrent(paramMap);
        	if(ntcInfo != null && !ntcInfo.isEmpty()) {
        		model.addAttribute("ntcInfo", ntcInfo);
        		
        		System.out.println(stm2100Service.selectBad1000NtcCnt(paramMap));
        		ntcInfo.put("cnt", stm2100Service.selectBad1000NtcCnt(paramMap));
        	}else {
        		model.addAttribute("ntcInfo", "N");
        	}
        	
        	
        	Map<String, String> badCntInfo = new HashMap<>();
        	badCntInfo = stm2100Service.selectBad1000WriteCntInfo(paramMap);
        	if(badCntInfo != null && !badCntInfo.isEmpty()) {
        		model.addAttribute("badCntInfo", badCntInfo);
        	}else {
        		model.addAttribute("badCntInfo", "N");
        	}
        	
        	Map<String, String> badHitInfo = new HashMap<>();
        	badHitInfo = stm2100Service.selectBad1000HitMaxInfo(paramMap);
        	if(badHitInfo != null && !badHitInfo.isEmpty()) {
        		model.addAttribute("badHitInfo", badHitInfo);
        	}else {
        		model.addAttribute("badHitInfo", "N");
        	}
        	
        	String pwCnt = stm2100Service.selectBad1000PwCnt(paramMap);
        	model.addAttribute("pwCnt", pwCnt);
        	
        	Map<String, String> fileSummery = new HashMap<>();
        	fileSummery = stm2100Service.selectBad1000FileSummery(paramMap);
        	if(fileSummery != null && !fileSummery.isEmpty()) {
        		model.addAttribute("fileSummery", fileSummery);
        	}else {
        		model.addAttribute("fileSummery", "N");
        	}
        	
        	Map<String, String> badCmtInfo = stm2100Service.selectBad1100CmtMaxInfo(paramMap);
        	if(badCmtInfo != null && !badCmtInfo.isEmpty()) {
        		int allCnt = stm2100Service.selectBad1100CmtAllCnt(paramMap);
        		badCmtInfo.put("allCnt", Integer.toString(allCnt));
            	
            	model.addAttribute("badCmtInfo", badCmtInfo);
        	}else {
        		model.addAttribute("badCmtInfo", "N");
        	}
        	
        	List<Map> tagInfo = stm2100Service.selectTag1000TopInfo(paramMap);
        	if(tagInfo != null && !tagInfo.isEmpty()) {
            	model.addAttribute("tagInfo", tagInfo);
        	}else {
        		model.addAttribute("tagInfo", "N");
        	}
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectStm2102BadSummeryInfoAjax()", ex);
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
}
