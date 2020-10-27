package kr.opensoftlab.lunaops.com.fms.web;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.jasypt.contrib.org.apache.commons.codec_1_3.binary.Base64;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.EgovWebUtil;
import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.util.EgovBasicLogger;
import egovframework.com.cmm.util.EgovResourceCloseHelper;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import kr.opensoftlab.lunaops.com.fms.web.service.FileMngService;
import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.lunaops.req.req6000.req6000.service.Req6000Service;
import kr.opensoftlab.sdf.util.ReqHistoryMngUtil;
import kr.opensoftlab.sdf.util.RequestConvertor;


@Controller
public class FileMngController {
	
	private final Logger Log = Logger.getLogger(this.getClass());
	
	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	
   	@Resource(name="fileMngService")
   	private FileMngService fileMngService;

   	
	@Resource(name = "req6000Service")
	private Req6000Service req6000Service;
	
	@Resource(name="EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;
	
	@Resource(name = "historyMng")
	private ReqHistoryMngUtil historyMng;
	
	
	@Resource(name = "EgovFileMngService")
	private EgovFileMngService fileService;

	@Resource(name = "egovFileIdGnrService")
	private EgovIdGnrService idgenService;
	
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
	
	
	@RequestMapping(value = "/com/fms/pdfViewerPage.do")
	public String pdfViewerPage(@RequestParam Map<String, Object> commandMap, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		String atchFileId = (String) commandMap.get("downAtchFileId");
		String fileSn = (String) commandMap.get("downFileSn");
		
		
		StringBuffer str = new StringBuffer();
		
		
		if(!"".equals(atchFileId) && atchFileId != null && !"".equals(fileSn) && fileSn != null){
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			if(loginVO != null){
				
				
				FileVO fileVO = new FileVO();
				fileVO.setAtchFileId(atchFileId);
				fileVO.setFileSn(fileSn);
				FileVO fvo = fileMngService.selectFileInf(fileVO);
				
				
				if(fvo == null){
					str.append("<script>alert('"+egovMessageSource.getMessage("com.fail.file.select")+"');</script>");
				}else{
					
					File uFile = new File(fvo.getFileStreCours(), fvo.getStreFileNm());
					long fSize = uFile.length();

					
					if (fSize > 0) {
						byte[] pdfByteArray = FileUtils.readFileToByteArray(uFile);
						String pdfData = new String(Base64.encodeBase64(pdfByteArray), Charset.forName("UTF-8"));
						model.addAttribute("pdfData",pdfData);

						model.addAttribute("atchFileId",atchFileId);
						model.addAttribute("fileSn",fileSn);
						model.addAttribute("fileNm",fvo.getOrignlFileNm());
						
						return "/com/fms/pdfViewerPage";
					}else{
						str.append("<script>alert('"+egovMessageSource.getMessage("com.fail.file.select")+"');</script>");
					}
					
				}
				
			}
		}
		
		String mimetype = "text/html; charset=UTF-8";
		
		response.setContentType(mimetype);
		
		PrintWriter printwriter = response.getWriter();
		printwriter.println("<html><form name='downForm'></form>");
		printwriter.println(str);
		printwriter.println("</html>");
		printwriter.flush();
		printwriter.close();
		return "/err/file";
	}
	
	
	@RequestMapping(value = "/com/fms/FileDown.do")
	public String FileDownload(@RequestParam Map<String, Object> commandMap, HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		String atchFileId = (String) commandMap.get("downAtchFileId");
		String fileSn = (String) commandMap.get("downFileSn");
		
		
		String mimetype = "text/html; charset=UTF-8";
		
		response.setContentType(mimetype);
		StringBuffer str = new StringBuffer();
		
		
		if(!"".equals(atchFileId) && atchFileId != null && !"".equals(fileSn) && fileSn != null){
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			if(loginVO != null){
				
				
				FileVO fileVO = new FileVO();
				fileVO.setAtchFileId(atchFileId);
				fileVO.setFileSn(fileSn);
				FileVO fvo = fileMngService.selectFileInf(fileVO);
				
				
				if(fvo == null){
					str.append("<script>alert('"+egovMessageSource.getMessage("com.fail.file.select")+"');</script>");
				}else{
					
					File uFile = new File(fvo.getFileStreCours(), fvo.getStreFileNm());
					long fSize = uFile.length();
					
					
					if (fSize > 0) {
						
						
						setDisposition(fvo.getOrignlFileNm(), request, response);
						
						BufferedInputStream in = null;
						BufferedOutputStream out = null;

						try {
							in = new BufferedInputStream(new FileInputStream(uFile));
							out = new BufferedOutputStream(response.getOutputStream());
							FileCopyUtils.copy(in, out);

							
							out.flush();
						} catch (IOException ex) {
							EgovBasicLogger.ignore("IO Exception", ex);
						} finally {
							
							EgovResourceCloseHelper.close(in, out);
						}
						return "/err/file";
					}else{
						str.append("<script>alert('"+egovMessageSource.getMessage("com.fail.file.select")+"');</script>");
					}
					
				}
				
			}
		}
		PrintWriter printwriter = response.getWriter();
		printwriter.println("<html><form name='downForm'></form>");
		printwriter.println(str);
		printwriter.println("</html>");
		printwriter.flush();
		printwriter.close();
		return "/err/file";
	}
	
	
	@RequestMapping(value = "/com/fms/ZipFileDown.do")
	public String ZipFileDown(@RequestParam Map<String, Object> commandMap,HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
		
		String[] downFile = (String[]) request.getParameterValues("downFile");
		
    	
		
		String mimetype = "text/html; charset=UTF-8";
		
		response.setContentType(mimetype);
		StringBuffer str = new StringBuffer();
		
		
		if(downFile != null && downFile.length > 0){
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			if(loginVO != null){
				
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
	    		try{
	    			
	    			zipOut = new ZipOutputStream(new FileOutputStream(zipFilePath+zipFileName));
		    		
	    			
	    			
		        	for(int i=0;i<downFile.length;i++){
		        		String[] split_file = downFile[i].split(";");
		        		String split_atchFileId = split_file[0];
		        		String split_fileSn = split_file[1];
		        		String split_dirNm = split_file[2];
		        		
		        		
		        		split_dirNm = split_dirNm.replaceAll("/", "-");
		        		
		        		FileVO fileVO = new FileVO();
		    			fileVO.setAtchFileId(split_atchFileId);
		    			fileVO.setFileSn(split_fileSn);
		    			FileVO fvo = fileService.selectFileInf(fileVO);
		    			
		    			File uFile = new File(fvo.getFileStreCours(), fvo.getStreFileNm());
		    			
		    			if(!uFile.isFile()){
			    			str.append("<script>alert('"+fvo.getOrignlFileNm()+" 파일이 서버에 존재하지 않습니다.');</script>");
			    			
			    			zipOut.close();
			    			
			    			
			    			zipMakeChk = false;
			    			break;
		    			}
		    			FileInputStream in = new FileInputStream(uFile);
		    	        String fileName = "file_"+i+"_"+fvo.getOrignlFileNm().toString();
		    	                
		    	        ZipEntry ze = new ZipEntry(split_dirNm+"/"+fileName);

		    	        zipOut.putNextEntry(ze);
		    	          
		    	        int len;
		    	        while ((len = in.read(buf)) > 0) {
		    	        	zipOut.write(buf, 0, len);
		    	        }
		    	          
		    	        zipOut.closeEntry();
		    	        in.close();
		        	}
		    		
		    		
		        	zipOut.close();
		    		
	    		}catch (IOException ioe) {
	    			Log.error("selectReq4104FileZipUpload()", ioe);
	    			str.append("<script>alert('"+egovMessageSource.getMessage("com.fail.file.select")+"');</script>");
	    			
	    			zipOut.close();
	    			
	    			
	    			zipMakeChk = false;
	    		}catch(Exception e){
    				Log.error(e);
    				
    				str.append("<script>alert('"+egovMessageSource.getMessage("com.fail.file.select")+"');</script>");
	    			
	    			zipOut.close();
	    			
	    			
	    			zipMakeChk = false;
    			}
	    		
	    		
	    		if(zipMakeChk){
		    		
					File uFile = new File(zipFilePath, zipFileName);
					long fSize = uFile.length();
					
					if (fSize > 0) {
						
						
						setDisposition(zipFileName, request, response);
						
						BufferedInputStream in = null;
						BufferedOutputStream out = null;
	
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
						return "/err/file";
					}else{
						
						str.append("<script>alert('"+egovMessageSource.getMessage("com.fail.file.select")+"');</script>");
					}
				}
			}
		}
		PrintWriter printwriter = response.getWriter();
		printwriter.println("<html><form name='downForm'></form>");
		printwriter.println(str);
		printwriter.println("</html>");
		printwriter.flush();
		printwriter.close();
		return "/err/file";
	}
	
	
	@RequestMapping(value="/com/fms/FileDelete.do")
	public ModelAndView FileDelete(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{

			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			paramMap.put("prjId", request.getSession().getAttribute("selPrjId").toString());
			
			
			String deleteType = (String)paramMap.get("deleteType");
			
			
			FileVO fileVo = new FileVO();
			fileVo.setAtchFileId(paramMap.get("atchFileId"));
			fileVo.setFileSn(paramMap.get("fileSn"));
			
			
			fileVo = fileMngService.selectFileInf(fileVo);
			
			
			if(fileVo == null || "".equals(fileVo.getAtchFileId()) || fileVo.getAtchFileId() == null){
				model.addAttribute("Success", "N");	
				model.addAttribute("nonFile", "Y");	
				model.addAttribute("message", egovMessageSource.getMessage("fail.common.nonDelete"));
				return new ModelAndView("jsonView");	
			}
			fileMngService.deleteFileInf(fileVo);

			
			String fileDeletePath  = fileVo.getFileStreCours()+fileVo.getStreFileNm();
		    String delResult       =  EgovFileMngUtil.deleteFile(fileDeletePath);
		    System.out.println(delResult);
			model.put("Success", "Y");
			
			
			if("request".equals(deleteType)){
				Map<String, Object> hisLogParamMap = new HashMap<String, Object>(paramMap);
				List<FileVO> files = new ArrayList<>();
				files.add(fileVo);
				hisLogParamMap.put("fileList", files);
				
				hisLogParamMap.put("fileActionType", "del");
				
				req6000Service.insertReq6000ModifyHistoryList(hisLogParamMap);
			}
			
			model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("FileDelete()", ex);

			
			model.put("Success", "N");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/com/fms/insertAtchFileIdInfo.do")
	public ModelAndView insertAtchFileIdInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		try{
			
			String atchFileIdString = idgenService.getNextStringId();
			fileMngService.insertFileMasterInfo(atchFileIdString);
			model.addAttribute("atchFileIdString",atchFileIdString);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("insertAtchFileIdInfo()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
			return new ModelAndView("jsonView");
		}
	}
	
	
}
