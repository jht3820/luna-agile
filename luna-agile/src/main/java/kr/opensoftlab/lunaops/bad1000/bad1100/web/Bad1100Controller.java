package kr.opensoftlab.lunaops.bad.bad1000.bad1100.web;

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
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.opensoftlab.lunaops.bad.bad1000.bad1100.service.Bad1100Service;
import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.sdf.util.PagingUtil;
import kr.opensoftlab.sdf.util.RequestConvertor;



@Controller
public class Bad1100Controller {

	
	private static final Logger Log = Logger.getLogger(Bad1100Controller.class);

	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	
	@Resource(name = "bad1100Service")
	private Bad1100Service bad1100Service;

	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/bad/bad1000/bad1100/selectBad1100CmtListAjax.do")
	public ModelAndView selectBad1100CmtListAjax(HttpServletRequest request, ModelMap model) throws Exception {
		try {
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			paramMap.put("prjGrpId", (String) ss.getAttribute("selPrjGrpId"));
			paramMap.put("prjId", loginVO.getPrjId());

			
			
			String _pageNo_str = paramMap.get("pagination[page]");
			String _pageSize_str = paramMap.get("pagination[perpage]");
			
			
			int totCnt = bad1100Service.selectBad1100CmtListCnt(paramMap);
			
			
			PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(_pageNo_str, _pageSize_str);

			
			paginationInfo.setTotalRecordCount(totCnt);
			paramMap = PagingUtil.getPageSettingMap(paramMap, paginationInfo);
			
			
			Map<String, Integer> pageMap = PagingUtil.getPageReturnMap(paginationInfo);
			
			
			List<Map> bad1100CmtList = bad1100Service.selectBad1100CmtList(paramMap);

			
			model.addAttribute("data", bad1100CmtList);
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
	
	
	@RequestMapping(value = "/bad/bad1000/bad1100/insertBad1100CmtInfoAjax.do")
	public ModelAndView insertBad1100CmtInfoAjax(HttpServletRequest request, ModelMap model) throws Exception {
		try {
			
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			paramMap.put("prjGrpId", (String) ss.getAttribute("selPrjGrpId"));
			paramMap.put("prjId", (String) ss.getAttribute("selPrjId"));
			paramMap.put("badCmtUsrId", loginVO.getUsrId());
					
			
			bad1100Service.insertBad1100CmtInfo(paramMap);
			
			
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
	
	
	@RequestMapping(value="/bad/bad1000/bad1000/deleteBad1100CmtInfoAjax.do")
	public ModelAndView deleteBad1100CmtInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			paramMap.put("prjGrpId", (String) ss.getAttribute("selPrjGrpId"));
			paramMap.put("prjId", (String) ss.getAttribute("selPrjId"));
			
			
			bad1100Service.deleteBad1100CmtDelInfo(paramMap);
			
			
			model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("deleteBad1000BadInfoAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
			return new ModelAndView("jsonView");
		}
	}
}
