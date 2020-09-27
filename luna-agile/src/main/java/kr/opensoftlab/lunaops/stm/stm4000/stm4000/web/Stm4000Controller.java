package kr.opensoftlab.lunaops.stm.stm4000.stm4000.web;

import java.util.ArrayList;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.property.EgovPropertyService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.lunaops.stm.stm4000.stm4000.service.Stm4000Service;
import kr.opensoftlab.sdf.excel.BigDataSheetWriter;
import kr.opensoftlab.sdf.excel.ExcelDataListResultHandler;
import kr.opensoftlab.sdf.excel.Metadata;
import kr.opensoftlab.sdf.excel.SheetHeader;
import kr.opensoftlab.sdf.util.OslStringUtil;
import kr.opensoftlab.sdf.util.PagingUtil;
import kr.opensoftlab.sdf.util.RequestConvertor;


@Controller
public class Stm4000Controller {

	
	protected Logger Log = Logger.getLogger(this.getClass());
	
	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	
	
    @Resource(name = "stm4000Service")
    private Stm4000Service stm4000Service;
    
	@Value("${Globals.fileStorePath}")
	private String tempPath;
    
    
	@RequestMapping(value="/stm/stm4000/stm4000/selectStm4000View.do")
    public String selectStm4000View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	return "/stm/stm4000/stm4000/stm4000";
    }
    
    
    @SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/stm/stm4000/stm4000/selectStm4000CommonCodeMasterListAjax.do")
    public ModelAndView selectStm4000CommonCodeMasterListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	try{
    		
        	Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
        	
        	
			
			String _pageNo_str = paramMap.get("pagination[page]");
			String _pageSize_str = paramMap.get("pagination[perpage]");
			
			
			String sortFieldId = (String) paramMap.get("sortFieldId");
			sortFieldId = OslStringUtil.replaceRegex(sortFieldId,"[^A-Za-z0-9+]*");
			String sortDirection = (String) paramMap.get("sortDirection");
			String paramSortFieldId = OslStringUtil.convertUnderScope(sortFieldId);
			paramMap.put("paramSortFieldId", paramSortFieldId);
			
			

			
			int totCnt = stm4000Service.selectStm4000CommonCodeMasterListCnt(paramMap);
			
			
			PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(_pageNo_str, _pageSize_str);

			
			paginationInfo.setTotalRecordCount(totCnt);
			paramMap = PagingUtil.getPageSettingMap(paramMap, paginationInfo);
			
			
			
			List<Map> masterCodeList = stm4000Service.selectStm4000CommonCodeMasterList(paramMap);
			
			
			
			Map<String, Object> metaMap = PagingUtil.getPageReturnMap(paginationInfo);
			
			
			metaMap.put("sort", sortDirection);
			metaMap.put("field", sortFieldId);
			
			model.addAttribute("data", masterCodeList);
			model.addAttribute("meta", metaMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
    	}
    	catch(Exception ex){
    		Log.error("selectStm4000CommonCodeMasterListAjax()", ex);

			
			model.addAttribute("errorYN", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
    	}
    }
	
    
	@RequestMapping(value="/stm/stm4000/stm4000/selectStm4001View.do")
    public String selectStm4001View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	try{
    		
        	Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
        	
        	String type = paramMap.get("type");
        	
        	if("insert".equals(type)) {
        		
               	int nextOrd = stm4000Service.selectStm4000MstCodeNextOrd(paramMap);
               	model.addAttribute("nextOrd", nextOrd);
        	}
        	
        	model.addAttribute("type",type);
        	return "/stm/stm4000/stm4000/stm4001";
    	}
    	catch(Exception ex){
    		Log.error("selectStm4001View()", ex);
  			throw new Exception(ex.getMessage());
    	}
    }
	
    
    @SuppressWarnings("rawtypes")
   	@RequestMapping(value="/stm/stm4000/stm4000/selectStm4000CommonCodeMasterInfoAjax.do")
       public ModelAndView selectStm4000CommonCodeMasterInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
       	
       	try{
       		
        	Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
        	
           	
           	Map mstCodeInfoMap = (Map) stm4000Service.selectStm4000CommonCodeMasterInfo(paramMap);
           	
           	model.addAttribute("mstCodeInfoMap", mstCodeInfoMap);
           	
           	
           	model.addAttribute("errorYn", "N");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        	
        	return new ModelAndView("jsonView");
    	}
    	catch(Exception ex){
    		Log.error("selectStm4000CommonCodeMasterInfoAjax()", ex);
    		
    		
    		model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		return new ModelAndView("jsonView");
    	}
    }
	
    
	@RequestMapping(value="/stm/stm4000/stm4000/selectStm4002View.do")
    public String selectStm4002View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	try{
    		
    		
        	Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
        	String type = paramMap.get("type");
        	
        	if("insert".equals(type)) {
        		
               	int nextOrd = stm4000Service.selectStm4000DetailCodeNextOrd(paramMap);
               	model.addAttribute("nextOrd", nextOrd);
        	}
        	
        	model.addAttribute("type",type);
        	return "/stm/stm4000/stm4000/stm4002";
    	}
    	catch(Exception ex){
    		Log.error("selectStm4002View()", ex);
    		throw new Exception(ex.getMessage());
    	}
    }
    
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value="/stm/stm4000/stm4000/selectStm4000CommonCodeDetailListAjax.do")
    public ModelAndView selectStm4000CommonCodeDetailListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	try{
    		
        	Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
        	
        	
			
			String _pageNo_str = paramMap.get("pagination[page]");
			String _pageSize_str = paramMap.get("pagination[perpage]");

			
			String sortFieldId = (String) paramMap.get("sortFieldId");
			sortFieldId = OslStringUtil.replaceRegex(sortFieldId,"[^A-Za-z0-9+]*");
			String sortDirection = (String) paramMap.get("sortDirection");
			String paramSortFieldId = OslStringUtil.convertUnderScope(sortFieldId);
			paramMap.put("paramSortFieldId", paramSortFieldId);
			
			
			int totCnt = stm4000Service.selectStm4000CommonCodeDetailListCnt(paramMap);
			
			
			PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(_pageNo_str, _pageSize_str);

			
			paginationInfo.setTotalRecordCount(totCnt);
			paramMap = PagingUtil.getPageSettingMap(paramMap, paginationInfo);
			
			
			
			List<Map> detailCodeList = stm4000Service.selectStm4000CommonCodeDetailList(paramMap);
			
			
			
			Map<String, Object> metaMap = PagingUtil.getPageReturnMap(paginationInfo);
			
			
			metaMap.put("sort", sortDirection);
			metaMap.put("field", sortFieldId);
			
			model.addAttribute("data", detailCodeList);
			model.addAttribute("meta", metaMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
    	}
    	catch(Exception ex){
    		Log.error("selectStm4000CommonCodeDetailListAjax()", ex);

			
			model.addAttribute("errorYN", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
    	}
    }
	
    
    @SuppressWarnings("rawtypes")
   	@RequestMapping(value="/stm/stm4000/stm4000/selectStm4000CommonCodeDetailInfoAjax.do")
       public ModelAndView selectStm4000CommonCodeDetailInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
       	
       	try{
       		
        	Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
        	
           	
           	Map detailCodeInfoMap = (Map) stm4000Service.selectStm4000CommonCodeDetailInfo(paramMap);
           	
           	model.addAttribute("detailCodeInfoMap", detailCodeInfoMap);
           	
           	
           	model.addAttribute("errorYn", "N");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        	
        	return new ModelAndView("jsonView");
    	}
    	catch(Exception ex){
    		Log.error("selectStm4000CommonCodeDetailInfoAjax()", ex);
    		
    		
    		model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		return new ModelAndView("jsonView");
    	}
    }
	
	
	@RequestMapping(value="/stm/stm4000/stm4000/saveStm4000CommonCodeMasterInfoAjax.do")
    public ModelAndView saveStm4000CommonCodeMasterAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	try{
    		
    		Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
        	
    		String type = paramMap.get("type");
    		
    		
        	if( "insert".equals(type)){
        		int count =  stm4000Service.selectStm4000CommonCodeCount(paramMap);
        		
        		if(count > 0) {
        			model.addAttribute("duplYn", "Y");
            		model.addAttribute("message", egovMessageSource.getMessage("stm4000.fail.duplCommonCode"));
            		return new ModelAndView("jsonView");
        		}
        	}
        	
        	
    		stm4000Service.saveStm4000CommonCodeMaster(paramMap);
        	
        	
        	model.addAttribute("errorYn", "N");
        	
        	
        	if("insert".equals(type)){
        		model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
        	}else if("update".equals(type)){
        		model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));
        	}
        	
        	return new ModelAndView("jsonView");
    	}
    	catch(Exception ex){
    		Log.error("saveStm4000CommonCodeMasterAjax()", ex);
    		
    		
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.save"));
    		return new ModelAndView("jsonView");
    	}
	}
	
	
	@RequestMapping(method=RequestMethod.POST, value="/stm/stm4000/stm4000/deleteStm4000CommonCodeMasterAjax.do")
    public ModelAndView deleteStm4000CommonCodeMasterAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	try{
    		
			Map<String, Object> paramMap = RequestConvertor.requestParamToMapAddSelInfoList(request, true, "mstCd");
      	
			int result = stm4000Service.deleteStm4000CommonCodeMaster(paramMap);
			
        	if(result > 0) {
        		model.addAttribute("errorYn", "Y");
        		model.addAttribute("message", egovMessageSource.getMessage("stm4000.systemUseCode.notDelete"));
        		return new ModelAndView("jsonView");
        	}
			
        	
        	model.addAttribute("errorYn", "N");
            model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
        	
        	return new ModelAndView("jsonView");
    	}
    	catch(Exception ex){
    		Log.error("deleteStm4000CommonCodeMasterAjax()", ex);
    		
    		
    		model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
    		return new ModelAndView("jsonView");
    	}
    }
	
	
	@RequestMapping(method=RequestMethod.POST, value="/stm/stm4000/stm4000/saveStm4000CommonCodeDetailInfoAjax.do")
    public ModelAndView saveStm4000CommonCodeDetailInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	try{
    		
    		Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
        	
    		String type = paramMap.get("type");
    		String stmUseYn = paramMap.get("stmUseYn");
        	
        	
        	if("insert".equals(type)){
        		
        		if("Y".equals(stmUseYn)){
        			model.addAttribute("errorYn", "N");
        			model.addAttribute("message", egovMessageSource.getMessage("stm4000.systemUseCode.notInsertDetail"));
        			return new ModelAndView("jsonView");
        		}
        		
        		
        		int count = stm4000Service.selectStm4000CommonDetailCodeCount(paramMap);
        		if(count > 0) {
        			model.addAttribute("duplYn", "Y");
            		model.addAttribute("message", egovMessageSource.getMessage("stm4000.fail.duplCommonCode"));
            		return new ModelAndView("jsonView");
        		}
			}
        	        
        	
        	stm4000Service.saveStm4000CommonCodeDetail(paramMap);
        	
        	
        	model.addAttribute("errorYn", "N");
        	
        	
        	if("insert".equals(type)){
        		model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
        	}else if("update".equals(type)){
        		model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));
        	}
        	        	
        	return new ModelAndView("jsonView");
    	}
    	catch(Exception ex){
    		Log.error("saveStm4000CommonCodeDetailInfoAjax()", ex);
    		
    		
    		model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.save"));
    		return new ModelAndView("jsonView");
    	}
	}
	
	
	@RequestMapping(method=RequestMethod.POST, value="/stm/stm4000/stm4000/deleteStm4000CommonCodeDetailAjax.do")
    public ModelAndView deleteStm4000CommonCodeDetailAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	try{

    		
			Map<String, Object> paramMap = RequestConvertor.requestParamToMapAddSelInfoList(request, true, "subCd");
			
        	int result = stm4000Service.deleteStm4000CommonCodeDetail(paramMap);
			
        	if(result > 0) {
        		model.addAttribute("errorYn", "Y");
        		model.addAttribute("message", egovMessageSource.getMessage("stm4000.systemUseCode.notDelete"));
        		return new ModelAndView("jsonView");
        	}
        	
        	
        	model.addAttribute("errorYn", "N");
            model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
        	
        	return new ModelAndView("jsonView");
    	}
    	catch(Exception ex){
    		Log.error("deleteStm4000CommonCodeDetailAjax()", ex);
    		
    		
        	model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
    		return new ModelAndView("jsonView", model);
    	}
    }
	
	
	@RequestMapping(
				value="/stm/stm4000/stm4000/selectStm4000ExcelList.do" 				
				,params={"MasterOrDetail","mstCd"}
			)
	public ModelAndView selectStm4000ExcelList(@RequestParam(value="MasterOrDetail") String type,
			@RequestParam(value="mstCd") String mstCd,
			HttpServletRequest request, 
			HttpServletResponse response, ModelMap model ) throws Exception {

		SheetHeader header = null;
		
		List<Metadata> metadatas = new ArrayList<Metadata>();
		
		if(type.toLowerCase().equals("master")){
			header = new SheetHeader(new String[]{
					egovMessageSource.getMessage("excel.mstCd")
					,egovMessageSource.getMessage("excel.upperMstCd")
					,egovMessageSource.getMessage("excel.mstCdNm")
					,egovMessageSource.getMessage("excel.mstCdDesc")
					,egovMessageSource.getMessage("excel.ord")
					,egovMessageSource.getMessage("excel.useYn")});
			
			metadatas.add(new Metadata("mstCd"));
			metadatas.add(new Metadata("upperMstCd"));
			metadatas.add(new Metadata("mstCdNm"));
			metadatas.add(new Metadata("mstCdDesc"));
			metadatas.add(new Metadata("ord"));		        
			metadatas.add(new Metadata("useYn"));	
		}else{
			header = new SheetHeader(new String[]{
					egovMessageSource.getMessage("excel.mstCd")
					,egovMessageSource.getMessage("excel.subCd")
					,egovMessageSource.getMessage("excel.subCdNm")
					,egovMessageSource.getMessage("excel.subCdRef1")
					,egovMessageSource.getMessage("excel.subCdRef2")
					,egovMessageSource.getMessage("excel.subCdDesc")
					,egovMessageSource.getMessage("excel.ord")
					,egovMessageSource.getMessage("excel.useYn")});
			
			metadatas.add(new Metadata("mstCd"));
			metadatas.add(new Metadata("subCd"));
			metadatas.add(new Metadata("subCdNm"));
			metadatas.add(new Metadata("subCdRef1"));
			metadatas.add(new Metadata("subCdRef2"));		        
			metadatas.add(new Metadata("subCdDesc"));	
			metadatas.add(new Metadata("ord"));
			metadatas.add(new Metadata("useYn"));
		}

		BigDataSheetWriter writer = new BigDataSheetWriter(
				egovMessageSource.getMessage("excel.stm4000.sheetNm")
				, tempPath
				, egovMessageSource.getMessage("excel.stm4000.sheetNm")
				, metadatas);

		writer.beginSheet();

		try{

			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			
			
			
			ExcelDataListResultHandler  resultHandler = new ExcelDataListResultHandler(writer.getXMLSheetWriter(), writer.getStyleMap(), header, metadatas);
			if(type.toLowerCase().equals("master")){
				stm4000Service.selectStm4000MasterExcelList(loginVO,resultHandler);
			}else{
				Map<String, String> map = new HashMap<>();
				map.put("licGrpId", loginVO.getLicGrpId());
				map.put("mstCd", mstCd);
				stm4000Service.selectStm4000DetailExcelList(map,resultHandler);
			}
		}
		catch(Exception ex){
			Log.error("selectReq2000ExcelDownList()", ex);
			throw new Exception(ex.getMessage());
		}finally{
			writer.endSheet();
		}
		
		return writer.getModelAndView();
	}
	

	
	@SuppressWarnings({ "rawtypes", "unchecked"})
	@RequestMapping(method = RequestMethod.POST, value = "/stm/stm4000/stm4000/selectStm4000MultiCommonCodeList.do")
	public ModelAndView selectCmm9100MultiCommonCodeList(
			HttpServletRequest request, HttpServletResponse response,
			ModelMap modelMap) throws Exception {
		
		Map paramMap = RequestConvertor.requestParamToMap(request,true);
		
		
		Map rtnMap = new HashMap();
		try {
			
			Map commonCodeList = stm4000Service.selectStm4000MultiCommonCodeList(paramMap);

			if(commonCodeList == null || commonCodeList.size() == 0){
				rtnMap = new HashMap();
				rtnMap.put("ERROR_CODE", "-1");
				rtnMap.put("ERROR_MSG", "공통콤보 리스트 내역이 없습니다.");
			}else{
				rtnMap.put("commonCodeList", commonCodeList);
				rtnMap.put("ERROR_CODE", "1");
				rtnMap.put("ERROR_MSG", "공통콤보조회 성공");
			}

		}catch(Exception e){
			Log.debug(e);
			rtnMap = new HashMap();
			rtnMap.put("ERROR_CODE", "-1");
			rtnMap.put("ERROR_MSG", "공통콤보 리스트 내역이 없습니다.");
		}
		
		return new ModelAndView("jsonView", rtnMap);
	}
}
