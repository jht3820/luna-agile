package kr.opensoftlab.lunaops.arm.arm1000.arm1100.web;

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
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.opensoftlab.lunaops.arm.arm1000.arm1100.service.Arm1100Service;
import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.sdf.util.PagingUtil;
import kr.opensoftlab.sdf.util.RequestConvertor;



@Controller
public class Arm1100Controller {

	
	private static final Logger Log = Logger.getLogger(Arm1100Controller.class);
	
	
    @Resource(name = "arm1100Service")
    private Arm1100Service arm1100Service;
    
    
    @Resource(name = "egovMessageSource")
    EgovMessageSource egovMessageSource;
    
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/arm/arm1000/arm1100/selectArm1100NtfListAjax.do")
	public ModelAndView selectArm1100NtfListAjax(HttpServletRequest request, ModelMap model) throws Exception {
		try {
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			String licGrpId = ((LoginVO) ss.getAttribute("loginVO")).getLicGrpId();
			paramMap.put("licGrpId", licGrpId);
			
			
			String paramUsrId = (String) paramMap.get("usrId");
			
			
			if(paramUsrId == null || "".equals(paramUsrId)) {
				paramUsrId = ((LoginVO) ss.getAttribute("loginVO")).getUsrId();
			}
			
			paramMap.put("usrId", paramUsrId);
			
			
			
			String _pageNo_str = paramMap.get("pagination[page]");
			String _pageSize_str = paramMap.get("pagination[perpage]");
			
			
			int totCnt = arm1100Service.selectArm1100NtfListCnt(paramMap);
			
			
			PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(_pageNo_str, _pageSize_str);

			
			paginationInfo.setTotalRecordCount(totCnt);
			paramMap = PagingUtil.getPageSettingMap(paramMap, paginationInfo);
			
			
			Map<String, Object> metaMap = PagingUtil.getPageReturnMap(paginationInfo);
			
			
			List<Map> arm1100List = arm1100Service.selectArm1100NtfList(paramMap);

			
			Map<String, String> notRead = new HashMap<String, String>();
			notRead.put("get", Integer.toString(arm1100Service.selectArm1100NtfNotReadCnt(paramMap)));
			
			
			model.addAttribute("data", arm1100List);
			model.addAttribute("meta", metaMap);
			model.addAttribute("notRead", notRead);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("selectArm1100NtfListAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/arm/arm1000/arm1100/selectArm1100NtfNotReadCntAjax.do")
	public ModelAndView selectArm1100NtfNotReadCntAjax(HttpServletRequest request, ModelMap model) throws Exception {
		try {
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			String licGrpId = ((LoginVO) ss.getAttribute("loginVO")).getLicGrpId();
			paramMap.put("licGrpId", licGrpId);
			
			
			String paramUsrId = (String) paramMap.get("usrId");
			
			
			if(paramUsrId == null || "".equals(paramUsrId)) {
				paramUsrId = ((LoginVO) ss.getAttribute("loginVO")).getUsrId();
			}
			paramMap.put("usrId", paramUsrId);
			
			
			Map<String, String> notRead = new HashMap<String, String>();
			notRead.put("notReadCnt", Integer.toString(arm1100Service.selectArm1100NtfNotReadCnt(paramMap)));
			
			model.addAttribute("notRead", notRead);

			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("selectArm1100NtfListAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/arm/arm1000/arm1100/insertArm1101NtfInfoAjax.do")
	public ModelAndView insertArm1101NtfInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			String licGrpId = ((LoginVO) ss.getAttribute("loginVO")).getLicGrpId();
			paramMap.put("licGrpId", licGrpId);
			
			
			String paramUsrId = (String) paramMap.get("usrId");
			
			
			if(paramUsrId == null || "".equals(paramUsrId)) {
				paramUsrId = ((LoginVO) ss.getAttribute("loginVO")).getUsrId();
			}
			paramMap.put("usrId", paramUsrId);		

			
			Map<String, String> notRead = new HashMap<String, String>();
			notRead.put("notReadCnt", Integer.toString(arm1100Service.selectArm1100NtfNotReadCnt(paramMap)));
			
			
			arm1100Service.insertArm1101NtfInfo(paramMap);

			
			model.addAttribute("notRead", notRead);
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("insertArm1101NtfInfoAjax()", ex);

			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.update"));
			return new ModelAndView("jsonView");
		}
	}
	
}
