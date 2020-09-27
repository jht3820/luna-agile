package kr.opensoftlab.lunaops.stm.stm5000.stm5000.web;



import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.lunaops.stm.stm5000.stm5000.service.Stm5000Service;
import kr.opensoftlab.lunaops.stm.stm5000.stm5000.vo.Stm5000VO;
import kr.opensoftlab.sdf.excel.BigDataSheetWriter;
import kr.opensoftlab.sdf.excel.ExcelDataListResultHandler;
import kr.opensoftlab.sdf.excel.Metadata;
import kr.opensoftlab.sdf.excel.SheetHeader;
import kr.opensoftlab.sdf.util.OslStringUtil;
import kr.opensoftlab.sdf.util.PagingUtil;
import kr.opensoftlab.sdf.util.RequestConvertor;


@Controller
public class Stm5000Controller {

	
	protected Logger Log = Logger.getLogger(this.getClass());

	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	
	@Resource(name = "stm5000Service")
	private Stm5000Service stm5000Service;

	@Value("${Globals.fileStorePath}")
	private String tempPath;
	
	
	@RequestMapping(value="/stm/stm5000/stm5000/selectStm5000View.do")
    public String selectDpl1000View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	return "/stm/stm5000/stm5000/stm5000";
    }

	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(method=RequestMethod.POST, value="/stm/stm5000/stm5000/selectStm5000ListAjax.do")
	public ModelAndView selectStm5000ListView(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
        	Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);

        	
			
			String _pageNo_str = paramMap.get("pagination[page]");
			String _pageSize_str = paramMap.get("pagination[perpage]");
			
			
			String sortFieldId = (String) paramMap.get("sortFieldId");
			sortFieldId = OslStringUtil.replaceRegex(sortFieldId,"[^A-Za-z0-9+]*");
			String sortDirection = (String) paramMap.get("sortDirection");
			String paramSortFieldId = OslStringUtil.convertUnderScope(sortFieldId);
			paramMap.put("paramSortFieldId", paramSortFieldId);
			
			
			/
			
			List<Map> stm5000List = stm5000Service.selectStm5000List(paramMap);

			
			
			Map<String, Object> metaMap = PagingUtil.getPageReturnMap(paginationInfo);
			
			
			metaMap.put("sort", sortDirection);
			metaMap.put("field", sortFieldId);
			
			model.addAttribute("data", stm5000List);
			model.addAttribute("meta", metaMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectStm5000ListAjax()", ex);
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}


	@RequestMapping(value="/stm/stm5000/stm5000/selectStm5000ExcelList.do")
	public ModelAndView selectStm5000ExcelList(HttpServletRequest request, @ModelAttribute("stm5000VO") Stm5000VO stm5000VO, ModelMap model ) throws Exception {
		SheetHeader header = new SheetHeader(new String[]{
				egovMessageSource.getMessage("excel.loginUsrId")
				,egovMessageSource.getMessage("excel.licGrpId")
				,egovMessageSource.getMessage("excel.usrNm")
				,egovMessageSource.getMessage("excel.loginIp")
				,egovMessageSource.getMessage("excel.loginTime")
				,egovMessageSource.getMessage("excel.logoutTime") });
		
		List<Metadata> metadatas = new ArrayList<Metadata>(); 
		metadatas.add(new Metadata("loginUsrId"));
		metadatas.add(new Metadata("licGrpId"));
		metadatas.add(new Metadata("usrNm"));
		metadatas.add(new Metadata("loginIp"));
		metadatas.add(new Metadata("loginTime"));		        
		metadatas.add(new Metadata("logoutTime"));

		BigDataSheetWriter writer = new BigDataSheetWriter(
				egovMessageSource.getMessage("excel.stm5000.sheetNm")
				, tempPath
				,egovMessageSource.getMessage("excel.stm5000.sheetNm")
				, metadatas);

		writer.beginSheet();

		try{

			ExcelDataListResultHandler  resultHandler = new ExcelDataListResultHandler(writer.getXMLSheetWriter(), writer.getStyleMap(), header, metadatas);
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			stm5000VO.setLicGrpId(loginVO.getLicGrpId());
			stm5000Service.selectStm5000ExcelList(stm5000VO,resultHandler);

		}
		catch(Exception ex){
			Log.error("selectStm5000ExcelList()", ex);
			throw new Exception(ex.getMessage());
		}finally{
			writer.endSheet();
		}

		return writer.getModelAndView();
	}
}