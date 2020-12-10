package kr.opensoftlab.lunaops.spr.spr2000.spr2100.web;

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
import kr.opensoftlab.lunaops.spr.spr2000.spr2100.service.Spr2100Service;
import kr.opensoftlab.sdf.util.OslStringUtil;
import kr.opensoftlab.sdf.util.PagingUtil;
import kr.opensoftlab.sdf.util.RequestConvertor;



@Controller
public class Spr2100Controller {

	
	private static final Logger Log = Logger.getLogger(Spr2100Controller.class);

	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	
	@Resource(name = "spr2100Service")
	private Spr2100Service spr2100Service;
	
	
	@RequestMapping(value="/spr/spr2000/spr2100/selectSpr2100View.do")
	public String selectSpr2100View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
			return "/spr/spr2000/spr2100/spr2100";
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/spr/spr2000/spr2100/selectSpr2000MmrListAjax.do")
	public ModelAndView selectSpr2000MmrListAjax(HttpServletRequest request, ModelMap model) throws Exception {
		try {
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			paramMap.put("prjGrpId", (String) ss.getAttribute("selPrjGrpId"));
			paramMap.put("prjId", (String) ss.getAttribute("selPrjId"));
			
			
			String sortFieldId = (String) paramMap.get("sortFieldId");
			sortFieldId = OslStringUtil.replaceRegex(sortFieldId,"[^A-Za-z0-9+]*");
			String sortDirection = (String) paramMap.get("sortDirection");
			String paramSortFieldId = OslStringUtil.convertUnderScope(sortFieldId);
			paramMap.put("paramSortFieldId", paramSortFieldId);
			
			
			
			String _pageNo_str = paramMap.get("pagination[page]");
			String _pageSize_str = paramMap.get("pagination[perpage]");
			
			
			int totCnt = 0;
			
			
			List<Map> spr2100List = null;
			String sprId = (String) paramMap.get("sprId");
			
			
			Map<String, Object> pageMap = null;
			
			
			if(sprId != null && !sprId.isEmpty()) {
				
				PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(_pageNo_str, _pageSize_str);

				
				totCnt = spr2100Service.selectSpr2100MmrListCnt(paramMap);
				
				
				paginationInfo.setTotalRecordCount(totCnt);
				paramMap = PagingUtil.getPageSettingMap(paramMap, paginationInfo);
				
				
				pageMap = PagingUtil.getPageReturnMap(paginationInfo);
				
				
				spr2100List = spr2100Service.selectSpr2100MmrList(paramMap);

				
				pageMap.put("sort", sortDirection);
				pageMap.put("field",sortFieldId);
			}
			
			
			model.addAttribute("data", spr2100List);
			model.addAttribute("meta", pageMap);

			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("selectSpr2000MmrListAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}

	
	@RequestMapping(value="/spr/spr2000/spr2100/saveSpr2101MmrView.do")
	public String saveSpr2101MmrView(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
			return "/spr/spr2000/spr2100/spr2101";
	}
	
	
	@RequestMapping(value = "/spr/spr2000/spr2100/insertSpr2100MmrInfoAjax.do")
	public ModelAndView insertSpr2100MmrInfoAjax(HttpServletRequest request, ModelMap model) throws Exception {
		try {
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			paramMap.put("prjGrpId", (String) ss.getAttribute("selPrjGrpId"));
			paramMap.put("prjId", (String) ss.getAttribute("selPrjId"));
			
			spr2100Service.insertSpr2100MmrInfo(paramMap);

			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
			
			return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("insertSpr2100MmrInfoAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
			return new ModelAndView("jsonView");
		}
	}
}
