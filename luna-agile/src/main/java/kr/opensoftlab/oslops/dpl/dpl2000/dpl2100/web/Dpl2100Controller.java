package kr.opensoftlab.lunaops.dpl.dpl2000.dpl2100.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.lunaops.dpl.dpl2000.dpl2100.service.Dpl2100Service;
import kr.opensoftlab.lunaops.dpl.dpl2000.dpl2100.vo.Dpl2100VO;
import kr.opensoftlab.sdf.util.OslAgileConstant;
import kr.opensoftlab.sdf.util.PagingUtil;
import kr.opensoftlab.sdf.util.RequestConvertor;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;



@Controller
public class Dpl2100Controller {

	
	protected Logger Log = Logger.getLogger(this.getClass());
	
	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
    
    
    @Resource(name = "dpl2100Service")
    private Dpl2100Service dpl2100Service;
    
	@Value("${Globals.fileStorePath}")
	private String tempPath;
    
    
    
	@RequestMapping(value="/dpl/dpl2000/dpl2100/selectDpl2100View.do")
    public String selectDpl2100View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	return "/dpl/dpl2000/dpl2100/dpl2100";
    }
	
	
	@RequestMapping(value="/dpl/dpl2000/dpl2100/selectDpl2101View.do")
	public String selectDpl2101View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/dpl/dpl2000/dpl2100/dpl2101";
	}
	
	
	@RequestMapping(value="/dpl/dpl2000/dpl2100/selectDpl2102View.do")
	public String selectDpl2102View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/dpl/dpl2000/dpl2100/dpl2102";
	}
	
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/dpl/dpl2000/dpl2100/selectDpl2100AjaxView.do")
	public ModelAndView selectDpl2000AjaxView(@ModelAttribute("dpl2100VO") Dpl2100VO dpl2100VO, HttpServletRequest request, HttpServletResponse response, ModelMap model )	throws Exception {

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
			
			
			dpl2100VO.setPageIndex(_pageNo);
			dpl2100VO.setPageSize(_pageSize);
			dpl2100VO.setPageUnit(_pageSize);
						
			PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(dpl2100VO); 

			List<Dpl2100VO> dpl2100List = null;

			HttpSession ss = request.getSession();
			String prjId	= (String) ss.getAttribute("selPrjId");
			String licGrpId	= (String) paramMap.get("licGrpId");
			String usrId = ((LoginVO) ss.getAttribute("loginVO")).getUsrId();

			dpl2100VO.setPrjId(prjId);
			dpl2100VO.setLicGrpId(licGrpId);
			
			
			dpl2100VO.setDpl2000LoginUsrIdChk(usrId);
			
			int totCnt = 0;
			dpl2100List = dpl2100Service.selectDpl2100SignList(dpl2100VO);

			
			totCnt = dpl2100Service.selectDpl2100SignListCnt(dpl2100VO);
			paginationInfo.setTotalRecordCount(totCnt);

			
			Map<String, Integer> pageMap = new HashMap<String, Integer>();
			pageMap.put("pageNo",dpl2100VO.getPageIndex());
			pageMap.put("listCount", dpl2100List.size());
			pageMap.put("totalPages", paginationInfo.getTotalPageCount());
			pageMap.put("totalElements", totCnt);
			pageMap.put("pageSize", _pageSize);

			model.addAttribute("selectYN", "Y");
			model.addAttribute("page", pageMap);
			model.addAttribute("list", dpl2100List); 			

			return new ModelAndView("jsonView");

		}catch(Exception ex){
			Log.error("selectDpl2000AjaxView()", ex);
			
			model.addAttribute("selectYN", "N");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}	
	
	
	@RequestMapping(value="/dpl/dpl2000/dpl2100/insertDpl2100SignActionAjax.do")
	public ModelAndView insertDpl2100SignActionAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			paramMap.put("prjId", (String)paramMap.get("selPrjId"));
        	
			
			dpl2100Service.insertDpl2100DplSignInfo(paramMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("insertDpl2100SignActionAjax()", ex);

			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
			return new ModelAndView("jsonView");
		}
	}
}
