package kr.opensoftlab.lunaops.prj.prj1000.prj1200.web;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.cmmn.trace.LeaveaTrace;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.opensoftlab.lunaops.cmm.cmm4000.cmm4000.service.Cmm4000Service;
import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.lunaops.prj.prj1000.prj1200.service.Prj1200Service;
import kr.opensoftlab.sdf.util.OslStringUtil;
import kr.opensoftlab.sdf.util.PagingUtil;
import kr.opensoftlab.sdf.util.RequestConvertor;



@Controller
public class Prj1200Controller {
	
	private static final Logger Log = Logger.getLogger(Prj1200Controller.class);
	
	
    @Resource(name = "prj1200Service")
    private Prj1200Service prj1200Service;
    
	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
    
	
	
	@Resource(name = "leaveaTrace")
	LeaveaTrace leaveaTrace;
	
	
	@RequestMapping(value="/prj/prj1000/prj1200/selectPrj1200View.do")
    public String selectPrj1200View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
        	return "/prj/prj1000/prj1200/prj1200";
    }
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/prj/prj1000/prj1200/selectPrj1200ListAjax.do")
	public ModelAndView selectPrj1200ListAjax(HttpServletRequest request, ModelMap model) throws Exception {
		try {
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);

			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			paramMap.put("prjGrpId", (String) ss.getAttribute("selPrjGrpId"));
			paramMap.put("prjId", (String) ss.getAttribute("selPrjId"));
			
			
			String sortFieldId = (String) paramMap.get("sortFieldId");
			sortFieldId = OslStringUtil.replaceRegex(sortFieldId,"[^A-Za-z0-9+]*");
			String sortDirection = (String) paramMap.get("sortDirection");
			String paramSortFieldId = OslStringUtil.convertUnderScope(sortFieldId);
			paramMap.put("paramSortFieldId", paramSortFieldId);
			
			
			
			
			String _pageNo_str = paramMap.get("pagination[page]");
			String _pageSize_str = paramMap.get("pagination[perpage]");
			
			
			int totCnt = prj1200Service.selectPrj1200PrjListCnt(paramMap);
			
			
			PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(_pageNo_str, _pageSize_str);

			
			paginationInfo.setTotalRecordCount(totCnt);
			paramMap = PagingUtil.getPageSettingMap(paramMap, paginationInfo);
			
			
			Map<String, Object> pageMap = PagingUtil.getPageReturnMap(paginationInfo);
			
			
			pageMap.put("sort", sortDirection);
			pageMap.put("field", sortFieldId);
			
			
			List<Map> prj1200List = prj1200Service.selectPrj1200PrjList(paramMap);
			

			
			model.addAttribute("data", prj1200List);
			model.addAttribute("meta", pageMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

			return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("selectBad1000ListAjax()", ex);

			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	

	
	@RequestMapping(value="/prj/prj1000/prj1200/selectPrj1201View.do")
	public String selectPrj1201View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/prj/prj1000/prj1200/prj1201";
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/prj/prj1000/prj1200/selectPrj1201PrjSetInfoAjax.do")
	public ModelAndView selectPrj1201PrjSetInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			HttpSession ss = request.getSession();
			
			
			LoginVO loginVo = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVo.getLicGrpId());
			paramMap.put("prjGrpId", (String) ss.getAttribute("selPrjGrpId"));
			paramMap.put("prjId", (String) ss.getAttribute("selPrjId"));
			
			
			Map prjSetInfo = prj1200Service.selectPrjSet1200Info(paramMap);
			model.addAttribute("prjSetInfo", prjSetInfo);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception e){
			Log.error("selectPrj1201PrjSetInfoAjax()", e);
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/prj/prj1000/prj1200/savePrj1201PrjSetInfo.do")
	public ModelAndView savePrj1201PrjSetInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			HttpSession ss = request.getSession();
			String type = (String) paramMap.get("newSetYn");
			
			
			LoginVO loginVo = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVo.getLicGrpId());
			paramMap.put("prjGrpId", (String) ss.getAttribute("selPrjGrpId"));
			paramMap.put("prjId", (String) ss.getAttribute("selPrjId"));
			
			
			if("Y".equals(type)) {
				
				prj1200Service.insertPrj1200PrjSetAjax(paramMap);
			}
			
			else if("N".equals(type)) {
				
				prj1200Service.updatePrj1200PrjSetAjax(paramMap);
			}else {
				
				model.addAttribute("errorYn", "Y");
	        	model.addAttribute("message", egovMessageSource.getMessage("fail.common.save"));
	        	return new ModelAndView("jsonView");
			}
			
			
        	model.addAttribute("errorYn", "N");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.save"));
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("savePrj1201PrjSetInfo()", ex);
			
			
			model.addAttribute("errorYn", "Y");
        	model.addAttribute("message", egovMessageSource.getMessage("fail.common.save"));
			throw new Exception(ex.getMessage());
		}
	}
	
}
