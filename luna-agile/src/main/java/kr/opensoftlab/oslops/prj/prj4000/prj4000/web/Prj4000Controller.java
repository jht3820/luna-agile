
package kr.opensoftlab.lunaops.prj.prj4000.prj4000.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import kr.opensoftlab.lunaops.prj.prj4000.prj4000.service.Prj4000Service;
import kr.opensoftlab.lunaops.prj.prj4000.prj4000.vo.Prj4000VO;
import kr.opensoftlab.sdf.util.OslAgileConstant;
import kr.opensoftlab.sdf.util.PagingUtil;
import kr.opensoftlab.sdf.util.RequestConvertor;
import kr.opensoftlab.sdf.util.WebhookSend;



@Controller
public class Prj4000Controller {

	
	protected Logger Log = Logger.getLogger(this.getClass());
	
	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
    
    
    @Resource(name = "prj4000Service")
    private Prj4000Service prj4000Service;
    
    
    @Resource(name = "webhookSend")
    private WebhookSend webhookSend;

    
	@RequestMapping(value="/prj/prj4000/prj4000/selectPrj4000View.do")
    public String selectPrj4000View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	return "/prj/prj4000/prj4000/prj4000";
    }

    
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/prj/prj4000/prj4000/selectPrj4001View.do")
    public String selectPrj4001View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		
    	Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
    	
    	Map prj4000WhkInfo = null;
		if( "U".equals(paramMap.get("proStatus"))){ 
			
			HttpSession ss = request.getSession();
			String prjId = (String) ss.getAttribute("selPrjId");
			
			paramMap.put("prjId", prjId);
			
			prj4000WhkInfo = prj4000Service.selectPrj4000PrjWhkInfo(paramMap);
    	}
		
		model.put("prj4000WhkInfo", prj4000WhkInfo);
    	return "/prj/prj4000/prj4000/whk1001";
    }
	

	
	@RequestMapping(method=RequestMethod.POST, value="/prj/prj4000/prj4000/selectPrj4000PrjWhkListAjax.do")
    public ModelAndView selectPrj4000PrjWhkListAjax(@ModelAttribute("prj4000VO") Prj4000VO prj4000VO, HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
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
			
			
			prj4000VO.setPageIndex(_pageNo);
			prj4000VO.setPageSize(_pageSize);
			prj4000VO.setPageUnit(_pageSize);
        	
        	
        	PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(prj4000VO); 
			List<Prj4000VO> prj4000List = null;
			
			HttpSession ss = request.getSession();
			String prjId	= (String) ss.getAttribute("selPrjId");
			
			prj4000VO.setPrjId(prjId);
			
        	
			prj4000List = (List<Prj4000VO>) prj4000Service.selectPrj4000PrjWhkList(prj4000VO);
        	
        	
			int totCnt = prj4000Service.selectPrj4000PrjWhkListCnt(prj4000VO);
					
        	paginationInfo.setTotalRecordCount(totCnt);
        	
        	model.addAttribute("list", prj4000List);
        	
			
			Map<String, Integer> pageMap = new HashMap<String, Integer>();
			pageMap.put("pageNo",prj4000VO.getPageIndex());
			pageMap.put("listCount", prj4000List.size());
			pageMap.put("totalPages", paginationInfo.getTotalPageCount());
			pageMap.put("totalElements", totCnt);
			pageMap.put("pageSize", _pageSize);
			
			model.addAttribute("page", pageMap);
        	
        	
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        	
        	return new ModelAndView("jsonView", model);
    	}
    	catch(Exception ex){
    		Log.error("selectPrj4000PrjWhkListAjax()", ex);
    		
    		
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		return new ModelAndView("jsonView", model);
    	}
    }
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(method=RequestMethod.POST, value="/prj/prj4000/prj4000/selectPrj4000WebhookConnectTest.do")
	public ModelAndView selectPrj4000WebhookConnectTest(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			String prjId = (String) paramMap.get("selPrjId");
			String prjNm = "";
			List<Map> prjList = (List<Map>) ss.getAttribute("prjList");

			if(prjList != null && prjList.size() > 0){
				
				for(Map prjInfo : prjList){
					if(prjId.equals(prjInfo.get("prjId"))){
						prjNm = (String) prjInfo.get("prjNm");
						break;
					}
				}
			}
			
			
			String platformTypeCd = paramMap.get("platformTypeCd");
			
			
			String webhookUrl = paramMap.get("webhookUrl");
			
			
			String inMessage = "["+prjNm+"] 프로젝트 에서 Webhook 연결을 시도합니다.";

			
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
			Log.error("selectPrj4000WebhookConnectTest()", ex);
			
			
			model.addAttribute("message", egovMessageSource.getMessage("fail.request.msg"));
			return new ModelAndView("jsonView", model);
		}
	}
	
	
	@RequestMapping(method=RequestMethod.POST, value="/prj/prj4000/prj4000/insertPrj4000WebhookInfo.do")
	public ModelAndView insertPrj4000WebhookInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			String prjId = (String) ss.getAttribute("selPrjId");
			
			paramMap.put("prjId", prjId);
			
			
			prj4000Service.insertPrj4000PrjWhkInfo(paramMap);
			
			model.addAttribute("errorYn", "N");
    		model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
    		
			return new ModelAndView("jsonView", model);
		}
		catch(UserDefineException ude) {
			
			model.addAttribute("message", ude.getMessage());
			return new ModelAndView("jsonView", model);
		}
		catch(Exception ex){
			Log.error("insertPrj4000WebhookInfo()", ex);
			
			
			model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
			return new ModelAndView("jsonView", model);
		}
	}
	
	
	@RequestMapping(method=RequestMethod.POST, value="/prj/prj4000/prj4000/updatePrj4000WebhookInfo.do")
	public ModelAndView updatePrj4000WebhookInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			String prjId = (String) ss.getAttribute("selPrjId");
			
			paramMap.put("prjId", prjId);
			
			
			prj4000Service.updatePrj4000PrjWhkInfo(paramMap);
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));
			
			return new ModelAndView("jsonView", model);
		}
		catch(UserDefineException ude) {
			
			model.addAttribute("message", ude.getMessage());
			return new ModelAndView("jsonView", model);
		}
		catch(Exception ex){
			Log.error("updatePrj4000WebhookInfo()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.update"));
			return new ModelAndView("jsonView", model);
		}
	}
	
	
	@RequestMapping(method=RequestMethod.POST, value="/prj/prj4000/prj4000/deletePrj4000WebhookList.do")
	public ModelAndView deletePrj4000WebhookList(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			
			Map<String, Object> paramMap = RequestConvertor.requestParamToMapAddSelInfoList(request, true,"webhookId");
			
			
			HttpSession ss = request.getSession();
			String prjId = (String) ss.getAttribute("selPrjId");
			
			paramMap.put("prjId", prjId);
			
			prj4000Service.deletePrj4000PrjWhkList(paramMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
			
			return new ModelAndView("jsonView", model);
		}
		catch(Exception ex){
			Log.error("deletePrj4000WebhookList()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
			return new ModelAndView("jsonView", model);
		}
	}
}
