package kr.opensoftlab.lunaops.arm.arm1000.arm1000.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.service.FileVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.opensoftlab.lunaops.arm.arm1000.arm1000.service.Arm1000Service;
import kr.opensoftlab.lunaops.com.fms.web.service.FileMngService;
import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.lunaops.stm.stm3000.stm3000.service.Stm3000Service;
import kr.opensoftlab.sdf.util.OslStringUtil;
import kr.opensoftlab.sdf.util.PagingUtil;
import kr.opensoftlab.sdf.util.RequestConvertor;



@Controller
public class Arm1000Controller {

	
	private static final Logger Log = Logger.getLogger(Arm1000Controller.class);
	
	
    @Resource(name = "arm1000Service")
    private Arm1000Service arm1000Service;
    
    
	@Resource(name = "stm3000Service")
	private Stm3000Service stm3000Service;
    
    
    @Resource(name = "egovMessageSource")
    EgovMessageSource egovMessageSource;

	
   	@Resource(name="fileMngService")
   	private FileMngService fileMngService;
   	
   	
	@Resource(name="EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;
    
	
	@RequestMapping(value="/cmm/cmm10000/cmm16000/cmm16000View.do")
	public String selectArm1000AlarmListView(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
			return "/cmm/cmm10000/cmm16000/cmm16000";
	}

	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/cmm/cmm10000/cmm16000/selectArm1000AlarmListAjax.do")
	public ModelAndView selectArm1000AlarmListAjax(HttpServletRequest request, ModelMap model) throws Exception {
		try {
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			String licGrpId = ((LoginVO) ss.getAttribute("loginVO")).getLicGrpId();
			paramMap.put("licGrpId", licGrpId);
			
			String paramPrjGrpId = (String) paramMap.get("prjGrpId");
			
			
			if(paramPrjGrpId == null || "".equals(paramPrjGrpId)) {
				paramPrjGrpId = (String) ss.getAttribute("selPrjGrpId");
			}
			
			
			String paramPrjId = (String) paramMap.get("prjId");
			
			
			if(paramPrjId == null || "".equals(paramPrjId)) {
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
			
			
			String paramUsrId = (String) paramMap.get("usrId");
			
			
			if(paramUsrId == null || "".equals(paramUsrId)) {
				paramUsrId = ((LoginVO) ss.getAttribute("loginVO")).getUsrId();
			}
			
			paramMap.put("prjGrpId", paramPrjGrpId);
			paramMap.put("prjId", paramPrjId);
			paramMap.put("usrId", paramUsrId);
			
			
			String sortFieldId = (String) paramMap.get("sortFieldId");
			sortFieldId = OslStringUtil.replaceRegex(sortFieldId,"[^A-Za-z0-9+]*");
			String sortDirection = (String) paramMap.get("sortDirection");
			String paramSortFieldId = OslStringUtil.convertUnderScope(sortFieldId);
			paramMap.put("paramSortFieldId", paramSortFieldId);
			
			
			
			String _pageNo_str = paramMap.get("pagination[page]");
			String _pageSize_str = paramMap.get("pagination[perpage]");
			
			
			int totCnt = arm1000Service.selectArm1000AlarmListCnt(paramMap);
			
			
			PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(_pageNo_str, _pageSize_str);

			
			paginationInfo.setTotalRecordCount(totCnt);
			paramMap = PagingUtil.getPageSettingMap(paramMap, paginationInfo);
			
			
			Map<String, Object> metaMap = PagingUtil.getPageReturnMap(paginationInfo);
			
			
			List<Map> arm1000List = arm1000Service.selectArm1000AlarmList(paramMap);

			
			Map<String, String> notRead = new HashMap<String, String>();
			paramMap.put("notRead", "get");
			notRead.put("get", Integer.toString(arm1000Service.selectArm1000AlarmListCnt(paramMap)));
			
			paramMap.put("notRead", "send");
			notRead.put("send", Integer.toString(arm1000Service.selectArm1000AlarmListCnt(paramMap)));
			
			paramMap.put("notRead", "alone");
			notRead.put("alone", Integer.toString(arm1000Service.selectArm1000AlarmListCnt(paramMap)));
			
			
			metaMap.put("sort", sortDirection);
			metaMap.put("field", sortFieldId);
			
			
			model.addAttribute("data", arm1000List);
			model.addAttribute("meta", metaMap);
			model.addAttribute("notRead", notRead);

			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("selectArm1000AlarmListAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value = "/cmm/cmm10000/cmm16000/selectArm1000AlarmNotReadCntAjax.do")
	public ModelAndView selectArm1000AlarmNotReadCntAjax(HttpServletRequest request, ModelMap model) throws Exception {
		try {
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			String licGrpId = ((LoginVO) ss.getAttribute("loginVO")).getLicGrpId();
			paramMap.put("licGrpId", licGrpId);
			
			
			String paramPrjGrpId = (String) paramMap.get("prjGrpId");
			
			
			if(paramPrjGrpId == null || "".equals(paramPrjGrpId)) {
				paramPrjGrpId = (String) ss.getAttribute("selPrjGrpId");
			}
			
			
			String paramPrjId = (String) paramMap.get("prjId");
			
			
			if(paramPrjId == null || "".equals(paramPrjId)) {
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
			
			
			String paramUsrId = (String) paramMap.get("usrId");
			
			
			if(paramUsrId == null || "".equals(paramUsrId)) {
				paramUsrId = ((LoginVO) ss.getAttribute("loginVO")).getUsrId();
			}
			
			paramMap.put("prjGrpId", paramPrjGrpId);
			paramMap.put("prjId", paramPrjId);
			paramMap.put("usrId", paramUsrId);
			
			
			Map<String, Integer> allMessage = new HashMap<String, Integer>();
			
			paramMap.put("armMenuType", "get");
			allMessage.put("get",arm1000Service.selectArm1000AlarmListCnt(paramMap));
			
			paramMap.put("armMenuType", "send");
			allMessage.put("send",arm1000Service.selectArm1000AlarmListCnt(paramMap));
			
			paramMap.put("armMenuType", "alone");
			allMessage.put("alone",arm1000Service.selectArm1000AlarmListCnt(paramMap));

			
			Map<String, Integer> notRead = new HashMap<String, Integer>();
			
			paramMap.put("notRead", "Y");
			
			
			paramMap.put("armMenuType", "get");
			notRead.put("get",arm1000Service.selectArm1000AlarmListCnt(paramMap));
			
			paramMap.put("armMenuType", "alone");
			notRead.put("alone", arm1000Service.selectArm1000AlarmListCnt(paramMap));
			
			model.addAttribute("allMessage", allMessage);
			model.addAttribute("notRead", notRead);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("selectArm1000AlarmNotReadCntAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/cmm/cmm10000/cmm16000/insertCmm16001View.do")
	public String insertCmm16001View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
			return "/cmm/cmm10000/cmm16000/cmm16001";
	}


	
	@SuppressWarnings({ "rawtypes" })
	@RequestMapping(value = "/cmm/cmm10000/cmm16000/selectArm1000AlarmUsrListAjax.do")
	public ModelAndView selectArm1000AlarmUsrListAjax(HttpServletRequest request, ModelMap model) throws Exception {
		try {
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			
			String paramPrjGrpId = (String) paramMap.get("prjGrpId");
			
			
			if(paramPrjGrpId == null || "".equals(paramPrjGrpId)) {
				paramPrjGrpId = (String) ss.getAttribute("selPrjGrpId");
			}
			
			
			String paramPrjId = (String) paramMap.get("prjId");
			
			
			if(paramPrjId == null || "".equals(paramPrjId)) {
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}

			paramMap.put("prjGrpId", paramPrjGrpId);
			paramMap.put("prjId", paramPrjId);
			paramMap.put("useCd", "01");
			
			int totCnt = stm3000Service.selectStm3000UsrListCnt(paramMap);
			
			paramMap.put("firstIndex", "0");
			paramMap.put("lastIndex", Integer.toString(totCnt));

			
			List<Map> usrAllList = stm3000Service.selectStm3000UsrList(paramMap);
			
			
			model.addAttribute("usrAllList", usrAllList);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("selectArm1000AlarmUsrListAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/cmm/cmm10000/cmm16000/insertArm1000AlarmAtchFileInfo.do")
	public ModelAndView insertArm1000AlarmAtchFileInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			MultipartHttpServletRequest mptRequest = (MultipartHttpServletRequest)request;
			
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			
			String paramPrjGrpId = (String) paramMap.get("prjGrpId");
			
			
			if(paramPrjGrpId == null || "".equals(paramPrjGrpId)) {
				paramPrjGrpId = (String) ss.getAttribute("selPrjGrpId");
			}
			
			
			String paramPrjId = (String) paramMap.get("prjId");
			
			
			if(paramPrjId == null || "".equals(paramPrjId)) {
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
			
			paramMap.put("prjGrpId", paramPrjGrpId);
			paramMap.put("prjId", paramPrjId);
			
			String atchFileId = (String) paramMap.get("atchFileId");
			String fileSn = (String) paramMap.get("fileSn");
			
			
			List<FileVO> _result = fileUtil.fileUploadInsert(mptRequest, atchFileId, Integer.parseInt(fileSn), "Arm");
			
			
			fileMngService.insertFileDetail(_result);  
			
			
			
			model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("insertArm1000AlarmAtchFileInfo()", ex);

			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/cmm/cmm10000/cmm16000/insertArm1000AlarmInfoAjax.do")
	public ModelAndView insertArm1000AlarmInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			String licGrpId = ((LoginVO) ss.getAttribute("loginVO")).getLicGrpId();
			paramMap.put("licGrpId", licGrpId);
			
			String paramPrjGrpId = (String) paramMap.get("prjGrpId");
			
			
			if(paramPrjGrpId == null || "".equals(paramPrjGrpId)) {
				paramPrjGrpId = (String) ss.getAttribute("selPrjGrpId");
			}
			
			
			String paramPrjId = (String) paramMap.get("prjId");
			
			
			if(paramPrjId == null || "".equals(paramPrjId)) {
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
			
			
			String paramUsrId = (String) paramMap.get("usrId");
			
			
			if(paramUsrId == null || "".equals(paramUsrId)) {
				paramUsrId = ((LoginVO) ss.getAttribute("loginVO")).getUsrId();
			}
			
			paramMap.put("prjGrpId", paramPrjGrpId);
			paramMap.put("prjId", paramPrjId);
			paramMap.put("usrId", paramUsrId);
			
			
			arm1000Service.insertArm1000AlarmInfo(paramMap);

			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("insertArm1000AlarmInfoAjax()", ex);

			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/cmm/cmm10000/cmm16000/selectCmm16002View.do")
	public String selectCmm16002View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			String fileSumMaxSize = EgovProperties.getProperty("Globals.lunaops.fileSumMaxSize");
			model.addAttribute("fileSumMaxSize",fileSumMaxSize);
			model.addAttribute("type",paramMap.get("type"));
			
			return "/cmm/cmm10000/cmm16000/cmm16002";
		}
		catch(Exception ex){
			Log.error("selectCmm16002View()", ex);
			throw new Exception(ex.getMessage());
		}
	}
	
	
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/cmm/cmm10000/cmm16000/selectArm1000AlarmInfoAjax.do")
	public ModelAndView selectArm1000AlarmInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			String licGrpId = ((LoginVO) ss.getAttribute("loginVO")).getLicGrpId();
			paramMap.put("licGrpId", licGrpId);
			
			String paramPrjGrpId = (String) paramMap.get("prjGrpId");
			
			
			if(paramPrjGrpId == null || "".equals(paramPrjGrpId)) {
				paramPrjGrpId = (String) ss.getAttribute("selPrjGrpId");
			}
			
			
			String paramPrjId = (String) paramMap.get("prjId");
			
			
			if(paramPrjId == null || "".equals(paramPrjId)) {
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
			
			paramMap.put("prjGrpId", paramPrjGrpId);
			paramMap.put("prjId", paramPrjId);
			
			
			
			Map arm1000Info = arm1000Service.selectArm1000AlarmInfo(paramMap);
			model.addAttribute("arm1000Info", arm1000Info);
			
			
			List<FileVO> fileList = null;
        	int fileCnt = 0;
        	
        	if(arm1000Info != null){
        		
            	FileVO fileVO = new FileVO();
	        	fileVO.setAtchFileId((String)arm1000Info.get("atchFileId"));
	        	
	        	
				fileList = fileMngService.fileDownList(fileVO);
				
				
				for(FileVO temp : fileList){
					if(fileCnt < Integer.parseInt(temp.getFileSn())){
						fileCnt = Integer.parseInt(temp.getFileSn());
					}
				}
        	}else {
        		model.addAttribute("errorYn", "Y");
            	model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
        	}
			model.addAttribute("fileList",fileList);
			model.addAttribute("fileListCnt",fileCnt);

			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectArm1000AlarmInfoAjax()", ex);

			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	

	
	@RequestMapping(value="/cmm/cmm10000/cmm16000/updateArm1000AlarmInfoAjax.do")
	public ModelAndView updateArm1000AlarmInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			String licGrpId = ((LoginVO) ss.getAttribute("loginVO")).getLicGrpId();
			paramMap.put("licGrpId", licGrpId);
									
			
			String paramPrjGrpId = (String) paramMap.get("prjGrpId");
			
			
			if(paramPrjGrpId == null || "".equals(paramPrjGrpId)) {
				paramPrjGrpId = (String) ss.getAttribute("selPrjGrpId");
			}
			
			
			String paramPrjId = (String) paramMap.get("prjId");
			
			
			if(paramPrjId == null || "".equals(paramPrjId)) {
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
			
			paramMap.put("prjGrpId", paramPrjGrpId);
			paramMap.put("prjId", paramPrjId);
			
			
			
			arm1000Service.updateArm1000AlarmInfo(paramMap);

			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("updateArm1000AlarmInfoAjax()", ex);

			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.update"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/cmm/cmm10000/cmm16000/deleteArm1000AlarmInfoAjax.do")
	public ModelAndView deleteArm1000AlarmInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			String licGrpId = ((LoginVO) ss.getAttribute("loginVO")).getLicGrpId();
			paramMap.put("licGrpId", licGrpId);
			
			String paramPrjGrpId = (String) paramMap.get("prjGrpId");
			
			
			if(paramPrjGrpId == null || "".equals(paramPrjGrpId)) {
				paramPrjGrpId = (String) ss.getAttribute("selPrjGrpId");
			}
			
			
			String paramPrjId = (String) paramMap.get("prjId");
			
			
			if(paramPrjId == null || "".equals(paramPrjId)) {
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
			
			paramMap.put("prjGrpId", paramPrjGrpId);
			paramMap.put("prjId", paramPrjId);
			
			
			
			arm1000Service.deleteArm1000AlarmInfo(paramMap);

			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("deleteArm1000AlarmInfoAjax()", ex);

			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
			return new ModelAndView("jsonView");
		}
	}
}
