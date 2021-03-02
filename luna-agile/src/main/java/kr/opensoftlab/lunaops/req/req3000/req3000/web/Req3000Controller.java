package kr.opensoftlab.lunaops.req.req3000.req3000.web;

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
import egovframework.com.cmm.service.FileVO;
import egovframework.rte.fdl.cmmn.trace.LeaveaTrace;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.opensoftlab.lunaops.com.fms.web.service.FileMngService;
import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.lunaops.req.req3000.req3000.service.Req3000Service;
import kr.opensoftlab.sdf.util.OslStringUtil;
import kr.opensoftlab.sdf.util.PagingUtil;
import kr.opensoftlab.sdf.util.RequestConvertor;



@Controller
public class Req3000Controller {

	
	private final Logger Log = Logger.getLogger(this.getClass());
	
	
	@Resource(name = "req3000Service")
	private Req3000Service req3000Service;
	
	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	
	@Resource(name = "leaveaTrace")
	LeaveaTrace leaveaTrace;
	
	
   	@Resource(name="fileMngService")
   	private FileMngService fileMngService;
	
   	@Resource(name = "egovFileIdGnrService")
	private EgovIdGnrService idgenService;
   	
   	
	@Resource(name="EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;
	
	
	@RequestMapping(value="/req/req3000/req3000/selectReq3000View.do")
	public String selectReq3000View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/req/req3000/req3000/req3000";
	}
	
	@RequestMapping(value="/req/req3000/req3000/selectReq3002View.do")
	public String selectReq3002View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/req/req3000/req3000/req3002";
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value="/req/req3000/req3000/selectReq3000ListAjaxView.do")
	public ModelAndView selectReq3000List(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			
			String _pageNo_str = paramMap.get("pagination[page]");
			String _pageSize_str = paramMap.get("pagination[perpage]");
			
			
			String paramPrjId = (String) paramMap.get("dtParamPrjId");
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			
		
			
			if(paramPrjId == null || "".equals(paramPrjId)) {
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
			paramMap.put("prjId", paramPrjId);
			
			
			String sortFieldId = (String) paramMap.get("sortFieldId");
			sortFieldId = OslStringUtil.replaceRegex(sortFieldId,"[^A-Za-z0-9+]*");
			String sortDirection = (String) paramMap.get("sortDirection");
			String paramSortFieldId = OslStringUtil.convertUnderScope(sortFieldId);
			paramMap.put("paramSortFieldId", paramSortFieldId);
			
			
			paramMap.put("reqUsrId", loginVO.getUsrId());

			
			/
			/
			
			Map<String, Object> metaMap = PagingUtil.getPageReturnMap(paginationInfo);
			
			
			metaMap.put("sort", sortDirection);
			metaMap.put("field", sortFieldId);
			
			model.addAttribute("data", req3000List);
			model.addAttribute("meta", metaMap);
			
			
			model.addAttribute("errorYn", "N");
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectReq1000ListView()", ex);
			
			model.addAttribute("errorYn", "Y");
			throw new Exception(ex.getMessage());
		}

	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value="/req/req3000/req3000/selectReq3001ListAjaxView.do")
	public ModelAndView selectReq3001List(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			
			String _pageNo_str = paramMap.get("pagination[page]");
			String _pageSize_str = paramMap.get("pagination[perpage]");
			
			
			String paramPrjId = (String) paramMap.get("dtParamPrjId");
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			
			
			if(paramPrjId == null || "".equals(paramPrjId)) {
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
			paramMap.put("prjId", paramPrjId);
			
			
			String sortFieldId = (String) paramMap.get("sortFieldId");
			sortFieldId = OslStringUtil.replaceRegex(sortFieldId,"[^A-Za-z0-9+]*");
			String sortDirection = (String) paramMap.get("sortDirection");
			String paramSortFieldId = OslStringUtil.convertUnderScope(sortFieldId);
			paramMap.put("paramSortFieldId", paramSortFieldId);
			
			
			paramMap.put("reqUsrId", loginVO.getUsrId());
			
			
			/
			/
			
			Map<String, Object> metaMap = PagingUtil.getPageReturnMap(paginationInfo);
			
			
			metaMap.put("sort", sortDirection);
			metaMap.put("field", sortFieldId);
			
			model.addAttribute("data", req3000List);
			model.addAttribute("meta", metaMap);
			
			
			model.addAttribute("errorYn", "N");
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectReq1000ListView()", ex);
			
			model.addAttribute("errorYn", "Y");
			throw new Exception(ex.getMessage());
		}
		
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value="/req/req3000/req3000/selectReq3002ListAjaxView.do")
	public ModelAndView selectReq3002List(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			
			String _pageNo_str = paramMap.get("pagination[page]");
			String _pageSize_str = paramMap.get("pagination[perpage]");
			
			
			String paramPrjId = (String) paramMap.get("dtParamPrjId");
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			
			
			if(paramPrjId == null || "".equals(paramPrjId)) {
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
			paramMap.put("prjId", paramPrjId);
			
			
			String sortFieldId = (String) paramMap.get("sortFieldId");
			sortFieldId = OslStringUtil.replaceRegex(sortFieldId,"[^A-Za-z0-9+]*");
			String sortDirection = (String) paramMap.get("sortDirection");
			String paramSortFieldId = OslStringUtil.convertUnderScope(sortFieldId);
			paramMap.put("paramSortFieldId", paramSortFieldId);
			
			
			paramMap.put("reqUsrId", loginVO.getUsrId());
			
			
			/
			/
			
			Map<String, Object> metaMap = PagingUtil.getPageReturnMap(paginationInfo);
			
			
			metaMap.put("sort", sortDirection);
			metaMap.put("field", sortFieldId);
			
			model.addAttribute("data", req3000List);
			model.addAttribute("meta", metaMap);
			
			
			model.addAttribute("errorYn", "N");
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectReq1000ListView()", ex);
			
			model.addAttribute("errorYn", "Y");
			throw new Exception(ex.getMessage());
		}
		
	}
	
	
	@RequestMapping(value="/req/req3000/req3000/selectReq3001View.do")
    public String selectReq3001View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	return "/req/req3000/req3000/req3001";
    }
	
	
	@RequestMapping(value="/req/req3000/req3000/insertReq3001ReqAtchFileInfo.do")
	public ModelAndView insertReq1001ReqAtchFileId(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

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
			
			
			List<FileVO> _result = fileUtil.fileUploadInsert(mptRequest,atchFileId,Integer.parseInt(fileSn),"Req");
			
			
			fileMngService.insertFileDetail(_result);  
			
			
			
			model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("insertReq3001ReqAtchFileId()", ex);

			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
			return new ModelAndView("jsonView");
		}
	}

	
	@RequestMapping(value="/req/req3000/req3000/insertReq3001ReqGrpInfoAjax.do")
	public ModelAndView insertReq3001ReqGrpInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try {
			
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			
			
			Object paramPrjGrpId =  paramMap.get("prjGrpId");
			
			
			if(paramPrjGrpId == null || "".equals(paramPrjGrpId)) {
				paramPrjGrpId = (String) ss.getAttribute("selPrjGrpId");
			}
			
			
			String paramPrjId = (String) paramMap.get("prjId");
			
			
			
			if(paramPrjId == null || "".equals(paramPrjId)) {
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
			
			paramMap.put("prjGrpId", (String) paramPrjGrpId);
			paramMap.put("prjId", paramPrjId);
			
			
			
			Object insertKey = req3000Service.saveReq3000ReqGrpInfo(paramMap);
			paramMap.put("reqId", (String) insertKey);

			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));

			
			return new ModelAndView("jsonView", model);
			
		}
		catch(Exception ex){
			
			Log.error("insertReq3001ReqGrpInfoAjax()", ex);

			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));

			return new ModelAndView("jsonView");
			
		}
		
	}
	
	 @SuppressWarnings({ "rawtypes" })
	 @RequestMapping(value="/req/req3000/req3000/selectReq3000ReqInfoAjax.do")
	 public ModelAndView selectReq1000ReqInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model )	throws Exception {
    	try{
    		
        	Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
        	
			HttpSession ss = request.getSession();
			String prjId = (String) ss.getAttribute("selPrjId");
			
			
        	String paramPrjId = paramMap.get("prjId");
        	if(paramPrjId != null && !"".equals(paramPrjId)){
        		prjId = paramPrjId;
        	}
        	
			String licGrpId = ((LoginVO) ss.getAttribute("loginVO")).getLicGrpId();
        	
			paramMap.put("prjId", prjId);
			paramMap.put("licGrpId", licGrpId);
			
        	
        	Map reqInfoMap = (Map) req3000Service.selectReq3000ReqGrpInfo(paramMap);        	
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
			

			
			List<Map> reqGrpConList = req3000Service.selectReq3001ReqConList(paramMap);
			model.addAttribute("reqGrpConList", reqGrpConList);
			
        	
        	model.addAttribute("errorYn", "N");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        	
        	return new ModelAndView("jsonView");
        	
    	}catch(Exception ex){
    		Log.error("selectReq3000ReqInfoAjax()", ex);
    		
    		model.addAttribute("errorYn", "Y");
        	model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		throw new Exception(ex.getMessage());
    	}
    }
	 
	 
	 @RequestMapping(value="/req/req3000/req3000/updateReq3001ReqInfoAjax.do")
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
				
				
				req3000Service.saveReq3000ReqGrpInfo(paramMap);
				
				
				model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));

				return new ModelAndView("jsonView");
			}
			catch(Exception ex){
				Log.error("updateReq3001ReqInfoAjax()", ex);

				
				model.addAttribute("saveYN", "N");
				model.addAttribute("message", egovMessageSource.getMessage("fail.common.update"));
				return new ModelAndView("jsonView");
			}
		}
	 	
		@RequestMapping(value="/req/req3000/req3000/deleteReq3000ReqListAjax.do")
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

				req3000Service.deleteReq3000ReqList(paramMap);
				
	        	
	        	model.addAttribute("errorYn", "N");
	        	model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
	        	
	        	return new ModelAndView("jsonView");
	        	
	    	}catch(Exception ex){
	    		Log.error("deleteReq3000ReqInfoAjax()", ex);
	    		
	    		model.addAttribute("errorYn", "Y");
	        	model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
	    		throw new Exception(ex.getMessage());
	    	}
	    }
}