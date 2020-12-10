package kr.opensoftlab.lunaops.spr.spr2000.spr2000.web;

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
import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.lunaops.spr.spr2000.spr2000.service.Spr2000Service;
import kr.opensoftlab.lunaops.stm.stm3000.stm3000.service.Stm3000Service;
import kr.opensoftlab.sdf.util.OslStringUtil;
import kr.opensoftlab.sdf.util.PagingUtil;
import kr.opensoftlab.sdf.util.RequestConvertor;



@Controller
public class Spr2000Controller {

	
	private static final Logger Log = Logger.getLogger(Spr2000Controller.class);

	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	
	@Resource(name = "spr2000Service")
	private Spr2000Service spr2000Service;
	
	
	@Resource(name = "stm3000Service")
	private Stm3000Service stm3000Service;
	
	
	@RequestMapping(value="/spr/spr2000/spr2000/selectSpr2000View.do")
	public String selectSpr2000SprListView(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
			return "/spr/spr2000/spr2000/spr2000";
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/spr/spr2000/spr2000/selectSpr2000RptListAjax.do")
	public ModelAndView selectSpr2000RptListAjax(HttpServletRequest request, ModelMap model) throws Exception {
		try {
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			String paramPrjGrpId = paramMap.get("prjGrpId");
			String paramPrjId = paramMap.get("prjId");
			
			
			if(paramPrjGrpId == null || "".equals(paramPrjGrpId)) {
				paramPrjGrpId = (String) ss.getAttribute("selPrjGrpId");
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
			
			paramMap.put("prjGrpId", paramPrjGrpId);
			paramMap.put("prjId", paramPrjId);
			
			
			String sortFieldId = (String) paramMap.get("sortFieldId");
			sortFieldId = OslStringUtil.replaceRegex(sortFieldId,"[^A-Za-z0-9+]*");
			String sortDirection = (String) paramMap.get("sortDirection");
			String paramSortFieldId = OslStringUtil.convertUnderScope(sortFieldId);
			paramMap.put("paramSortFieldId", paramSortFieldId);
			
			
			
			String _pageNo_str = paramMap.get("pagination[page]");
			String _pageSize_str = paramMap.get("pagination[perpage]");
			
			
			int totCnt = 0;
			
			
			List<Map> spr2000List = null;
			String sprId = (String) paramMap.get("sprId");
			
			
			Map<String, Object> pageMap = null;
			
			
			if(sprId != null && !sprId.isEmpty()) {
				
				PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(_pageNo_str, _pageSize_str);
	
				
				totCnt = spr2000Service.selectSpr2000RptListCnt(paramMap);
				
				
				paginationInfo.setTotalRecordCount(totCnt);
				paramMap = PagingUtil.getPageSettingMap(paramMap, paginationInfo);
				
				
				pageMap = PagingUtil.getPageReturnMap(paginationInfo);
				
				
				spr2000List = spr2000Service.selectSpr2000RptList(paramMap);
				
				
				pageMap.put("sort", sortDirection);
				pageMap.put("field",sortFieldId);
			}

			
			model.addAttribute("data", spr2000List);
			model.addAttribute("meta", pageMap);

			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("selectSpr2000RptListAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}

	
	@RequestMapping(value="/spr/spr2000/spr2000/saveSpr2001RptView.do")
	public String insertSpr2000InfoView(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
			return "/spr/spr2000/spr2000/spr2001";
	}
	
	
	@RequestMapping(value = "/spr/spr2000/spr2000/insertSpr2001RptInfoAjax.do")
	public ModelAndView insertSpr2000RptInfoAjax(HttpServletRequest request, ModelMap model) throws Exception {
		try {
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			String paramPrjGrpId = paramMap.get("prjGrpId");
			String paramPrjId = paramMap.get("prjId");
			
			
			if(paramPrjGrpId == null || "".equals(paramPrjGrpId)) {
				paramPrjGrpId = (String) ss.getAttribute("selPrjGrpId");
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
			
			paramMap.put("prjGrpId", paramPrjGrpId);
			paramMap.put("prjId", paramPrjId);
			
			spr2000Service.insertSpr2000RptInfo(paramMap);

			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
			
			return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("insertSpr2000RptInfoAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	@RequestMapping(value = "/spr/spr2000/spr2000/selectSpr2001RptUsrListAjax.do")
	public ModelAndView selectSpr2001RptUsrListAjax(HttpServletRequest request, ModelMap model) throws Exception {
		try {
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			String paramPrjGrpId = paramMap.get("prjGrpId");
			String paramPrjId = paramMap.get("prjId");
			
			
			if(paramPrjGrpId == null || "".equals(paramPrjGrpId)) {
				paramPrjGrpId = (String) ss.getAttribute("selPrjGrpId");
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
			
			paramMap.put("prjGrpId", paramPrjGrpId);
			paramMap.put("prjId", paramPrjId);
			int totCnt = stm3000Service.selectStm3000UsrListCnt(paramMap);
			
			paramMap.put("firstIndex", "0");
			paramMap.put("lastIndex", Integer.toString(totCnt));

			
			List<Map> usrAllList = stm3000Service.selectStm3000UsrList(paramMap);
			
			
			model.addAttribute("usrAllList", usrAllList);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("selectSpr2001RptUsrListAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	

	
	@RequestMapping(value="/spr/spr2000/spr2000/selectSpr2002View.do")
	public String selectSpr2002View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
			return "/spr/spr2000/spr2000/spr2002";
	}
	
	
	@SuppressWarnings({ "rawtypes"})
	@RequestMapping(value = "/spr/spr2000/spr2000/selectSpr2000RptInfoAjax.do")
	public ModelAndView selectSpr2000RptInfoAjax(HttpServletRequest request, ModelMap model) throws Exception {
		try {
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			String paramPrjGrpId = paramMap.get("prjGrpId");
			String paramPrjId = paramMap.get("prjId");
			
			
			if(paramPrjGrpId == null || "".equals(paramPrjGrpId)) {
				paramPrjGrpId = (String) ss.getAttribute("selPrjGrpId");
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
			
			paramMap.put("prjGrpId", paramPrjGrpId);
			paramMap.put("prjId", paramPrjId);
			
			Map rptInfo = spr2000Service.selectSpr2000RptInfo(paramMap);
			List<Map> rptMemList = spr2000Service.selectSpr2001RptMemList(paramMap);
			model.addAttribute("rptInfo", rptInfo);
			model.addAttribute("rptMemList", rptMemList);

			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
			
			return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("selectSpr2000RptInfoAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
			return new ModelAndView("jsonView");
		}
	}

	
	@RequestMapping(value = "/spr/spr2000/spr2000/updateSpr2001RptInfoAjax.do")
	public ModelAndView updateSpr2001RptInfoAjax(HttpServletRequest request, ModelMap model) throws Exception {
		try {
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			String paramPrjGrpId = paramMap.get("prjGrpId");
			String paramPrjId = paramMap.get("prjId");
			
			
			if(paramPrjGrpId == null || "".equals(paramPrjGrpId)) {
				paramPrjGrpId = (String) ss.getAttribute("selPrjGrpId");
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
			
			paramMap.put("prjGrpId", paramPrjGrpId);
			paramMap.put("prjId", paramPrjId);
			
			spr2000Service.updateSpr2000RptInfo(paramMap);

			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));
			
			return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("updateSpr2001RptInfoAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.update"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value = "/spr/spr2000/spr2000/deleteSpr2000RptListAjax.do")
	public ModelAndView deleteSpr2000RptListAjax(HttpServletRequest request, ModelMap model) throws Exception {
		try {
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			String paramPrjGrpId = paramMap.get("prjGrpId");
			String paramPrjId = paramMap.get("prjId");
			
			
			if(paramPrjGrpId == null || "".equals(paramPrjGrpId)) {
				paramPrjGrpId = (String) ss.getAttribute("selPrjGrpId");
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
			
			paramMap.put("prjGrpId", paramPrjGrpId);
			paramMap.put("prjId", paramPrjId);
			
			spr2000Service.deleteSpr2000RptList(paramMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
			
			return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("deleteSpr2000RptListAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
			return new ModelAndView("jsonView");
		}
	}
}
