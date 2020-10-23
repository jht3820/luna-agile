package kr.opensoftlab.lunaops.req.req2000.req2000.web;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.cmmn.trace.LeaveaTrace;
import egovframework.rte.fdl.property.EgovPropertyService;
import kr.opensoftlab.lunaops.req.req2000.req2000.service.Req2000Service;
import kr.opensoftlab.sdf.excel.BigDataSheetWriter;
import kr.opensoftlab.sdf.excel.ExcelDataListResultHandler;
import kr.opensoftlab.sdf.excel.Metadata;
import kr.opensoftlab.sdf.excel.SheetHeader;
import kr.opensoftlab.sdf.util.RequestConvertor;



@Controller
public class Req2000Controller {

	
	private final Logger Log = Logger.getLogger(this.getClass());

	
	@Resource(name = "req2000Service")
	private Req2000Service req2000Service;

	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	
	@Resource(name = "leaveaTrace")
	LeaveaTrace leaveaTrace;

	@Value("${Globals.fileStorePath}")
	private String tempPath;
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value="/req/req2000/req2000/selectReq2001View.do")
	public String selectReq2001View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{
			
			Map paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);

			
			List<Map> reqClsList = (List) req2000Service.selectReq2000ReqClsList(paramMap);

			model.addAttribute("reqClsList", reqClsList);

			return "/req/req2000/req2000/req2001";
		}
		catch(Exception ex){
			Log.error("selectReq2001View()", ex);
			throw new Exception(ex.getMessage());
		}
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value="/req/req2000/req2000/selectReq2002View.do")
	public String selectReq2002View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{
			
			Map paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);

			
			List<Map> reqClsList = (List) req2000Service.selectReq2000ReqClsList(paramMap);

			model.addAttribute("reqClsList", reqClsList);

			return "/req/req2000/req2000/req2002";
		}
		catch(Exception ex){
			Log.error("selectReq2002View()", ex);
			throw new Exception(ex.getMessage());
		}
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value="/req/req2000/req2000/selectReq2000View.do")
	public String selectReq2000View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{
			
			Map paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);

			
			List<Map> reqClsList = (List) req2000Service.selectReq2000ReqClsList(paramMap);

			model.addAttribute("reqClsList", reqClsList);

			return "/req/req2000/req2000/req2000";
		}
		catch(Exception ex){
			Log.error("selectReq2000View()", ex);
			throw new Exception(ex.getMessage());
		}
	}

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/req/req2000/req2000/selectReq2000ReqClsListAjax.do")
	public ModelAndView selectReq2000ReqClsListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{

			
			Map paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);

			String prjId = (String) paramMap.get("prjId");
        	
    		
    		if(prjId != null && !"".equals(prjId)){
    			
    			paramMap.remove("selPrjId");
    			
    			
    			paramMap.put("selPrjId", prjId);
    		}
    		
			
			List<Map> reqClsList = (List) req2000Service.selectReq2000ReqClsList(paramMap);

			
			model.addAttribute("reqClsList", reqClsList);
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectReq2000ReqClsListAjax()", ex);

			
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/req/req2000/req2000/selectReq2000ReqClsInfoAjax.do")
	public ModelAndView selectReq2000ReqClsInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{

			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);

			String prjId = (String) paramMap.get("prjId");
        	
    		
    		if(prjId != null && !"".equals(prjId)){
    			
    			paramMap.remove("selPrjId");
    			
    			
    			paramMap.put("selPrjId", prjId);
    		}
    		
			
			Map<String, String> menuInfoMap = (Map) req2000Service.selectReq2000ReqClsInfo(paramMap);

			
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

			return new ModelAndView("jsonView", menuInfoMap);
		}
		catch(Exception ex){
			Log.error("selectReq2000ReqClsInfoAjax()", ex);

			
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/req/req2000/req2000/insertReq2000ReqClsInfoAjax.do")
	public ModelAndView insertAdm1000MenuInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{

			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);

			
			Map<String, String> reqClsInfoMap = (Map) req2000Service.insertReq2000ReqClsInfo(paramMap);

			
			model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));

			return new ModelAndView("jsonView", reqClsInfoMap);
		}
		catch(Exception ex){
			Log.error("selectAdm1000MenuInfoAjax()", ex);

			
			model.addAttribute("saveYN", "N");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
			return new ModelAndView("jsonView");
		}
	}

	
	@RequestMapping(value="/req/req2000/req2000/deleteReq2000ReqClsInfoAjax.do")
	public ModelAndView deleteAdm1000MenuInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{
			
			Map<String, Object> paramMap = RequestConvertor.requestParamToMapAddSelInfoList(request, true,"reqClsId");

			
			List<String> notDelReqClsList = req2000Service.deleteReq2000ReqClsAssignChk(paramMap);

			
			if(notDelReqClsList.size() > 0){
				model.addAttribute("errorYn", "Y");
				model.addAttribute("notDelReqClsList", notDelReqClsList);
				model.addAttribute("message", egovMessageSource.getMessage("req2000.reqClsDeleteReason.fail"));
				return new ModelAndView("jsonView");
			}

			
			req2000Service.deleteReq2000ReqClsInfo(paramMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("deleteAdm1000MenuInfoAjax()", ex);

			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
			return new ModelAndView("jsonView");
		}
	}

	
	@RequestMapping(value="/req/req2000/req2000/updateReq2000ReqClsInfoAjax.do")
	public ModelAndView updateAdm1000MenuInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {

		try{

			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);

			
			req2000Service.updateReq2000ReqClsInfo(paramMap);

			
			model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("updateAdm1000MenuInfoAjax()", ex);

			
			model.addAttribute("saveYN", "N");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.update"));
			return new ModelAndView("jsonView");
		}
	}


	
	@SuppressWarnings({ "rawtypes" })
	@RequestMapping(value="/req/req2000/req2000/selectReq2000ExcelList.do")
	public ModelAndView selectReq2000ExcelList(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		Map paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);

		
		String strPrjId = egovMessageSource.getMessage("excel.prjId");
		String strPrjNm = egovMessageSource.getMessage("excel.prjNm");
		String strReqClsId = egovMessageSource.getMessage("excel.reqClsId");
		String strUpperReqClsId = egovMessageSource.getMessage("excel.upperReqClsId");
		String strReqClsNm = egovMessageSource.getMessage("excel.reqClsNm");
		String strLvl = egovMessageSource.getMessage("excel.lvl");
		String strOrd = egovMessageSource.getMessage("excel.ord");
		SheetHeader header = new SheetHeader(new String[]{strPrjId, strPrjNm, strReqClsId, strUpperReqClsId, strReqClsNm, strLvl, strOrd});
		
		
		List<Metadata> metadatas = new ArrayList<Metadata>(); 
		metadatas.add(new Metadata("prjId"));
		metadatas.add(new Metadata("prjNm"));
		metadatas.add(new Metadata("reqClsId"));
		metadatas.add(new Metadata("upperReqClsId"));
		metadatas.add(new Metadata("reqClsNm"));
		metadatas.add(new Metadata("lvl"));		        
		metadatas.add(new Metadata("ord"));

		
		
		String browserType = ((String)paramMap.get("browserType")).toLowerCase();
		
		
		String excelNm = egovMessageSource.getMessage("excel.req2000.sheetNm");
		
		
		if("edge".equals(browserType)){
			
			excelNm = URLEncoder.encode(excelNm, "UTF-8");
		}
		
		BigDataSheetWriter writer = new BigDataSheetWriter(excelNm, tempPath, excelNm, metadatas);

		writer.beginSheet();

		try{

			ExcelDataListResultHandler  resultHandler = new ExcelDataListResultHandler(writer.getXMLSheetWriter(), writer.getStyleMap(), header, metadatas);

			req2000Service.selectReq2000ExcelList(paramMap,resultHandler);

		}
		catch(Exception ex){
			Log.error("selectReq2000ExcelList()", ex);
			throw new Exception(ex.getMessage());
		}finally{
			writer.endSheet();
		}

		return writer.getModelAndView();
	}
}
