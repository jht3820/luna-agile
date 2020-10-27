package kr.opensoftlab.lunaops.dpl.dpl1000.dpl1100.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.lunaops.dpl.dpl1000.dpl1000.service.Dpl1000Service;
import kr.opensoftlab.lunaops.dpl.dpl1000.dpl1100.service.Dpl1100Service;
import kr.opensoftlab.lunaops.dpl.dpl1000.dpl1100.vo.Dpl1100VO;
import kr.opensoftlab.sdf.util.OslAgileConstant;
import kr.opensoftlab.sdf.util.PagingUtil;
import kr.opensoftlab.sdf.util.RequestConvertor;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.GsonBuilder;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;



@Controller
public class Dpl1100Controller {

	
	protected Logger Log = Logger.getLogger(this.getClass());

	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	
	@Resource(name = "dpl1000Service")
	private Dpl1000Service dpl1000Service;
	
	
	@Resource(name = "dpl1100Service")
	private Dpl1100Service dpl1100Service;

	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/dpl/dpl1000/dpl1100/selectDpl1100View.do")
	public String selectDpl1100View(HttpServletRequest request, HttpServletResponse response,ModelMap model) throws Exception {
		try{
			Map paramMap = RequestConvertor.requestParamToMap(request, true);
			paramMap.put("prjId", request.getSession().getAttribute("selPrjId"));
	
			
			List<Map> selectDpl1000List = (List) dpl1000Service.selectDpl1000DeployVerNormalList(paramMap);
			String dplListJson = (new GsonBuilder().serializeNulls().create()).toJsonTree(selectDpl1000List).toString();
			
			
			if(selectDpl1000List != null && selectDpl1000List.size() > 0){
				model.addAttribute("srchDplId", selectDpl1000List.get(0).get("dplId"));
			}
			
			model.addAttribute("dplList", dplListJson.replaceAll("<", "&lt"));
			
			
    		model.addAttribute("errorYn", 'N');
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return "/dpl/dpl1000/dpl1100/dpl1100";
		}
    	catch(Exception ex){
    		Log.error("selectSpr1000BView()", ex);
    		
    		
    		model.addAttribute("errorYn", 'Y');
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		throw new Exception(ex.getMessage());
    	}
	}

	
	@RequestMapping(value = "/dpl/dpl1000/dpl1100/insertDpl1100Dpl.do")
	public ModelAndView insertDpl1100Dpl(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws Exception {

		try {
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);

			HttpSession ss = request.getSession();
			
			paramMap.put("prjId", ss.getAttribute("selPrjId").toString());

			
			dpl1100Service.insertDpl1100ReqDplInfo(paramMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message",egovMessageSource.getMessage("success.common.insert"));
			return new ModelAndView("jsonView");
			
		} catch (Exception ex) {
			Log.error("insertDpl1100Dpl()", ex);

			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message",egovMessageSource.getMessage("fail.common.insert"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value = "/dpl/dpl1000/dpl1100/deleteDpl1100Dpl.do")
	public ModelAndView deleteDpl1100Dpl(HttpServletRequest request,HttpServletResponse response, ModelMap model) throws Exception {
		
		try {
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			HttpSession ss = request.getSession();
			
			paramMap.put("prjId", ss.getAttribute("selPrjId").toString());
			
			
			dpl1100Service.deleteDpl1100ReqDplInfo(paramMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message",egovMessageSource.getMessage("success.common.delete"));
			return new ModelAndView("jsonView");
			
		} catch (Exception ex) {
			Log.error("deleteDpl1100Dpl()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message",egovMessageSource.getMessage("fail.common.delete"));
			return new ModelAndView("jsonView");
		}
	}

	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value = "/dpl/dpl1000/dpl1100/selectDpl1100DplListAjax.do")
	public ModelAndView selectDpl1100ReqListAjax(@ModelAttribute("dpl1100VO") Dpl1100VO dpl1100VO, HttpServletRequest request,HttpServletResponse response, ModelMap model) throws Exception {

		try {

			
			Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
			
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			
			
			String licGrpId = loginVO.getLicGrpId();
			
			String prjId = (String) paramMap.get("prjId");
			
			
			if(prjId == null || "".equals(prjId)) {
				prjId = ss.getAttribute("selPrjId").toString();
			}
			
			
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
			
			
			dpl1100VO.setLicGrpId(licGrpId);
			dpl1100VO.setPrjId(prjId);
			
			
			dpl1100VO.setPageIndex(_pageNo);
			dpl1100VO.setPageSize(_pageSize);
			dpl1100VO.setPageUnit(_pageSize);
			
			
			
			
			
			dpl1100VO.setPagingYn("Y");
						
			PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(dpl1100VO);  
			
			
			int totCnt = 0;
			
			
			List dplAssignReqList = null;
			
			if ("clsAdd".equals(paramMap.get("clsMode"))) {
				
				
				totCnt = dpl1100Service.selectDpl1100ExistDplListCnt(dpl1100VO) ;
				
				dplAssignReqList = dpl1100Service.selectDpl1100ExistDplList(dpl1100VO);

			} else if ("clsDel".equals(paramMap.get("clsMode"))) {
				
				totCnt = dpl1100Service.selectDpl1100NotExistDplListCnt(dpl1100VO) ;
				
				dplAssignReqList = dpl1100Service.selectDpl1100NotExistDplList(dpl1100VO);
			}
			
			
			paginationInfo.setTotalRecordCount(totCnt);

			
			model.addAttribute("list", dplAssignReqList);

			
			Map<String, Integer> pageMap = new HashMap<String, Integer>();
			pageMap.put("pageNo",dpl1100VO.getPageIndex());
			pageMap.put("listCount", dplAssignReqList.size());
			pageMap.put("totalPages", paginationInfo.getTotalPageCount());
			pageMap.put("totalElements", totCnt);
			pageMap.put("pageSize", _pageSize);
			
			
			model.addAttribute("page", pageMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message",egovMessageSource.getMessage("success.common.select"));

			return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("selectDpl1100ReqListAjax()", ex);

			model.addAttribute("errorYn", "Y");
			model.addAttribute("message",egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	

}
