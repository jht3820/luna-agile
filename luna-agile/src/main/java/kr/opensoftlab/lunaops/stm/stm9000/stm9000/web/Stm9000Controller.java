package kr.opensoftlab.lunaops.stm.stm9000.stm9000.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.client.HttpResponseException;
import org.apache.http.conn.HttpHostConnectException;
import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.opensoftlab.lunaops.com.exception.UserDefineException;
import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.lunaops.dpl.dpl1000.dpl1000.service.Dpl1000Service;
import kr.opensoftlab.lunaops.stm.stm9000.stm9000.service.Stm9000Service;
import kr.opensoftlab.lunaops.stm.stm9000.stm9100.service.Stm9100Service;
import kr.opensoftlab.sdf.jenkins.JenkinsClient;
import kr.opensoftlab.sdf.util.CommonScrty;
import kr.opensoftlab.sdf.util.OslStringUtil;
import kr.opensoftlab.sdf.util.PagingUtil;
import kr.opensoftlab.sdf.util.RequestConvertor;


@Controller
public class Stm9000Controller {

	
	private static final Logger Log = Logger.getLogger(Stm9000Controller.class);

	public static final String JENKINS_OK = "JENKINS_OK";

	public static final String JENKINS_SETTING_WORNING = "JENKINS_SETTING_WORNING";

	public static final String JENKINS_WORNING_URL = "JENKINS_WORNING_URL";

	public static final String JENKINS_FAIL = "JENKINS_FAIL";

	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	
	@Resource(name = "stm9000Service")
	private Stm9000Service stm9000Service;
	
	
	@Resource(name = "stm9100Service")
	private Stm9100Service stm9100Service;

    
    @Resource(name = "dpl1000Service")
    private Dpl1000Service dpl1000Service;

	@Resource(name = "jenkinsClient")
	private JenkinsClient jenkinsClient;
	
	
	@RequestMapping(value="/stm/stm9000/stm9000/selectStm9000View.do")
	public String selectStm9000View( HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/stm/stm9000/stm9000/stm9000";
	}
	
	
	@RequestMapping(value="/stm/stm9000/stm9000/selectStm9001View.do")
	public String selectStm9001View( HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/stm/stm9000/stm9000/stm9001";
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/stm/stm9000/stm9000/selectStm9003View.do")
	public String selectStm9003View( HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			String userId= paramMap.get("paramJenUsrId");
			String tokenId= paramMap.get("paramJenUsrTok");
			String jenUrl= paramMap.get("paramJenUrl");
			
			
			String salt = EgovProperties.getProperty("Globals.lunaops.salt");
			
			
			if(tokenId == null || "".equals(tokenId)){
				
				model.addAttribute("errorYn", "Y");
				model.addAttribute("message", egovMessageSource.getMessage("stm9000.fail.jenkins.notTokenKey"));
			}
			
			
			String deTokenId = CommonScrty.decryptedAria(tokenId, salt);
			
			
			jenkinsClient.setUser(userId);
			jenkinsClient.setPassword(deTokenId);
			
			try{
				
				String buildUrl = jenUrl+"/api/json";
				
				String buildContent = jenkinsClient.excuteHttpClientJenkins(buildUrl);
				Map jenMap = jenkinsClient.getJenkinsParser(buildContent);
				
				model.addAttribute("jenMap", jenMap);
				
				
				List<JSONObject> jobs = (List)jenMap.get("jobs");
				
				model.addAttribute("jobs",jobs);
				
			}catch(Exception e){
				
				model.addAttribute("errorYn", "Y");
				model.addAttribute("message", egovMessageSource.getMessage("stm9000.fail.jenkins.connect.check.error.message"));
			}
		}catch(Exception e){
			Log.error(e);
		}
		return "/stm/stm9000/stm9000/stm9003";
	}
	
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/stm/stm9000/stm9000/selectStm9000JenkinsListAjax.do")
	public ModelAndView selectStm9000JenkinsListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			
			String _pageNo_str = paramMap.get("pagination[page]");
			String _pageSize_str = paramMap.get("pagination[perpage]");
			
			
			int totCnt = stm9000Service.selectStm9000JenkinsListCnt(paramMap);
			
			
			PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(_pageNo_str, _pageSize_str);

			
			paginationInfo.setTotalRecordCount(totCnt);
			paramMap = PagingUtil.getPageSettingMap(paramMap, paginationInfo);
			
			
			String sortFieldId = (String) paramMap.get("sortFieldId");
			sortFieldId = OslStringUtil.replaceRegex(sortFieldId,"[^A-Za-z0-9+]*");
			String sortDirection = (String) paramMap.get("sortDirection");
			String paramSortFieldId = OslStringUtil.convertUnderScope(sortFieldId);
			paramMap.put("paramSortFieldId", paramSortFieldId);
			
			
			
			List stm9000JenkinList = stm9000Service.selectStm9000JenkinsList(paramMap);
			
			
			
			Map<String, Object> metaMap = PagingUtil.getPageReturnMap(paginationInfo);
			
			
			metaMap.put("sort", sortDirection);
			metaMap.put("field", sortFieldId);
			model.addAttribute("data", stm9000JenkinList);
			model.addAttribute("meta", metaMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
						
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectStm9000JenkinsListAjax()", ex);
			
			
    		model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		return new ModelAndView("jsonView");
		}
	}
	
	
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/stm/stm9000/stm9000/selectStm9000JenkinsNormalListAjax.do")
	public ModelAndView selectStm9000JenkinsNormalListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);

			
			List jenkinList = stm9000Service.selectStm9000JenkinsNormalList(paramMap);

			model.addAttribute("jenList", jenkinList);

			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectStm9000JenkinsNormalListAjax()", ex);

			
    		model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/stm/stm9000/stm9000/selectStm9000JenkinsInfoAjax.do")
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
				
				String url = (String)paramMap.get("jenUrl")+"/api/json";
				String content = "";
				
				
				content = jenkinsClient.excuteHttpClientJenkins(url);
	
				jenkinsClient.getJenkinsParser(content);
			}
			catch(Exception ex){
				Log.error("selectStm9000URLConnect()", ex);
				
				
				
				if(ex instanceof HttpResponseException){
					int responseCode = ((HttpResponseException) ex).getStatusCode(); 
					
					if(responseCode == 401) {
						model.addAttribute("resultCode", JENKINS_FAIL);
						model.addAttribute("resultMessage", egovMessageSource.getMessage("stm9000.fail.jenkins.connect.setting.information"));
					
					}else if(responseCode == 404) {
						model.addAttribute("resultCode", JENKINS_FAIL);
						model.addAttribute("resultMessage", egovMessageSource.getMessage("stm9000.fail.jenkins.connect.setting.information"));
					}
				
				}else if(ex instanceof HttpHostConnectException){
					model.addAttribute("resultCode", JENKINS_FAIL);
					model.addAttribute("resultMessage", egovMessageSource.getMessage("stm9000.fail.jenkins.connect.setting.information"));
				
				}else if( ex instanceof ParseException){
					model.addAttribute("resultCode", JENKINS_FAIL);
					model.addAttribute("resultMessage", egovMessageSource.getMessage("stm9000.fail.jenkins.connect.result.parsing.error"));
				
				}else if(ex instanceof UserDefineException){
					model.addAttribute("resultCode", JENKINS_FAIL);
					model.addAttribute("resultMessage", ex.getMessage());
				
				}else if( ex instanceof IllegalArgumentException){
					model.addAttribute("resultCode", JENKINS_FAIL);
					model.addAttribute("resultMessage", egovMessageSource.getMessage("stm9000.fail.jenkins.connect.unauthorized.url"));
				}else{
					model.addAttribute("resultCode", JENKINS_FAIL);
					model.addAttribute("resultMessage", egovMessageSource.getMessage("stm9000.fail.jenkins.connect.check.error"));
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
	
	
	
	@RequestMapping(value="/stm/stm9000/stm9000/deleteStm9000JenkinsInfoAjax.do")
	public ModelAndView deleteStm9000JenkinsInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			stm9000Service.deleteStm9000JenkinsInfo(paramMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("deleteStm9000JenkinsInfoAjax()", ex);

			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
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
				model.addAttribute("resultCode", JENKINS_FAIL);
				model.addAttribute("resultMessage", egovMessageSource.getMessage("stm9000.fail.jenkins.notTokenKey"));
				return new ModelAndView("jsonView");
			}

			
			jenkinsClient.setUser(userId);
			jenkinsClient.setPassword(newTokenId);
			
			String url =   (String)jenMap.get("jenUrl")+"/api/json";
			String content = "";

			
			content = jenkinsClient.excuteHttpClientJenkins(url);
			
			jenkinsClient.getJenkinsParser(content);
			
			model.addAttribute("resultCode", JENKINS_OK);

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectStm9000ConfirmConnect()", ex);
			
			
			
			if(ex instanceof HttpResponseException){
				int responseCode = ((HttpResponseException) ex).getStatusCode(); 
				
				if(responseCode == 401) {
					model.addAttribute("resultCode", JENKINS_FAIL);
					model.addAttribute("resultMessage", egovMessageSource.getMessage("stm9000.fail.jenkins.user.authentication"));
				
				}else if(responseCode == 404) {
					model.addAttribute("resultCode", JENKINS_FAIL);
					model.addAttribute("resultMessage", egovMessageSource.getMessage("stm9000.fail.jenkins.serverData"));
				}
			
			}else if(ex instanceof HttpHostConnectException){
				model.addAttribute("resultCode", JENKINS_FAIL);
				model.addAttribute("resultMessage", egovMessageSource.getMessage("stm9000.fail.jenkins.connect.check.error"));
			
			}else if( ex instanceof ParseException){
				model.addAttribute("resultCode", JENKINS_FAIL);
				model.addAttribute("resultMessage", egovMessageSource.getMessage("stm9000.fail.jenkins.connect.result.parsing.error"));
			
			}else if( ex instanceof IllegalArgumentException){
				model.addAttribute("resultCode", JENKINS_FAIL);
				model.addAttribute("resultMessage", egovMessageSource.getMessage("stm9000.fail.jenkins.connect.unauthorized.url"));
			
			}else if(ex instanceof UserDefineException){
				model.addAttribute("resultCode", JENKINS_FAIL);
				model.addAttribute("resultMessage", ex.getMessage());
			}else{
				model.addAttribute("resultCode", JENKINS_FAIL);
				model.addAttribute("resultMessage", egovMessageSource.getMessage("stm9000.fail.jenkins.connect.check.error"));
			}
			
			return new ModelAndView("jsonView");
		}
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
				model.addAttribute("resultCode", JENKINS_FAIL);
				model.addAttribute("resultMessage", egovMessageSource.getMessage("stm9000.fail.jenkins.notTokenKey"));
				return new ModelAndView("jsonView");
			}
			
			
			jenkinsClient.setUser(userId);
			jenkinsClient.setPassword(tokenId);
			
			String url =   (String)paramMap.get("jenUrl")+"/api/json";
			String content = "";

			content = jenkinsClient.excuteHttpClientJenkins(url);

			Map jenkinsMap= jenkinsClient.getJenkinsParser(content);
			List jobList =  (List)jenkinsMap.get("jobs");

			
			model.addAttribute("jobList", jobList);
			model.addAttribute("resultCode", JENKINS_OK);
			
			List<Map> jobRestoreList = stm9100Service.selectStm9100JobNormalList(paramMap);
			
			model.addAttribute("jobRestoreList", jobRestoreList);
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			
			
			
			if(ex instanceof HttpResponseException){
				int responseCode = ((HttpResponseException) ex).getStatusCode(); 
				
				if(responseCode == 401) {
					model.addAttribute("resultCode", JENKINS_FAIL);
					model.addAttribute("resultMessage", egovMessageSource.getMessage("stm9000.fail.jenkins.user.authentication"));
				
				}else if(responseCode == 404) {
					model.addAttribute("resultCode", JENKINS_FAIL);
					model.addAttribute("resultMessage", egovMessageSource.getMessage("stm9000.fail.jenkins.serverData"));
				}
			
			}else if(ex instanceof HttpHostConnectException){
				model.addAttribute("resultCode", JENKINS_FAIL);
				model.addAttribute("resultMessage", egovMessageSource.getMessage("stm9000.fail.jenkins.connect.check.error"));
			
			}else if( ex instanceof ParseException){
				model.addAttribute("resultCode", JENKINS_FAIL);
				model.addAttribute("resultMessage", egovMessageSource.getMessage("stm9000.fail.jenkins.connect.result.parsing.error"));
			
			}else if( ex instanceof IllegalArgumentException){
				model.addAttribute("resultCode", JENKINS_FAIL);
				model.addAttribute("resultMessage", egovMessageSource.getMessage("stm9000.fail.jenkins.connect.unauthorized.url"));
			
			}else if(ex instanceof UserDefineException){
				model.addAttribute("resultCode", JENKINS_FAIL);
				model.addAttribute("resultMessage", ex.getMessage());
			}else{
				model.addAttribute("resultCode", JENKINS_FAIL);
				model.addAttribute("resultMessage", egovMessageSource.getMessage("stm9000.fail.jenkins.connect.check.error"));
			}
			
			return new ModelAndView("jsonView");
		}
	}
	
}
