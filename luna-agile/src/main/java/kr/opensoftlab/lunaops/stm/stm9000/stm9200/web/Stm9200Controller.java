package kr.opensoftlab.lunaops.stm.stm9000.stm9200.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.opensoftlab.lunaops.com.fms.web.service.FileMngService;
import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.lunaops.stm.stm9000.stm9200.service.Stm9200Service;
import kr.opensoftlab.lunaops.stm.stm9000.stm9200.vo.Stm9200VO;
import kr.opensoftlab.sdf.util.OslAgileConstant;
import kr.opensoftlab.sdf.util.PagingUtil;
import kr.opensoftlab.sdf.util.ReqHistoryMngUtil;
import kr.opensoftlab.sdf.util.RequestConvertor;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;



@Controller
public class Stm9200Controller {

	
	private static final Logger Log = Logger.getLogger(Stm9200Controller.class);

	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	
	@Resource(name="fileMngService")
	private FileMngService fileMngService;

	@Resource(name = "egovFileIdGnrService")
	private EgovIdGnrService idgenService;

	@Resource(name = "historyMng")
	private ReqHistoryMngUtil historyMng;
	
	
	@Resource(name = "stm9200Service")
	private Stm9200Service stm9200Service;
	
	
	@RequestMapping(value="/stm/stm9000/stm9200/selectStm9200View.do")
	public String selectStm9200View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/stm/stm9000/stm9200/stm9200";
	}
	
	
	
	@RequestMapping(value="/stm/stm9000/stm9200/selectStm9200ProjectJenkinsJobAllListAjax.do")
	public ModelAndView selectStm9200ProjectJenkinsJobAllListAjax(@ModelAttribute("stm9200VO") Stm9200VO stm9200VO, HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

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
			
			
			stm9200VO.setLicGrpId(loginVO.getLicGrpId());
			
			
			stm9200VO.setPageIndex(_pageNo);
			stm9200VO.setPageSize(_pageSize);
			stm9200VO.setPageUnit(_pageSize);
			
			PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(stm9200VO);  

			
			List<Stm9200VO> allPrjJenkinsJobList = null;

			
			int totCnt = 0;
			totCnt = stm9200Service.selectStm9200ProjectJenkinsJobAllListCnt(stm9200VO);  
			
			paginationInfo.setTotalRecordCount(totCnt);
			
			
			allPrjJenkinsJobList = stm9200Service.selectStm9200ProjectJenkinsJobAllList(stm9200VO);
			
			
			model.addAttribute("list", allPrjJenkinsJobList);
			
			
			Map<String, Integer> pageMap = new HashMap<String, Integer>();
			pageMap.put("pageNo",stm9200VO.getPageIndex());
			pageMap.put("listCount", allPrjJenkinsJobList.size());
			pageMap.put("totalPages", paginationInfo.getTotalPageCount());
			pageMap.put("totalElements", totCnt);
			pageMap.put("pageSize", _pageSize);
			
			
			model.addAttribute("page", pageMap);
			
			
    		model.addAttribute("errorYn", 'N');
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectStm9200ProjectJenkinsJobAllListAjax()", ex);
			
			
    		model.addAttribute("errorYn", 'Y');
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			throw new Exception(ex.getMessage());
		}
	}
	
}
