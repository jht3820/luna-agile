package kr.opensoftlab.lunaops.stm.stm5000.stm5100.web;



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
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.lunaops.stm.stm5000.stm5100.service.Stm5100Service;
import kr.opensoftlab.lunaops.stm.stm5000.stm5100.vo.Stm5100VO;
import kr.opensoftlab.sdf.excel.BigDataSheetWriter;
import kr.opensoftlab.sdf.excel.ExcelDataListResultHandler;
import kr.opensoftlab.sdf.excel.Metadata;
import kr.opensoftlab.sdf.excel.SheetHeader;
import kr.opensoftlab.sdf.util.OslStringUtil;
import kr.opensoftlab.sdf.util.PagingUtil;
import kr.opensoftlab.sdf.util.RequestConvertor;


@Controller
public class Stm5100Controller {
   
	
	protected Logger Log = Logger.getLogger(this.getClass());
	
	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	
    @Resource(name = "stm5100Service")
    private Stm5100Service stm5100Service;
	
    @Value("${Globals.fileStorePath}")
	private String tempPath;
	
    
	@RequestMapping(value="/stm/stm5000/stm5100/selectStm5100View.do")
    public String selectStm5100ListView(HttpServletRequest request, ModelMap model ) throws Exception {
		return "/stm/stm5000/stm5100/stm5100";
    }
	
	 
    @SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/stm/stm5000/stm5100/selectStm5100ViewAjax.do")
    public ModelAndView selectStm5100ViewAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			
			String _pageNo_str = paramMap.get("pagination[page]");
			String _pageSize_str = paramMap.get("pagination[perpage]");
			
			
			String sortFieldId = (String) paramMap.get("sortFieldId");
			sortFieldId = OslStringUtil.replaceRegex(sortFieldId,"[^A-Za-z0-9+]*");
			String sortDirection = (String) paramMap.get("sortDirection");
			String paramSortFieldId = OslStringUtil.convertUnderScope(sortFieldId);
			paramMap.put("paramSortFieldId", paramSortFieldId);
			
			
			
			int totCnt = stm5100Service.selectStm5100ListCnt(paramMap);
			
			
			PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(_pageNo_str, _pageSize_str);

			
			paginationInfo.setTotalRecordCount(totCnt);
			paramMap = PagingUtil.getPageSettingMap(paramMap, paginationInfo);
			
			
			
			List<Map> stm5100List = stm5100Service.selectStm5100List(paramMap);
			
			
			
			Map<String, Object> metaMap = PagingUtil.getPageReturnMap(paginationInfo);
			
			
			metaMap.put("sort", sortDirection);
			metaMap.put("field", sortFieldId);
			
			model.addAttribute("data", stm5100List);
			model.addAttribute("meta", metaMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectStm5100ViewAjax()", ex);
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
    }
	
	
	@RequestMapping(value="/stm/stm5000/stm5100/selectStm5100ExcelList.do")
    public ModelAndView selectStm5100ExcelList(HttpServletRequest request, @ModelAttribute("stm5100VO") Stm5100VO stm5100VO, ModelMap model ) throws Exception {
		
		SheetHeader header = new SheetHeader(new String[]{
				egovMessageSource.getMessage("excel.logUsrId")
				,egovMessageSource.getMessage("excel.licGrpId")
				,egovMessageSource.getMessage("excel.usrNm")
				,egovMessageSource.getMessage("excel.logIp")
				,egovMessageSource.getMessage("excel.logUrl")
				,egovMessageSource.getMessage("excel.logTime") });
		
		List<Metadata> metadatas = new ArrayList<Metadata>(); 
		metadatas.add(new Metadata("logUsrId"));
		metadatas.add(new Metadata("licGrpId"));
		metadatas.add(new Metadata("usrNm"));
		metadatas.add(new Metadata("logIp"));
		metadatas.add(new Metadata("logUrl"));		        
		metadatas.add(new Metadata("logTime"));
		
		BigDataSheetWriter writer = new BigDataSheetWriter(
				egovMessageSource.getMessage("excel.stm5100.sheetNm")
				, tempPath
				,egovMessageSource.getMessage("excel.stm5100.sheetNm")
				, metadatas);

		writer.beginSheet();

		try{

			ExcelDataListResultHandler  resultHandler = new ExcelDataListResultHandler(writer.getXMLSheetWriter(), writer.getStyleMap(), header, metadatas);
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			stm5100VO.setLicGrpId(loginVO.getLicGrpId());
			stm5100Service.selectStm5100ExcelList(stm5100VO,resultHandler);

		}
		catch(Exception ex){
			Log.error("selectReq2000ExcelDownList()", ex);
			throw new Exception(ex.getMessage());
		}finally{
			writer.endSheet();
		}
		
		return writer.getModelAndView();
    }
	

}
