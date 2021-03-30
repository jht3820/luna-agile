package kr.opensoftlab.lunaops.stm.stm9000.stm9200.web;

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
import kr.opensoftlab.lunaops.stm.stm9000.stm9200.service.Stm9200Service;
import kr.opensoftlab.sdf.util.OslStringUtil;
import kr.opensoftlab.sdf.util.PagingUtil;
import kr.opensoftlab.sdf.util.RequestConvertor;


@Controller
public class Stm9200Controller {

	
	private static final Logger Log = Logger.getLogger(Stm9200Controller.class);

	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	
	@Resource(name = "stm9200Service")
	private Stm9200Service stm9200Service;
	
	
	@RequestMapping(value="/stm/stm9000/stm9200/selectStm9200View.do")
	public String selectStm9200View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/stm/stm9000/stm9200/stm9200";
	}
	
	
	@RequestMapping(value="/stm/stm9000/stm9200/selectStm9201View.do")
	public String selectStm9201View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/stm/stm9000/stm9200/stm9201";
	}
	

	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/stm/stm9000/stm9200/selectStm9200PrjAssignJenkinsJobListAjax.do")
	public ModelAndView selectStm9200PrjAssignJenkinsJobListAjax(HttpServletRequest request, ModelMap model) throws Exception {
		try {
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			
			String paramPrjGrpId = paramMap.get("prjGrpId");
			String paramPrjId = paramMap.get("prjId");
						
			
			String sortFieldId = (String) paramMap.get("sortFieldId");
			sortFieldId = OslStringUtil.replaceRegex(sortFieldId,"[^A-Za-z0-9+]*");
			String sortDirection = (String) paramMap.get("sortDirection");
			String paramSortFieldId = OslStringUtil.convertUnderScope(sortFieldId);
			paramMap.put("paramSortFieldId", paramSortFieldId);
			
			
			
			String _pageNo_str = paramMap.get("pagination[page]");
			String _pageSize_str = paramMap.get("pagination[perpage]");
			
			
			int totCnt = 0;

			
			Map<String, Object> pageMap = null;
			
			
			List<Map> prjAssignJobList = null;
			
			
			if(paramPrjGrpId != null && !"".equals(paramPrjGrpId) && paramPrjId != null && !"".equals(paramPrjId) ) {
				
				
				PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(_pageNo_str, _pageSize_str);

				
				totCnt = stm9200Service.selectStm9200PrjAssignJenkinsJobListCnt(paramMap);
				
				
				paginationInfo.setTotalRecordCount(totCnt);
				paramMap = PagingUtil.getPageSettingMap(paramMap, paginationInfo);
				
				
				pageMap = PagingUtil.getPageReturnMap(paginationInfo);
				
				
				prjAssignJobList = stm9200Service.selectStm9200PrjAssignJenkinsJobList(paramMap);
				
				
				pageMap.put("sort", sortDirection);
				pageMap.put("field",sortFieldId);
			}
		
			
			model.addAttribute("data", prjAssignJobList);
			model.addAttribute("meta", pageMap);

			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("selectStm9200PrjAssignJenkinsJobListAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/stm/stm9000/stm9200/selectStm9200PrjNotAssignJenkinsJobListAjax.do")
	public ModelAndView selectStm9200PrjNotAssignJenkinsJobListAjax(HttpServletRequest request, ModelMap model) throws Exception {
		try {
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			
			String paramPrjGrpId = paramMap.get("prjGrpId");
			String paramPrjId = paramMap.get("prjId");
						
			
			String sortFieldId = (String) paramMap.get("sortFieldId");
			sortFieldId = OslStringUtil.replaceRegex(sortFieldId,"[^A-Za-z0-9+]*");
			String sortDirection = (String) paramMap.get("sortDirection");
			String paramSortFieldId = OslStringUtil.convertUnderScope(sortFieldId);
			paramMap.put("paramSortFieldId", paramSortFieldId);
			
			
			
			String _pageNo_str = paramMap.get("pagination[page]");
			String _pageSize_str = paramMap.get("pagination[perpage]");
			
			
			int totCnt = 0;

			
			Map<String, Object> pageMap = null;
			
			
			List<Map> prjNotAssignJobList = null;
			
			
			if(paramPrjGrpId != null && !"".equals(paramPrjGrpId) && paramPrjId != null && !"".equals(paramPrjId) ) {
				
				
				PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(_pageNo_str, _pageSize_str);

				
				totCnt = stm9200Service.selectStm9200PrjNotAssignJenkinsJobListCnt(paramMap);
				
				
				paginationInfo.setTotalRecordCount(totCnt);
				paramMap = PagingUtil.getPageSettingMap(paramMap, paginationInfo);
				
				
				pageMap = PagingUtil.getPageReturnMap(paginationInfo);
				
				
				prjNotAssignJobList = stm9200Service.selectStm9200PrjNotAssignJenkinsJobList(paramMap);
				
				
				pageMap.put("sort", sortDirection);
				pageMap.put("field",sortFieldId);
			}
		
			
			model.addAttribute("data", prjNotAssignJobList);
			model.addAttribute("meta", pageMap);

			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("selectStm9200PrjNotAssignJenkinsJobListAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	

	
	@RequestMapping(value = "/stm/stm9000/stm9200/insertStm9200JenkinsJobListAjax.do")
	public ModelAndView insertStm9200JenkinsJobListAjax(HttpServletRequest request, ModelMap model) throws Exception {
		try {
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
						
			String paramPrjGrpId = paramMap.get("paramPrjGrpId");
			String paramPrjId = paramMap.get("paramPrjId");
			
			
			if(paramPrjGrpId == null || "".equals(paramPrjGrpId) || paramPrjId == null || "".equals(paramPrjId)){
				model.addAttribute("errorYn", "N");
				model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
				return new ModelAndView("jsonView");
			}
			
			paramMap.put("prjGrpId", paramPrjGrpId);
			paramMap.put("prjId", paramPrjId);
			
			
			stm9200Service.insertStm9200JenkinsJobInfo(paramMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
			
			return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("insertStm9200JenkinsJobListAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value = "/stm/stm9000/stm9200/deleteStm9200JenkinsJobListAjax.do")
	public ModelAndView deleteStm9200JenkinsJobListAjax(HttpServletRequest request, ModelMap model) throws Exception {
		try {
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			
			String paramPrjGrpId = paramMap.get("paramPrjGrpId");
			String paramPrjId = paramMap.get("paramPrjId");
						
			
			if(paramPrjGrpId == null || "".equals(paramPrjGrpId) || paramPrjId == null || "".equals(paramPrjId)){
				model.addAttribute("errorYn", "N");
				model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
				return new ModelAndView("jsonView");
			}
			
			paramMap.put("prjGrpId", paramPrjGrpId);
			paramMap.put("prjId", paramPrjId);
			
			
			stm9200Service.deleteStm9200JenkinsJobInfo(paramMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
			
			return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("deleteStm9200JenkinsJobListAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value="/stm/stm9000/stm9200/selectStm9200PrjAssignDplAuthListAjax.do")
	public ModelAndView selectStm9200PrjAssignDplAuthListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			
			String _pageNo_str = paramMap.get("pagination[page]");
			String _pageSize_str = paramMap.get("pagination[perpage]");
			
			
			String paramPrjId = (String) paramMap.get("dtParamPrjId");
			
			
			if(paramPrjId == null || "".equals(paramPrjId)) {
				model.addAttribute("errorYn", "N");
				model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
				return new ModelAndView("jsonView");
			}
			
			
			paramMap.put("prjId",paramPrjId );
			
			
			String sortFieldId = (String) paramMap.get("sortFieldId");
			sortFieldId = OslStringUtil.replaceRegex(sortFieldId,"[^A-Za-z0-9+]*");
			String sortDirection = (String) paramMap.get("sortDirection");
			String paramSortFieldId = OslStringUtil.convertUnderScope(sortFieldId);
			paramMap.put("paramSortFieldId", paramSortFieldId);
			
			
			
			int totCnt = stm9200Service.selectStm9200PrjAssignDplAuthListCnt(paramMap);

			
			PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(_pageNo_str, _pageSize_str);

			
			paginationInfo.setTotalRecordCount(totCnt);
			paramMap = PagingUtil.getPageSettingMap(paramMap, paginationInfo);

			
			
			List<Map> stm9200AssignDplAuthList = stm9200Service.selectStm9200PrjAssignDplAuthList(paramMap);
			
			
			
			Map<String, Object> metaMap = PagingUtil.getPageReturnMap(paginationInfo);
			
			
			metaMap.put("sort", sortDirection);
			metaMap.put("field", sortFieldId);
			
			model.addAttribute("data", stm9200AssignDplAuthList);
			model.addAttribute("meta", metaMap);
			
			
			model.addAttribute("errorYn", "N");
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectStm9200PrjAssignDplAuthListAjax()", ex);
			
			model.addAttribute("errorYn", "Y");
			throw new Exception(ex.getMessage());
		}
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value="/stm/stm9000/stm9200/selectStm9200PrjNotAssignDplAuthListAjax.do")
	public ModelAndView selectStm9200PrjNotAssignDplAuthListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			
			String _pageNo_str = paramMap.get("pagination[page]");
			String _pageSize_str = paramMap.get("pagination[perpage]");
			
			
			String paramPrjId = (String) paramMap.get("dtParamPrjId");
			
			
			if(paramPrjId == null || "".equals(paramPrjId)) {
				model.addAttribute("errorYn", "N");
				model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
				return new ModelAndView("jsonView");
			}
			
			
			paramMap.put("prjId",paramPrjId );
			
			
			String sortFieldId = (String) paramMap.get("sortFieldId");
			sortFieldId = OslStringUtil.replaceRegex(sortFieldId,"[^A-Za-z0-9+]*");
			String sortDirection = (String) paramMap.get("sortDirection");
			String paramSortFieldId = OslStringUtil.convertUnderScope(sortFieldId);
			paramMap.put("paramSortFieldId", paramSortFieldId);
			
			
			
			int totCnt = stm9200Service.selectStm9200PrjNotAssignDplAuthListCnt(paramMap);

			
			PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(_pageNo_str, _pageSize_str);

			
			paginationInfo.setTotalRecordCount(totCnt);
			paramMap = PagingUtil.getPageSettingMap(paramMap, paginationInfo);

			
			
			List<Map> stm9200NotAssignDplAuthList = stm9200Service.selectStm9200PrjNotAssignDplAuthList(paramMap);
			
			
			
			Map<String, Object> metaMap = PagingUtil.getPageReturnMap(paginationInfo);
			
			
			metaMap.put("sort", sortDirection);
			metaMap.put("field", sortFieldId);
			
			model.addAttribute("data", stm9200NotAssignDplAuthList);
			model.addAttribute("meta", metaMap);
			
			
			model.addAttribute("errorYn", "N");
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectStm9200PrjNotAssignDplAuthListAjax()", ex);
			
			model.addAttribute("errorYn", "Y");
			throw new Exception(ex.getMessage());
		}
	}
	
	
	@RequestMapping(value = "/stm/stm9000/stm9200/insertStm9200DplAuthInfoAjax.do")
	public ModelAndView insertStm9200DplAuthInfoAjax(HttpServletRequest request, ModelMap model) throws Exception {
		try {
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			stm9200Service.insertStm9200DplAuthInfo(paramMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
			
			return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("insertStm9200DplAuthInfoAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value = "/stm/stm9000/stm9200/deleteStm9200DplAuthInfoAjax.do")
	public ModelAndView deleteStm9200DplAuthInfoAjax(HttpServletRequest request, ModelMap model) throws Exception {
		try {
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			stm9200Service.deleteStm9200DplAuthInfo(paramMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
			
			return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("deleteStm9200DplAuthInfoAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
			return new ModelAndView("jsonView");
		}
	}
}
