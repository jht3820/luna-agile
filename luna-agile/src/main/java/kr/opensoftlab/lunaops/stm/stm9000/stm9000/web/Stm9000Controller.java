package kr.opensoftlab.lunaops.stm.stm9000.stm9000.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.opensoftlab.lunaops.com.exception.UserDefineException;
import kr.opensoftlab.lunaops.com.fms.web.service.FileMngService;
import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.lunaops.dpl.dpl1000.dpl1000.service.Dpl1000Service;
import kr.opensoftlab.lunaops.stm.stm9000.stm9000.service.Stm9000Service;
import kr.opensoftlab.lunaops.stm.stm9000.stm9000.vo.Stm9000VO;
import kr.opensoftlab.lunaops.stm.stm9000.stm9000.vo.Stm9001VO;
import kr.opensoftlab.sdf.jenkins.JenkinsClient;
import kr.opensoftlab.sdf.util.CommonScrty;
import kr.opensoftlab.sdf.util.OslAgileConstant;
import kr.opensoftlab.sdf.util.PagingUtil;
import kr.opensoftlab.sdf.util.ReqHistoryMngUtil;
import kr.opensoftlab.sdf.util.RequestConvertor;

import org.apache.http.conn.HttpHostConnectException;
import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;



@Controller
public class Stm9000Controller {

	
	private static final Logger Log = Logger.getLogger(Stm9000Controller.class);

	public static final String JENKINS_OK = "JENKINS_OK";

	public static final String JENKINS_SETTING_WORNING = "JENKINS_SETTING_WORNING";

	public static final String JENKINS_WORNING_URL = "JENKINS_WORNING_URL";

	public static final String JENKINS_FAIL = "JENKINS_FAIL";

	
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

	@Resource(name = "stm9000Service")
	private Stm9000Service stm9000Service;

    
    @Resource(name = "dpl1000Service")
    private Dpl1000Service dpl1000Service;

	@Resource(name = "jenkinsClient")
	private JenkinsClient jenkinsClient;
	
	

	@RequestMapping(value="/stm/stm9000/stm9000/selectStm9000JobView.do")
	public String selectStm9000JobView( HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/stm/stm9000/stm9000/stm9000";
	}

	
	@RequestMapping(value="/stm/stm9000/stm9000/selectStm9001JenkinsDetailView.do")
	public String selectStm9001JenkinsDetailView( HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/stm/stm9000/stm9000/stm9001";
	}
	
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/stm/stm9000/stm9000/selectStm9002JobDetailView.do")
	public String selectStm9002JobDetailView( HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			List<Map> jenkinsList = stm9000Service.selectStm9000JenkinsNormalList(paramMap);
			model.addAttribute("jenkinsList",jenkinsList);
		}catch(Exception e){
			Log.error(e);
		}
		return "/stm/stm9000/stm9000/stm9002";
	}
	
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/stm/stm9000/stm9000/selectStm9003JenkinsDetailView.do")
	public String selectStm9003JenkinsDetailView( HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			String userId= paramMap.get("jenUsrId");
			String tokenId= paramMap.get("jenUsrTok");
			String jenUrl= paramMap.get("jenUrl");
			
			
			String salt = EgovProperties.getProperty("Globals.lunaops.salt");
			
			
			if(tokenId == null || "".equals(tokenId)){
				
				model.addAttribute("errorYn", "Y");
				model.addAttribute("message", "JENKINS 연결에 실패했습니다.");
			}
			
			
			String deTokenId = CommonScrty.decryptedAria(tokenId, salt);
			
			
			jenkinsClient.setUser(userId);
			jenkinsClient.setPassword(deTokenId);
			
			try{
				
				String buildUrl = jenUrl+"/api/json";
				String buildContent = jenkinsClient.excuteHttpClientJenkins(buildUrl);
				Map jenMap = jenkinsClient.getJenkinsParser(buildContent);
				
				model.addAttribute("jenMap",jenMap);
				
				
				List<JSONObject> jobs = (List)jenMap.get("jobs");
				
				model.addAttribute("jobs",jobs);
				
			}catch(Exception e){
				System.out.println(e);
				model.addAttribute("errorYn", "Y");
				model.addAttribute("message", "JENKINS 연결에 실패했습니다.");
			}
		}catch(Exception e){
			Log.error(e);
		}
		return "/stm/stm9000/stm9000/stm9003";
	}
	
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/stm/stm9000/stm9000/selectStm9004JobDetailView.do")
	public String selectStm9004JenkinsDetailView( HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			List jobBldNumList = dpl1000Service.selectDpl1400DplBldNumList(paramMap);
			model.addAttribute("jobBldNumList",jobBldNumList);
		}catch(Exception e){
			Log.error(e);
		}
		return "/stm/stm9000/stm9000/stm9004";
	}
	
	
	@RequestMapping(value="/stm/stm9000/stm9000/selectStm9000JenkinsListAjax.do")
	public ModelAndView selectStm9000JenkinsListAjax(@ModelAttribute("stm9000VO") Stm9000VO stm9000VO, HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

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

			
			stm9000VO.setPageIndex(_pageNo);
			stm9000VO.setPageSize(_pageSize);
			stm9000VO.setPageUnit(_pageSize);


			PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(stm9000VO);  

			List<Stm9000VO> stm9000List = null;

			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");

			stm9000VO.setLoginUsrId(loginVO.getUsrId());
			stm9000VO.setLicGrpId(loginVO.getLicGrpId());

			
			int totCnt = 0;
			stm9000List =   stm9000Service.selectStm9000JenkinsList(stm9000VO);


			
			totCnt =  stm9000Service.selectStm9000JenkinsListCnt(stm9000VO);
			paginationInfo.setTotalRecordCount(totCnt);

			model.addAttribute("list", stm9000List);

			
			Map<String, Integer> pageMap = new HashMap<String, Integer>();
			pageMap.put("pageNo",stm9000VO.getPageIndex());
			pageMap.put("listCount", stm9000List.size());
			pageMap.put("totalPages", paginationInfo.getTotalPageCount());
			pageMap.put("totalElements", totCnt);
			pageMap.put("pageSize", _pageSize);

			model.addAttribute("page", pageMap);

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectStm9000JenkinsListAjax()", ex);
			throw new Exception(ex.getMessage());
		}
	}
	
	
	@RequestMapping(value="/stm/stm9000/stm9000/selectStm9000JobListAjax.do")
	public ModelAndView selectStm9000JobListAjax(@ModelAttribute("stm9000VO") Stm9001VO jen1100VO, HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

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

			
			jen1100VO.setPageIndex(_pageNo);
			jen1100VO.setPageSize(_pageSize);
			jen1100VO.setPageUnit(_pageSize);
			jen1100VO.setPrjId((String)request.getSession().getAttribute("selPrjId"));


			PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(jen1100VO);  

			List<Stm9001VO> stm9000List = null;

			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");

			jen1100VO.setLoginUsrId(loginVO.getUsrId());
			jen1100VO.setLicGrpId(loginVO.getLicGrpId());

			
			int totCnt = 0;
			stm9000List =   stm9000Service.selectStm9000JobList(jen1100VO);


			
			totCnt =  stm9000Service.selectStm9000JobListCnt(jen1100VO);
			paginationInfo.setTotalRecordCount(totCnt);

			model.addAttribute("list", stm9000List);

			
			Map<String, Integer> pageMap = new HashMap<String, Integer>();
			pageMap.put("pageNo",jen1100VO.getPageIndex());
			pageMap.put("listCount", stm9000List.size());
			pageMap.put("totalPages", paginationInfo.getTotalPageCount());
			pageMap.put("totalElements", totCnt);
			pageMap.put("pageSize", _pageSize);

			model.addAttribute("page", pageMap);

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectStm9000JobListAjax()", ex);
			throw new Exception(ex.getMessage());
		}
	}


	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/stm/stm9000/stm9000/selectStm9000JenkinsDetailAjax.do")
	public ModelAndView selectStm9000JenkinsDetailAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);

			
			Map jenMap = stm9000Service.selectStm9000JenkinsInfo(paramMap);

			model.addAttribute("jenInfo", jenMap);

			
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectStm9000JenkinsDetailAjax()", ex);


			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}

	
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/stm/stm9000/stm9000/selectStm9000JobDetailAjax.do")
	public ModelAndView selectStm9000JobDetailAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			Map jobMap = stm9000Service.selectStm9000JobInfo(paramMap);
			
			model.addAttribute("jobInfo", jobMap);
			
			
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectStm9000JobDetailAjax()", ex);
			
			
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	


	
	@RequestMapping(value="/stm/stm9000/stm9000/saveStm9001JenkinsInfoAjax.do")
	public ModelAndView saveStm9001JenkinsInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{


			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			HttpSession ss = request.getSession();

			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");

			paramMap.put("licGrpId", loginVO.getLicGrpId());	
			
			
			String type = (String) paramMap.get("type");
			
			
			String salt = EgovProperties.getProperty("Globals.lunaops.salt");
			
			
			String nowJenUsrTok = (String)paramMap.get("nowJenUsrTok");
			
			
			String jenUsrTok = (String)paramMap.get("jenUsrTok");
			
			
			String newJenUsrTok = "";
			try{
				String userId=(String)paramMap.get("jenUsrId");
				String tokenId=(String)paramMap.get("jenUsrTok");
				
				
				if(type != null && "update".equals(type)){
					
					if(tokenId == null || "".equals(tokenId)){
						model.addAttribute("MSG_CD", JENKINS_FAIL);
						return new ModelAndView("jsonView");
					}
					
					
					if(nowJenUsrTok.equals(jenUsrTok)){
						
						tokenId = CommonScrty.decryptedAria(tokenId, salt);
					}else{
						tokenId = jenUsrTok;
					}
				}
				
				
				jenkinsClient.setUser(userId);
				jenkinsClient.setPassword(tokenId);
				
				String url =   (String)paramMap.get("jenUrl")+"/api/json";
				String content = "";
	
				content = jenkinsClient.excuteHttpClientJenkins(url);
	
				jenkinsClient.getJenkinsParser(content );
			}
			catch(Exception ex){
				Log.error("selectStm9000URLConnect()", ex);
				if( ex instanceof HttpHostConnectException){
					model.addAttribute("MSG_CD", JENKINS_FAIL);
				}else if( ex instanceof ParseException){
					model.addAttribute("MSG_CD", JENKINS_FAIL);
				}else if( ex instanceof IllegalArgumentException){
					model.addAttribute("MSG_CD", JENKINS_WORNING_URL);
				}else if( ex instanceof UserDefineException){
					model.addAttribute("MSG_CD", ex.getMessage());
				}else{
					model.addAttribute("MSG_CD", JENKINS_FAIL);
				}
				
				return new ModelAndView("jsonView");
			}
			
			
			if("update".equals(type)){
				
				if(!nowJenUsrTok.equals(jenUsrTok)){
					
					newJenUsrTok = CommonScrty.encryptedAria(jenUsrTok, salt);
				}else{
					newJenUsrTok = jenUsrTok;
				}
			}
			
			else{
				newJenUsrTok = CommonScrty.encryptedAria(jenUsrTok, salt);
			}

			
			paramMap.remove("jenUsrTok");
			
			
			paramMap.put("jenUsrTok", newJenUsrTok);
			
			
			stm9000Service.saveStm9000JenkinsInfo(paramMap);

			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.save"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("saveStm9001JenkinsInfoAjax()", ex);

			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.save"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/stm/stm9000/stm9000/saveStm9002JobInfoAjax.do")
	public ModelAndView saveStm9002JobInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			HttpSession ss = request.getSession();
			
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			
			paramMap.put("licGrpId", loginVO.getLicGrpId());	
			
			
			String type = (String) paramMap.get("type");
			
			
			if(!"update".equals(type)){
				
				int jobCheck = stm9000Service.selectStm9000JobUseCountInfo(paramMap);
				
				if(jobCheck > 0){
					
					model.addAttribute("errorYn", "Y");
					model.addAttribute("message", "이미 추가된 JOB입니다.");
					return new ModelAndView("jsonView");
				}
			}
			
			
			String salt = EgovProperties.getProperty("Globals.lunaops.salt");
			
			
			String nowJobTok = (String)paramMap.get("nowJobTok");
			
			
			String jobTok = (String)paramMap.get("jobTok");
			
			
			String newJobTok = "";
			try{
				String jenUrl=(String)paramMap.get("jenUrl");
				String jobId=(String)paramMap.get("jobId");
				String userId=(String)paramMap.get("jenUsrId");
				String tokenId=(String)paramMap.get("jenUsrTok");
				
				
				if(tokenId == null || "".equals(tokenId)){
					model.addAttribute("MSG_CD", JENKINS_FAIL);
					return new ModelAndView("jsonView");
				}
				
				
				tokenId = CommonScrty.decryptedAria(tokenId, salt);
				
				
				jenkinsClient.setUser(userId);
				jenkinsClient.setPassword(tokenId);
				
				String url = jenUrl+"/api/json";
				String content = "";
				
				content = jenkinsClient.excuteHttpClientJenkins(url);
				
				jenkinsClient.getJenkinsParser(content );
				
				
				String deJobTok = jobTok;
				
				
				if(nowJobTok.equals(jobTok)){
					
					deJobTok = CommonScrty.decryptedAria(jobTok, salt);
				}
				
				if(deJobTok == null || "".equals(deJobTok)){
					model.addAttribute("MSG_CD", "JOB TOKEN 값이 없습니다.");
					return new ModelAndView("jsonView");
				}
				
				url = jenUrl+"/job/"+jobId+"/config.xml";
				String settingJobTok = "";
				
				settingJobTok = jenkinsClient.excuteHttpClientJobToken(url,deJobTok);
				
				
				if(!deJobTok.equals(settingJobTok)){
					model.addAttribute("MSG_CD", "JOB TOKEN KEY값을 확인해주세요.");
					return new ModelAndView("jsonView");
				}
				
			}
			catch(Exception ex){
				Log.error("selectStm9000URLConnect()", ex);
				if( ex instanceof HttpHostConnectException){
					model.addAttribute("MSG_CD", JENKINS_FAIL);
				}else if( ex instanceof ParseException){
					model.addAttribute("MSG_CD", JENKINS_FAIL);
				}else if( ex instanceof IllegalArgumentException){
					model.addAttribute("MSG_CD", JENKINS_WORNING_URL);
				}else if( ex instanceof UserDefineException){
					model.addAttribute("MSG_CD", ex.getMessage());
				}else{
					model.addAttribute("MSG_CD", JENKINS_FAIL);
				}
				
				return new ModelAndView("jsonView");
			}
			
			
			if("update".equals(type)){
				
				if(!nowJobTok.equals(jobTok)){
					
					newJobTok = CommonScrty.encryptedAria(jobTok, salt);
				}else{
					newJobTok = jobTok;
				}
			}
			
			else{
				newJobTok = CommonScrty.encryptedAria(jobTok, salt);
			}
			
			
			paramMap.remove("jobTok");
			
			
			paramMap.put("jobTok", newJobTok);
			
			
			stm9000Service.saveStm9000JobInfo(paramMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.save"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("saveStm9002JobInfoAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.save"));
			return new ModelAndView("jsonView");
		}
	}

	
	@RequestMapping(value="/stm/stm9000/stm9000/deleteStm9000JenkinsInfoAjax.do")
	public ModelAndView deleteStm9000JenkinsInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			paramMap.put("delCd", "01");
			
			stm9000Service.deleteStm9000JenkinsInfo(paramMap);
			
			
			model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));


			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("deleteStm9000JenkinsInfoAjax()", ex);

			
			model.addAttribute("saveYN", "N");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.save"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/stm/stm9000/stm9000/deleteStm9000JobInfoAjax.do")
	public ModelAndView deleteStm9000JobInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			String prjId = paramMap.get("selPrjId");
			paramMap.put("prjId", prjId);
			
			stm9000Service.deleteStm9000JobInfo(paramMap);
			
			
			model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
			
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("deleteStm9000JobInfoAjax()", ex);
			
			
			model.addAttribute("saveYN", "N");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.save"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/stm/stm9000/stm9000/selectStm9000ConfirmConnect.do")
	public ModelAndView selectStm9000ConfirmConnect(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{

			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);

			Map jenMap = stm9000Service.selectStm9000JenkinsInfo(paramMap);
			String userId=(String)jenMap.get("jenUsrId");
			String tokenId=(String)jenMap.get("jenUsrTok");
			
			
			String salt = EgovProperties.getProperty("Globals.lunaops.salt");
			
			
			String newTokenId = CommonScrty.decryptedAria(tokenId, salt);
			
			
			if(newTokenId == null || "".equals(newTokenId)){
				model.addAttribute("MSG_CD", JENKINS_SETTING_WORNING);
				return new ModelAndView("jsonView");
			}

			
			jenkinsClient.setUser(userId);
			jenkinsClient.setPassword(newTokenId);
			
			String url =   (String)jenMap.get("jenUrl")+"/api/json";
			String content = "";

			content = jenkinsClient.excuteHttpClientJenkins(url);

			jenkinsClient.getJenkinsParser(content );

			model.addAttribute("MSG_CD", JENKINS_OK);


			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectStm9000ConfirmConnect()", ex);
			if( ex instanceof HttpHostConnectException){
				model.addAttribute("MSG_CD", JENKINS_FAIL);
			}else if( ex instanceof ParseException){
				model.addAttribute("MSG_CD", JENKINS_FAIL);
			}else if( ex instanceof UserDefineException){
					model.addAttribute("MSG_CD", ex.getMessage());
			}else{
				model.addAttribute("MSG_CD", JENKINS_FAIL);
			}
			
			return new ModelAndView("jsonView");
		}
	}
	
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/stm/stm9000/stm9000/selectStm9000JobConfirmConnect.do")
	public ModelAndView selectStm9000JobConfirmConnect(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		try{
			
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			Map jobMap = stm9000Service.selectStm9000JobInfo(paramMap);
			
			
			String jenUsrId=(String)jobMap.get("jenUsrId");
			String jenUsrTok=(String)jobMap.get("jenUsrTok");
			String jobTok=(String)jobMap.get("jobTok");
			String jenUrl=(String)jobMap.get("jenUrl");
			String jobId=(String)jobMap.get("jobId");
			
			
			String salt = EgovProperties.getProperty("Globals.lunaops.salt");
			
			
			String deJenUsrTok = CommonScrty.decryptedAria(jenUsrTok, salt);
			String deJobTok = CommonScrty.decryptedAria(jobTok, salt);
			
			
			if(deJenUsrTok == null || "".equals(deJenUsrTok)){
				model.addAttribute("MSG_CD", JENKINS_SETTING_WORNING);
				return new ModelAndView("jsonView");
			}
			if(deJobTok == null || "".equals(deJobTok)){
				model.addAttribute("MSG_CD", "JOB TOKEN 값이 없습니다.");
				return new ModelAndView("jsonView");
			}
			
			
			jenkinsClient.setUser(jenUsrId);
			jenkinsClient.setPassword(deJenUsrTok);
			
			String url = jenUrl+"/job/"+jobId+"/config.xml";
			String settingJobTok = "";
			
			settingJobTok = jenkinsClient.excuteHttpClientJobToken(url,deJobTok);
			
			
			if(!deJobTok.equals(settingJobTok)){
				model.addAttribute("MSG_CD", "JOB TOKEN KEY값을 확인해주세요.");
				
				return new ModelAndView("jsonView");
			}
			
			model.addAttribute("MSG_CD", JENKINS_OK);
			
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectStm9000JobConfirmConnect()", ex);
			if( ex instanceof HttpHostConnectException){
				model.addAttribute("MSG_CD", JENKINS_FAIL);
			}else if( ex instanceof ParseException){
				model.addAttribute("MSG_CD", JENKINS_FAIL);
			}else if( ex instanceof UserDefineException){
				model.addAttribute("MSG_CD", ex.getMessage());
			}else{
				model.addAttribute("MSG_CD", JENKINS_FAIL);
			}
			
			return new ModelAndView("jsonView");
		}
	}

	
	@RequestMapping(value="/stm/stm9000/stm9000/selectStm9002JobView.do")
	public String selectStm9002JobView( HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/stm/stm9000/stm9000/stm9002";
	}
	
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/stm/stm9000/stm9000/selectStm9000URLConnect.do")
	public ModelAndView selectStm9000URLConnect(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{

			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);

			String userId= (String)paramMap.get("jenUsrId");
			String tokenId= (String)paramMap.get("jenUsrTok");
			
			
			String salt = EgovProperties.getProperty("Globals.lunaops.salt");
			
			
			tokenId = CommonScrty.decryptedAria(tokenId, salt);
			
			
			if(tokenId == null || "".equals(tokenId)){
				model.addAttribute("MSG_CD", JENKINS_FAIL);
				return new ModelAndView("jsonView");
			}
			
			
			jenkinsClient.setUser(userId);
			jenkinsClient.setPassword(tokenId);
			
			String url =   (String)paramMap.get("jenUrl")+"/api/json";
			String content = "";

			content = jenkinsClient.excuteHttpClientJenkins(url);

			Map jenkinsMap= jenkinsClient.getJenkinsParser(content );
			List jobList =  (List) jenkinsMap.get("jobs");

			
			model.addAttribute("list", jobList);
			model.addAttribute("MSG_CD", JENKINS_OK);
			
			
			paramMap.put("restoreSelJobType", "03");
			
			
			List<Map> jobRestoreList = stm9000Service.selectStm9000JobNormalList(paramMap);
			
			model.addAttribute("jobRestoreList", jobRestoreList);
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectStm9000URLConnect()", ex);
			if( ex instanceof HttpHostConnectException){
				model.addAttribute("MSG_CD", JENKINS_FAIL);
			}else if( ex instanceof ParseException){
				model.addAttribute("MSG_CD", JENKINS_FAIL);
			}else if( ex instanceof IllegalArgumentException){
				model.addAttribute("MSG_CD", JENKINS_WORNING_URL);
			}else if( ex instanceof UserDefineException){
					model.addAttribute("MSG_CD", ex.getMessage());
			}else{
				model.addAttribute("MSG_CD", JENKINS_FAIL);
			}
			
			return new ModelAndView("jsonView");
		}
	}
	

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/stm/stm9000/stm9000/selectStm9000JenAuthGrpList.do")
	public ModelAndView selectStm9000JenAuthGrpList(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			List<Map> jenAuthGrpList = stm9000Service.selectStm9000JenAuthGrpList(paramMap);
			model.addAttribute("jenAuthGrpList", jenAuthGrpList);
			
			
			model.addAttribute("errorYN", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectStm9000JenAuthGrpList()", ex);
			
			
			model.addAttribute("errorYN", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	@RequestMapping(value="/stm/stm9000/stm9000/insertStm9000JenAuthGrpList.do")
	public ModelAndView insertStm9000JenAuthGrpList(HttpServletRequest request, HttpServletResponse response, ModelMap model )	throws Exception {
		try{
			
			Map paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			int selAuthCnt = Integer.parseInt((String)paramMap.get("selAuthCnt"));
			
			
			int addFailAuthCnt = stm9000Service.insertStm9000JenAuthGrpList(paramMap);
			
			
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
			Log.error("insertStm9000JenAuthGrpList()", e);
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
			return new ModelAndView("jsonView");
		}
	}
	

	
	@SuppressWarnings({ "rawtypes"})
	@RequestMapping(value="/stm/stm9000/stm9000/deleteStm9000JenAuthGrpList.do")
	public ModelAndView deleteStm9000JenAuthGrpList(HttpServletRequest request, HttpServletResponse response, ModelMap model )	throws Exception {
		try{
			
			Map paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			stm9000Service.deleteStm9000JenAuthGrpList(paramMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
			
			return new ModelAndView("jsonView");

		}catch(Exception e){
			Log.error("deleteStm9000JenAuthGrpList()", e);
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
			return new ModelAndView("jsonView");
		}
	}
}
