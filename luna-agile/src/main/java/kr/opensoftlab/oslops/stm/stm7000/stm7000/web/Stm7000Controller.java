package kr.opensoftlab.lunaops.stm.stm7000.stm7000.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.annotation.DefaultAnnotationHandlerMapping;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.service.FileVO;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.opensoftlab.lunaops.com.fms.web.service.FileMngService;
import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.lunaops.stm.stm7000.stm7000.service.Stm7000Service;
import kr.opensoftlab.lunaops.stm.stm7000.stm7000.vo.Stm7000VO;
import kr.opensoftlab.sdf.util.OslAgileConstant;
import kr.opensoftlab.sdf.util.PagingUtil;
import kr.opensoftlab.sdf.util.ReqHistoryMngUtil;
import kr.opensoftlab.sdf.util.RequestConvertor;



@SuppressWarnings("deprecation")
@Controller
public class Stm7000Controller {

	
	private static final Logger Log = Logger.getLogger(Stm7000Controller.class);

	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;


	
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

	
	@Resource(name = "stm7000Service")
	private Stm7000Service stm7000Service;
	
    @Autowired
    private ApplicationContext ac;

    
	@RequestMapping(value="/stm/stm7000/stm7000/selectStm7000View.do")
	public String selectStm7000View( HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/stm/stm7000/stm7000/stm7000";
	}
	
	
	@RequestMapping(value="/stm/stm7000/stm7000/selectStm1001View.do")
	public String selectStm1001View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
        	
        	HttpSession ss = request.getSession();
    		LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");   		
    		model.addAttribute("regUsrId",loginVO.getUsrId());

        	
    		String fileInfoMaxSize = EgovProperties.getProperty("Globals.lunaops.fileInfoMaxSize");
    		String fileSumMaxSize = EgovProperties.getProperty("Globals.lunaops.fileSumMaxSize");
    		model.addAttribute("fileInfoMaxSize",fileInfoMaxSize);
    		model.addAttribute("fileSumMaxSize",fileSumMaxSize);
    		
			return "/stm/stm7000/stm7000/stm1001";
		}
    	catch(Exception ex){
    		Log.error("selectStm1001View()", ex);
    		throw new Exception(ex.getMessage());
    	}
	}

	
	
	@RequestMapping(value="/stm/stm7000/stm7000/selectStm7000ListAjaxView.do")
	public ModelAndView selectStm7000ListAjaxView(@ModelAttribute("stm7000DAO") Stm7000VO stm7000VO, HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			String _pageNo_str = paramMap.get("pageNo");
			String _pageSize_str = paramMap.get("pageSize");
			
			int _pageNo = 1;
			int _pageSize = OslAgileConstant.pageSize;
			
			if(_pageNo_str != null && !"".equals(_pageNo_str)){
				_pageNo = Integer.parseInt(_pageNo_str)+1;  
			}
			if(_pageSize_str != null && !"".equals(_pageSize_str)){
				_pageSize = Integer.parseInt(_pageSize_str);  
			}
			
			
			stm7000VO.setPageIndex(_pageNo);
			stm7000VO.setPageSize(_pageSize);
			stm7000VO.setPageUnit(_pageSize);
			
			
			PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(stm7000VO);  

			List<Stm7000VO> stm7000List = null;

			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");

			stm7000VO.setLoginUsrId(loginVO.getUsrId());
			stm7000VO.setLicGrpId(loginVO.getLicGrpId());
			stm7000VO.setPrjId((String) ss.getAttribute("selPrjId"));

			
			int totCnt = 0;
			stm7000List =  stm7000Service.selectStm7000List(stm7000VO);

			
			
			totCnt =stm7000Service.selectStm7000ListCnt(stm7000VO);
			paginationInfo.setTotalRecordCount(totCnt);
			
			model.addAttribute("list", stm7000List);
			
			
			Map<String, Integer> pageMap = new HashMap<String, Integer>();
			pageMap.put("pageNo",stm7000VO.getPageIndex());
			pageMap.put("listCount", stm7000List.size());
			pageMap.put("totalPages", paginationInfo.getTotalPageCount());
			pageMap.put("totalElements", totCnt);
			pageMap.put("pageSize", _pageSize);
			
			model.addAttribute("page", pageMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectStm7000ListAjaxView()", ex);
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/stm/stm7000/stm7000/selectStm1001InfoAjax.do")
	public ModelAndView selectStm1001InfoAjax( HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
    		LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");

    		
        	paramMap.put("licGrpId", loginVO.getLicGrpId());
			
			paramMap.put("prjGrpId", (String)ss.getAttribute("selPrjGrpId"));
			
			Map apiInfoMap =  stm7000Service.selectStm7000Info(paramMap);
			
			
			model.addAttribute("apiInfoMap", apiInfoMap);
			
			
			List<FileVO> fileList = null;
        	int fileCnt = 0;
        	
        	if(apiInfoMap != null){
        		
            	FileVO fileVO = new FileVO();
	        	fileVO.setAtchFileId((String)apiInfoMap.get("atchFileId"));
	        	
	        	
				fileList = fileMngService.fileDownList(fileVO);
				
				
				
				for(FileVO temp : fileList){
					if(fileCnt < Integer.parseInt(temp.getFileSn())){
						fileCnt = Integer.parseInt(temp.getFileSn());
					}
				}
        	}
			model.addAttribute("fileList",fileList);
			
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectStm1001InfoAjax()", ex);
			throw new Exception(ex.getMessage());
		}
	}

	
	@RequestMapping(value="/stm/stm7000/stm7000/saveStm1001InfoAjax.do")
	public ModelAndView saveApi1001InfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			saveFile(paramMap,request);

			
			stm7000Service.saveStm7000Info(paramMap);
	
			
			model.addAttribute("message", egovMessageSource.getMessage("success.common.save"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("saveApi1001InfoAjax()", ex);

			
			model.addAttribute("saveYN", "N");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.save"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	public void saveFile(Map<String, String> paramMap,HttpServletRequest request) throws Exception{
		MultipartHttpServletRequest mptRequest = (MultipartHttpServletRequest)request;
		
		List<FileVO> _result = new ArrayList<FileVO>();

		
		String _atchFileId = paramMap.get("atchFileId");
		FileVO fVo = new FileVO();
		fVo.setAtchFileId(_atchFileId);
		
		int _FileSn = -1;
		_FileSn = fileMngService.getMaxFileSN(fVo);

		
		if("".equals(_atchFileId) || _atchFileId == null || "NULL".equals(_atchFileId)){
			
			_result = fileUtil.fileUploadInsert(mptRequest,"",0,"Req");

			
			if(_result != null){
				
				_atchFileId = fileMngService.insertFileInfs(_result);  
				paramMap.put("atchFileId",_atchFileId);
			}else{
				
				String atchFileIdString = idgenService.getNextStringId();
				fileMngService.insertFileMasterInfo(atchFileIdString);
				paramMap.put("atchFileId",atchFileIdString);
			}
		}else if(_FileSn >= 0){
			
			
			_result = fileUtil.fileUploadInsert(mptRequest,_atchFileId,_FileSn,"Req");
			
			
			if(_result != null){
				
				_atchFileId = fileMngService.insertFileDetail(_result);  
			}
		}else{
			paramMap.put("atchFileId",_atchFileId);
		}
	}

	
	@RequestMapping(value="/stm/stm7000/stm7000/deleteStm7000InfoAjax.do")
	public ModelAndView deleteStm7000InfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			int useCount = stm7000Service.selectStm7000UseCountInfo(paramMap);
			if(useCount==0){
				stm7000Service.deleteStm7000Info(paramMap);
				
				model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
			}else{
				
				model.addAttribute("saveYN", "N");
				model.addAttribute("message", egovMessageSource.getMessage("fail.common.existInfo"));
			}
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("deleteStm7000InfoAjax()", ex);

			
			model.addAttribute("saveYN", "N");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/stm/stm7000/stm7000/selectStm1002View.do")
	public String selectStm1002View( HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/stm/stm7000/stm7000/stm1002";
	}
	
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/stm/stm7000/stm7000/selectStm7000ValidRestfulApiListAjax.do")
	public ModelAndView selectStm7000ValidRestfulApiListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{
			
			
			DefaultAnnotationHandlerMapping mapping = ac.getBean(DefaultAnnotationHandlerMapping.class);
			
			Map map = mapping.getHandlerMap();
			
			List<Map> urlList = new ArrayList<Map>();
			
			Set<String> keySet=map.keySet();
			
			Map urlMap = null;
			
			for( String  key   : keySet) {
				if(key.indexOf("/restapi")>-1){
					if(! "/".equals(key.substring(key.length()-1)) ){
						if(! ".*".equals(key.substring(key.length()-2)) ){
							urlMap = new HashMap();
							urlMap.put("url", key);
							urlList.add(urlMap);	
						}
					}
				}
			}
									
			model.addAttribute("urlList", urlList);			
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectStm7000ValidRestfulApiListAjax()", ex);
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}

}
