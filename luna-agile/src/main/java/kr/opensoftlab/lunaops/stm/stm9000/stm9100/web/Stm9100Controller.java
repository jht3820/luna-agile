package kr.opensoftlab.lunaops.stm.stm9000.stm9100.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.client.HttpResponseException;
import org.apache.http.conn.HttpHostConnectException;
import org.apache.log4j.Logger;
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
import kr.opensoftlab.lunaops.stm.stm9000.stm9000.web.Stm9000Controller;
import kr.opensoftlab.lunaops.stm.stm9000.stm9100.service.Stm9100Service;
import kr.opensoftlab.sdf.jenkins.JenkinsClient;
import kr.opensoftlab.sdf.util.CommonScrty;
import kr.opensoftlab.sdf.util.OslStringUtil;
import kr.opensoftlab.sdf.util.PagingUtil;
import kr.opensoftlab.sdf.util.RequestConvertor;


@Controller
public class Stm9100Controller {

	
	private static final Logger Log = Logger.getLogger(Stm9100Controller.class);

	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	@Resource(name = "stm9100Service")
	private Stm9100Service stm9100Service;
	
	@Resource(name = "dpl1000Service")
	private Dpl1000Service dpl1000Service;
	
	@Resource(name = "jenkinsClient")
	private JenkinsClient jenkinsClient;
	
	
	@RequestMapping(value="/stm/stm9000/stm9100/selectStm9100View.do")
	public String selectStm9100View( HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/stm/stm9000/stm9100/stm9100";
	}
	
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="stm/stm9000/stm9100/selectStm9101View.do")
	public String selectStm9101View( HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {












		return "/stm/stm9000/stm9100/stm9101";
	}
	
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/stm/stm9000/stm9100/selectStm9102View.do")
	public String selectStm9102View( HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			List jobBldNumList = dpl1000Service.selectDpl1400DplBldNumList(paramMap);
			model.addAttribute("jobBldNumList",jobBldNumList);
		}catch(Exception e){
			Log.error(e);
		}
		return "/stm/stm9000/stm9100/stm9102";
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/stm/stm9000/stm9100/selectStm9100JobListAjax.do")
	public ModelAndView selectStm9100JobListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			
			String _pageNo_str = paramMap.get("pagination[page]");
			String _pageSize_str = paramMap.get("pagination[perpage]");
			
			
			int totCnt = stm9100Service.selectStm9100JobListCnt(paramMap);
			
			
			PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(_pageNo_str, _pageSize_str);
			
			
			paginationInfo.setTotalRecordCount(totCnt);
			paramMap = PagingUtil.getPageSettingMap(paramMap, paginationInfo);
			
			
			String sortFieldId = (String) paramMap.get("sortFieldId");
			sortFieldId = OslStringUtil.replaceRegex(sortFieldId,"[^A-Za-z0-9+]*");
			String sortDirection = (String) paramMap.get("sortDirection");
			String paramSortFieldId = OslStringUtil.convertUnderScope(sortFieldId);
			paramMap.put("paramSortFieldId", paramSortFieldId);
			
			
			
			List<Map> stm9100JobList = stm9100Service.selectStm9100JobList(paramMap);
				
			
			
			Map<String, Object> metaMap = PagingUtil.getPageReturnMap(paginationInfo);
				
			
			metaMap.put("sort", sortDirection);
			metaMap.put("field", sortFieldId);
			model.addAttribute("data", stm9100JobList);
			model.addAttribute("meta", metaMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectStm9100JobListAjax()", ex);
			
			
    		model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		return new ModelAndView("jsonView");
		}
	}
	
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/stm/stm9000/stm9100/selectStm9100JobDetailAjax.do")
	public ModelAndView selectStm9100JobDetailAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			Map jobMap = stm9100Service.selectStm9100JobInfo(paramMap);
			
			model.addAttribute("jobInfo", jobMap);
			
			
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectStm9100JobDetailAjax()", ex);
			
			
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/stm/stm9000/stm9100/saveStm9101JobInfoAjax.do")
	public ModelAndView saveStm9101JobInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			HttpSession ss = request.getSession();
			
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());	
			
			
			String type = (String) paramMap.get("type");
			
			
			if(!"update".equals(type)){
				
				
				int jobCheck = stm9100Service.selectStm9100JobUseCountInfo(paramMap);
				
				if(jobCheck > 0){
					
					model.addAttribute("errorYn", "Y");
					model.addAttribute("message", egovMessageSource.getMessage("stm9100.fail.job.exists")); 
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
					model.addAttribute("resultCode", Stm9000Controller.JENKINS_FAIL);
					model.addAttribute("resultMessage", egovMessageSource.getMessage("stm9000.fail.jenkins.notTokenKey"));
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
					model.addAttribute("resultCode", Stm9000Controller.JENKINS_FAIL);
					model.addAttribute("resultMessage", egovMessageSource.getMessage("stm9100.fail.job.notTokenKey"));
					return new ModelAndView("jsonView");
				}
				
				
				url = jenUrl+"/job/"+jobId+"/config.xml";
				String settingJobTok = "";
				
				settingJobTok = jenkinsClient.excuteHttpClientJobToken(url,deJobTok);
				
				
				if(!deJobTok.equals(settingJobTok)){
					
					model.addAttribute("resultCode", Stm9000Controller.JENKINS_FAIL);
					model.addAttribute("resultMessage", egovMessageSource.getMessage("stm9100.fail.job.check.tokenKey"));
					return new ModelAndView("jsonView");
				}
				
			}catch(Exception ex){
				Log.error("saveStm9101JobInfoAjax()", ex);
				
				
				
				if(ex instanceof HttpResponseException){
					int responseCode = ((HttpResponseException) ex).getStatusCode(); 
					
					if(responseCode == 401) {
						model.addAttribute("resultCode", Stm9000Controller.JENKINS_FAIL);
						model.addAttribute("resultMessage", egovMessageSource.getMessage("stm9000.fail.jenkins.user.authentication"));
					
					}else if(responseCode == 404) {
						model.addAttribute("resultCode", Stm9000Controller.JENKINS_FAIL);
						model.addAttribute("resultMessage", egovMessageSource.getMessage("stm9000.fail.jenkins.serverData"));
					}
				
				}else if(ex instanceof HttpHostConnectException){
					model.addAttribute("resultCode", Stm9000Controller.JENKINS_FAIL);
					model.addAttribute("resultMessage", egovMessageSource.getMessage("stm9000.fail.jenkins.connect.check.error"));
				
				}else if( ex instanceof ParseException){
					model.addAttribute("resultCode", Stm9000Controller.JENKINS_FAIL);
					model.addAttribute("resultMessage", egovMessageSource.getMessage("stm9000.fail.jenkins.connect.result.parsing.error"));
				
				}else if( ex instanceof IllegalArgumentException){
					model.addAttribute("resultCode", Stm9000Controller.JENKINS_FAIL);
					model.addAttribute("resultMessage", egovMessageSource.getMessage("stm9000.fail.jenkins.connect.unauthorized.url"));
				
				}else if(ex instanceof UserDefineException){
					model.addAttribute("resultCode", Stm9000Controller.JENKINS_FAIL);
					model.addAttribute("resultMessage", ex.getMessage());
				}else{
					model.addAttribute("resultCode", Stm9000Controller.JENKINS_FAIL);
					model.addAttribute("resultMessage", egovMessageSource.getMessage("stm9000.fail.jenkins.connect.check.error"));
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
			
			
			stm9100Service.saveStm9100JobInfo(paramMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.save"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("saveStm9101JobInfoAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.save"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/stm/stm9000/stm9100/deleteStm9100JobInfoAjax.do")
	public ModelAndView deleteStm9100JobInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			stm9100Service.deleteStm9100JobInfo(paramMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("deleteStm9000JobInfoAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.save"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/stm/stm9000/stm9100/selectStm9100JobConfirmConnect.do")
	public ModelAndView selectStm9100JobConfirmConnect(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			Map jobMap = stm9100Service.selectStm9100JobInfo(paramMap);
			
			
			String jenUsrId=(String)jobMap.get("jenUsrId");
			String jenUsrTok=(String)jobMap.get("jenUsrTok");
			String jobTok=(String)jobMap.get("jobTok");
			String jenUrl=(String)jobMap.get("jenUrl");
			String jobId=(String)jobMap.get("jobId");
			
			
			String salt = EgovProperties.getProperty("Globals.lunaops.salt");
			
			
			String deJenUsrTok = CommonScrty.decryptedAria(jenUsrTok, salt);
			String deJobTok = CommonScrty.decryptedAria(jobTok, salt);
			
			
			if(deJenUsrTok == null || "".equals(deJenUsrTok)){
				model.addAttribute("resultCode", Stm9000Controller.JENKINS_FAIL);
				model.addAttribute("resultMessage", egovMessageSource.getMessage("stm9000.fail.jenkins.notTokenKey"));
				return new ModelAndView("jsonView");
			}
			
			
			if(deJobTok == null || "".equals(deJobTok)){
				model.addAttribute("resultCode", Stm9000Controller.JENKINS_FAIL);
				model.addAttribute("resultMessage", egovMessageSource.getMessage("stm9100.fail.job.notTokenKey"));
				return new ModelAndView("jsonView");
			}
			
			
			jenkinsClient.setUser(jenUsrId);
			jenkinsClient.setPassword(deJenUsrTok);
			
			String url = jenUrl+"/job/"+jobId+"/config.xml";
			String settingJobTok = "";
			
			settingJobTok = jenkinsClient.excuteHttpClientJobToken(url,deJobTok);
			
			
			if(!deJobTok.equals(settingJobTok)){
				
				model.addAttribute("resultCode", Stm9000Controller.JENKINS_FAIL);
				model.addAttribute("resultMessage", egovMessageSource.getMessage("stm9100.fail.job.check.tokenKey"));
				return new ModelAndView("jsonView");
			}
			
			
			model.addAttribute("resultCode", Stm9000Controller.JENKINS_OK);
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectStm9100JobConfirmConnect()", ex);
			
			
			
			if(ex instanceof HttpResponseException){
				int responseCode = ((HttpResponseException) ex).getStatusCode(); 
				
				if(responseCode == 401) {
					model.addAttribute("resultCode", Stm9000Controller.JENKINS_FAIL);
					model.addAttribute("resultMessage", egovMessageSource.getMessage("stm9000.fail.jenkins.user.authentication"));
				
				}else if(responseCode == 404) {
					model.addAttribute("resultCode", Stm9000Controller.JENKINS_FAIL);
					model.addAttribute("resultMessage", egovMessageSource.getMessage("stm9000.fail.jenkins.serverData"));
				}
			
			}else if(ex instanceof HttpHostConnectException){
				model.addAttribute("resultCode", Stm9000Controller.JENKINS_FAIL);
				model.addAttribute("resultMessage", egovMessageSource.getMessage("stm9000.fail.jenkins.connect.check.error"));
			
			}else if( ex instanceof ParseException){
				model.addAttribute("resultCode", Stm9000Controller.JENKINS_FAIL);
				model.addAttribute("resultMessage", egovMessageSource.getMessage("stm9000.fail.jenkins.connect.result.parsing.error"));
			
			}else if( ex instanceof IllegalArgumentException){
				model.addAttribute("resultCode", Stm9000Controller.JENKINS_FAIL);
				model.addAttribute("resultMessage", egovMessageSource.getMessage("stm9000.fail.jenkins.connect.unauthorized.url"));
			
			}else if(ex instanceof UserDefineException){
				model.addAttribute("resultCode", Stm9000Controller.JENKINS_FAIL);
				model.addAttribute("resultMessage", ex.getMessage());
			}else{
				model.addAttribute("resultCode", Stm9000Controller.JENKINS_FAIL);
				model.addAttribute("resultMessage", egovMessageSource.getMessage("stm9000.fail.jenkins.connect.check.error"));
			}
			
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/stm/stm9000/stm9100/selectStm9102JobView.do")
	public String selectStm9002JobView( HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/stm/stm9000/stm9000/stm9102";
	}
}
