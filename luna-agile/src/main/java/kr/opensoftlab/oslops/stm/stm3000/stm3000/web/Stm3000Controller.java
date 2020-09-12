package kr.opensoftlab.lunaops.stm.stm3000.stm3000.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.utl.fcc.service.EgovStringUtil;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.opensoftlab.lunaops.com.fms.web.service.FileMngService;
import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.lunaops.stm.stm3000.stm3000.service.Stm3000Service;
import kr.opensoftlab.lunaops.stm.stm3000.stm3000.vo.Stm3000VO;
import kr.opensoftlab.lunaops.stm.stm3000.stm3003.service.Stm3003Service;
import kr.opensoftlab.sdf.excel.BigDataSheetWriter;
import kr.opensoftlab.sdf.excel.ExcelDataListResultHandler;
import kr.opensoftlab.sdf.excel.Metadata;
import kr.opensoftlab.sdf.excel.SheetHeader;
import kr.opensoftlab.sdf.excel.SheetParser;
import kr.opensoftlab.sdf.util.OslStringUtil;
import kr.opensoftlab.sdf.util.PagingUtil;
import kr.opensoftlab.sdf.util.RequestConvertor;



@Controller
public class Stm3000Controller {

	
	private static final Logger Log = Logger.getLogger(Stm3000Controller.class);
	
    
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	
    @Resource(name = "stm3000Service")
    private Stm3000Service stm3000Service;

	
    @Resource(name = "stm3003Service")
    private Stm3003Service stm3003Service;

	@Value("${Globals.fileStorePath}")
	private String tempPath;
	
	@Resource(name = "egovFileIdGnrService")
	private EgovIdGnrService idgenService;
	
	
   	@Resource(name="fileMngService")
   	private FileMngService fileMngService;
   	
	
	@Resource(name="EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;
    
    
	@RequestMapping(value="/stm/stm3000/stm3000/selectStm3000View.do")
    public String selectStm3000View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	return "/stm/stm3000/stm3000/stm3000";
    }
	
    
	@RequestMapping(value="/stm/stm3000/stm3000/selectStm3001View.do")
    public String selectStm3001View(HttpServletRequest request, HttpServletResponse response, ModelMap model) throws Exception {
    	
    	 try{
    		
	    	Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
	    	
	    	
    		String ldapUse = EgovProperties.getProperty("Globals.lunaops.ldap");
    		
    		model.put("ldapUse", ldapUse);
	    	model.put("type", paramMap.get("type"));
	    	
	    	return "/stm/stm3000/stm3000/stm3001";
    		 
    	 }catch(Exception ex){
  			Log.error("selectStm3001View()", ex);
  			throw new Exception(ex.getMessage());
  		}
    }
	
	
	@RequestMapping(value="/stm/stm3000/stm3000/selectStm3002View.do")
	public String selectStm3002View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
    	return "/stm/stm3000/stm3000/stm3002";
	}
    
	 @SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/stm/stm3000/stm3000/selectStm3000ListAjax.do")
	public ModelAndView selectStm3000ListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model )	throws Exception {
		
    	try{
    		
        	Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
        	
			
			String _pageNo_str = paramMap.get("pagination[page]");
			String _pageSize_str = paramMap.get("pagination[perpage]");
			
			
			
			int totCnt = stm3000Service.selectStm3000UsrListCnt(paramMap);

			
			PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(_pageNo_str, _pageSize_str);

			
			paginationInfo.setTotalRecordCount(totCnt);
			paramMap = PagingUtil.getPageSettingMap(paramMap, paginationInfo);
			
			
			String sortFieldId = (String) paramMap.get("sortFieldId");
			sortFieldId = OslStringUtil.replaceRegex(sortFieldId,"[^A-Za-z0-9+]*");
			String sortDirection = (String) paramMap.get("sortDirection");
			String paramSortFieldId = OslStringUtil.convertUnderScope(sortFieldId);
			paramMap.put("paramSortFieldId", paramSortFieldId);
			
			
			
			List stm3000List = stm3000Service.selectStm3000UsrList(paramMap);
		    
		    
			
			
			Map<String, Object> metaMap = PagingUtil.getPageReturnMap(paginationInfo);
			
			
			metaMap.put("sort", sortDirection);
			metaMap.put("field", sortFieldId);
			model.addAttribute("data", stm3000List);
			model.addAttribute("meta", metaMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
			
    	}catch(Exception ex){
    		Log.error("selectStm3000UsrList()", ex);
    		
    		
    		model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		return new ModelAndView("jsonView");
    	}
	}
	 
    
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/stm/stm3000/stm3000/selectStm3000UsrInfoAjax.do")
	public ModelAndView selectStm3000UsrInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model )	throws Exception {
		
    	try{
    		
        	Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
        	
        	Map usrInfoMap = stm3000Service.selectStm3000UsrInfo(paramMap);
        	model.addAttribute("usrInfoMap", usrInfoMap);
        	
        	if(usrInfoMap != null) {
        		
        		String usrImgFileExist = "N"; 
        		
        		
        		FileVO fileVo = new FileVO();
        		fileVo.setAtchFileId((String)usrInfoMap.get("usrImgId"));
        		fileVo.setFileSn("0");
        		
        		
        		fileVo = fileMngService.selectFileInf(fileVo);
        		if(fileVo != null){
        			usrImgFileExist = "Y";
        		}
        		
        		
        		model.addAttribute("usrImgFileExist", usrImgFileExist);
        	}
        	
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
			
    	}catch(Exception ex){
    		Log.error("selectStm3000UsrInfoAjax()", ex);
    		
    		
    		model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		return new ModelAndView("jsonView");
    	}
	} 
	
    
	@RequestMapping(value="/stm/stm3000/stm3000/insertStm3000UsrInfoAjax.do")
    public ModelAndView insertStm3000UsrInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			MultipartHttpServletRequest mptRequest = (MultipartHttpServletRequest)request;
			
			
        	Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);

    		
    		int idChkCnt = stm3000Service.selectCmm2000IdCheck(paramMap);
    		if(idChkCnt > 0){
    			model.put("errorYn", "N");
    			model.addAttribute("message", egovMessageSource.getMessage("success.common.dupid"));
    			return new ModelAndView("jsonView");
    		}
    		
    		
    		int emailChkCnt = stm3000Service.selectStm3000EmailCheck(paramMap);
    		if(emailChkCnt > 0){
    			model.put("errorYn", "N");
    			model.addAttribute("message", egovMessageSource.getMessage("fail.common.email"));
    			return new ModelAndView("jsonView");
    		}
    		
    		
			String atchFileId = paramMap.get("usrImgId");
			
			
			List<FileVO> _result = fileUtil.fileUploadInsert(mptRequest,atchFileId,0,"UsrImg");
			
			
			if(_result != null){
				fileMngService.insertFileDetail(_result); 
			}

			
        	stm3000Service.insertStm3000UsrInfo(paramMap);
        	
        	
        	model.addAttribute("errorYn", "N");
    		model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
        	return new ModelAndView("jsonView");
		
		}catch(Exception e){
			Log.error("insertStm3000UsrInfoAjax()", e);
			
    		model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
    		return new ModelAndView("jsonView");
		}
	}
	
    
	@RequestMapping(value="/stm/stm3000/stm3000/updateStm3000UsrInfoAjax.do")
    public ModelAndView updateStm3000UsrInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			MultipartHttpServletRequest mptRequest = (MultipartHttpServletRequest)request;
			
			
        	Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
        	
    		String orgEmail = paramMap.get("orgEmail"); 
    		String email = paramMap.get("email"); 
    		
    		
    		if(orgEmail != null && email != null && !orgEmail.equals(email)) {
    			
        		int emailChkCnt = stm3000Service.selectStm3000EmailCheck(paramMap);
        		if(emailChkCnt > 0){
        			model.put("errorYn", "N");
        			model.addAttribute("message", egovMessageSource.getMessage("fail.common.email"));
        			return new ModelAndView("jsonView");
        		}
    		}
    		
    		
			String atchFileId = (String) paramMap.get("usrImgId");
			
			
			if(atchFileId == null || "".equals(atchFileId)) {
				String atchFileIdString = idgenService.getNextStringId();
				fileMngService.insertFileMasterInfo(atchFileIdString);
				paramMap.put("usrImgId",atchFileIdString);
			}
        	
			
			stm3000Service.updateStm3000UsrInfo(paramMap, mptRequest);
			
        	
        	model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));
        	
        	return new ModelAndView("jsonView");
		}catch(Exception e){
			Log.error("updateStm3000UsrInfoAjax()", e);
			
    		model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.update"));
    		return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(method=RequestMethod.POST, value="/stm/stm3000/stm3000/deleteStm3000UsrInfo.do")
    public ModelAndView deleteStm3000UsrInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, Object> paramMap = RequestConvertor.requestParamToMapAddSelInfoList(request, true,"usrId");
        	
			
        	Map<String, Object> resultMap = stm3000Service.deleteStm3000UsrInfo(paramMap);
        	
        	if("-1".equals(resultMap.get("code"))) {
        		model.addAttribute("checkYn", "Y");
        		model.addAttribute("result", resultMap);
        		return new ModelAndView("jsonView");
        	}
        	
        	
        	model.addAttribute("errorYn", "N");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
        	return new ModelAndView("jsonView");
		}catch(Exception e){
			Log.error("deleteStm3000UsrInfo()", e);
			
			
        	model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
    		return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value = "/stm/stm3000/stm3000/selectCmm2000IdCheck.do", produces="text/plain;charset=UTF-8")
	public ModelAndView selectCmm2000IdCheck (HttpServletRequest request, ModelMap model) throws Exception   {

		try{
			
			Map<String, String> param = RequestConvertor.requestParamToMap(request, true);

			
			String usrId = param.get("usrId");

			
			if( "".equals(EgovStringUtil.isNullToString(usrId)) ) {
				model.put("idChkYn", "Y");
				model.addAttribute("message", egovMessageSource.getMessage("fail.required.dupid"));
				return new ModelAndView("jsonView");
			}
			
			
			int idChkCnt =  stm3000Service.selectCmm2000IdCheck( param );
			
			
			if( idChkCnt == 0) {
				
				model.put("idChkYn", "N");
				model.addAttribute("message", egovMessageSource.getMessage("success.common.dupid"));
			}else{
				model.put("idChkYn", "Y");
				model.addAttribute("message", egovMessageSource.getMessage("fail.common.dupid"));
			}
			
			return new ModelAndView("jsonView");
			
		}catch(Exception e){
			Log.error("selectCmm2000IdCheck", e);
			model.put("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value = "/stm/stm3000/stm3000/selectStm3000EmailCheck.do", produces="text/plain;charset=UTF-8")
	public ModelAndView selectStm3000EmailCheck (HttpServletRequest request, ModelMap model) throws Exception   {

		try{
			
			Map<String, String> param = RequestConvertor.requestParamToMap(request, true);

			
			String usrEmail = param.get("email");

			
			if( "".equals(EgovStringUtil.isNullToString(usrEmail)) ) {
				model.put("emailChkYn", "Y");
				model.addAttribute("message", egovMessageSource.getMessage("fail.required.email"));
				return new ModelAndView("jsonView");
			}
			
			
			int emaildChkCnt =  stm3000Service.selectStm3000EmailCheck( param );
			
			
			if( emaildChkCnt == 0) {
				
				model.put("emailChkYn", "N");
				model.addAttribute("message", egovMessageSource.getMessage("success.common.email"));
			}else{
				model.put("emailChkYn", "Y");
				model.addAttribute("message", egovMessageSource.getMessage("fail.common.email"));
			}
			
			return new ModelAndView("jsonView");
			
		}catch(Exception e){
			Log.error("selectStm3000EmailCheck", e);
			model.put("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	
	@RequestMapping(value="/stm/stm3000/stm3000/updateStm3000UseCd.do")
    public ModelAndView updateStm3000UseCd(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
        	Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
        	
    		
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			
    		paramMap.put("licGrpId", loginVO.getLicGrpId());		
        	paramMap.put("regUsrId", loginVO.getUsrId()); 			
        	paramMap.put("regUsrIp", request.getRemoteAddr()); 
        	
        	stm3000Service.updateStm3000UseCd(paramMap);
        	
        	
        	model.addAttribute("successYn", "Y");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.save"));
        	
        	return new ModelAndView("jsonView");
        	
		}catch(Exception e){
			Log.error("saveStm3000UsrInfo()", e);
			
    		model.addAttribute("successYn", "N");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.save"));
    		
    		return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/stm/stm3000/stm3000/selectStm3000ExcelList.do")
	public ModelAndView selectStm3000ExcelList(@ModelAttribute("Stm3000VO") Stm3000VO Stm3000VO, HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {


		
		SheetHeader header = new SheetHeader(new String[]{
				egovMessageSource.getMessage("excel.useCd")
				,egovMessageSource.getMessage("excel.usrId")
				,egovMessageSource.getMessage("excel.usrNm")
				,egovMessageSource.getMessage("excel.telno")
				,egovMessageSource.getMessage("excel.email")
				,egovMessageSource.getMessage("excel.etc")});

		
		List<Metadata> metadatas = new ArrayList<Metadata>(); 
		metadatas.add(new Metadata("useCd"));
		metadatas.add(new Metadata("usrId"));
		metadatas.add(new Metadata("usrNm"));
		metadatas.add(new Metadata("telno"));
		metadatas.add(new Metadata("email"));		        
		metadatas.add(new Metadata("etc"));		        


		BigDataSheetWriter writer = new BigDataSheetWriter(egovMessageSource.getMessage("excel.stm3000.sheetNm")
				, tempPath
				, egovMessageSource.getMessage("excel.stm3000.sheetNm")
				, metadatas);

		writer.beginSheet();

		try{

			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			Stm3000VO.setLicGrpId(loginVO.getLicGrpId());
			
			ExcelDataListResultHandler  resultHandler = new ExcelDataListResultHandler(writer.getXMLSheetWriter(), writer.getStyleMap(), header, metadatas);

			stm3000Service.selectStm3000ExcelList(Stm3000VO,resultHandler);

		}
		catch(Exception ex){
			Log.error("selectStm3000ExcelList()", ex);
			throw new Exception(ex.getMessage());
		}finally{
			writer.endSheet();
		}
		
		return writer.getModelAndView();
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value="/stm/stm3000/stm3000/excelUpload.do" ,method = RequestMethod.POST)
	public ModelAndView uploadExcelParseToAjax(final MultipartHttpServletRequest multiRequest,  HttpServletResponse response ) throws Exception {
		List<Object> excelList =null;
		Map jsonMap =new HashMap();

		Map<String, MultipartFile> fileMap = multiRequest.getFileMap();
		try{
			Set<Entry<String,  MultipartFile>> entrySet = fileMap.entrySet();
			Class clz = Stm3000VO.class;
			
			for (Entry<String,  MultipartFile> entry : entrySet) {
				SheetParser parser = new SheetParser(entry.getValue().getInputStream(),1);
				excelList = parser.createEntity(clz, 1);
			}
		}
		catch(Exception ex){
			Log.error("selectExcelUploadView()", ex);
			throw new Exception(ex.getMessage());
		}

		jsonMap.put("parseList", excelList);
		return  new ModelAndView("jsonView",jsonMap);
	}
	
	
	@RequestMapping(value="/stm/stm3000/stm3000/insertStm3000AdmInfoListAjax.do")
	public ModelAndView insertStm3000AdmInfoListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
						
			HttpSession ss = request.getSession();

			String prjId = (String) ss.getAttribute("selPrjId");
	
			
			stm3000Service.insertStm3000AdmInfoListAjax(paramMap, prjId);

			
			model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("insertStm3000AdmInfoAjax()", ex);

			
			model.addAttribute("saveYN", "N");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/stm/stm3000/stm3000/updateStm3000Block.do")
    public ModelAndView updateStm3000BlockAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
        	Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
        	
    		
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			
    		paramMap.put("licGrpId", loginVO.getLicGrpId());		
        	paramMap.put("regUsrId", loginVO.getUsrId()); 			
        	paramMap.put("regUsrIp", request.getRemoteAddr()); 		
        	
        	
        	stm3000Service.updateStm3000Block(paramMap);
        	
        	
        	model.addAttribute("successYn", "Y");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));
        	
        	return new ModelAndView("jsonView");
        	
		}catch(Exception e){
			Log.error("updateStm3000BlockAjax()", e);
			
    		model.addAttribute("successYn", "N");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.update"));
    		
    		return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/stm/stm3000/stm3000/selectStm3000BeforeUsedPwChkAjax.do")
    public ModelAndView selectStm3000BeforeUsedPwChkAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
        	Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);	
        	
        	
        	String isUsedPw = stm3003Service.selectStm3003BeforeUsedPwCheck(paramMap);
        	
        	
        	model.addAttribute("isUsedPw", isUsedPw);
        	
        	
        	model.addAttribute("errorYn", "N");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        	
        	return new ModelAndView("jsonView");
        	
		}catch(Exception e){
			Log.error("selectStm3000BeforeUsedPwChkAjax()", e);
			
    		model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		
    		return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/stm/stm3000/stm3000/updateStm3000AccountInit.do")
    public ModelAndView updateStm3000AccountInit(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
        	Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
        	
        	
        	stm3000Service.updateStm3000AccountInit(paramMap);
        	
        	
        	model.addAttribute("errorYn", "N");
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));
        	
        	return new ModelAndView("jsonView");
        	
		}catch(Exception e){
			Log.error("updateStm3000AccountInit()", e);
			
    		model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.update"));
    		return new ModelAndView("jsonView");
		}
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/stm/stm3000/stm3000/selectStm3000PrjAuthUserList.do")
    public ModelAndView selectStm3000PrjAuthUserList(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
        	Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
        	
        	
			HttpSession ss = request.getSession();
			String  prjId = "";
			
			if(paramMap.get("popupPrjId") != null){
				prjId = paramMap.get("popupPrjId");
			}
			else if(paramMap.get("prjId") != null){
				prjId = paramMap.get("prjId");
			}
			else{
				prjId = (String) ss.getAttribute("selPrjId");
			}
			
			paramMap.remove("prjId");
			paramMap.put("prjId", prjId);
        	
        	List<Map> prjAuthUserList = stm3000Service.selectStm3000PrjAuthUserList(paramMap);
        	model.addAttribute("prjAuthUserList", prjAuthUserList);
        	
        	
        	model.addAttribute("errorYn", "N");
    		model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
        	
        	return new ModelAndView("jsonView");
        	
		}catch(Exception e){
			Log.error("selectStm3000PrjAuthUserList()", e);
			
    		model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
    		
    		return new ModelAndView("jsonView");
		}
	}
}
