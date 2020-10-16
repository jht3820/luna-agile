package kr.opensoftlab.lunaops.usr.usr4000.usr4000.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.opensoftlab.lunaops.com.exception.UserDefineException;
import kr.opensoftlab.lunaops.usr.usr4000.usr4000.service.Usr4000Service;
import kr.opensoftlab.lunaops.usr.usr4000.usr4000.vo.Usr4000VO;
import kr.opensoftlab.sdf.util.OslAgileConstant;
import kr.opensoftlab.sdf.util.PagingUtil;
import kr.opensoftlab.sdf.util.RequestConvertor;
import kr.opensoftlab.sdf.util.WebhookSend;



@Controller
public class Usr4000Controller {

	
	protected Logger Log = Logger.getLogger(this.getClass());
	
	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
    
    
    @Resource(name = "usr4000Service")
    private Usr4000Service usr4000Service;
    
    
    @Resource(name = "webhookSend")
    private WebhookSend webhookSend;

    
	@RequestMapping(value="/usr/usr4000/usr4000/selectUsr4000View.do")
    public String selectUsr4000View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	return "/usr/usr4000/usr4000/usr4000";
    }

    
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/usr/usr4000/usr4000/selectUsr4001View.do")
    public String selectWhk2001View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		
    	Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
    	
    	Map prj4000WhkInfo = null;
		if( "U".equals(paramMap.get("proStatus"))){ 
			paramMap.put("usrId", paramMap.get("regUsrId"));
			
			prj4000WhkInfo = usr4000Service.selectUsr4000UsrWhkInfo(paramMap);
    	}
		
		model.put("usr4000WhkInfo", prj4000WhkInfo);
    	return "/usr/usr4000/usr4000/usr4001";
    }
	

	
	@RequestMapping(method=RequestMethod.POST, value="/usr/usr4000/usr4000/selectUsr4000UsrWhkListAjax.do")
    public ModelAndView selectUsr4000UsrWhkListAjax(@ModelAttribute("usr4000Vo") Usr4000VO usr4000Vo, HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
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
			
			
			usr4000Vo.setPageIndex(_pageNo);
			usr4000Vo.setPageSize(_pageSize);
			usr4000Vo.setPageUnit(_pageSize);
        	
        	
        	PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(usr4000Vo); 
			List<Usr4000VO> usr4000List = null;
			
			usr4000Vo.setLicGrpId(paramMap.get("licGrpId"));
			usr4000Vo.setUsrId(paramMap.get("regUsrId"));
			
        	
			usr4000List = (List<Usr4000VO>) usr4000Service.selectUsr4000UsrWhkList(usr4000Vo);
        	
        	
			int totCnt = usr4000Service.selectUsr4000UsrWhkListCnt(usr4000Vo);
					
        	paginationInfo.setTotalRecordCount(totCnt);
        	
        	model.addAttribute("list", usr4000List);
        	
			
			Map<String, Integer> pageMap = new HashMap<String, Integer>();
			pageMap.put("pageNo",usr4000Vo.getPageIndex());
			pageMap.put("listCount", usr4000List.size());
			pageMap.put("totalPages", paginationInfo.getTotalPageCount());
			pageMap.put("totalElements", totCnt);
			pageMap.put("pageSize", _pageSize);
			
			model.addAttribute("page", pageMap);
        	
        	
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        	
        	return new ModelAndView("jsonView", model);
    	}
    	catch(Exception ex){
    		Log.error("selectUsr4000UsrWhkListAjax()", ex);
    		
    		
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		return new ModelAndView("jsonView", model);
    	}
    }
	
	
	@RequestMapping(method=RequestMethod.POST, value="/usr/usr4000/usr4000/selectUsr4000WebhookConnectTest.do")
	public ModelAndView selectUsr4000WebhookConnectTest(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			String usrNm = paramMap.get("whkRegUsrNm");
			
			
			String platformTypeCd = paramMap.get("platformTypeCd");
			
			
			String webhookUrl = paramMap.get("webhookUrl");
			
			
			String inMessage = "["+usrNm+"] 님께서 Webhook 연결을 시도합니다.";
			
			
			String proStatus = paramMap.get("proStatus");
			
			
			if("I".equals(proStatus)){
				inMessage += "\n- 연결을 성공했습니다.";
			}
			
			else{
				inMessage += "\n- 옵션 항목이 수정되었습니다.";
			}
			
			
			webhookSend.webhookConnectTest(inMessage, webhookUrl, platformTypeCd);
			
			
			model.addAttribute("returnData", webhookSend.getReturnDataList());
			return new ModelAndView("jsonView", model);
		}
		catch(UserDefineException ude) {
			
			model.addAttribute("returnData", webhookSend.getReturnDataList());
			return new ModelAndView("jsonView", model);
		}
		catch(Exception ex){
			Log.error("selectUsr4000WebhookConnectTest()", ex);
			
			
			model.addAttribute("message", egovMessageSource.getMessage("fail.request.msg"));
			return new ModelAndView("jsonView", model);
		}
	}
	
	
	@RequestMapping(method=RequestMethod.POST, value="/usr/usr4000/usr4000/insertUsr4000WebhookInfo.do")
	public ModelAndView insertUsr4000WebhookInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			paramMap.put("usrId", paramMap.get("regUsrId"));
			
			
			usr4000Service.insertUsr4000UsrWhkInfo(paramMap);
			
			model.addAttribute("errorYn", "N");
    		model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
    		
			return new ModelAndView("jsonView", model);
		}
		catch(Exception ex){
			Log.error("insertUsr4000WebhookInfo()", ex);
			
			
			model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
			return new ModelAndView("jsonView", model);
		}
	}
	
	
	@RequestMapping(method=RequestMethod.POST, value="/usr/usr4000/usr4000/updateUsr4000WebhookInfo.do")
	public ModelAndView updateUsr4000WebhookInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			paramMap.put("usrId", paramMap.get("regUsrId"));
			
			
			usr4000Service.updateUsr4000UsrWhkInfo(paramMap);
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));
			
			return new ModelAndView("jsonView", model);
		}
		catch(Exception ex){
			Log.error("updateUsr4000WebhookInfo()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.update"));
			return new ModelAndView("jsonView", model);
		}
	}
	
	
	@RequestMapping(method=RequestMethod.POST, value="/usr/usr4000/usr4000/deleteUsr4000WebhookList.do")
	public ModelAndView deleteUsr4000WebhookList(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			
			Map<String, Object> paramMap = RequestConvertor.requestParamToMapAddSelInfoList(request, true,"webhookId");
			paramMap.put("usrId", paramMap.get("regUsrId"));
			
			usr4000Service.deleteUsr4000UsrWhkList(paramMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
			
			return new ModelAndView("jsonView", model);
		}
		catch(Exception ex){
			Log.error("deleteUsr4000WebhookList()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
			return new ModelAndView("jsonView", model);
		}
	}
}
