package kr.opensoftlab.lunaops.bad.bad1000.bad1000.web;

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
import egovframework.com.cmm.service.FileVO;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.opensoftlab.lunaops.bad.bad1000.bad1000.service.Bad1000Service;
import kr.opensoftlab.lunaops.com.fms.web.service.FileMngService;
import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.lunaops.stm.stm2000.stm2100.service.Stm2100Service;
import kr.opensoftlab.sdf.util.PagingUtil;
import kr.opensoftlab.sdf.util.RequestConvertor;




@Controller
public class Bad1000Controller {


	
	private static final Logger Log = Logger.getLogger(Bad1000Controller.class);

	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	
	@Resource(name = "bad1000Service")
	private Bad1000Service bad1000Service;

	
	@Resource(name = "stm2100Service")
	private Stm2100Service stm2100Service;
	
	
   	@Resource(name="fileMngService")
   	private FileMngService fileMngService;
   	
   	
	@Resource(name="EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;
	
	
	@RequestMapping(value="/bad/bad1000/bad1000/selectBad1000View.do")
	public String selectBad1000View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
			return "/bad/bad1000/bad1000/bad1000";
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	@RequestMapping(value = "/bad/bad1000/bad1000/selectBad1000DsTypeGetAjax.do")
	public ModelAndView selectBad1000DsTypeGetAjax(HttpServletRequest request, ModelMap model) throws Exception {
		try {
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);

			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			paramMap.put("prjGrpId", (String) ss.getAttribute("selPrjGrpId"));
			paramMap.put("prjId", (String) ss.getAttribute("selPrjId"));
			paramMap.put("menuId", (String) ss.getAttribute("selMenuId"));
			
			
			Map stmInfo = stm2100Service.selectStm2100BadInfo(paramMap);

			
			model.addAttribute("menuId", paramMap.get("menuId"));
			model.addAttribute("stmInfo", stmInfo);
			
			return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("selectBad1000DsTypeGetAjax()", ex);

			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/bad/bad1000/bad1000/selectBad1000ListAjax.do")
	public ModelAndView selectBad1000ListAjax(HttpServletRequest request, ModelMap model) throws Exception {
		try {
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);

			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			paramMap.put("prjGrpId", (String) ss.getAttribute("selPrjGrpId"));
			paramMap.put("prjId", (String) ss.getAttribute("selPrjId"));
			
			
			if("tagNm".equals(paramMap.get("searchTargetId"))) {
				
				paramMap.put("searchTargetId", paramMap.get("searchTargetId").replace("#", ""));
			}
			
			
			
			String _pageNo_str = paramMap.get("pagination[page]");
			String _pageSize_str = paramMap.get("pagination[perpage]");
			
			
			int totCnt = bad1000Service.selectBad1000BadListCnt(paramMap);
			
			
			PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(_pageNo_str, _pageSize_str);

			
			paginationInfo.setTotalRecordCount(totCnt);
			paramMap = PagingUtil.getPageSettingMap(paramMap, paginationInfo);
			
			
			Map<String, Integer> pageMap = PagingUtil.getPageReturnMap(paginationInfo);
			
			
			List<Map> bad1000List = bad1000Service.selectBad1000BadList(paramMap);
			
			if("03".equals(paramMap.get("stmTypeCode")) || "04".equals(paramMap.get("stmTypecode"))) {
				
				List<Map> bad1006BadTagList = bad1000Service.selectBad1000BadListTagList(paramMap);

				if(bad1006BadTagList != null) {
					model.addAttribute("bad1006Tags", bad1006BadTagList);
				}
			}

			
			model.addAttribute("data", bad1000List);
			model.addAttribute("meta", pageMap);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

			return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("selectBad1000ListAjax()", ex);

			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/bad/bad1000/bad1000/selectBad1004PwView.do")
	public String selectBad1004PwView(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/bad/bad1000/bad1000/bad1004";
	}
	
	
	@RequestMapping(value = "/bad/bad1000/bad1000/selectBad1004PwInfoAjax.do")
	public ModelAndView selectBad1004PwInfoAjax(HttpServletRequest request, ModelMap model) throws Exception {
		try {
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);

			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			paramMap.put("prjGrpId", (String) ss.getAttribute("selPrjGrpId"));
			paramMap.put("prjId", loginVO.getPrjId());
			
			
			String resultPwCheck = bad1000Service.selectBad1000BadPwInfo(paramMap);
			
			model.addAttribute("resultPwCheck", resultPwCheck);
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

			return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("selectBad1004PwInfoAjax()", ex);

			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/bad/bad1000/bad1000/selectBad1001View.do")
	public String selectBad1001View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/bad/bad1000/bad1000/bad1001";
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	@RequestMapping(value = "/bad/bad1000/bad1000/selectBad1001InfoAjax.do")
	public ModelAndView selectBad1001InfoAjax(HttpServletRequest request, ModelMap model) throws Exception {
		try {
	
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);

			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			paramMap.put("prjGrpId", (String) ss.getAttribute("selPrjGrpId"));
			paramMap.put("prjId", (String) ss.getAttribute("selPrjId"));
			
			
			
			
			
			Map bad1001Info = bad1000Service.selectBad1000BadInfo(paramMap);

			
			
			List<FileVO> fileList = null;
			
			int fileCnt = 0;
			
			if(bad1001Info.get("atchFileId") != null){
				
				FileVO fileVO = new FileVO();
				fileVO.setAtchFileId((String) bad1001Info.get("atchFileId"));
				
				
				fileList = fileMngService.fileDownList(fileVO);
				
				
				for(FileVO temp : fileList){
					if(fileCnt < Integer.parseInt(temp.getFileSn())){
						fileCnt = Integer.parseInt(temp.getFileSn());
					}
				}
			}
			
			
			List<String> bad1001TagList = bad1000Service.selectBad1000BadTagList(paramMap);

			
			model.addAttribute("bad1001Info", bad1001Info);
			if(fileList != null) {
				model.addAttribute("bad1001FileList", fileList);
				model.addAttribute("bad1001FileListCnt", fileCnt);
			}
			if(bad1001TagList != null) {
				model.addAttribute("bad1001Tag", bad1001TagList);
			}
			
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

			return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("selectBad1000ListAjax()", ex);

			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/bad/bad1000/bad1000/insertBad1002View.do")
	public String insertBad1002View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/bad/bad1000/bad1000/bad1002";
	}
	
	
	@RequestMapping(value = "/bad/bad1000/bad1000/insertBad1002InfoAjax.do")
	public ModelAndView insertBad1002InfoAjax(HttpServletRequest request, ModelMap model) throws Exception {
		try {
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);

			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("prjGrpId", (String) ss.getAttribute("selPrjGrpId"));
			paramMap.put("prjId", (String) ss.getAttribute("selPrjId"));
			paramMap.put("licGrpId", loginVO.getLicGrpId());
	
			
			Map<String, String> stm2100Info = stm2100Service.selectStm2100BadInfo(paramMap);
			
			model.addAttribute("badInfo", stm2100Info); 
						
			
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
	
			return new ModelAndView("jsonView");
		} catch (Exception ex) {
			Log.error("selectBad1000ListAjax()", ex);

			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/bad/bad1000/bad1000/insertBad1002BadAtchFileInfo.do")
	public ModelAndView insertBad1002BadAtchFileInfo(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			MultipartHttpServletRequest mptRequest = (MultipartHttpServletRequest)request;
			
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			String atchFileId = (String) paramMap.get("atchFileId");
			String fileSn = (String) paramMap.get("fileSn");
			
			
			List<FileVO> _result = fileUtil.fileUploadInsert(mptRequest,atchFileId,Integer.parseInt(fileSn),"Req");
			
			
			fileMngService.insertFileDetail(_result);  
			
			
			
			model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("insertBad1002BadAtchFileInfo()", ex);

			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/bad/bad1000/bad1000/insertBad1002BadInfoAjax.do")
	public ModelAndView insertBad1002BadInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			paramMap.put("prjGrpId", (String) ss.getAttribute("selPrjGrpId"));
			paramMap.put("prjId", (String) ss.getAttribute("selPrjId"));
			paramMap.put("usrId", loginVO.getUsrId());
			
			
			
			bad1000Service.insertBad1000Badinfo(paramMap);
			
			
			model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("insertBad1002BadInfoAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/bad/bad1000/bad1000/updateBad1003View.do")
	public String updateBad1003View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/bad/bad1000/bad1000/bad1003";
	}
	
	
	@RequestMapping(value="/bad/bad1000/bad1000/updateBad1003BadInfoAjax.do")
	public ModelAndView updateBad1003BadInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);

			
			bad1000Service.updateBad1000BadInfo(paramMap);
			
			
			model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("updateBad1003BadInfoAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.update"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/bad/bad1000/bad1000/deleteBad1000View.do")
	public String deleteBad1001PwView(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/bad/bad1000/bad1000/bad1005";
	}
	
	
	@RequestMapping(value="/bad/bad1000/bad1000/deleteBad1000BadListAjax.do")
	public ModelAndView deleteBad1000BadListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			
			
			bad1000Service.deleteBad1000BadList(paramMap);
			
			
			model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("deleteBad1000BadInfoAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
			return new ModelAndView("jsonView");
		}
	}
	
	
	@RequestMapping(value="/bad/bad1000/bad1000/updateBad1001BadRestoreAjax.do")
	public ModelAndView updateBad1001BadRestoreAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			



			
			
			bad1000Service.updateBad1000BadRestore(paramMap);
			
			
			model.addAttribute("message", egovMessageSource.getMessage("bad1000.success.bad.restore"));
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("updateBad1001BadRestoreAjax()", ex);
			
			
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("bad1000.fail.bad.restore"));
			return new ModelAndView("jsonView");
		}
	}
	
	@RequestMapping(value="/bad/bad1000/bad1000/selectBad1006View.do")
	public String selectBad1006View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
			return "/bad/bad1000/bad1000/bad1006";
	}
	
	
	@RequestMapping(value="/bad/bad1000/bad1000/selectBad1007View.do")
	public String selectBad1007View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/bad/bad1000/bad1000/bad1007";
	}
	
	
	@RequestMapping(value="/bad/bad1000/bad1000/insertBad1008View.do")
	public String insertBad1008View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/bad/bad1000/bad1000/bad1008";
	}
	
	
	
	@RequestMapping(value="/bad/bad1000/bad1000/updateBad1009View.do")
	public String updateBad1009View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/bad/bad1000/bad1000/bad1009";
	}
	
	
	@RequestMapping(value="/bad/bad1000/bad1000/selectBad1010View.do")
	public String selectBad1010View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/bad/bad1000/bad1000/bad1010";
	}
	
	
}
