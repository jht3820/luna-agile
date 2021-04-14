package kr.opensoftlab.lunaops.prj.prj3000.prj3100.web;

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
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
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
import kr.opensoftlab.lunaops.com.exception.UserDefineException;
import kr.opensoftlab.lunaops.com.fms.web.service.FileMngService;
import kr.opensoftlab.lunaops.prj.prj3000.prj3000.service.Prj3000Service;
import kr.opensoftlab.lunaops.prj.prj3000.prj3100.service.Prj3100Service;
import kr.opensoftlab.sdf.util.RequestConvertor;



@Controller
public class Prj3100Controller {

	
	private final Logger Log = Logger.getLogger(this.getClass());

	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	
   	@Resource(name="fileMngService")
   	private FileMngService fileMngService;
   	
	
	@Resource(name="EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;
	
	@Resource(name="prj3100Service")
	private Prj3100Service prj3100Service;
	
	
	@Resource(name = "EgovFileMngService")
	private EgovFileMngService fileService;
	
	
	@Resource(name = "prj3000Service")
	private Prj3000Service prj3000Service;
	
	
	@RequestMapping(value="/prj/prj3000/prj3100/selectPrj3100View.do")
	public String selectPrj3100View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
			return "/prj/prj3000/prj3100/prj3100";
	}
	
	@RequestMapping(value="/prj/prj3000/prj3100/selectPrj3101View.do")
	public String selectPrj3101View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
			return "/prj/prj3000/prj3100/prj3101";
	}
	
   	@RequestMapping(value = "/prj/prj3000/prj3100/insertPrj3100FormFileUploadAjax.do")
   	public ModelAndView insertPrj3100FormFileUploadAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
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
			Log.error("insertPrj3100FormFileUploadAjax()", ex);

       		
       		model.addAttribute("errorYn", "Y");
       		model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
       		return new ModelAndView("jsonView");
			
		}
   	}
   	
	
   	@RequestMapping(value ="/prj/prj3000/prj3100/selectPrj3100FormFileListAjax.do")
   	public ModelAndView selectPrj3100FormFileListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
   		try {
			
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			
			
			String paramPrjId = (String) paramMap.get("paramPrjId");
			
			
			if(paramPrjId == null || "".equals(paramPrjId)) {
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
			
			paramMap.put("prjId", paramPrjId);
			
			List<FileVO> atchFileList = null;
			List<FileVO> waitFileList = null;
			
			
        	FileVO fileVO = new FileVO();
        	fileVO.setAtchFileId((String)paramMap.get("docAtchFileId"));
        	
        	
        	atchFileList = fileMngService.fileDownList(fileVO);
			
        	
        	fileVO.setAtchFileId((String)paramMap.get("docWaitFileId"));
        	waitFileList = fileMngService.fileDownList(fileVO);
        	
        	
        	model.addAttribute("atchFileList", atchFileList);
        	model.addAttribute("waitFileList", waitFileList);
        	
			
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			return new ModelAndView("jsonView");
				
           	
		} catch (Exception ex) {
			Log.error("selectPrj3100FormFileListAjax()", ex);

       		
       		model.addAttribute("errorYn", "Y");
       		model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
       		return new ModelAndView("jsonView");
		}
   	}
   	
	
   	@RequestMapping(value = "/prj/prj3000/prj3100/deletePrj3100FileAjax.do")
   	public ModelAndView deletePrj3100FileAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception{
   		try {
			
   			
           	Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
   			
           	
        	prj3100Service.deletePrj3100File(paramMap);
        	
        	
           	model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
           	
   	   		return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("deletePrj3100FileAjax()", ex);

       		
       		model.addAttribute("errorYn", "Y");
       		model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
       		return new ModelAndView("jsonView");
			
		}
   	}
   	
   	
   	@RequestMapping(value = "/prj/prj3000/prj3100/updatePrj3100FileTypeAjax.do")
   	public ModelAndView updatePrj3100FileTypeAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception{
   		try {
			
   			
           	Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
   			
           	
           	FileVO fileVO = new FileVO();
           	fileVO.setAtchFileId(paramMap.get("afterFileId"));
           	
           	
        	
			int fileSn = fileMngService.getFileSN(fileVO) + 1;
           	
			paramMap.put("afterFileSn", String.valueOf(fileSn));
			
           	
        	prj3100Service.updatePrj3100FileType(paramMap);
        	
        	
           	model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));
           	
   	   		return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("updatePrj3100FileTypeAjax()", ex);

       		
       		model.addAttribute("errorYn", "Y");
       		model.addAttribute("message", egovMessageSource.getMessage("fail.common.update"));
       		return new ModelAndView("jsonView");
			
		}
   	}
   	
   	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/prj/prj3000/prj3100/selectPrj3100MenuTreeZipDownload.do")
	public String selectPrj3000MenuTreeZipDownload(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		String mimetype = "text/html; charset=UTF-8";
		
		response.setContentType(mimetype);
		StringBuffer str = new StringBuffer();
		
		try {
			
        	Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
        	
        	HttpSession ss = request.getSession();
           	paramMap.put("prjId", (String)ss.getAttribute("selPrjId"));
        	
           	
           	List<Map> docMenuList = prj3100Service.selectPrj3100MenuTree(paramMap);

           	
           	
           	
           	Map<String, Map> docStepData = new HashMap<String, Map>();
           	
           	for(Map docMenuInfo : docMenuList) {
           		
           		String lvl = String.valueOf(docMenuInfo.get("lvl"));
           		
           		
           		String docId = (String)docMenuInfo.get("docId");
           		
           		
           		String upperDocId = (String)docMenuInfo.get("upperDocId");
           		
           		
           		String docNm = (String)docMenuInfo.get("docNm");
           		
           		
           		docNm = "["+docId+"]_"+docNm;
           		
           		
           		String atchFileId = "";
           		
           		
           		docNm = docNm.replaceAll("/", "-");
           		
           		Map newMap = new HashMap<>();
           		
           		
           		if("0".equals(lvl)) {
           			newMap.put("stepNm", docNm);
           		}else {
           			
           			
           			Map upperDocInfo = docStepData.get(upperDocId);
           			
           			String stepNm = docNm;
           			
           			
           			if(upperDocInfo != null && upperDocInfo.containsKey("stepNm")) {
           				stepNm = (String)upperDocInfo.get("stepNm");
           				stepNm = stepNm+"/"+docNm;
           			}
           			newMap.put("stepNm", stepNm);
           		}
           		
           		
           		
           		
           		atchFileId = (String)docMenuInfo.get("docAtchFileId");
           		newMap.put("atchFileId", atchFileId);
       			
           		
           		docStepData.put(docId, newMap);
           	}
           	
           	
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
    		
    		try {
    			
    			zipOut = new ZipOutputStream(new FileOutputStream(zipFilePath+zipFileName));
    			
    			
               	for(Map docMenuInfo : docMenuList) {
               		
               		String docId = (String)docMenuInfo.get("docId");
               		
               		
               		Map docMap = docStepData.get(docId);
               		
               		String stepNm = (String) docMap.get("stepNm");
               		String atchFileId = (String) docMap.get("atchFileId");
               		
           			
           			FileVO fileVO = new FileVO();
           			fileVO.setAtchFileId(atchFileId);
           			List<FileVO> fList = fileService.selectFileInfs(fileVO);
           			
           			for(FileVO fvo: fList) {
           				
	           			
	           			if(fvo == null) {
	           				
	           				continue;
	           			}
	           			
	           			
	           			File uFile = new File(fvo.getFileStreCours(), fvo.getStreFileNm());
	           			
	           			
	           			if(!uFile.isFile()){
			    			
			    			zipOut.close();
			    			
			    			
			    			zipMakeChk = false;
			    			throw new UserDefineException("<script>$alert('"+egovMessageSource.getMessage("com.fail.file.select")+"\\n"+fvo.getOrignlFileNm()+"');</script>");
		    			}
	           			
	           			
		    			FileInputStream in = new FileInputStream(uFile);
		    	        String fileName = "["+appendFileCnt+"]_"+fvo.getOrignlFileNm().toString();
		    	                
		    	        ZipEntry ze = new ZipEntry(stepNm+"/"+fileName);
	
		    	        zipOut.putNextEntry(ze);
		    	         
		    	        
		    	        int len;
		    	        while ((len = in.read(buf)) > 0) {
		    	        	zipOut.write(buf, 0, len);
		    	        }
		    	          
		    	        zipOut.closeEntry();
		    	        in.close();
		    	        
		    	        
		    	        appendFileCnt++;
           			}
               	}
               	
               	zipOut.close();
               	
               	
	    		if(appendFileCnt == 0) {
	    			
					String fileDeletePath  = zipFilePath+zipFileName;
					EgovFileMngUtil.deleteFile(fileDeletePath);
				    
	    			throw new UserDefineException("<script>alert('등록된 파일이 존재하지 않습니다.');</script>");
	    		}
               	
	    		else if(zipMakeChk){
		    		
					File uFile = new File(zipFilePath, zipFileName);
					long fSize = uFile.length();
					
					if (fSize > 0) {
						
						
						setDisposition(zipFileName, request, response);
						
						BufferedInputStream in = null;
						BufferedOutputStream out = null;
						
						try {
							
							in = new BufferedInputStream(new FileInputStream(uFile));
							out = new BufferedOutputStream(response.getOutputStream());
							
							int copyCnt = FileCopyUtils.copy(in, out);
						
							System.out.println(copyCnt);
	
							
							out.flush();
						} catch (IOException ex) {
							EgovBasicLogger.ignore("IO Exception", ex);
						} finally {
							
							EgovResourceCloseHelper.close(in, out);
							
							
							String fileDeletePath  = zipFilePath+zipFileName;
						    String deleteChk = EgovFileMngUtil.deleteFile(fileDeletePath);
						    
						    Log.debug("Delete Result"+deleteChk);
						}
						return "/err/file";
					}else{
						throw new UserDefineException("<script>alert('"+egovMessageSource.getMessage("com.fail.file.select")+"');</script>");
					}
				}
	    		
	    		
    		}catch(UserDefineException ude) {
    			zipOut.close();
    			throw new UserDefineException(ude.getMessage());
    		}catch(Exception subE) {
    		
    			Log.error("selectPrj3000MenuTreeZipDownload()", subE);
    			str.append("<script>alert('"+egovMessageSource.getMessage("com.fail.file.select")+"');</script>");
    			
    			zipOut.close();
    		}
			
			return "/err/file";
		}catch(UserDefineException ude) {
			str.append(ude.getMessage());
		}catch(Exception e) {
			Log.error("selectPrj3000MenuTreeZipDownload()", e);
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
	
	
	
	@RequestMapping(value="/prj/prj3000/prj3100/selectPrj3100ZipDownload.do")
	public String selectPrj3000ZipDownload(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		String mimetype = "text/html; charset=UTF-8";
		
		response.setContentType(mimetype);
		StringBuffer str = new StringBuffer();
		
		try {
			
        	Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
        	
        	HttpSession ss = request.getSession();
           	paramMap.put("prjId", (String)ss.getAttribute("selPrjId"));
        	
           	
           	String atchFileId = paramMap.get("atchFileId");
           	
           	
           	String docId = paramMap.get("docId");
           	
           	
           	String docNm = paramMap.get("docNm");
           	
           	
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
    		
    		try {
    			
    			zipOut = new ZipOutputStream(new FileOutputStream(zipFilePath+zipFileName));
    			
    			FileVO fileVO = new FileVO();
    			
    			fileVO.setAtchFileId(atchFileId);
    			
    			List<FileVO> fileList = fileMngService.selectFileInfs(fileVO);

    			String stepNm = "["+docId+"]_"+docNm;
    			
    			
               	for(FileVO fvo : fileList) {
               		
               		
           				
           			
           			if(fvo == null) {
           				
           				continue;
           			}
           			
           			
           			File uFile = new File(fvo.getFileStreCours(), fvo.getStreFileNm());
           			
           			
           			if(!uFile.isFile()){
		    			
		    			zipOut.close();
		    			
		    			
		    			zipMakeChk = false;
		    			throw new UserDefineException("<script>$alert('"+egovMessageSource.getMessage("com.fail.file.select")+"\\n"+fvo.getOrignlFileNm()+"');</script>");
	    			}
           			
           			
	    			FileInputStream in = new FileInputStream(uFile);
	    	        String fileName = "["+appendFileCnt+"]_"+fvo.getOrignlFileNm().toString();
	    	                
	    	        ZipEntry ze = new ZipEntry(stepNm+"/"+fileName);

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
				    
	    			throw new UserDefineException("<script>alert('등록된 파일이 존재하지 않습니다.');</script>");
	    		}
               	
	    		else if(zipMakeChk){
		    		
					File uFile = new File(zipFilePath, zipFileName);
					long fSize = uFile.length();
					
					if (fSize > 0) {
						
						
						setDisposition(zipFileName, request, response);
						
						BufferedInputStream in = null;
						BufferedOutputStream out = null;
						
						try {
							
							in = new BufferedInputStream(new FileInputStream(uFile));
							out = new BufferedOutputStream(response.getOutputStream());
							
							int copyCnt = FileCopyUtils.copy(in, out);
						
							System.out.println(copyCnt);
	
							
							out.flush();
						} catch (IOException ex) {
							EgovBasicLogger.ignore("IO Exception", ex);
						} finally {
							
							EgovResourceCloseHelper.close(in, out);
							
							
							String fileDeletePath  = zipFilePath+zipFileName;
						    String deleteChk = EgovFileMngUtil.deleteFile(fileDeletePath);
						    
						    Log.debug("Delete Result"+deleteChk);
						}
						return "/err/file";
					}else{
						throw new UserDefineException("<script>alert('"+egovMessageSource.getMessage("com.fail.file.select")+"');</script>");
					}
				}
	    		
	    		
    		}catch(UserDefineException ude) {
    			zipOut.close();
    			throw new UserDefineException(ude.getMessage());
    		}catch(Exception subE) {
    		
    			Log.error("selectPrj3000MenuTreeZipDownload()", subE);
    			str.append("<script>alert('"+egovMessageSource.getMessage("com.fail.file.select")+"');</script>");
    			
    			zipOut.close();
    		}
			
			return "/err/file";
		}catch(UserDefineException ude) {
			str.append(ude.getMessage());
		}catch(Exception e) {
			Log.error("selectPrj3000MenuTreeZipDownload()", e);
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
	
	
	@RequestMapping(value = "/prj/prj3000/prj3100/selectPrj3100FormFileCntAjax.do")
	public ModelAndView selectPrj3100FormFileCntAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
   		try {
			
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			
			
			String paramPrjId = (String) paramMap.get("paramPrjId");
			
			
			if(paramPrjId == null || "".equals(paramPrjId)) {
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
			
			paramMap.put("prjId", paramPrjId);
			
			List<FileVO> formConfFileList = null;
			
			
        	FileVO fileVO = new FileVO();
        	fileVO.setAtchFileId((String)paramMap.get("atchFileId"));
        	
        	
        	formConfFileList = fileMngService.fileDownList(fileVO);
			
        	
        	
        	model.addAttribute("fileCnt", formConfFileList.size());
        	if(formConfFileList.size() == 1) {
        		model.addAttribute("atchFileId", formConfFileList.get(0).getAtchFileId());
        		model.addAttribute("fileSn", formConfFileList.get(0).getFileSn());
        	}
        	
			
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			return new ModelAndView("jsonView");
				
           	
		} catch (Exception ex) {
			Log.error("selectPrj3100FormFileListAjax()", ex);

       		
       		model.addAttribute("errorYn", "Y");
       		model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
       		return new ModelAndView("jsonView");
		}
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

