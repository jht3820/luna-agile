package kr.opensoftlab.lunaops.arm.arm1000.arm1000.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.opensoftlab.lunaops.arm.arm1000.arm1000.service.Arm1000Service;
import kr.opensoftlab.lunaops.arm.arm1000.arm1000.vo.Arm1000VO;
import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.sdf.util.OslAgileConstant;
import kr.opensoftlab.sdf.util.PagingUtil;
import kr.opensoftlab.sdf.util.RequestConvertor;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.cmmn.trace.LeaveaTrace;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;



@Controller
public class Arm1000Controller {

	
	private static final Logger Log = Logger.getLogger(Arm1000Controller.class);
	
	
    @Resource(name = "arm1000Service")
    private Arm1000Service arm1000Service;
    
    
    
	
    
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	
	@Resource(name = "leaveaTrace")
	LeaveaTrace leaveaTrace;
    
    
	@RequestMapping(value="/arm/arm1000/arm1000/selectArm1000View.do")
    public String selectArm1000View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			String viewChk = (String)paramMap.get("viewChk");
			model.addAttribute("viewChk", viewChk);
			
			
			String sendChk = (String)paramMap.get("sendChk");
			String armSendTypeCd = (String)paramMap.get("armSendTypeCd");
			String usrIdChk = (String)paramMap.get("usrIdChk");
			String usrNmChk = (String)paramMap.get("usrNmChk");
			String arm_reqId = (String)paramMap.get("arm_reqId");
			String arm_reqNm = (String)paramMap.get("arm_reqNm");
			String reqPrjId = (String)paramMap.get("reqPrjId");
			model.addAttribute("sendChk", sendChk);
			model.addAttribute("usrIdChk", usrIdChk);
			model.addAttribute("armSendTypeCd", armSendTypeCd);
			model.addAttribute("usrNmChk", usrNmChk);
			model.addAttribute("arm_reqId", arm_reqId);
			model.addAttribute("arm_reqNm", arm_reqNm);
			model.addAttribute("reqPrjId", reqPrjId);
			
        	return "/arm/arm1000/arm1000/arm1000";
		}catch(Exception ex){
			Log.error("selectArm1000View()", ex);
    		throw new Exception(ex.getMessage());
		}
    }
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value="/arm/arm1000/arm1000/selectArm1000ListAjax.do")
	public ModelAndView selectArm1000ListAjax(@ModelAttribute("arm1000VO") Arm1000VO arm1000VO, HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

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
			
			
			arm1000VO.setPageIndex(_pageNo);
			arm1000VO.setPageSize(_pageSize);
			arm1000VO.setPageUnit(_pageSize);
			
			PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(arm1000VO);  

			List<Arm1000VO> arm1000List = null;
			
			
			arm1000VO.setUsrId(loginVO.getUsrId());
			paramMap.put("usrId", loginVO.getUsrId());
			
			
			arm1000VO.setLicGrpId(loginVO.getLicGrpId());

			
			Map armCntMap = arm1000Service.selectArm1000AlarmCnt(paramMap);
			
			String allCnt = String.valueOf(armCntMap.get("allCnt"));
			int totCnt = Integer.parseInt(allCnt);
			paginationInfo.setTotalRecordCount(totCnt);
			
			
			
			arm1000List = arm1000Service.selectArm1000AlarmList(arm1000VO);

			model.addAttribute("list", arm1000List);

			
			Map<String, Integer> pageMap = new HashMap<String, Integer>();
			pageMap.put("pageNo",arm1000VO.getPageIndex());
			pageMap.put("listCount", arm1000List.size());
			pageMap.put("totalPages", paginationInfo.getTotalPageCount());
			pageMap.put("totalElements", totCnt);
			pageMap.put("pageSize", _pageSize);

			model.addAttribute("page", pageMap);
			
			
			model.addAttribute("result", "ok");
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectArm1000ListAjax()", ex);
			
			model.addAttribute("result", "fail");
			return new ModelAndView("jsonView");
		}
	}
	
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/arm/arm1000/arm1000/updateArm1000AlarmInfo.do")
	public ModelAndView updateArm1000AlarmInfo(@ModelAttribute("arm1000VO") Arm1000VO arm1000VO, HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{
			
			Map<String, Object> paramMap = RequestConvertor.requestParamToMapAddSelInfoList(request, true,"armId");
			

			
    		HttpSession ss = request.getSession();
    		LoginVO loginVo = (LoginVO)ss.getAttribute("loginVO");
    		
    		String usrId = loginVo.getUsrId();
    		
			arm1000Service.updateArm1000AlarmInfo(paramMap);
			
    		
    		Map<String, String> tempMap = new HashMap<String,String>();
    		
    		tempMap.put("usrId", usrId);
    		
			Map alarmCnt = arm1000Service.selectArm1000AlarmCnt(tempMap);
			
			model.addAttribute("alarmCnt", alarmCnt);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("updateArm1000AlarmInfo()", ex);
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.update"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	@RequestMapping(value="/arm/arm1000/arm1000/selectArm1000InfoAjax.do")
	public ModelAndView selectArm1000InfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			String usrId = loginVO.getUsrId();
			
			
			String viewCheck = (String)paramMap.get("viewCheck");
			
			
			String armTypeCd = (String) paramMap.get("armTypeCd");
			
			
			paramMap.put("usrId", usrId);
			
			
			if("02".equals(viewCheck) && "02".equals(armTypeCd)){
				Map<String, Object> tempMap = new HashMap<String,Object>();
				tempMap.put("viewCheck", "01");
				tempMap.put("armId", paramMap.get("armId"));
				tempMap.put("usrId", usrId);
				arm1000Service.updateArm1000AlarmInfo(tempMap);
				
				Map alarmCnt = arm1000Service.selectArm1000AlarmCnt(paramMap);
				
				
				model.addAttribute("alarmCnt", alarmCnt);
				
				
				model.addAttribute("viewAction", "01");
				
			
			}else if("02".equals(viewCheck) && "03".equals(armTypeCd)){	
				
				Map<String, Object> tempMap = new HashMap<String,Object>();
				tempMap.put("viewCheck", "01");
				tempMap.put("armId", paramMap.get("armId"));
				tempMap.put("usrId", usrId);
				arm1000Service.updateArm1000AlarmInfo(tempMap);
				
				Map alarmCnt = arm1000Service.selectArm1000AlarmCnt(paramMap);
				
				model.addAttribute("alarmCnt", alarmCnt);
				
				
				model.addAttribute("viewAction", "01");
				
			}else{
				model.addAttribute("viewAction", "02");
			}
			
			
			Map armInfo = arm1000Service.selectArm1000AlarmInfo(paramMap);
			
			model.addAttribute("armInfo", armInfo);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectArm1000ListAjax()", ex);
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/arm/arm1000/arm1000/insertArm1000InfoAjax.do")
	public ModelAndView insertArm1000InfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			String usrId = loginVO.getUsrId();
			paramMap.put("sendUsrId", usrId);
			paramMap.put("armSendTypeCd", "01");
			
			
			arm1000Service.insertArm1000AlarmInfo(paramMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("insertArm1000InfoAjax()", ex);
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	
}
