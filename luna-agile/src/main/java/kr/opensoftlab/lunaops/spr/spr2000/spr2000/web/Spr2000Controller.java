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
	@RequestMapping(value = "/spr/spr2000/spr2000/selectSpr2000MmtListAjax.do")
	public ModelAndView selectSpr2000MmtListAjax(HttpServletRequest request, ModelMap model) throws Exception {
		try {
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());

			
			String paramPrjGrpId = (String) paramMap.get("prjGrpId");
			
			
			if(paramPrjGrpId == null || "".equals(paramPrjGrpId)) {
				paramPrjGrpId = (String) ss.getAttribute("selPrjGrpId");
			}
			
			
			String paramPrjId = (String) paramMap.get("prjId");
			
			
			if(paramPrjId == null || "".equals(paramPrjId)) {
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
			
			
			Map<String, Object> metaMap = null;
			
			
			if(sprId != null && !sprId.isEmpty()) {
				
				PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(_pageNo_str, _pageSize_str);
	
				
				totCnt = spr2000Service.selectSpr2000MmtListCnt(paramMap);
				
				
				paginationInfo.setTotalRecordCount(totCnt);
				paramMap = PagingUtil.getPageSettingMap(paramMap, paginationInfo);
				
				
				metaMap = PagingUtil.getPageReturnMap(paginationInfo);
				
				
				spr2000List = spr2000Service.selectSpr2000MmtList(paramMap);
			}
			if(totCnt != 0) {
				
				metaMap.put("sort", sortDirection);
				metaMap.put("field",sortFieldId);
			}

			
			model.addAttribute("data", spr2000List);
			model.addAttribute("meta", metaMap);

			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("selectSpr2000MmtListAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}

	
	@RequestMapping(value="/spr/spr2000/spr2000/saveSpr2001MmtView.do")
	public String insertSpr2000InfoView(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
			return "/spr/spr2000/spr2000/spr2001";
	}
	
	
	@RequestMapping(value = "/spr/spr2000/spr2000/insertSpr2001MmtInfoAjax.do")
	public ModelAndView insertSpr2000MmtInfoAjax(HttpServletRequest request, ModelMap model) throws Exception {
		try {
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());

			
			String paramPrjGrpId = (String) paramMap.get("prjGrpId");
			
			
			if(paramPrjGrpId == null || "".equals(paramPrjGrpId)) {
				paramPrjGrpId = (String) ss.getAttribute("selPrjGrpId");
			}
			
			
			String paramPrjId = (String) paramMap.get("prjId");
			
			
			if(paramPrjId == null || "".equals(paramPrjId)) {
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
			
			paramMap.put("prjGrpId", paramPrjGrpId);
			paramMap.put("prjId", paramPrjId);
			
			spr2000Service.insertSpr2000MmtInfo(paramMap);

			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
			
			return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("insertSpr2000MmtInfoAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	@RequestMapping(value = "/spr/spr2000/spr2000/selectSpr2001MmtUsrListAjax.do")
	public ModelAndView selectSpr2001MmtUsrListAjax(HttpServletRequest request, ModelMap model) throws Exception {
		try {
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());

			
			String paramPrjGrpId = (String) paramMap.get("prjGrpId");
			
			
			if(paramPrjGrpId == null || "".equals(paramPrjGrpId)) {
				paramPrjGrpId = (String) ss.getAttribute("selPrjGrpId");
			}
			
			
			String paramPrjId = (String) paramMap.get("prjId");
			
			
			if(paramPrjId == null || "".equals(paramPrjId)) {
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
			
			paramMap.put("prjGrpId", paramPrjGrpId);
			paramMap.put("prjId", paramPrjId);
			
			paramMap.put("useCd", "01");
			int totCnt = stm3000Service.selectStm3000UsrListCnt(paramMap);
			
			paramMap.put("firstIndex", "0");
			paramMap.put("lastIndex", Integer.toString(totCnt));

			
			List<Map> usrAllList = stm3000Service.selectStm3000UsrList(paramMap);
			
			
			model.addAttribute("usrAllList", usrAllList);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("selectSpr2001MmtUsrListAjax()", ex);
			
			
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
	@RequestMapping(value = "/spr/spr2000/spr2000/selectSpr2000MmtInfoAjax.do")
	public ModelAndView selectSpr2000MmtInfoAjax(HttpServletRequest request, ModelMap model) throws Exception {
		try {
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());

			
			String paramPrjGrpId = (String) paramMap.get("prjGrpId");
			
			
			if(paramPrjGrpId == null || "".equals(paramPrjGrpId)) {
				paramPrjGrpId = (String) ss.getAttribute("selPrjGrpId");
			}
			
			
			String paramPrjId = (String) paramMap.get("prjId");
			
			
			if(paramPrjId == null || "".equals(paramPrjId)) {
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
			
			paramMap.put("prjGrpId", paramPrjGrpId);
			paramMap.put("prjId", paramPrjId);
			
			Map mmtInfo = spr2000Service.selectSpr2000MmtInfo(paramMap);
			List<Map> mmtMemList = spr2000Service.selectSpr2001MmtMemList(paramMap);
			model.addAttribute("mmtInfo", mmtInfo);
			model.addAttribute("mmtMemList", mmtMemList);

			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
			
			return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("selectSpr2000MmtInfoAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
			return new ModelAndView("jsonView");
		}
	}

	
	@RequestMapping(value = "/spr/spr2000/spr2000/updateSpr2001MmtInfoAjax.do")
	public ModelAndView updateSpr2001MmtInfoAjax(HttpServletRequest request, ModelMap model) throws Exception {
		try {
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());

			
			String paramPrjGrpId = (String) paramMap.get("prjGrpId");
			
			
			if(paramPrjGrpId == null || "".equals(paramPrjGrpId)) {
				paramPrjGrpId = (String) ss.getAttribute("selPrjGrpId");
			}
			
			
			String paramPrjId = (String) paramMap.get("prjId");
			
			
			if(paramPrjId == null || "".equals(paramPrjId)) {
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
			
			paramMap.put("prjGrpId", paramPrjGrpId);
			paramMap.put("prjId", paramPrjId);
			
			spr2000Service.updateSpr2000MmtInfo(paramMap);

			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));
			
			return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("updateSpr2001MmtInfoAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.update"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value = "/spr/spr2000/spr2000/deleteSpr2000MmtListAjax.do")
	public ModelAndView deleteSpr2000MmtListAjax(HttpServletRequest request, ModelMap model) throws Exception {
		try {
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());

			
			String paramPrjGrpId = (String) paramMap.get("prjGrpId");
			
			
			if(paramPrjGrpId == null || "".equals(paramPrjGrpId)) {
				paramPrjGrpId = (String) ss.getAttribute("selPrjGrpId");
			}
			
			
			String paramPrjId = (String) paramMap.get("prjId");
			
			
			if(paramPrjId == null || "".equals(paramPrjId)) {
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
			
			paramMap.put("prjGrpId", paramPrjGrpId);
			paramMap.put("prjId", paramPrjId);
			
			spr2000Service.deleteSpr2000MmtList(paramMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
			
			return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("deleteSpr2000MmtListAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
			return new ModelAndView("jsonView");
		}
	}
}
