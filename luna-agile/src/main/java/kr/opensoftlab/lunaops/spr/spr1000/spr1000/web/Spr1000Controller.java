package kr.opensoftlab.lunaops.spr.spr1000.spr1000.web;

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
import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.lunaops.spr.spr1000.spr1000.service.Spr1000Service;
import kr.opensoftlab.sdf.util.OslStringUtil;
import kr.opensoftlab.sdf.util.PagingUtil;
import kr.opensoftlab.sdf.util.RequestConvertor;

@Controller
public class Spr1000Controller {

	private static final Logger Log = Logger.getLogger(Spr1000Controller.class);

	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	@Resource(name = "spr1000Service")
	private Spr1000Service spr1000Service;

	@RequestMapping(value="/spr/spr1000/spr1000/selectSpr1000View.do")
	public String selectSpr1000View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/spr/spr1000/spr1000/spr1000";
	}

	@RequestMapping(value="/spr/spr1000/spr1000/selectSpr1001View.do")
	public String selectSpr1001View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/spr/spr1000/spr1000/spr1001";
	}
	
	@RequestMapping(value="/spr/spr1000/spr1000/selectSpr1002View.do")
	public String selectSpr1002View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/spr/spr1000/spr1000/spr1002";
	}
	
	@RequestMapping(value="/spr/spr1000/spr1000/selectSpr1003View.do")
	public String selectSpr1003View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/spr/spr1000/spr1000/spr1003";
	}
	
	@RequestMapping(value="/spr/spr1000/spr1000/selectSpr1004View.do")
	public String selectSpr1004View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/spr/spr1000/spr1000/spr1004";
	}
	
	@RequestMapping(value="/spr/spr1000/spr1000/selectSpr1005View.do")
	public String selectSpr1005View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/spr/spr1000/spr1000/spr1005";
	}
	
	@RequestMapping(value="/spr/spr1000/spr1000/selectSpr1006View.do")
	public String selectSpr1006View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/spr/spr1000/spr1000/spr1006";
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/spr/spr1000/spr1000/selectSpr1000SprListAjax.do")
	public ModelAndView selectSpr1000SprListAjax(HttpServletRequest request, ModelMap model) throws Exception {
		try {
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			String _pageNo_str = paramMap.get("pagination[page]");
			String _pageSize_str = paramMap.get("pagination[perpage]");
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			
			String paramPrjGrpId = (String) paramMap.get("paramPrjGrpId");
			
			if(paramPrjGrpId == null || "".equals(paramPrjGrpId)) {
				paramPrjGrpId = (String) ss.getAttribute("selPrjGrpId");
			}
			
			String paramPrjId = (String) paramMap.get("paramPrjId");
			
			if(paramPrjId == null || "".equals(paramPrjId)) {
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
			
			paramMap.put("prjGrpId", paramPrjGrpId);
			paramMap.put("prjId", paramPrjId);
			
			String sortFieldId = (String) paramMap.get("sortFieldId");
			sortFieldId = OslStringUtil.replaceRegex(sortFieldId,"[^A-Za-z0-9+]*");
			String sortDirection = (String) paramMap.get("sortDirection");
			String paramSortFieldId = OslStringUtil.convertUnderScope(sortFieldId);
			paramMap.put("paramSortFieldId", paramSortFieldId);
			
			paramMap.put("delCd", "02");
			
			int totCnt = 0;
			List<Map> dataList = null;
			Map<String, Object> metaMap = null;
			
			totCnt = spr1000Service.selectSpr1000SprListCnt(paramMap);

			PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(_pageNo_str, _pageSize_str);

			paginationInfo.setTotalRecordCount(totCnt);
			paramMap = PagingUtil.getPageSettingMap(paramMap, paginationInfo);

			dataList = (List) spr1000Service.selectSpr1000SprList(paramMap);
			
			metaMap = PagingUtil.getPageReturnMap(paginationInfo);
			
			metaMap.put("sort", sortDirection);
			metaMap.put("field", sortFieldId);
			
			model.addAttribute("data", dataList);
			model.addAttribute("meta", metaMap);
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        	
        	return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("selectSpr1000SprListAjax()", ex);
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	@RequestMapping(value="/spr/spr1000/spr1000/saveSpr1002SprInfo.do")
	public ModelAndView saveSpr1002SprInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		try{
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			String type = (String) paramMap.get("type");
			
			HttpSession ss = request.getSession();
			
			String paramPrjGrpId = (String) paramMap.get("paramPrjGrpId");
			String paramSprId = (String) paramMap.get("paramSprId");
			
			if(paramPrjGrpId == null || "".equals(paramPrjGrpId)) {
				paramPrjGrpId = (String) ss.getAttribute("selPrjGrpId");
			}
			
			String paramPrjId = (String) paramMap.get("paramPrjId");
			
			if(paramPrjId == null || "".equals(paramPrjId)) {
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
			
			paramMap.put("prjGrpId", paramPrjGrpId);
			paramMap.put("prjId", paramPrjId);
			
			if("insert".equals(type)) {
				
				paramMap.put("sprTypeCd", "01");
				spr1000Service.insertSpr1000SprInfo(paramMap);
			}
			else if("update".equals(type)) {
				paramMap.put("sprId", paramSprId);
				spr1000Service.updateSpr1000Info(paramMap);
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
			Log.error("saveSpr1002SprInfo()", ex);
			
			model.addAttribute("errorYn", "Y");
        	model.addAttribute("message", egovMessageSource.getMessage("fail.common.save"));
			throw new Exception(ex.getMessage());
		}
	}

	@SuppressWarnings({ "rawtypes" })
	@RequestMapping(value="/spr/spr1000/spr1000/selectSpr1000SprInfoAjax.do")
	public ModelAndView selectSpr1000SprInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			// request 파라미터를 map으로 변환
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			HttpSession ss = request.getSession();
			
			String paramPrjGrpId = (String) paramMap.get("paramPrjGrpId");
			String paramSprId = (String) paramMap.get("paramSprId");
			
			if(paramPrjGrpId == null || "".equals(paramPrjGrpId)) {
				paramPrjGrpId = (String) ss.getAttribute("selPrjGrpId");
			}
			
			String paramPrjId = (String) paramMap.get("paramPrjId");
			
			if(paramPrjId == null || "".equals(paramPrjId)) {
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
			
			paramMap.put("prjGrpId", paramPrjGrpId);
			paramMap.put("prjId", paramPrjId);
			paramMap.put("sprId", paramSprId);
			
			LoginVO loginVo = (LoginVO) ss.getAttribute("loginVO");
			String usrId = loginVo.getUsrId();
			paramMap.put("usrId", usrId);
			paramMap.put("prjGrpCd", "01");
			paramMap.put("prjAuthTypeCd", "01");
			
			Map sprInfo = spr1000Service.selectSpr1000SprInfo(paramMap);
			model.addAttribute("sprInfo", sprInfo);
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception e){
			Log.error("selectSpr1000SprInfoAjax()", e);
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			
			return new ModelAndView("jsonView");
		}
	}
	
	@RequestMapping(value="/spr/spr1000/spr1000/deleteSpr1000SprList.do")
	public ModelAndView deleteSpr1000SprList(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			spr1000Service.deleteSpr1000SprInfo(paramMap);
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception e){
			Log.error("deleteSpr1000SprList()", e);
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
			
			return new ModelAndView("jsonView");
		}
	}
}
