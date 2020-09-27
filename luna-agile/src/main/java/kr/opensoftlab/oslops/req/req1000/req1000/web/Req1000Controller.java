package kr.opensoftlab.lunaops.req.req1000.req1000.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.service.FileVO;
import egovframework.rte.fdl.cmmn.trace.LeaveaTrace;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.opensoftlab.lunaops.com.exception.UserDefineException;
import kr.opensoftlab.lunaops.com.fms.web.service.FileMngService;
import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.lunaops.prj.prj1000.prj1000.service.Prj1000Service;
import kr.opensoftlab.lunaops.req.req1000.req1000.service.Req1000Service;
import kr.opensoftlab.sdf.util.OslStringUtil;
import kr.opensoftlab.sdf.util.PagingUtil;
import kr.opensoftlab.sdf.util.ReqHistoryMngUtil;
import kr.opensoftlab.sdf.util.RequestConvertor;



@Controller
public class Req1000Controller {

	
	protected Logger Log = Logger.getLogger(this.getClass());
	
	
	@Resource(name = "req1000Service")
	private Req1000Service req1000Service;
	
	
    @Resource(name = "prj1000Service")
    private Prj1000Service prj1000Service;
	
	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	
	@Resource(name = "leaveaTrace")
	LeaveaTrace leaveaTrace;
	
	
   	@Resource(name="fileMngService")
   	private FileMngService fileMngService;
		
	@Value("${Globals.fileStorePath}")
	private String tempPath;

	
	@Resource(name="EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;
	
	@Resource(name = "egovFileIdGnrService")
	private EgovIdGnrService idgenService;
	
	@Resource(name = "historyMng")
	private ReqHistoryMngUtil historyMng;
	
	
	@SuppressWarnings({ "rawtypes" })
	@RequestMapping(value="/req/req1000/req1000/selectReq1000View.do")
	public String selectReq1000ListView(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
		paramMap.put("prjId", request.getSession().getAttribute("selPrjId").toString());
		
		
		Map prjInfo = (Map)prj1000Service.selectPrj1000Info(paramMap);
		model.addAttribute("currPrjInfo",prjInfo);
		
		return "/req/req1000/req1000/req1000";
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value="/req/req1000/req1000/selectReq1000ListAjaxView.do")
	public ModelAndView selectReq1000ListAjaxView(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

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
			
			model.addAttribute("data", req1000List);
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


    
    @SuppressWarnings({ "rawtypes" })
	@RequestMapping(value="/req/req1000/req1000/selectReq1000ReqInfoAjax.do")
	public ModelAndView selectReq1000ReqInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model )	throws Exception {
    	
    	try{
    		
        	Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
        	
			HttpSession ss = request.getSession();
			String prjId	= (String) ss.getAttribute("selPrjId");
			
			
        	String paramPrjId = paramMap.get("prjId");
        	if(paramPrjId != null && !"".equals(paramPrjId)){
        		prjId = paramPrjId;
        	}
        	
			String licGrpId = ((LoginVO) ss.getAttribute("loginVO")).getLicGrpId();
        	
			paramMap.put("prjId", prjId);
			paramMap.put("licGrpId", licGrpId);
			
        	
        	Map reqInfoMap = (Map) req1000Service.selectReq1000ReqInfo(paramMap);        	
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
    
	
	@RequestMapping(value="/req/req1000/req1000/selectReq1001View.do")
	public String selectReq1001View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
        	Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);

        	
			String fileSumMaxSize = EgovProperties.getProperty("Globals.lunaops.fileSumMaxSize");
			model.addAttribute("fileSumMaxSize",fileSumMaxSize);
			model.addAttribute("type",paramMap.get("type"));
			
			return "/req/req1000/req1000/req1001";
		}
    	catch(Exception ex){
    		Log.error("selectReq1001View()", ex);
    		throw new Exception(ex.getMessage());
    	}
	}
	
	
	@RequestMapping(value="/req/req1000/req1000/selectReq1002View.do")
	public String selectReq1002View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			String fileSumMaxSize = EgovProperties.getProperty("Globals.lunaops.fileSumMaxSize");
			model.addAttribute("fileSumMaxSize",fileSumMaxSize);
			model.addAttribute("type",paramMap.get("type"));
			
			return "/req/req1000/req1000/req1002";
		}
		catch(Exception ex){
			Log.error("selectReq1002View()", ex);
			throw new Exception(ex.getMessage());
		}
	}
    
    
	@RequestMapping(value="/req/req1000/req1000/insertReq1001ReqAtchFileInfo.do")
	public ModelAndView insertReq1001ReqAtchFileId(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{
			MultipartHttpServletRequest mptRequest = (MultipartHttpServletRequest)request;
			
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			String atchFileId = (String) paramMap.get("atchFileId");
			
			FileVO fVo = new FileVO();
			fVo.setAtchFileId(atchFileId);
			
			int _FileSn = -1;
			_FileSn = fileMngService.getMaxFileSN(fVo);
			
			
			List<FileVO> _result = fileUtil.fileUploadInsert(mptRequest,atchFileId,_FileSn,"Req");
			
			
			fileMngService.insertFileDetail(_result);  
			
			
			
			model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("insertReq1001ReqAtchFileId()", ex);

			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
			return new ModelAndView("jsonView");
		}
	}
	
	@RequestMapping(value="/req/req1000/req1000/insertReq1001ReqInfoAjax.do")
	public ModelAndView insertReq1001ReqInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			HttpSession ss = request.getSession();

			
			String atchFileId = (String) paramMap.get("atchFileId");
			
			
			if(atchFileId == null || "".equals(atchFileId)) {
				String atchFileIdString = idgenService.getNextStringId();
				fileMngService.insertFileMasterInfo(atchFileIdString);
				paramMap.put("atchFileId",atchFileIdString);
			}
			
			
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("whkRegUsrNm", loginVO.getUsrNm());
        	
			
			Object insertKey = req1000Service.saveReq1000ReqInfo(paramMap);
			paramMap.put("reqId", (String)insertKey);

			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("insertReq1001ReqInfoAjax()", ex);

			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
			return new ModelAndView("jsonView");
		}
	}
    
	
	@RequestMapping(value="/req/req1000/req1000/updateReq1001ReqInfoAjax.do")
	public ModelAndView updateReq1001ReqInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			req1000Service.saveReq1000ReqInfo(paramMap);
			
			model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("updateReq1001ReqInfoAjax()", ex);

			model.addAttribute("saveYN", "N");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.update"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/req/req1000/req1000/deleteReq1001ReqListAjax.do")
	public ModelAndView deleteReq1001ReqListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
        	Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);

			req1000Service.deleteReq1000ReqList(paramMap);

			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));

			return new ModelAndView("jsonView");
		}
		catch(UserDefineException ude) {
			Log.error("deleteReq1001ReqListAjax()", ude);

			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", ude);

			return new ModelAndView("jsonView");
		}
		catch(Exception e){
			Log.error("deleteReq1001ReqListAjax()", e);

			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));

			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/batteryStatus.do")
	public void batteryStatus(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
        	Map<String, String> paramMap = RequestConvertor.requestParamToMap(request);
		}
		catch(Exception e){

		}
	}
}
