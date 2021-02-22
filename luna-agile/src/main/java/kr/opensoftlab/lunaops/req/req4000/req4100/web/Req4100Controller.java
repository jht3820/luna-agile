package kr.opensoftlab.lunaops.req.req4000.req4100.web;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.service.FileVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.opensoftlab.lunaops.com.fms.web.service.FileMngService;
import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.lunaops.req.req4000.req4100.service.Req4100Service;
import kr.opensoftlab.lunaops.stm.stm3000.stm3000.service.Stm3000Service;
import kr.opensoftlab.sdf.util.OslStringUtil;
import kr.opensoftlab.sdf.util.PagingUtil;
import kr.opensoftlab.sdf.util.RequestConvertor;



@Controller
public class Req4100Controller {

	
	private static final Logger Log = Logger.getLogger(Req4100Controller.class);

	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	
	@Resource(name = "req4100Service")
	private Req4100Service req4100Service;
	
	
	@Resource(name = "stm3000Service")
	private Stm3000Service stm3000Service;
	
	
   	@Resource(name="fileMngService")
   	private FileMngService fileMngService;
   	
   	
	@Resource(name="EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;

	
	
	@RequestMapping(value="/req/req4000/req4100/selectReq4100View.do")
	public String selectReq4100ReqListView(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
			return "/req/req4000/req4100/req4100";
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/req/req4000/req4100/selectReq4100ReqListAjax.do")
	public ModelAndView selectReq4100ReqListAjax(HttpServletRequest request, ModelMap model) throws Exception {
		try {
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			
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
			
			
			int totCnt = req4100Service.selectReq4100ReqListCnt(paramMap);
			
			
			PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(_pageNo_str, _pageSize_str);

			
			paginationInfo.setTotalRecordCount(totCnt);
			paramMap = PagingUtil.getPageSettingMap(paramMap, paginationInfo);
			
			
			Map<String, Object> metaMap = PagingUtil.getPageReturnMap(paginationInfo);
			
			
			List<Map> req4100List = req4100Service.selectReq4100ReqList(paramMap);

			
			metaMap.put("sort", sortDirection);
			metaMap.put("field", sortFieldId);
			
			
			model.addAttribute("data", req4100List);
			model.addAttribute("meta", metaMap);

			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("selectReq4100ReqListAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/req/req4000/req4100/selectReq4100PrepListAjax.do")
	public ModelAndView selectReq4100PrepListAjax(HttpServletRequest request, ModelMap model) throws Exception {
		try {
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			
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
			
			
			int totCnt = req4100Service.selectReq4100PrepListCnt(paramMap);
			
			
			PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(_pageNo_str, _pageSize_str);
			
			
			paginationInfo.setTotalRecordCount(totCnt);
			paramMap = PagingUtil.getPageSettingMap(paramMap, paginationInfo);
			
			
			Map<String, Object> metaMap = PagingUtil.getPageReturnMap(paginationInfo);
			
			
			List<Map> req4100PrepList = req4100Service.selectReq4100PrepList(paramMap);
			
			
			metaMap.put("sort", sortDirection);
			metaMap.put("field", sortFieldId);
			
			
			model.addAttribute("data", req4100PrepList);
			model.addAttribute("meta", metaMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("selectReq4100PrepListAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/req/req4000/req4100/selectReq4101View.do")
	public String selectReq4101ReqInfoView(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
			return "/req/req4000/req4100/req4101";
	}
	
	
	@RequestMapping(value="/req/req4000/req4100/insertReq4101ReqAtchFileInfo.do")
	public ModelAndView insertReq4101ReqAtchFileInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			MultipartHttpServletRequest mptRequest = (MultipartHttpServletRequest)request;
			
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			
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
			
			String atchFileId = (String) paramMap.get("atchFileId");
			String fileSn = (String) paramMap.get("fileSn");
			
			
			List<FileVO> _result = fileUtil.fileUploadInsert(mptRequest, atchFileId, Integer.parseInt(fileSn), "Req");
			
			
			fileMngService.insertFileDetail(_result);  
			
			
			
			model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("insertReq4101ReqAtchFileInfo()", ex);

			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/req/req4000/req4100/insertReq4101ReqInfoAjax.do")
	public ModelAndView insertReq4101ReqInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
						
			
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
			
			
			Object insertKey = req4100Service.saveReq4100ReqInfo(paramMap);
			paramMap.put("reqId", (String)insertKey);

			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("insertReq4101ReqInfoAjax()", ex);

			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/req/req4000/req4100/selectReq4103View.do")
	public String selectReq4103View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
			return "/req/req4000/req4100/req4103";
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value="/req/req4000/req4100/selectReq4103UsrListAjax.do")
	public ModelAndView selectReq4103UsrListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try {
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			
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
			
			
			int totCnt = stm3000Service.selectStm3000UsrListCnt(paramMap);
			
			
			PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(_pageNo_str, _pageSize_str);
			
			
			paginationInfo.setTotalRecordCount(totCnt);
			paramMap = PagingUtil.getPageSettingMap(paramMap, paginationInfo);
			
			
			Map<String, Object> metaMap = PagingUtil.getPageReturnMap(paginationInfo);
			
			
			List<Map> req4103UsrList = stm3000Service.selectStm3000UsrList(paramMap);
			
			
			metaMap.put("sort", sortDirection);
			metaMap.put("field", sortFieldId);
			
			
			model.addAttribute("data", req4103UsrList);
			model.addAttribute("meta", metaMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("selectReq4103UsrListAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/req/req4000/req4100/updateReq4101ReqInfoAjax.do")
	public ModelAndView updateReq4101ReqInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			
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
			
			
			req4100Service.saveReq4100ReqInfo(paramMap);
			
			
			model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("updateReq4101ReqInfoAjax()", ex);

			
			model.addAttribute("saveYN", "N");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.update"));
			return new ModelAndView("jsonView");
		}
	}

	
	@RequestMapping(value="/req/req4000/req4100/selectReq4102View.do")
	public String selectReq4102View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			String fileSumMaxSize = EgovProperties.getProperty("Globals.lunaops.fileSumMaxSize");
			model.addAttribute("fileSumMaxSize",fileSumMaxSize);
			model.addAttribute("type",paramMap.get("type"));
			
			return "/req/req4000/req4100/req4102";
		}
		catch(Exception ex){
			Log.error("selectReq4102View()", ex);
			throw new Exception(ex.getMessage());
		}
	}
	
	
	@RequestMapping(value="/req/req4000/req4100/selectReq4100UserCheckAjax.do")
	public ModelAndView selectReq4100UserCheckAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model )	throws Exception {
    	try{
    		
        	Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
						
			
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
		
			String licGrpId = ((LoginVO) ss.getAttribute("loginVO")).getLicGrpId();
			paramMap.put("licGrpId", licGrpId);

			String reqAuth = req4100Service.selectReq4100UserCheck(paramMap);
			model.addAttribute("reqAuth", reqAuth);
			
        	
        	model.addAttribute("errorYn", "N");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
        	
        	return new ModelAndView("jsonView");
        	
    	}catch(Exception ex){
    		Log.error("selectReq4100UserCheckAjax()", ex);
    		
    		model.addAttribute("errorYn", "Y");
        	model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
    		throw new Exception(ex.getMessage());
    	}
    }
	
	
    @SuppressWarnings({ "rawtypes" })
	@RequestMapping(value="/req/req4000/req4100/selectReq4100ReqInfoAjax.do")
	public ModelAndView selectReq4100ReqInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model )	throws Exception {
    	try{
    		
        	Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
        	
        	
			HttpSession ss = request.getSession();
			String licGrpId = ((LoginVO) ss.getAttribute("loginVO")).getLicGrpId();
			paramMap.put("licGrpId", licGrpId);
			
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
			
        	
        	Map reqInfoMap = (Map) req4100Service.selectReq4100ReqInfo(paramMap);        	
        	model.addAttribute("reqInfoMap", reqInfoMap);

        	List<FileVO> fileList = null;
        	int fileCnt = 0;
        	
        	if(reqInfoMap != null){
        		
            	FileVO fileVO = new FileVO();
	        	fileVO.setAtchFileId((String)reqInfoMap.get("atchFileId"));
	        	
	        	
				fileList = fileMngService.fileDownList(fileVO);
				
				
				
				for(FileVO temp : fileList){
					if(fileCnt < Integer.parseInt(temp.getFileSn())){
						fileCnt = Integer.parseInt(temp.getFileSn());
					}
				}
        	}else {
        		model.addAttribute("errorYn", "Y");
            	model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
        	}
			model.addAttribute("fileList",fileList);
			model.addAttribute("fileListCnt",fileCnt);
			
        	
        	model.addAttribute("errorYn", "N");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        	
        	return new ModelAndView("jsonView");
        	
    	}catch(Exception ex){
    		Log.error("selectReq1000ReqInfoAjax()", ex);
    		
    		model.addAttribute("errorYn", "Y");
        	model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		throw new Exception(ex.getMessage());
    	}
    }
    
    
	@RequestMapping(value="/req/req4000/req4100/deleteReq4100ReqListAjax.do")
	public ModelAndView deleteReq4100ReqListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model )	throws Exception {
    	try{
    		
        	Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
        	
        	
			HttpSession ss = request.getSession();
			String licGrpId = ((LoginVO) ss.getAttribute("loginVO")).getLicGrpId();
			paramMap.put("licGrpId", licGrpId);
			
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

			req4100Service.deleteReq4100ReqList(paramMap);
			
        	
        	model.addAttribute("errorYn", "N");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
        	
        	return new ModelAndView("jsonView");
        	
    	}catch(Exception ex){
    		Log.error("deleteReq4100ReqInfoAjax()", ex);
    		
    		model.addAttribute("errorYn", "Y");
        	model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
    		throw new Exception(ex.getMessage());
    	}
    }
	
	
	@RequestMapping(value="/req/req4000/req4100/selectReq4104View.do")
	public String selectReq4104View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/req/req4000/req4100/req4104";
	}
	
	
	@RequestMapping(value="/req/req4000/req4100/selectReq4100PwCheckAjax.do")
	public ModelAndView selectReq4100PwCheckAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model )	throws Exception {
    	try{
    		
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

			String resultPwCheck = req4100Service.selectReq4100ReqPwCheck(paramMap);
			model.addAttribute("resultPwCheck", resultPwCheck);
			
        	
        	model.addAttribute("errorYn", "N");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        	
        	return new ModelAndView("jsonView");
        	
    	}catch(Exception ex){
    		Log.error("selectReq4100PwCheckAjax()", ex);
    		
    		model.addAttribute("errorYn", "Y");
        	model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		throw new Exception(ex.getMessage());
    	}
    }
	
	   
	@RequestMapping(value="/req/req4000/req4100/insertReq4100ReqCopyAjax.do")
	public ModelAndView insertReq4100ReqCopyAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model )	throws Exception {
    	try{
    		
        	Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
        	
        	
			HttpSession ss = request.getSession();
			String licGrpId = ((LoginVO) ss.getAttribute("loginVO")).getLicGrpId();
			paramMap.put("licGrpId", licGrpId);
			
			
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
			
			
			String reqId = req4100Service.insertReq4100ReqCopy(paramMap);
			model.addAttribute("reqId", reqId);
			
        	
        	model.addAttribute("errorYn", "N");
        	model.addAttribute("message", egovMessageSource.getMessage("req4100.success.copy"));
        	
        	return new ModelAndView("jsonView");
        	
    	}catch(Exception ex){
    		Log.error("insertReq4100ReqCopyAjax()", ex);
    		
    		model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("req4100.fail.copy"));
    		throw new Exception(ex.getMessage());
    	}
    }
}
