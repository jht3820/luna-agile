package kr.opensoftlab.lunaops.stm.stm6000.stm6000.web;

import java.net.URLEncoder;
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
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.property.EgovPropertyService;
import kr.opensoftlab.lunaops.stm.stm6000.stm6000.service.Stm6000Service;
import kr.opensoftlab.lunaops.com.exception.UserDefineException;
import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.sdf.excel.BigDataSheetWriter;
import kr.opensoftlab.sdf.excel.ExcelDataListResultHandler;
import kr.opensoftlab.sdf.excel.Metadata;
import kr.opensoftlab.sdf.excel.SheetHeader;
import kr.opensoftlab.sdf.util.RequestConvertor;



@Controller
public class Stm6000Controller {
	
	
	protected Logger Log = Logger.getLogger(this.getClass());
	
	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;
	
	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	
	@Resource(name = "stm6000Service")
	private Stm6000Service stm6000Service;
	
	
	@Value("${Globals.fileStorePath}")
	private String tempPath;
	
    
	@RequestMapping(value="/stm/stm6000/stm6000/selectStm6000View.do")
    public String selectStm6000View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/stm/stm6000/stm6000/stm6000";
    }
	
    
	@RequestMapping(value="/stm/stm6000/stm6000/selectStm6001View.do")
    public String selectStm6001View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		try{
    		
        	Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);

    		
           	int nextOrd = stm6000Service.selectStm6000DeptNextOrd(paramMap);
           	model.addAttribute("nextOrd",nextOrd);
           	model.addAttribute("type",paramMap.get("type"));
           	
        	return "/stm/stm6000/stm6000/stm6001";
    	}
    	catch(Exception ex){
    		Log.error("selectStm6001View()", ex);
  			throw new Exception(ex.getMessage());
    	}
	}
	
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/stm/stm6000/stm6000/selectStm6000DeptListAjax.do")
	public ModelAndView selectStm6000DeptListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		try{			
			
			Map paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
    		List<Map> deptList = (List)stm6000Service.selectStm6000DeptList(paramMap);
			
    		
			model.addAttribute("list", deptList);
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
    		
			return new ModelAndView("jsonView");
			
		}catch(Exception ex){
			Log.error("selectStm6000DeptListAjax()", ex);

			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/stm/stm6000/stm6000/selectStm6000SubDeptListAjax.do")
	public ModelAndView selectStm6000SubDeptListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		try{			
			
			Map paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
    		List<Map> deptList = (List)stm6000Service.selectStm6000SubDeptList(paramMap);
			
    		
			model.addAttribute("deptList", deptList);
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
    		
			return new ModelAndView("jsonView");
			
		}catch(Exception ex){
			Log.error("selectStm6000SubDeptListAjax()", ex);

			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/stm/stm6000/stm6000/selectStm6000DeptInfoAjax.do")
	public ModelAndView selectStm6000DeptInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		try{		
			
			Map paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			Map deptInfoMap = stm6000Service.selectStm6000DeptInfo(paramMap);
			model.addAttribute("deptInfoMap", deptInfoMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			return new ModelAndView("jsonView");
		}catch(Exception ex){
			Log.error("selectStm6000DeptInfoAjax()", ex);

			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}	
	
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/stm/stm6000/stm6000/insertStm6000DeptInfoAjax.do")
	public ModelAndView insertStm6000DeptInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		try{
			
			Map paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			String newDeptId = stm6000Service.insertStm6000DeptInfo(paramMap);
			model.addAttribute("newDeptId", newDeptId);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
			
			return new ModelAndView("jsonView");
		
		}catch(UserDefineException ude) {
			Log.error("insertStm6000DeptInfoAjax()", ude);

			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", ude);

			return new ModelAndView("jsonView");
		}catch(Exception ex){
			Log.error("insertStm6000DeptInfoAjax()", ex);

			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/stm/stm6000/stm6000/updateStm6000DpteInfoAjax.do")
	public ModelAndView updateStm6000DpteInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		try{			
			
			Map paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			stm6000Service.updateStm6000DpteInfo(paramMap);
		
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));

			return new ModelAndView("jsonView");
			
		}catch(UserDefineException ude) {
			Log.error("updateStm6000DpteInfoAjax()", ude);

			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", ude);

			return new ModelAndView("jsonView");
		}catch(Exception ex){
			Log.error("updateStm6000DpteInfoAjax()", ex);

			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.update"));
			return new ModelAndView("jsonView");
		}	
	}	
	
	
	
	@RequestMapping(value="/stm/stm6000/stm6000/deleteStm6000DeptInfoAjax.do")
	public ModelAndView deleteStm6000DeptInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			
    		paramMap.put("licGrpId", loginVO.getLicGrpId());
			
			
			Map<String, Object> delResultMap = stm6000Service.deleteStm6000DeptInfo(paramMap);
			
        	if("-1".equals(delResultMap.get("code"))) {
        		model.addAttribute("checkYn", "Y");
        		model.addAttribute("result", delResultMap);
        		return new ModelAndView("jsonView");
        	}
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
			
			return new ModelAndView("jsonView");
			
		}catch(Exception ex){
			Log.error("deleteStm6000DeptInfoAjax()", ex);

			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/stm/stm6000/stm6000/selectStm6000BeforeCmmDeptList.do")
	public ModelAndView selectStm6000BeforeCmmDeptList(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		try{			
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
    		List<Map> deptList = stm6000Service.selectStm6000BeforeCmmDeptList(paramMap);
    		model.addAttribute("deptList", deptList);
			
    		
    		model.addAttribute("errorYn", "N");
    		model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
    		
			return new ModelAndView("jsonView");
		}catch(Exception ex){
			Log.error("selectStm6000BeforeCmmDeptList()", ex);

			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/stm/stm6000/stm6000/selectStm6000ExistDeptChk.do")
	public ModelAndView selectStm6000ExistDeptChk(HttpServletRequest request, HttpServletResponse response, ModelMap model )	throws Exception {

		
		HashMap<String, String> chkMap = new HashMap<String, String>();
		try{

			
			Map param = RequestConvertor.requestParamToMap(request, true);

			
			String inDeptId = (String)param.get("inDeptId");
			param.put("deptId", inDeptId);

			int chkDeptId  = 0;
			
			
			chkDeptId = stm6000Service.selectStm6000ExistDeptChk(param);
			
			
			if( chkDeptId == 0) {
				
				chkMap.put("chkDeptId", "N");
			}else{
				chkMap.put("chkDeptId", "Y");
			}

			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView", chkMap);

		}catch(Exception e){
			Log.error("selectStm6000ExistDeptChk()", e);
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.save"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	
	@SuppressWarnings({ "rawtypes" })
	@RequestMapping(value="/stm/stm6000/stm6000/selectStm6000ExcelList.do")
	public ModelAndView selectStm6000ExcelList(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		Map paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);

		
		String strDeptId = egovMessageSource.getMessage("excel.deptId");			
		String strUpperDeptId = egovMessageSource.getMessage("excel.upperDeptId");	
		String strDeptName = egovMessageSource.getMessage("excel.deptName");		
		String strLvl = egovMessageSource.getMessage("excel.lvl");					
		String strOrd = egovMessageSource.getMessage("excel.ord");					
		String strDeptEtc = egovMessageSource.getMessage("excel.deptEtc");			
		
		SheetHeader header = new SheetHeader(new String[]{strDeptId, strUpperDeptId, strDeptName, strLvl, strOrd, strDeptEtc});
		
		
		List<Metadata> metadatas = new ArrayList<Metadata>(); 
		metadatas.add(new Metadata("deptId"));
		metadatas.add(new Metadata("upperDeptId"));
		metadatas.add(new Metadata("deptName"));
		metadatas.add(new Metadata("lvl"));		        
		metadatas.add(new Metadata("ord"));
		metadatas.add(new Metadata("deptEtc"));

		
		String browserType = ((String)paramMap.get("browserType")).toLowerCase();
		
		
		String excelNm = egovMessageSource.getMessage("excel.stm6000.sheetNm");
		
		
		if("edge".equals(browserType)){
			
			excelNm = URLEncoder.encode(excelNm, "UTF-8");
		}
		
		BigDataSheetWriter writer = new BigDataSheetWriter(excelNm, tempPath, excelNm, metadatas);

		writer.beginSheet();

		try{

			ExcelDataListResultHandler  resultHandler = new ExcelDataListResultHandler(writer.getXMLSheetWriter(), writer.getStyleMap(), header, metadatas);

			stm6000Service.selectStm6000ExcelList(paramMap,resultHandler);

		}
		catch(Exception ex){
			Log.error("selectStm6000ExcelList()", ex);
			throw new Exception(ex.getMessage());
		}finally{
			writer.endSheet();
		}

		return writer.getModelAndView();
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/stm/stm6000/stm6000/selectStm6000NormalDeptListAjax.do")
	public ModelAndView selectStm6000NormalDeptListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		
		try{			
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			String searchDeptNm = paramMap.get("searchDeptNm");
			
			
			List<Map> deptList = null;
			
			
			if(searchDeptNm != null && !"".equals(searchDeptNm)){
				
				deptList = (List)stm6000Service.selectStm6000NormalDeptList(paramMap);
			}
			
    		
			model.addAttribute("deptList", deptList);
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
    		
			return new ModelAndView("jsonView");
			
		}catch(Exception ex){
			Log.error("selectStm6000NormalDeptListAjax()", ex);

			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
}
