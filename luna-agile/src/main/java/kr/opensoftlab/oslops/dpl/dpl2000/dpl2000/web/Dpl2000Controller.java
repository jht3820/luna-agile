package kr.opensoftlab.lunaops.dpl.dpl2000.dpl2000.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.lunaops.dpl.dpl1000.dpl1000.service.Dpl1000Service;
import kr.opensoftlab.lunaops.dpl.dpl2000.dpl2000.service.Dpl2000Service;
import kr.opensoftlab.lunaops.dpl.dpl2000.dpl2000.vo.Dpl2000VO;
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
public class Dpl2000Controller {

	
	protected Logger Log = Logger.getLogger(this.getClass());
	
	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
    
    
    @Resource(name = "dpl1000Service")
    private Dpl1000Service dpl1000Service;
    
    
    @Resource(name = "dpl2000Service")
    private Dpl2000Service dpl2000Service;
    
	@Value("${Globals.fileStorePath}")
	private String tempPath;
    
    
    
	@RequestMapping(value="/dpl/dpl2000/dpl2000/selectDpl2000View.do")
    public String selectDpl2000View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	return "/dpl/dpl2000/dpl2000/dpl2000";
    }
		
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/dpl/dpl2000/dpl2000/selectDpl2000AjaxView.do")
	public ModelAndView selectDpl2000AjaxView(@ModelAttribute("dpl2000VO") Dpl2000VO dpl2000VO, HttpServletRequest request, HttpServletResponse response, ModelMap model )	throws Exception {

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
			
			
			dpl2000VO.setPageIndex(_pageNo);
			dpl2000VO.setPageSize(_pageSize);
			dpl2000VO.setPageUnit(_pageSize);
						
			PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(dpl2000VO); 

			List<Dpl2000VO> dpl2000List = null;

			HttpSession ss = request.getSession();
			String prjId	= (String) ss.getAttribute("selPrjId");
			String licGrpId	= (String) paramMap.get("licGrpId");
			String usrId = ((LoginVO) ss.getAttribute("loginVO")).getUsrId();

			dpl2000VO.setPrjId(prjId);
			dpl2000VO.setLicGrpId(licGrpId);
			
			
			dpl2000VO.setDpl2000LoginUsrIdChk(usrId);
			
			int totCnt = 0;
			dpl2000List = dpl2000Service.selectDpl2000SignList(dpl2000VO);

			
			totCnt = dpl2000Service.selectDpl2000SignListCnt(dpl2000VO);
			paginationInfo.setTotalRecordCount(totCnt);

			
			Map<String, Integer> pageMap = new HashMap<String, Integer>();
			pageMap.put("pageNo",dpl2000VO.getPageIndex());
			pageMap.put("listCount", dpl2000List.size());
			pageMap.put("totalPages", paginationInfo.getTotalPageCount());
			pageMap.put("totalElements", totCnt);
			pageMap.put("pageSize", _pageSize);

			model.addAttribute("selectYN", "Y");
			model.addAttribute("page", pageMap);
			model.addAttribute("list", dpl2000List); 			

			return new ModelAndView("jsonView");

		}catch(Exception ex){
			Log.error("selectDpl2000AjaxView()", ex);
			
			model.addAttribute("selectYN", "N");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
}
