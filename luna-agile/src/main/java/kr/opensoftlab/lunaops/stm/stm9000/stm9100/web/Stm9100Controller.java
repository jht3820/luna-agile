package kr.opensoftlab.lunaops.stm.stm9000.stm9100.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.opensoftlab.lunaops.com.fms.web.service.FileMngService;
import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.lunaops.stm.stm9000.stm9100.service.Stm9100Service;
import kr.opensoftlab.lunaops.stm.stm9000.stm9100.vo.Stm9100VO;
import kr.opensoftlab.sdf.util.OslAgileConstant;
import kr.opensoftlab.sdf.util.PagingUtil;
import kr.opensoftlab.sdf.util.ReqHistoryMngUtil;
import kr.opensoftlab.sdf.util.RequestConvertor;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;



@Controller
public class Stm9100Controller {

	
	private static final Logger Log = Logger.getLogger(Stm9100Controller.class);

	
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
	
	@Resource(name = "stm9100Service")
	private Stm9100Service stm9100Service;
	

	
	@RequestMapping(value="/stm/stm9000/stm9100/selectStm9100View.do")
	public String selectStm9100View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/stm/stm9000/stm9100/stm9100";
	}
	
	
	@RequestMapping(value="/stm/stm9000/stm9100/selectStm9100JenkinsProjectListAjax.do")
    public ModelAndView selectStm9100JenkinsProjectListAjax(@ModelAttribute("stm9100VO") Stm9100VO stm9100VO, HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	try{
    		
        	Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);

    		
    		HttpSession ss = request.getSession();
    		LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
    		
    		
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

			
			stm9100VO.setLicGrpId(loginVO.getLicGrpId());
			
			
			stm9100VO.setPageIndex(_pageNo);
			stm9100VO.setPageSize(_pageSize);
			stm9100VO.setPageUnit(_pageSize);
			
			PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(stm9100VO);  
    		
			
			List<Stm9100VO> jenkinsProjectList = null;
			
			
			int totCnt = 0;
			
			
			totCnt =  stm9100Service.selectStm9100JenkinsProjectListCnt(stm9100VO);
			paginationInfo.setTotalRecordCount(totCnt);
    		
    		
			jenkinsProjectList = stm9100Service.selectStm9100JenkinsProjectList(stm9100VO);

			
    		model.addAttribute("list", jenkinsProjectList);
    		
    		
			Map<String, Integer> pageMap = new HashMap<String, Integer>();
			pageMap.put("pageNo",stm9100VO.getPageIndex());
			pageMap.put("listCount", jenkinsProjectList.size());
			pageMap.put("totalPages", paginationInfo.getTotalPageCount());
			pageMap.put("totalElements", totCnt);
			pageMap.put("pageSize", _pageSize);

			
			model.addAttribute("page", pageMap);
    		
    		
    		model.addAttribute("errorYn", 'N');
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        	
        	return new ModelAndView("jsonView", model);
    	}
    	catch(Exception ex){
    		Log.error("selectStm9100JenkinsProjectListAjax()", ex);
    		
    		
    		model.addAttribute("errorYn", 'Y');
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		return new ModelAndView("jsonView");
    	}
    }

	
	@RequestMapping(value="/stm/stm9000/stm9100/selectStm9101View.do")
	public String selectStm9101View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/stm/stm9000/stm9100/stm9101";
	}
	
	
	
	@RequestMapping(value="/stm/stm9000/stm9100/selectStm9102View.do")
	public String selectStm9102View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/stm/stm9000/stm9100/stm9102";
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value="/stm/stm9000/stm9100/selectStm9100JenkinsProjectAuthListAjax.do")
    public ModelAndView selectStm9100JenkinsProjectAuthListAjax(@ModelAttribute("stm9100VO") Stm9100VO stm9100VO, HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	try{
    		
        	Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
        	
    		
    		HttpSession ss = request.getSession();
    		LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
    		
    		
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

			
			stm9100VO.setLicGrpId(loginVO.getLicGrpId());
			
			
			stm9100VO.setPageIndex(_pageNo);
			stm9100VO.setPageSize(_pageSize);
			stm9100VO.setPageUnit(_pageSize);
			
			PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(stm9100VO);  
    		
			
			List<Map> jenkinsJobList = null;
			
			
			int totCnt = 0;
			
			totCnt = stm9100Service.selectStm9100JenkinsProjectAuthListCnt(stm9100VO);
			paginationInfo.setTotalRecordCount(totCnt);
			
			
			jenkinsJobList = stm9100Service.selectStm9100JenkinsProjectAuthList(stm9100VO);

			
    		model.addAttribute("list", jenkinsJobList);
			
			
			Map<String, Integer> pageMap = new HashMap<String, Integer>();
			pageMap.put("pageNo",stm9100VO.getPageIndex());
			pageMap.put("listCount", jenkinsJobList.size());
			pageMap.put("totalPages", paginationInfo.getTotalPageCount());
			pageMap.put("totalElements", totCnt);
			pageMap.put("pageSize", _pageSize);

			
			model.addAttribute("page", pageMap);
			
    		model.addAttribute("errorYn", 'N');
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        	
        	return new ModelAndView("jsonView", model);
    	}
    	catch(Exception ex){
    		Log.error("selectStm9100JenkinsProjectAuthListAjax()", ex);
    		
    		model.addAttribute("errorYn", 'Y');
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		return new ModelAndView("jsonView");
    	}
    }
	
	
	
	@RequestMapping(value="/stm/stm9000/stm9100/insertStm9100ProjectAddJobAjax.do")
    public ModelAndView insertStm9100ProjectAddJobAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	try{
    		
    		Map<String, Object> paramMap = RequestConvertor.requestParamToMapAddSelInfoList(request, true,"jobId");
    		
        	HttpSession ss = request.getSession();
    		LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
       	
    		
    		paramMap.put("licGrpId", loginVO.getLicGrpId());
        	
    		
    		stm9100Service.insertStm9100ProjectAddJob(paramMap);
      
        	
        	model.addAttribute("errorYn", 'N');
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
        	
        	return new ModelAndView("jsonView", model);
    	}
    	catch(Exception ex){
    		Log.error("insertStm9100ProjectAddJobAjax()", ex);
    		
    		
    		model.addAttribute("errorYn", 'Y');
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
    		return new ModelAndView("jsonView");
    	}
    }
	
	
	
	@RequestMapping(value="/stm/stm9000/stm9100/deleteStm9100ProjectDelJobAjax.do")
    public ModelAndView deleteStm9100ProjectDelJob(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	try{
    		
    		Map<String, Object> paramMap = RequestConvertor.requestParamToMapAddSelInfoList(request, true,"jobId");
    		
        	HttpSession ss = request.getSession();
    		LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
       	
    		
    		paramMap.put("licGrpId", loginVO.getLicGrpId());
        	
    		
    		stm9100Service.deleteStm9100ProjectDelJob(paramMap);
      
        	
        	model.addAttribute("errorYn", 'N');
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
        	
        	return new ModelAndView("jsonView", model);
    	}
    	catch(Exception ex){
    		Log.error("deleteStm9100ProjectDelJob()", ex);
    		
    		
    		model.addAttribute("errorYn", 'Y');
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
    		return new ModelAndView("jsonView");
    	}
    }
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/stm/stm9000/stm9100/selectStm9100JenkinsJobAuthGrpListAjax.do")
	public ModelAndView selectStm9100JenkinsJobAuthGrpListAjax(@ModelAttribute("stm9100VO") Stm9100VO stm9100VO, HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
    		HttpSession ss = request.getSession();
    		LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
    		
			
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

			
			stm9100VO.setLicGrpId(loginVO.getLicGrpId());
			
			
			stm9100VO.setPageIndex(_pageNo);
			stm9100VO.setPageSize(_pageSize);
			stm9100VO.setPageUnit(_pageSize);
			
			PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(stm9100VO);  
    		
			
			List<Map> jenAuthGrpList = null;
			
			
			int totCnt = 0;
			
			totCnt = stm9100Service.selectStm9100JenkinsJobAuthGrpListCnt(stm9100VO);
			paginationInfo.setTotalRecordCount(totCnt);
			
			
			jenAuthGrpList = stm9100Service.selectStm9100JenkinsJobAuthGrpList(stm9100VO);

			model.addAttribute("list", jenAuthGrpList);
			
			
			Map<String, Integer> pageMap = new HashMap<String, Integer>();
			pageMap.put("pageNo",stm9100VO.getPageIndex());
			pageMap.put("listCount", jenAuthGrpList.size());
			pageMap.put("totalPages", paginationInfo.getTotalPageCount());
			pageMap.put("totalElements", totCnt);
			pageMap.put("pageSize", _pageSize);

			
			model.addAttribute("page", pageMap);
			
			
			model.addAttribute("errorYN", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectStm9100JenkinsJobAuthGrpListAjax()", ex);
			
			
			model.addAttribute("errorYN", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/stm/stm9000/stm9000/insertStm9100JenkinsJobAuthGrpInfoAjax.do")
	public ModelAndView insertStm9100JenkinsJobAuthGrpInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model )	throws Exception {
		try{
			
			Map<String, Object> paramMap = RequestConvertor.requestParamToMapAddSelInfoList(request, true,"authGrpId");

			List selAuthMapList = (List)paramMap.get("list");
			
			int selAuthCnt = selAuthMapList.size();
			
			
			int addFailAuthCnt = stm9100Service.insertStm9100JenkinsJobAuthGrpInfo(paramMap);
			
			
			if(selAuthCnt == addFailAuthCnt){
				
				model.addAttribute("errorYn", "Y");
				model.addAttribute("message", "선택된 모든 역할그룹이 중복됩니다.");
			}
			
			else if(addFailAuthCnt > 0){
				
				model.addAttribute("errorYn", "N");
				model.addAttribute("message", egovMessageSource.getMessage("success.common.insert")+"</br>"+addFailAuthCnt+"건의 중복 선택 역할그룹은 제외되었습니다.");
			}else{
				
				model.addAttribute("errorYn", "N");
				model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
			}
			
			return new ModelAndView("jsonView");

		}catch(Exception e){
			Log.error("insertStm9100JenkinsJobAuthGrpInfoAjax()", e);
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/stm/stm9000/stm9100/deleteStm9100JenkinsJobAuthGrpInfoAjax.do")
	public ModelAndView deleteStm9100JenkinsJobAuthGrpInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model )	throws Exception {
		try{
			
			Map<String, Object> paramMap = RequestConvertor.requestParamToMapAddSelInfoList(request, true,"authGrpId");
			
			
			stm9100Service.deleteStm9100JenkinsJobAuthGrpInfo(paramMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
			
			return new ModelAndView("jsonView");

		}catch(Exception e){
			Log.error("deleteStm9100JenkinsJobAuthGrpInfoAjax()", e);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
			return new ModelAndView("jsonView");
		}
	}

}
