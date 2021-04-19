package kr.opensoftlab.lunaops.stm.stm8000.stm8000.web;

import java.util.ArrayList;
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
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.lunaops.stm.stm8000.stm8000.service.Stm8000Service;
import kr.opensoftlab.sdf.util.OslStringUtil;
import kr.opensoftlab.sdf.util.PagingUtil;
import kr.opensoftlab.sdf.util.RequestConvertor;

/**
 * @Class Name : Stm8000Controller.java
 * @Description : Stm8000Controller Controller class
 * @Modification Information
 *
 * @author 안지혜
 * @since 2020.10.21
 * @version 1.0
 * @see
 *  
 *  Copyright (C)  All right reserved.
 */

@Controller
public class Stm8000Controller {

	/** 로그4j 로거 로딩 */
	private static final Logger Log = Logger.getLogger(Stm8000Controller.class);

	/** EgovMessageSource */
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	/** Stm8000Service DI */
	@Resource(name = "stm8000Service")
	private Stm8000Service stm8000Service;
	
	
	/**
	 * Stm8000 소스 저장소 목록
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @exception Exception
	 * @author 안지혜
	 * @since 2020.10.21
	 */
	@RequestMapping(value="/stm/stm8000/stm8000/selectStm8000View.do")
	public String selectStm8000View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		return "/stm/stm8000/stm8000/stm8000";
	}
	
	/**
	 * Stm8000 목록 Ajax 조회
	 * 
	 * @throws Exception
	 * @author 안지혜
	 * @since 2020.10.21.
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/stm/stm8000/stm8000/selectStm8000ListAjax.do")
	public ModelAndView selectStm8000ListAjax( HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			// request 파라미터를 map으로 변환
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);

			// 세션에서 필요 정보 가져오기
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			
			//정렬 Key있는경우 underScope로 변경
			String sortFieldId = (String) paramMap.get("sortFieldId");
			sortFieldId = OslStringUtil.replaceRegex(sortFieldId,"[^A-Za-z0-9+]*");
			String sortDirection = (String) paramMap.get("sortDirection");
			String paramSortFieldId = OslStringUtil.convertUnderScope(sortFieldId);
			paramMap.put("paramSortFieldId", paramSortFieldId);
			
			// 페이지 정보 세팅
			// 현재 페이지 값, 보여지는 개체 수, 전체 데이터 건수
			String _pageNo_str = paramMap.get("pagination[page]");
			String _pageSize_str = paramMap.get("pagination[perpage]");
			
			// 총 데이터 개수
			int totCnt = stm8000Service.selectStm8000ServerListCnt(paramMap);

			// 페이지 사이즈
			PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(_pageNo_str, _pageSize_str);

			// 총 페이지 개수
			paginationInfo.setTotalRecordCount(totCnt);
			paramMap = PagingUtil.getPageSettingMap(paramMap, paginationInfo);
			
			// 페이지 정보 세팅
			Map<String, Object> metaMap = PagingUtil.getPageReturnMap(paginationInfo);
						
			// 소스 저장소 목록 가져오기
			List<Map> stm8000List = stm8000Service.selectStm8000ServerList(paramMap);
			
			//sort 정보
			metaMap.put("sort", sortDirection);
			metaMap.put("field", sortFieldId);
			
			// 페이지 세팅하기
			model.addAttribute("data", stm8000List);
			model.addAttribute("meta", metaMap);

			// 조회성공 여부 및 조회 성공메시지 세팅
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectStm8000ListAjax()", ex);
			// 조회 실패여부 및 실패메시지 세팅
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	/**
	 * Stm8000 접속 확인 Ajax 조회
	 * 
	 * @throws Exception
	 * @author 안지혜
	 * @since 2020.10.29.
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value="/stm/stm8000/stm8000/selectStm8000RepoConnectCheckAjax.do")
	public ModelAndView selectStm8000RepoConnectCheckAjax( HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			// request 파라미터를 map으로 변환
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			// 세션에서 필요 정보 가져오기
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			
			//연결 확인 서비스 호출
			String connectResult = stm8000Service.selectStm8000SvnConnectCheck(paramMap);
			model.addAttribute("connectResult", connectResult);
			
			//결과값이 비어있는 경우
			if(connectResult.isEmpty()) {
				model.addAttribute("errorYn", "Y");
				model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			}else {
				// 조회성공 여부 및 조회 성공메시지 세팅
				model.addAttribute("errorYn", "N");
				model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			}
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectStm8000RepoConnectCheckAjax()", ex);
			// 조회 실패여부 및 실패메시지 세팅
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	/**
	 * stm8000 소스 저장소 등록/수정 화면
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @exception Exception
	 * @author 안지혜
	 * @since 2020.10.21
	 */
	@RequestMapping(value="/stm/stm8000/stm8000/selectStm8001View.do")
	public String selectStm8001View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
			return "/stm/stm8000/stm8000/stm8001";
	}

	/**
	 * stm8000 소스 저장소 상세 조회 화면
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @exception Exception
	 * @author 안지혜
	 * @since 2020.10.21
	 */
	@RequestMapping(value="/stm/stm8000/stm8000/selectStm8002View.do")
	public String selectStm8002View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
			return "/stm/stm8000/stm8000/stm8002";
	}
	
	/**
	 * stm8000 소스 저장소 단건 등록 AJAX
	 * @param 
	 * @return 
	 * @exception Exception
	 */
	@RequestMapping(value="/stm/stm8000/stm8000/insertStm8000ServerInfoAjax.do")
	public ModelAndView insertStm8000ServerInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			// request 파라미터를 map으로 변환
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			// 세션에서 필요한 정보 가져오기
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());

			// 소스 저장소 정보 등록
			stm8000Service.insertStm8000ServerInfo(paramMap);

			//등록 성공 메시지 세팅
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));

			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("insertStm8000ServerInfoAjax()", ex);

			//조회실패 메시지 세팅 및 저장 성공여부 세팅
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
			return new ModelAndView("jsonView");
		}
	}
	
	/**
	 * stm8000 소스 저장소 상세 조회 AJAX
	 * @param 
	 * @return 
	 * @exception Exception
	 */
	@SuppressWarnings("rawtypes")
	@RequestMapping(value="/stm/stm8000/stm8000/selectStm8000ServerInfoAjax.do")
	public ModelAndView selectStm8000ServerInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			// request 파라미터를 map으로 변환
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			// 세션에서 필요한 정보 가져오기
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			
			// 소스 저장소 정보 상세 조회
			Map repInfo = stm8000Service.selectStm8000ServerInfo(paramMap);
			
			model.addAttribute("repInfo",repInfo);
			
			//등록 성공 메시지 세팅
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectStm8000ServerInfoAjax()", ex);
			
			//조회실패 메시지 세팅 및 저장 성공여부 세팅
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	/**
	 * stm8000 소스 저장소 수정 AJAX
	 * @param 
	 * @return 
	 * @exception Exception
	 */
	@RequestMapping(value="/stm/stm8000/stm8000/updateStm8000ServerInfoAjax.do")
	public ModelAndView updateStm8000ServerInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			// request 파라미터를 map으로 변환
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			// 세션에서 필요한 정보 가져오기
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			
			// 소스 저장소 정보 수정
			stm8000Service.updateStm8000ServerInfo(paramMap);
			
			//등록 성공 메시지 세팅
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.update"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("updateStm8000ServerInfoAjax()", ex);
			
			//조회실패 메시지 세팅 및 저장 성공여부 세팅
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.update"));
			return new ModelAndView("jsonView");
		}
	}
	
	/**
	 * stm8000 소스 저장소 삭제 AJAX
	 * @param 
	 * @return 
	 * @exception Exception
	 */
	@RequestMapping(value="/stm/stm8000/stm8000/deleteStm8000ServerInfoAjax.do")
	public ModelAndView deleteStm8000ServerInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			// request 파라미터를 map으로 변환
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			// 세션에서 필요한 정보 가져오기
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			
			// 소스 저장소 정보 삭제
			stm8000Service.deleteStm8000ServerInfo(paramMap);
			
			//등록 성공 메시지 세팅
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.delete"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("deleteStm8000ServerInfoAjax()", ex);
			
			//조회실패 메시지 세팅 및 저장 성공여부 세팅
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.delete"));
			return new ModelAndView("jsonView");
		}
	}
	
	/**
	 * stm8000 소스 저장소 리비전 확인 AJAX
	 * @param 
	 * @return 
	 * @exception Exception
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/stm/stm8000/stm8000/selectStm8000RevisionListAjax.do")
	public ModelAndView selectStm8000RevisionListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			// request 파라미터를 map으로 변환
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			// 세션에서 필요한 정보 가져오기
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			
			// 페이지 정보 세팅
			// 현재 페이지 값, 보여지는 개체 수, 전체 데이터 건수
			String _pageNo_str = paramMap.get("pagination[page]");
			String _pageSize_str = paramMap.get("pagination[perpage]");
			
			// 소스 저장소 리비전 조회
			List<Map> list = stm8000Service.selectStm8000RevisionList(paramMap);
			
			// 총 데이터 개수
			int totCnt = Integer.parseInt((String) list.get(0).get("totalCnt"));
			//리비전 범위
			long searchStNum = (long)list.get(0).get("searchStNum");
			long searchEdNum = (long)list.get(0).get("searchEdNum");
			
			//목록만 남기기
			list.remove(0);

			// 페이지 사이즈
			PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(_pageNo_str, _pageSize_str);

			// 총 페이지 개수
			paginationInfo.setTotalRecordCount(totCnt);
			paramMap = PagingUtil.getPageSettingMap(paramMap, paginationInfo);
			
			// 페이지 정보 세팅
			Map<String, Object> metaMap = PagingUtil.getPageReturnMap(paginationInfo);
			
			if(searchStNum < searchEdNum) {
				metaMap.put("searchStNum", searchStNum);
				metaMap.put("searchEdNum", searchEdNum);
			}else {
				metaMap.put("searchStNum", searchEdNum);
				metaMap.put("searchEdNum", searchStNum);
			}
			
			model.addAttribute("data", list);
			model.addAttribute("meta", metaMap);
			
			//등록 성공 메시지 세팅
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectStm8000RevisionListAjax()", ex);
			
			//조회실패 메시지 세팅 및 저장 성공여부 세팅
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	/**
	 * stm8000 소스 저장소 리비전 트리구조 확인 AJAX - 폴더
	 * @param 
	 * @return 
	 * @exception Exception
	 */
	@SuppressWarnings({ "rawtypes"})
	@RequestMapping(value="/stm/stm8000/stm8000/selectStm8000DirListAjax.do")
	public ModelAndView selectStm8000DirListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			// request 파라미터를 map으로 변환
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			List<Map> list = new ArrayList<Map>();
			
			// 세션에서 필요한 정보 가져오기
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			
			//파라미터값으로 넘어온 prjGrpId
			String paramPrjGrpId = (String) paramMap.get("prjGrpId");
			
			//prjId 없는 경우 세션 prjId 세팅
			if(paramPrjGrpId == null || "".equals(paramPrjGrpId)) {
				paramPrjGrpId = (String) ss.getAttribute("selPrjGrpId");
			}
			
			//파라미터값으로 넘어온 prjId
			String paramPrjId = (String) paramMap.get("prjId");
			
			//prjId 없는 경우 세션 prjId 세팅
			if(paramPrjId == null || "".equals(paramPrjId)) {
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
			
			paramMap.put("prjGrpId", paramPrjGrpId);
			paramMap.put("prjId", paramPrjId);
			
			//키 값이 존재할 때
			if(paramMap.containsKey("revision")==true && paramMap.containsKey("strgRepId")==true) {
				if(!paramMap.get("revision").isEmpty() && !paramMap.get("strgRepId").isEmpty()){
					list = stm8000Service.selectStm8000FileDirList(paramMap);
				}
			}
			
			model.addAttribute("list", list); //트리에서 사용
			
			//등록 성공 메시지 세팅
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectStm8000DirListAjax()", ex);
			
			//조회실패 메시지 세팅 및 저장 성공여부 세팅
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	/**
	 * stm8000 소스 저장소 리비전 트리구조 확인 AJAX - 파일
	 * @param 
	 * @return 
	 * @exception Exception
	 */
	@SuppressWarnings({ "rawtypes", "unchecked"})
	@RequestMapping(value="/stm/stm8000/stm8000/selectStm8000FileListAjax.do")
	public ModelAndView selectStm8000FileListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			// request 파라미터를 map으로 변환
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			List<Map> list = new ArrayList<Map>();
			
			// 세션에서 필요한 정보 가져오기
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			
			//파라미터값으로 넘어온 prjGrpId
			String paramPrjGrpId = (String) paramMap.get("prjGrpId");
			
			//prjId 없는 경우 세션 prjId 세팅
			if(paramPrjGrpId == null || "".equals(paramPrjGrpId)) {
				paramPrjGrpId = (String) ss.getAttribute("selPrjGrpId");
			}
			
			//파라미터값으로 넘어온 prjId
			String paramPrjId = (String) paramMap.get("prjId");
			
			//prjId 없는 경우 세션 prjId 세팅
			if(paramPrjId == null || "".equals(paramPrjId)) {
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
			
			paramMap.put("prjGrpId", paramPrjGrpId);
			paramMap.put("prjId", paramPrjId);
			
			// 페이지 정보 세팅
			// 현재 페이지 값, 보여지는 개체 수, 전체 데이터 건수
			String _pageNo_str = paramMap.get("pagination[page]");
			String _pageSize_str = paramMap.get("pagination[perpage]");
			
			// 페이지 사이즈
			PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(_pageNo_str, _pageSize_str);
			
			// 총 데이터 개수 - 파일
			int totCnt = 0;
			
			//키 값이 존재할 때
			if(paramMap.containsKey("revision")==true && paramMap.containsKey("strgRepId")==true) {
				if(!paramMap.get("revision").isEmpty() && !paramMap.get("strgRepId").isEmpty()){
					list = stm8000Service.selectStm8000FileDirList(paramMap);
					totCnt = list.size();
				}
			}
			
			// 총 페이지 개수
			paginationInfo.setTotalRecordCount(totCnt);
			
			paramMap = PagingUtil.getPageSettingMap(paramMap, paginationInfo);

			
			// 페이지 정보 세팅
			Map<String, Object> metaMap = PagingUtil.getPageReturnMap(paginationInfo);
			
			//sort 정보
			//정렬 Key있는경우 underScope로 변경
			String sortFieldId = (String) paramMap.get("sortFieldId");
			String sortDirection = (String) paramMap.get("sortDirection");
			
			metaMap.put("sort", sortDirection);
			metaMap.put("field", sortFieldId);
			
			//sort 정보에 따라 정렬
			model.addAttribute("data", list); //파일 데이터테이블에서 사용
			
			model.addAttribute("meta", metaMap);
			
			//등록 성공 메시지 세팅
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectStm8000FileListAjax()", ex);
			
			//조회실패 메시지 세팅 및 저장 성공여부 세팅
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	/**
	 * stm8000 리비전 소스파일 상세보기
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @exception Exception
	 * @author 안지혜
	 * @since 2020.10.27
	 */
	@RequestMapping(value="/stm/smt8000/stm8000/selectStm8003View.do")
	public String selectStm8003View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
			return "/stm/stm8000/stm8000/stm8003";
	}
	
	/**
	 * stm8000 리비전 소스파일 상세보기 AJAX
	 * @param 
	 * @return 
	 * @exception Exception
	 */
	@RequestMapping(value="/stm/stm8000/stm8000/selectStm8000RevisionFileInfoAjax.do")
	public ModelAndView selectStm8000RevisionFileInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			// request 파라미터를 map으로 변환
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			// 세션에서 필요한 정보 가져오기
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());

			//파라미터값으로 넘어온 prjGrpId
			String paramPrjGrpId = (String) paramMap.get("prjGrpId");
			
			//prjId 없는 경우 세션 prjId 세팅
			if(paramPrjGrpId == null || "".equals(paramPrjGrpId)) {
				paramPrjGrpId = (String) ss.getAttribute("selPrjGrpId");
			}
			
			//파라미터값으로 넘어온 prjId
			String paramPrjId = (String) paramMap.get("prjId");
			
			//prjId 없는 경우 세션 prjId 세팅
			if(paramPrjId == null || "".equals(paramPrjId)) {
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
			
			paramMap.put("prjGrpId", paramPrjGrpId);
			paramMap.put("prjId", paramPrjId);
			
			// 리비전 파일 소스 보기
			String contentInfo = stm8000Service.selectStm8000RevisionFileInfo(paramMap);
			model.addAttribute("contentInfo", contentInfo);
			
			//등록 성공 메시지 세팅
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("deleteStm8000ServerInfoAjax()", ex);
			
			//조회실패 메시지 세팅 및 저장 성공여부 세팅
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	/**
	 * stm8000 리비전 소스파일 목록 확인창
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @exception Exception
	 * @author 안지혜
	 * @since 2020.10.28
	 */
	@RequestMapping(value="/stm/stm8000/stm8000/selectStm8004View.do")
	public String selectStm8004View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
			return "/stm/stm8000/stm8000/stm8004";
	}
	
	/**
	 * stm8000 리비전 소스파일 DIFF 리스트 AJAX
	 * @param 
	 * @return 
	 * @exception Exception
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/stm/stm8000/stm8000/selectStm8000FileRevisionListAjax.do")
	public ModelAndView selectStm8000FileRevisionListAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			// request 파라미터를 map으로 변환
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			// 세션에서 필요한 정보 가져오기
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			
			//파라미터값으로 넘어온 prjGrpId
			String paramPrjGrpId = (String) paramMap.get("prjGrpId");
			
			//prjId 없는 경우 세션 prjId 세팅
			if(paramPrjGrpId == null || "".equals(paramPrjGrpId)) {
				paramPrjGrpId = (String) ss.getAttribute("selPrjGrpId");
			}
			
			//파라미터값으로 넘어온 prjId
			String paramPrjId = (String) paramMap.get("prjId");
			
			//prjId 없는 경우 세션 prjId 세팅
			if(paramPrjId == null || "".equals(paramPrjId)) {
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
			
			paramMap.put("prjGrpId", paramPrjGrpId);
			paramMap.put("prjId", paramPrjId);
			
			// 해당 저장소 정보 가져오기
			if(paramMap.containsKey("linkUrl")==false || paramMap.containsKey("linkId")==false || paramMap.containsKey("linkPw")==false) {
				Map repInfo = stm8000Service.selectStm8000ServerInfo(paramMap);
				paramMap.put("linkUrl", (String)repInfo.get("strgRepUrl"));
				paramMap.put("linkId", (String)repInfo.get("strgUsrId"));
				if("01".equals(repInfo.get("strgTypeCd"))) {
					//저장소 유형이 svn인경우
					paramMap.put("linkPw", (String)repInfo.get("strgUsrPw"));
				}else {
					//저장소 유형이 git인 경우
					paramMap.put("linkPw", (String)repInfo.get("strgKey"));
				}
				
			}
			
			// 페이지 정보 세팅
			// 현재 페이지 값, 보여지는 개체 수, 전체 데이터 건수
			String _pageNo_str = paramMap.get("pagination[page]");
			String _pageSize_str = paramMap.get("pagination[perpage]");
						
			// 파일의 리비전 파일 목록 전체 가져오기
			// 소스 저장소 리비전 조회
			List<Map> list = stm8000Service.selectStm8000RevisionList(paramMap);
			
			// 총 데이터 개수
			int totCnt = Integer.parseInt((String) list.get(0).get("totalCnt"));
			
			//목록만 남기기
			list.remove(0);
			
			// 페이지 사이즈
			PaginationInfo paginationInfo = PagingUtil.getPaginationInfo(_pageNo_str, _pageSize_str);

			// 총 페이지 개수
			paginationInfo.setTotalRecordCount(totCnt);
			paramMap = PagingUtil.getPageSettingMap(paramMap, paginationInfo);
			
			// 페이지 정보 세팅
			Map<String, Object> metaMap = PagingUtil.getPageReturnMap(paginationInfo);
			
			model.addAttribute("data", list);
			model.addAttribute("meta", metaMap);
			
			//등록 성공 메시지 세팅
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectStm8000FileRevisionListAjax()", ex);
			
			//조회실패 메시지 세팅 및 저장 성공여부 세팅
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
	/**
	 * stm8000 리비전 소스파일 목록 확인창
	 * 
	 * @param request
	 * @param response
	 * @param model
	 * @return
	 * @exception Exception
	 * @author 안지혜
	 * @since 2020.10.28
	 */
	@RequestMapping(value="/stm/stm8000/stm8000/selectStm8005View.do")
	public String selectStm8005View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
			return "/stm/stm8000/stm8000/stm8005";
	}
	
	/**
	 * stm8000 리비전 소스파일 DIFF 정보 AJAX
	 * @param 
	 * @return 
	 * @exception Exception
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@RequestMapping(value="/stm/stm8000/stm8000/selectStm8000FileDiffInfoAjax.do")
	public ModelAndView selectStm8000FileDiffInfoAjax(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			// request 파라미터를 map으로 변환
			Map<String, String> paramMap = RequestConvertor.requestParamToMapAddSelInfo(request, true);
			
			// 세션에서 필요한 정보 가져오기
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			paramMap.put("licGrpId", loginVO.getLicGrpId());
			
			//파라미터값으로 넘어온 prjGrpId
			String paramPrjGrpId = (String) paramMap.get("prjGrpId");
			
			//prjId 없는 경우 세션 prjId 세팅
			if(paramPrjGrpId == null || "".equals(paramPrjGrpId)) {
				paramPrjGrpId = (String) ss.getAttribute("selPrjGrpId");
			}
			
			//파라미터값으로 넘어온 prjId
			String paramPrjId = (String) paramMap.get("prjId");
			
			//prjId 없는 경우 세션 prjId 세팅
			if(paramPrjId == null || "".equals(paramPrjId)) {
				paramPrjId = (String) ss.getAttribute("selPrjId");
			}
			
			paramMap.put("prjGrpId", paramPrjGrpId);
			paramMap.put("prjId", paramPrjId);
			
			// 해당 저장소 정보 가져오기
			if(paramMap.containsKey("linkUrl")==false || paramMap.containsKey("linkId")==false || paramMap.containsKey("linkPw")==false) {
				Map repInfo = stm8000Service.selectStm8000ServerInfo(paramMap);
				paramMap.put("linkUrl", (String)repInfo.get("strgRepUrl"));
				paramMap.put("linkId", (String)repInfo.get("strgUsrId"));
				if("01".equals(repInfo.get("strgTypeCd"))) {
					//저장소 유형이 svn인경우
					paramMap.put("linkPw", (String)repInfo.get("strgUsrPw"));
				}else {
					//저장소 유형이 git인 경우
					paramMap.put("linkPw", (String)repInfo.get("strgKey"));
				}
				
			}
			
			//넘어온 리비전에 따라 변경 전/후 구분
			String beforeRevision;
			String afterRevision;
			long revision01 = (long) Integer.parseInt(paramMap.get("diffRevision01"));
			long revision02 = (long) Integer.parseInt(paramMap.get("diffRevision02"));
			if(revision01<revision02) {
				beforeRevision = Integer.toString((int)revision01);
				afterRevision = Integer.toString((int)revision02);
			}else {
				beforeRevision = Integer.toString((int)revision02);
				afterRevision = Integer.toString((int)revision01);
			}
			
			//변경 전 파일 내용
			paramMap.put("revision", beforeRevision);
			// 리비전 파일 소스 보기
			String beforeRevisionContent = stm8000Service.selectStm8000RevisionFileInfo(paramMap);
			//변경 후 파일 내용
			paramMap.put("revision", afterRevision);
			// 리비전 파일 소스 보기
			String afterRevisionContent = stm8000Service.selectStm8000RevisionFileInfo(paramMap);
			
			model.addAttribute("beforeRevision", beforeRevision);
			model.addAttribute("afterRevision", afterRevision);
			
			model.addAttribute("beforeContent", beforeRevisionContent);
			model.addAttribute("afterContent", afterRevisionContent);
			
			//등록 성공 메시지 세팅
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			
			return new ModelAndView("jsonView");
		}
		catch(Exception ex){
			Log.error("selectStm8000FileDiffInfoAjax()", ex);
			
			//조회실패 메시지 세팅 및 저장 성공여부 세팅
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
	
}
