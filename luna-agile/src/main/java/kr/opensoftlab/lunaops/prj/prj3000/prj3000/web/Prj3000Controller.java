package kr.opensoftlab.lunaops.prj.prj3000.prj3000.web;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.EgovWebUtil;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovBasicLogger;
import egovframework.com.cmm.util.EgovResourceCloseHelper;
import egovframework.rte.fdl.cmmn.trace.LeaveaTrace;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import kr.opensoftlab.lunaops.com.exception.UserDefineException;
import kr.opensoftlab.lunaops.com.fms.web.service.FileMngService;
import kr.opensoftlab.lunaops.prj.prj3000.prj3000.service.Prj3000Service;
import kr.opensoftlab.sdf.util.RequestConvertor;



@Controller
public class Prj3000Controller {

	
	private final Logger Log = Logger.getLogger(this.getClass());

	
	@Resource(name = "prj3000Service")
	private Prj3000Service prj3000Service;

	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	
   	@Resource(name="fileMngService")
   	private FileMngService fileMngService;
   	
	
	@Resource(name="EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;
	
	
	@Resource(name = "egovFileIdGnrService")
	private EgovIdGnrService idgenService;

	
	@Resource(name = "EgovFileMngService")
	private EgovFileMngService fileService;
	
	
	@Resource(name = "leaveaTrace")
	LeaveaTrace leaveaTrace;

	@Value("${Globals.fileStorePath}")
	private String tempPath;
	
	@RequestMapping(value="/prj/prj3000/prj3000/selectPrj3000View.do")
	public String selectPrj3000View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
			return "/prj/prj3000/prj3000/prj3000";
	}

    
    @SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/prj/prj3000/prj3000/selectPrj3000DocListAjax.do")
    public ModelAndView selectPrj3000DocListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	
    	try{
        	
    		
    		Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
        	
    		
			String paramPrjId = (String) paramMap.get("dtParamPrjId");
        	
        	
    		HttpSession ss = request.getSession();
    		
    		
    		if(paramPrjId == null || "".equals(paramPrjId)){
    			paramPrjId = (String)ss.getAttribute("selPrjId");
    		}
    		
    		paramMap.put("prjId", paramPrjId);
        	
    		List<Map> baseDocList = null;
    		
			
			baseDocList = (List) prj3000Service.selectPrj3000BaseMenuList(paramMap);
			
			
			if(baseDocList.size() == 0) {
				
				
				String docFormConfFileId = idgenService.getNextStringId();
				paramMap.put("docFormConfFileId", docFormConfFileId);
				
				
				String docFormFileId = idgenService.getNextStringId();
				paramMap.put("docFormFileId", docFormFileId);
				
				
				String docAtchFileId = idgenService.getNextStringId();
				paramMap.put("docAtchFileId", docAtchFileId);
				
				
				String docWaitFileId = idgenService.getNextStringId();
				paramMap.put("docWaitFileId", docWaitFileId);
				
				
				prj3000Service.insertPrj3000RootMenuInfo(paramMap);
				
				
				baseDocList = (List) prj3000Service.selectPrj3000BaseMenuList(paramMap);
			}
			
        	model.addAttribute("baseDocList", baseDocList);
        	
        	
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        	
        	return new ModelAndView("jsonView", paramMap);
    	}
    	catch(Exception ex){
    		Log.error("selectPrj3000DocListAjax()", ex);
    		
    		
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		return new ModelAndView("jsonView");
    	}
    }
    
    
    
    @SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/prj/prj3000/prj3000/selectPrj3000DocInfoAjax.do")
    public ModelAndView selectPrj3000DocInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	
    	try{
        	
    		
        	Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
        	
        	
			String paramPrjId = (String) paramMap.get("dtParamPrjId");
        	
        	
    		HttpSession ss = request.getSession();
    		
    		
    		if(paramPrjId == null || "".equals(paramPrjId)){
    			paramMap.put("prjId", (String)ss.getAttribute("selPrjId"));
    		}else{
    			paramMap.put("prjId", paramPrjId);
    		}
        	
        	Map<String, String> docInfoMap = (Map) prj3000Service.selectPrj3000MenuInfo(paramMap);
        	
        	
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        	
        	
        	model.addAttribute("docInfoMap",docInfoMap);
        	
        	return new ModelAndView("jsonView");
    	}
    	catch(Exception ex){
    		Log.error("selectPrj3000DocInfoAjax()", ex);

    		
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		return new ModelAndView("jsonView");
    	}
    }
    
    
   	@RequestMapping(value="/prj/prj3000/prj3000/selectPrj3001View.do")
    public String selectPrj3001View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		try{
    		
        	Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
        	
        	
			String paramPrjId = (String) paramMap.get("dtParamPrjId");
        	
        	
    		HttpSession ss = request.getSession();
    		
    		
    		if(paramPrjId == null || "".equals(paramPrjId)){
    			paramMap.put("prjId", (String)ss.getAttribute("selPrjId"));
    		}else{
    			paramMap.put("prjId", paramPrjId);
    		}
        	
    		
           	int nextOrd = prj3000Service.selectPrj3000DocNextOrd(paramMap); 
           	model.addAttribute("nextOrd",nextOrd);
           	model.addAttribute("type",paramMap.get("type"));
           	
        	return "/prj/prj3000/prj3000/prj3001";
    	}
    	catch(Exception ex){
    		Log.error("selectPrj3001View()", ex);
  			throw new Exception(ex.getMessage());
    	}
	}
    
    
   	@RequestMapping(value = "/prj/prj3000/prj3000/insertPrj3000DocInfoAjax.do")
   	public ModelAndView insertPrj3000DocInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception{
   		
   		try {
			
   			
           	Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
   			
           	
           	HttpSession ss = request.getSession();
           	
           	
			String paramPrjId = (String) paramMap.get("dtParamPrjId");
			
			
			if(paramPrjId == null || "".equals(paramPrjId)) {
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
        	
			paramMap.put("prjId", paramPrjId);
        	
			
			String docFormConfFileId = idgenService.getNextStringId();
			paramMap.put("docFormConfFileId", docFormConfFileId);
			
			
			String docFormFileId = idgenService.getNextStringId();
			paramMap.put("docFormFileId", docFormFileId);
			
			
			String docAtchFileId = idgenService.getNextStringId();
			paramMap.put("docAtchFileId", docAtchFileId);
			
			
			String docWaitFileId = idgenService.getNextStringId();
			paramMap.put("docWaitFileId", docWaitFileId);
			
        	
        	String newDocId = prj3000Service.insertPrj3000DocInfo(paramMap);
        	model.addAttribute("newDocId", newDocId);
        	
        	
           	model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
           	
   	   		return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("insertPrj3000DocInfo()", ex);

       		
       		model.addAttribute("errorYn", "Y");
       		model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
       		return new ModelAndView("jsonView");
			
		}
   	}
   	
   	
   	@RequestMapping(value = "/prj/prj3000/prj3000/updatePrj3000DocInfoAjax.do")
   	public ModelAndView updatePrj3000DocInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
   		
   		try {
			
   			
           	Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
   			
           	
           	HttpSession ss = request.getSession();
           	
           	
			String paramPrjId = (String) paramMap.get("dtParamPrjId");
			
			
			if(paramPrjId == null || "".equals(paramPrjId)) {
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
        	
			paramMap.put("prjId", paramPrjId);
        	
        	
        	prj3000Service.updatePrj3000DocInfo(paramMap);
        	
        	
           	model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));
           	
   	   		return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("updatePrj3000DocInfoAjax()", ex);

       		
       		model.addAttribute("errorYn", "Y");
       		model.addAttribute("message", egovMessageSource.getMessage("fail.common.update"));
       		return new ModelAndView("jsonView");
			
		}
   		
   	}
   	
   	
   	
   	@RequestMapping(value = "/prj/prj3000/prj3000/deletePrj3000DocInfoAjax.do")
   	public ModelAndView deletePrj3000DocInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
   		
   		try {
			
   			
           	Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
   			
           	
        	prj3000Service.deletePrj3000DocInfo(paramMap);
        	
        	
           	model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
           	
   	   		return new ModelAndView("jsonView");
   	   		
		} catch (Exception ex) {
			Log.error("deletePrj3000DocInfoAjax()", ex);

       		
       		model.addAttribute("errorYn", "Y");
       		model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
       		return new ModelAndView("jsonView");
			
		}
   	}
   	
   	
   	
   	@RequestMapping(value = "/prj/prj3000/prj3000/insertPrj3000FormFileUploadAjax.do")
   	public ModelAndView insertPrj3000FormFileUploadAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
   		try {
			
   			MultipartHttpServletRequest mptRequest = (MultipartHttpServletRequest)request;
			
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			
			
			String paramPrjId = (String) paramMap.get("prjId");
			
			
			if(paramPrjId == null || "".equals(paramPrjId)) {
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
			
			paramMap.put("prjId", paramPrjId);
			
			String atchFileId = (String) paramMap.get("atchFileId");
			
			
        	FileVO fileVO = new FileVO();
        	fileVO.setAtchFileId(atchFileId);
        	
			
        	
			int fileSn = fileMngService.getFileSN(fileVO);
			
			
			List<FileVO> _result = fileUtil.fileUploadInsert(mptRequest,atchFileId,fileSn,"Prj");
			
			
			fileMngService.insertFileDetail(_result);  
			
			
			
			model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
			return new ModelAndView("jsonView");
           	
		} catch (Exception ex) {
			Log.error("insertPrj3000ConfFileUploadAjax()", ex);

       		
       		model.addAttribute("errorYn", "Y");
       		model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
       		return new ModelAndView("jsonView");
			
		}
   	}
   		
   	
   	@RequestMapping(value ="/prj/prj3000/prj3000/selectPrj3000FormFileListAjax.do")
   	public ModelAndView selectPrj3000FormFileListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
   		try {
			
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			
			
			String paramPrjId = (String) paramMap.get("paramPrjId");
			
			
			if(paramPrjId == null || "".equals(paramPrjId)) {
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
			
			paramMap.put("prjId", paramPrjId);
			
			List<FileVO> formConfFileList = null;
			List<FileVO> formFileList = null;
			
			
        	FileVO fileVO = new FileVO();
        	fileVO.setAtchFileId((String)paramMap.get("docFormConfFileId"));
        	
        	
        	formConfFileList = fileMngService.fileDownList(fileVO);
			
        	
        	fileVO.setAtchFileId((String)paramMap.get("docFormFileId"));
        	formFileList = fileMngService.fileDownList(fileVO);
        	
        	
        	model.addAttribute("formConfFileList", formConfFileList);
        	model.addAttribute("formFileList", formFileList);
        	
			
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			return new ModelAndView("jsonView");
				
           	
		} catch (Exception ex) {
			Log.error("selectPrj3000FormFileListAjax()", ex);

       		
       		model.addAttribute("errorYn", "Y");
       		model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
       		return new ModelAndView("jsonView");
		}
   	}
   	
   	
   	@RequestMapping(value = "/prj/prj3000/prj3000/deletePrj3000FileAjax.do")
   	public ModelAndView deletePrj3000FileAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception{
   		try {
			
   			
           	Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
   			
           	
        	prj3000Service.deletePrj3000File(paramMap);
        	
        	
           	model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
           	
   	   		return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("deletePrj3000FileAjax()", ex);

       		
       		model.addAttribute("errorYn", "Y");
       		model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
       		return new ModelAndView("jsonView");
			
		}
   	}
   	
   	
   	@RequestMapping(value = "/prj/prj3000/prj3000/updatePrj3000FileTypeAjax.do")
   	public ModelAndView updatePrj3000FileTypeAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception{
   		try {
			
   			
           	Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
   			
           	
           	FileVO fileVO = new FileVO();
           	fileVO.setAtchFileId(paramMap.get("afterFileId"));
           	
           	
        	
			int fileSn = fileMngService.getFileSN(fileVO) + 1;
           	
			paramMap.put("afterFileSn", String.valueOf(fileSn));
			
           	
        	prj3000Service.updatePrj3000FileType(paramMap);
        	
        	
           	model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));
           	
   	   		return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("updatePrj3000FileTypeAjax()", ex);

       		
       		model.addAttribute("errorYn", "Y");
       		model.addAttribute("message", egovMessageSource.getMessage("fail.common.update"));
       		return new ModelAndView("jsonView");
			
		}
   	}
   	

   	
   	
   	
   	
   	
   	
   	
   	
   	
   	
   	
   	
    
       @SuppressWarnings({ "rawtypes", "unchecked" })
   	@RequestMapping(value="/prj/prj3000/prj3000/insertPrj3000MenuInfoAjax.do")
       public ModelAndView insertPrj3000MenuInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
       	
       	try{
           	
       		
           	Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
           	
           	HttpSession ss = request.getSession();
        	paramMap.put("prjId", (String)ss.getAttribute("selPrjId"));
        	
        	
        	String fileFormId = idgenService.getNextStringId();
        	paramMap.put("fileFormId", fileFormId);
        	
        	
        	String fileAtchId = idgenService.getNextStringId();
        	paramMap.put("fileAtchId", fileAtchId);
        	
           	
           	Map<String, String> docInfoMap = (Map) prj3000Service.insertPrj3000MenuInfo(paramMap);
           	
           	
           	model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
           	
           	
           	return new ModelAndView("jsonView", docInfoMap);
       	}
       	catch(Exception ex){
       		Log.error("selectPrj3000MenuInfoAjax()", ex);

       		
       		model.addAttribute("saveYN", "N");
       		model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
       		return new ModelAndView("jsonView");
       	}
    }
       
      	@RequestMapping(value="/prj/prj3000/prj3000/updatePrj3000MenuInfoAjax.do")
          public ModelAndView updatePrj3000MenuInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
          	
          	try{
              	
          		
              	Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
              	
              	HttpSession ss = request.getSession();
              	paramMap.put("prjId", (String)ss.getAttribute("selPrjId"));
           	
           	
              	
              	prj3000Service.updatePrj3000MenuInfo(paramMap);
              	
              	
              	model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));
              	
              	return new ModelAndView("jsonView");
          	}
          	catch(Exception ex){
          		Log.error("updateAdm1000MenuInfoAjax()", ex);

          		
          		model.addAttribute("saveYN", "N");
          		model.addAttribute("message", egovMessageSource.getMessage("fail.common.update"));
          		return new ModelAndView("jsonView");
          	}
      }
      	
      	
       	@RequestMapping(value="/prj/prj3000/prj3000/updatePrj3000FileSnAjax.do")
           public ModelAndView updatePrj3000FileSnAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
           	
           	try{
               	
           		
               	Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
               	
               	HttpSession ss = request.getSession();
               	paramMap.put("prjId", (String)ss.getAttribute("selPrjId"));
               

               	
               	
            	prj3000Service.updatePrj3000FileSnSelect(paramMap);
               	
               	
            	model.addAttribute("saveYN", "Y");
               	model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));
               	
               	return new ModelAndView("jsonView");
           	}
           	catch(Exception ex){
           		Log.error("updatePrj3000FileSnAjax()", ex);

           		
           		model.addAttribute("saveYN", "N");
           		model.addAttribute("message", egovMessageSource.getMessage("fail.common.update"));
           		return new ModelAndView("jsonView");
           	}
       }
   	
	@RequestMapping(value="/prj/prj3000/prj3000/deletePrj3000AuthGrpInfoAjax.do")
    public ModelAndView deletePrj3000AuthGrpInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	
    	try{
        	
    		
        	Map<String, Object> paramMap = RequestConvertor.requestParamToMapAddSelInfoList(request, true,"docId");
    		
        	HttpSession ss = request.getSession();
           	paramMap.put("prjId", (String)ss.getAttribute("selPrjId"));
           	
        	
           	prj3000Service.deletePrj3000MenuInfo(paramMap);
        	
        	
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
        	
        	return new ModelAndView("jsonView");
    	}
    	catch(Exception ex){
    		Log.error("deleteAdm1000MenuInfoAjax()", ex);

    		
    		model.addAttribute("saveYN", "N");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
    		return new ModelAndView("jsonView");
    	}
    }
	
	@RequestMapping(value="/prj/prj3000/prj3000/insertPrj3000FileUploadAjax.do")
    public ModelAndView insertPrj3000FileUploadAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	
    	try{
    		MultipartHttpServletRequest mptRequest = (MultipartHttpServletRequest)request;
    		
    		
        	Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
        	
        	HttpSession ss = request.getSession();
           	paramMap.put("prjId", (String)ss.getAttribute("selPrjId"));
        	
           	String _atchFileId = paramMap.get("docFormFileId");
           	
           	
           	
           	
			if("".equals(_atchFileId) || _atchFileId == null || "NULL".equals(_atchFileId)){
				
				List<FileVO> _result = fileUtil.fileUploadInsert(mptRequest,"",0,"Doc"+"/"+paramMap.get("prjId"));
				
				
				if(_result != null){
					
					_atchFileId = fileMngService.insertFileInfs(_result);  
					paramMap.put("docFormFileId",_atchFileId);
					paramMap.put("docFormFileSn",null);
					
		        	
		           	
		        	prj3000Service.updatePrj3000MenuInfo(paramMap);
		        	
		        	model.addAttribute("message", egovMessageSource.getMessage("prj3000.success.fileUpload.insert"));
		        	model.addAttribute("saveYN", "Y");
		        	model.addAttribute("firstInsert", "Y");
		        	model.addAttribute("addFileId", _atchFileId);
		        	model.addAttribute("addFileSn", "0");
		        	model.addAttribute("fileVo", _result.get(0)); 
		        	return new ModelAndView("jsonView");
					
				}else{
					
		    		model.addAttribute("saveYN", "N");
		    		model.addAttribute("message", egovMessageSource.getMessage("fail.request.msg"));
		    		return new ModelAndView("jsonView");
				}
			}
			
           	FileVO fvo = new FileVO();
           	fvo.setAtchFileId(_atchFileId);
           	
           	int _fileSn = Integer.parseInt(paramMap.get("uploadFileSn"));
			if(_fileSn >= 1){
				
				List<FileVO> _result = fileUtil.fileUploadInsert(mptRequest,_atchFileId,_fileSn,"Doc"+"/"+paramMap.get("prjId"));
				
				
				if(_result != null && !(_result.isEmpty())){
					
					_atchFileId = fileMngService.insertFileDetail(_result);  
					model.addAttribute("fileVo", _result.get(0)); 
				}else{
					
		    		model.addAttribute("saveYN", "N");
		    		model.addAttribute("message", egovMessageSource.getMessage("fail.request.msg"));
		    		return new ModelAndView("jsonView");
				}
			}
        	
    		model.addAttribute("addFileId", _atchFileId);
        	model.addAttribute("addFileSn", _fileSn);
        	
        	model.addAttribute("message", egovMessageSource.getMessage("prj3000.success.fileUpload.insert"));
        	model.addAttribute("saveYN", "Y");
        	return new ModelAndView("jsonView");
    	}
    	catch(Exception ex){
    		Log.error("insertPrj3000FileUploadAjax()", ex);

    		
    		model.addAttribute("saveYN", "N");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.request.msg"));
    		return new ModelAndView("jsonView");
    	}
    }
	
	
	
	
   	@RequestMapping(value = "/prj/prj3000/prj3000/selectPrj3000ZipDownload.do")
   	public String selectPrj3000ZipDownload(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception{
   		
   		
		String mimetype = "text/html; charset=UTF-8";
		
		response.setContentType(mimetype);
		StringBuffer str = new StringBuffer();
		
   		try {
			
   			
           	Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
           	
           	HttpSession ss = request.getSession();
           	
    		
			String paramPrjId = (String) paramMap.get("paramPrjId");
    		
    		
			if(paramPrjId == null || "".equals(paramPrjId)) {
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
			
			paramMap.put("prjId", paramPrjId);
			
			
			String atchFileId = paramMap.get("atchFileId");
			
			String docId = paramMap.get("docId");
			
			String docNm = paramMap.get("docNm");
			
       		docNm = "["+docId+"]_"+docNm;
       		
       		
           	int appendFileCnt = 0;
           	
           	
	    	byte[] buf = new byte[4096];
	    	
	    	
        	String storePathString = EgovProperties.getProperty("Globals.fileStorePath");
        	
        	
        	String addPath = "tempZip/";
        	String zipFilePath = EgovWebUtil.filePathBlackList(storePathString+addPath);
       		
        	
        	File saveFolder = new File(zipFilePath);

    		if (!saveFolder.exists() || saveFolder.isFile()) {
    			saveFolder.mkdirs();
    		}
    		
    		Date today = new Date();
    		DateFormat fm = new SimpleDateFormat("yyyyMMddHHmmss");
    		
    		
    		String zipFileName = "_OSL"+fm.format(today)+".zip";
    		
    		
    		ZipOutputStream zipOut = null;
    		
    		
    		boolean zipMakeChk = true;
    		
    		
			zipOut = new ZipOutputStream(new FileOutputStream(zipFilePath+zipFileName));
			
			FileVO fileVO = new FileVO();
			
			fileVO.setAtchFileId(atchFileId);
			
			List<FileVO> fileList = fileMngService.selectFileInfs(fileVO);
			
			for(FileVO fvo : fileList) {
				
				
       			if(fvo == null) {
       				
       				continue;
       			}
				
       			
       			File uFile = new File(fvo.getFileStreCours(), fvo.getStreFileNm());
       			
       			
       			if(!uFile.isFile()){
	    			
	    			zipOut.close();
	    			
	    			
	    			zipMakeChk = false;
	    			throw new UserDefineException("<script>alert('"+egovMessageSource.getMessage("com.fail.file.select")+"\\n"+fvo.getOrignlFileNm()+"');</script>");
    			}
       			
       			
       			
    			FileInputStream in = new FileInputStream(uFile);
    	        String fileName = "["+appendFileCnt+"]_"+fvo.getOrignlFileNm().toString();
    	                
    	        ZipEntry ze = new ZipEntry(docNm+"/"+fileName);

    	        zipOut.putNextEntry(ze);
    	         
    	        
    	        int len;
    	        while ((len = in.read(buf)) > 0) {
    	        	zipOut.write(buf, 0, len);
    	        }
    	          
    	        zipOut.closeEntry();
    	        in.close();
    	        
    	        
    	        appendFileCnt++;
       			
			}
       		
			zipOut.close();
			
			
    		if(appendFileCnt == 0) {
    			
				String fileDeletePath  = zipFilePath+zipFileName;
				EgovFileMngUtil.deleteFile(fileDeletePath);
			    
    			throw new UserDefineException("<script>alert('확정된 파일이 없습니다.');</script>");
    		}
           	
    		else if(zipMakeChk){
	    		
				File uFile = new File(zipFilePath, zipFileName);
				long fSize = uFile.length();
				
				if (fSize > 0) {
					
					
					setDisposition(zipFileName, request, response);
					
					BufferedInputStream in = null;
					BufferedOutputStream out = null;
					
					
					
					if(uFile.isFile()) {
						
						String qqq = "gggg";
						qqq.charAt(1);
					}
					
					try {
						in = new BufferedInputStream(new FileInputStream(uFile));
						
						
						out = new BufferedOutputStream(response.getOutputStream());
						
						FileCopyUtils.copy(in, out);

						
						out.flush();
					} catch (IOException ex) {
						EgovBasicLogger.ignore("IO Exception", ex);
					} finally {
						
						EgovResourceCloseHelper.close(in, out);
						
						
						String fileDeletePath  = zipFilePath+zipFileName;
					    String deleteChk = EgovFileMngUtil.deleteFile(fileDeletePath);
					    
					    Log.debug("Delete Result"+deleteChk);
					}
				}else{

		       		return "/err/file";
				}
			}
    		return "/err/file";
		} catch (Exception ex) {
			Log.error("selectPrj3000ZipDownload()", ex);
			str.append("<script>alert('"+egovMessageSource.getMessage("com.fail.file.select")+"');</script>");
			
		}
   		
   		PrintWriter printwriter = response.getWriter();
		printwriter.println("<html><form name='downForm'></form>");
		printwriter.println(str);
		printwriter.println("</html>");
		printwriter.flush();
		printwriter.close();
		return "/err/file";
   	}
	
	
	
	
	private String getBrowser(HttpServletRequest request) {
		String header = request.getHeader("User-Agent");
		if (header.indexOf("MSIE") > -1) {
			return "MSIE";
		} else if (header.indexOf("Trident") > -1) { 
			return "Trident";
		} else if (header.indexOf("Chrome") > -1) {
			return "Chrome";
		} else if (header.indexOf("Opera") > -1) {
			return "Opera";
		}
		return "Firefox";
	}

	
	
	private void setDisposition(String filename, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String browser = getBrowser(request);

		String dispositionPrefix = "attachment; filename=";
		String encodedFilename = null;

		if (browser.equals("MSIE")) {
			encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
		} else if (browser.equals("Trident")) { 
			encodedFilename = URLEncoder.encode(filename, "UTF-8").replaceAll("\\+", "%20");
		} else if (browser.equals("Firefox")) {
			encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.equals("Opera")) {
			encodedFilename = "\"" + new String(filename.getBytes("UTF-8"), "8859_1") + "\"";
		} else if (browser.equals("Chrome")) {
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < filename.length(); i++) {
				char c = filename.charAt(i);
				if (c > '~') {
					sb.append(URLEncoder.encode("" + c, "UTF-8"));
				} else {
					sb.append(c);
				}
			}
			encodedFilename = sb.toString();
		} else {
			throw new IOException("Not supported browser");
		}

		response.setHeader("Content-Disposition", dispositionPrefix + encodedFilename);

		if ("Opera".equals(browser)) {
			response.setContentType("application/octet-stream;charset=UTF-8");
		}
	}
	
}
