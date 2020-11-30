package kr.opensoftlab.lunaops.prj.prj1000.prj1000.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.service.impl.FileManageDAO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import kr.opensoftlab.lunaops.com.exception.UserDefineException;
import kr.opensoftlab.lunaops.com.fms.web.service.FileMngService;
import kr.opensoftlab.lunaops.prj.prj1000.prj1000.service.Prj1000Service;
import kr.opensoftlab.lunaops.prj.prj1000.prj1100.service.Prj1100Service;
import kr.opensoftlab.lunaops.prj.prj2000.prj2000.service.impl.Prj2000DAO;
import kr.opensoftlab.lunaops.prj.prj2000.prj2100.service.impl.Prj2100DAO;
import kr.opensoftlab.lunaops.prj.prj3000.prj3000.service.impl.Prj3000DAO;
import kr.opensoftlab.lunaops.req.req2000.req2000.service.impl.Req2000DAO;
import kr.opensoftlab.lunaops.req.req4000.req4100.service.impl.Req4100DAO;
import kr.opensoftlab.lunaops.req.req4000.req4100.vo.Req4100VO;
import kr.opensoftlab.lunaops.stm.stm2000.stm2000.service.Stm2000Service;
import kr.opensoftlab.lunaops.stm.stm2000.stm2000.service.impl.Stm2000DAO;



@Service("prj1000Service")
public class Prj1000ServiceImpl extends EgovAbstractServiceImpl implements Prj1000Service {
	
    @Resource(name="req4100DAO")
    private Req4100DAO req4100DAO;
    
    
    @Resource(name="req2000DAO")
    private Req2000DAO req2000DAO;

	
    @Resource(name="prj1000DAO")
    private Prj1000DAO prj1000DAO;
    
	
    @Resource(name="prj3000DAO")
    private Prj3000DAO prj3000DAO;

	
    @Resource(name="prj2000DAO")
    private Prj2000DAO prj2000DAO;
    
    
    @Resource(name="prj2100DAO")
    private Prj2100DAO prj2100DAO;
    
	
    @Resource(name="stm2000DAO")
    private Stm2000DAO stm2000DAO;

	
   	@Resource(name="fileMngService")
   	private FileMngService fileMngService;
   	
	
    @Resource(name = "prj1100Service")
    private Prj1100Service prj1100Service;
    
    
    @Resource(name = "stm2000Service")
    private Stm2000Service stm2000Service;
    
	@Resource(name = "FileManageDAO")
	private FileManageDAO fileMngDAO;
	

   	@Resource(name = "egovFileIdGnrService")
	private EgovIdGnrService idgenService;
   	
	@SuppressWarnings("rawtypes")
	public List selectPrj1000PrjGrpAllList(Map paramMap) throws Exception {
		 return prj1000DAO.selectPrj1000PrjGrpAllList(paramMap);
    }
	
   	
	@SuppressWarnings("rawtypes")
	public List selectPrj1000PrjGrpList(Map paramMap) throws Exception {
		 return prj1000DAO.selectPrj1000PrjGrpList(paramMap);
    }
	
	@SuppressWarnings("rawtypes")
	public int selectPrj1000PrjGrpListCnt(Map paramMap) throws Exception {
		return prj1000DAO.selectPrj1000PrjGrpListCnt(paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public List selectPrj1000PrjList(Map paramMap) throws Exception {
		return prj1000DAO.selectPrj1000PrjList(paramMap);
	}
	
	@SuppressWarnings("rawtypes")
	public int selectPrj1000PrjListCnt(Map paramMap) throws Exception {
		return prj1000DAO.selectPrj1000PrjListCnt(paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public List selectPrj1000PrjAuthUsrList(Map paramMap) throws Exception {
		return prj1000DAO.selectPrj1000PrjAuthUsrList(paramMap);
	}
	
	@SuppressWarnings("rawtypes")
	public int selectPrj1000PrjAuthUsrListCnt(Map paramMap) throws Exception {
		return prj1000DAO.selectPrj1000PrjAuthUsrListCnt(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj2100PrjAuthNoneUsrList(Map paramMap) throws Exception {
		return prj1000DAO.selectPrj2100PrjAuthNoneUsrList(paramMap);
	}
	
	@SuppressWarnings("rawtypes")
	public int selectPrj2100PrjAuthNoneUsrListCnt(Map paramMap) throws Exception {
		return prj1000DAO.selectPrj2100PrjAuthNoneUsrListCnt(paramMap);
	}
    
   	@SuppressWarnings("rawtypes")
   	public Map selectPrj1000Info(Map paramMap) throws Exception {
   		return prj1000DAO.selectPrj1000Info(paramMap) ;
   	}

	
	@SuppressWarnings("rawtypes")
	public List selectPrj1001PrjGrpAuthList(Map paramMap) throws Exception {
		return prj1000DAO.selectPrj1001PrjGrpAuthList(paramMap);
	}
	
   	
	@SuppressWarnings("rawtypes")
	public List selectPrj1000PrjGrpExistCheck(Map paramMap) throws Exception {
		return prj1000DAO.selectPrj1000PrjGrpExistCheck(paramMap);
	}
   	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj1000PrjGrpIdExistCheck(Map paramMap) throws Exception {
		return prj1000DAO.selectPrj1000PrjGrpIdExistCheck(paramMap);
	}
	
   	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public String insertPrj1000PrjGrpAjax(Map paramMap) throws Exception{
		
		//로그인 사용자 ID
		String prjAuthTargetId = (String) paramMap.get("prjAuthTargetId");
		
		String prjGrpId = (String) prj1000DAO.insertPrj1000PrjGrpAjax(paramMap);

		//프로젝트 그룹 생성자를 담당자로 지정
		paramMap.put("prjId", prjGrpId);
		prj1000DAO.insertPrj1000PrjAuthInfo(paramMap);
		
		//추가된 담당자 목록
		String usrIdList = (String) paramMap.get("usrIdList");
		if(usrIdList != null && !"[]".equals(usrIdList)) {
			//JSON파서 선언
			JSONArray jsonArray = new JSONArray(usrIdList);
			
			//담당자 목록
			for(int i=0;i<jsonArray.length();i++) {
				JSONObject jsonObj = (JSONObject) jsonArray.get(i);
				String licGrpId = jsonObj.getString("licGrpId");
				String usrId = jsonObj.getString("usrId");
				
				//현재 로그인 사용자는 skip
				if(!usrId.equals(prjAuthTargetId)) {
					paramMap.put("licGrpId", licGrpId);
					paramMap.put("prjAuthTargetId", usrId);
					prj1000DAO.insertPrj1000PrjAuthInfo(paramMap);
				}
			}
		}
		
		
		return prjGrpId;
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public int updatePrj1000PrjGrp(Map paramMap) throws Exception{
		int rtnValue = 0;
		
		//프로젝트ID
		paramMap.put("prjId", paramMap.get("paramPrjId"));
		
		//로그인 사용자 ID
		//String prjAuthTargetId = (String) paramMap.get("prjAuthTargetId");
		rtnValue = (int) prj1000DAO.updatePrj1000(paramMap);

		//프로젝트 그룹 담당자 전체 제거
		paramMap.remove("prjAuthTargetId");
		prj1000DAO.deletePrj1000PrjAuthInfo(paramMap);
		
		//추가된 담당자 목록
		String usrIdList = (String) paramMap.get("usrIdList");
		
		if(usrIdList != null && !"[]".equals(usrIdList)) {
			//JSON파서 선언
			JSONArray jsonArray = new JSONArray(usrIdList);
			
			//담당자 목록
			for(int i=0;i<jsonArray.length();i++) {
				JSONObject jsonObj = (JSONObject) jsonArray.get(i);
				String licGrpId = jsonObj.getString("licGrpId");
				String usrId = jsonObj.getString("usrId");
				
				paramMap.put("licGrpId", licGrpId);
				paramMap.put("prjAuthTargetId", usrId);
				prj1000DAO.insertPrj1000PrjAuthInfo(paramMap);
			}
		}
		
		return rtnValue;
	}
   	

	
	@SuppressWarnings("rawtypes")
	public String insertPrj1000PrjAjax(Map paramMap) throws Exception{
		return prj1000DAO.insertPrj1000PrjAjax(paramMap);
	}
	
   	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public String insertPrj1001Ajax(Map paramMap) throws Exception{
		
		String licGrpId = (String) paramMap.get("licGrpId");
		String regUsrId = (String) paramMap.get("regUsrId");
		String regUsrIp = (String) paramMap.get("regUsrIp");
		String modifyUsrId = (String) paramMap.get("modifyUsrId");
		String modifyUsrIp = (String) paramMap.get("modifyUsrIp");
		String prjNm = (String) paramMap.get("prjNm");
		
		Map regModiMap = new HashMap();
		regModiMap.put("licGrpId", licGrpId);
		regModiMap.put("regUsrId", regUsrId);
		regModiMap.put("regUsrIp", regUsrIp);
		regModiMap.put("modifyUsrId", modifyUsrId);
		regModiMap.put("modifyUsrIp", modifyUsrIp);
		
		//프로젝트 생성관리 등록
		String prjId = "";
		
		
		prjId = prj1000DAO.insertPrj1000PrjAjax(paramMap);
		paramMap.put("prjId", prjId);
		
		//기본 권한그룹 목록 조회
		List<Map> rootAuthGrpList = stm2000DAO.selectStm2000StmAuthGrpNoPagingList(paramMap);
		
		//권한그룹 목록 없는 경우 오류
		if(rootAuthGrpList == null || rootAuthGrpList.size() == 0) {
			throw new UserDefineException();
		}
		
		//권한그룹 추가
		for(Map rootAuthGrpInfo: rootAuthGrpList) {
			String authGrpId = (String) rootAuthGrpInfo.get("authGrpId");
			
			//프로젝트 Id 교체
		    rootAuthGrpInfo.remove("prjId");
		    rootAuthGrpInfo.put("prjId", prjId);
		    rootAuthGrpInfo.put("selPrjId", prjId);
		    rootAuthGrpInfo.put("orginAuthGrpId", authGrpId);
		    rootAuthGrpInfo.put("authGrpUseCd", rootAuthGrpInfo.get("useCd"));
		    rootAuthGrpInfo.put("authGrpOrd", rootAuthGrpInfo.get("ord"));
		    rootAuthGrpInfo.putAll(regModiMap);
		    
		    //권한그룹 추가
		    prj2000DAO.insertPrj2000AuthGrpInfoAjax(rootAuthGrpInfo);
		}
		
		//사용자 배정
	    Map newMap = new HashMap<>();
	    newMap.put("prjId",prjId);
	    newMap.put("authGrpId",rootAuthGrpList.get(0).get("authGrpId"));
	    newMap.putAll(regModiMap);
	    newMap.put("usrId", regUsrId);
	    
	    //사용자 배정 추가
	    prj2000DAO.insertPrj2000PrjUsrAuthListAjax(newMap);
	    
	    //메뉴별 접근권한 정보 생성 'ROOTSYSTEM_PRJ'
	    stm2000DAO.insertStm2001MenuRootAuthList(paramMap);
	    
	    //TODO 요구사항 분류 root 생성
	    
	    //프로젝트 산출물 루트정보 생성
	    paramMap.put("docNm", prjNm);
	    prj3000DAO.insertPrj3000RootMenuInfo(paramMap);
	    
		// 생성된 프로젝트 Id 리턴
		return prjId;
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public int updatePrj1000Ajax(Map paramMap) throws Exception{
		//프로젝트 생성관리 수정
		return prj1000DAO.updatePrj1000(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void deletePrj1000PrjAjax(Map paramMap) throws Exception{
		String deleteDataList = (String) paramMap.get("deleteDataList");

		//JSON파서 선언
		JSONArray jsonArray = new JSONArray(deleteDataList);
		
		//삭제 요구사항 목록
		for(int i=0;i<jsonArray.length();i++) {
			JSONObject jsonObj = (JSONObject) jsonArray.get(i);
			
			//json to Map
			Map infoMap = new Gson().fromJson(jsonObj.toString(), new HashMap().getClass());
			
			//프로젝트 그룹&단건 삭제
			prj1000DAO.deletePrj1000PrjAjax(infoMap);
			
		}
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void updatePrj1000PrjGrpTrashListAjax(Map paramMap) throws Exception{
		String deleteDataList = (String) paramMap.get("deleteDataList");
		String delCd = (String) paramMap.get("delCd");
		
		//JSON파서 선언
		JSONArray jsonArray = new JSONArray(deleteDataList);
		
		//삭제 요구사항 목록
		for(int i=0;i<jsonArray.length();i++) {
			JSONObject jsonObj = (JSONObject) jsonArray.get(i);
			
			//json to Map
			Map infoMap = new Gson().fromJson(jsonObj.toString(), new HashMap().getClass());
			
			//삭제유무 변경
			infoMap.put("delCd", delCd);
			
			// 요구사항 휴지통 이동 (삭제유무 변경)
			prj1000DAO.updatePrj1000PrjTrashMoveAjax(infoMap);
		}
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked"})
	public void deletePrj1001Ajax(Map paramMap) throws Exception{
		String deleteDataList = (String) paramMap.get("deleteDataList");

		//JSON파서 선언
		JSONArray jsonArray = new JSONArray(deleteDataList);
		
		//fileAtchId 정리
		List<String> atchFileIdList = new ArrayList<String>();
				
		//삭제 요구사항 목록
		for(int i=0;i<jsonArray.length();i++) {
			JSONObject jsonObj = (JSONObject) jsonArray.get(i);
			
			//json to Map
			Map infoMap = new Gson().fromJson(jsonObj.toString(), new HashMap().getClass());
			
			//요구사항 목록 불러오기
			paramMap.put("atchFileIdNotNull", "Y"); //isNotEmpty
			List<Map> prjReqList = req4100DAO.selectReq4100AllList(infoMap);
			
			//산출물 목록 불러오기
			List<Map> prjDocList = prj3000DAO.selectPrj3000BaseMenuList(infoMap);
			
			//추가항목 + 값 가져오기
			List<Map> prjFlwOptList = prj1100Service.selectPrj1102FlwOptExistFileIdList(infoMap);
			
			prj1000DAO.updatePrj1000UserProjectId(infoMap);
			
			
			
			//권한그룹 정보 삭제
			prj2000DAO.deletePrj2000AuthGrpInfoAjax(infoMap);
			
			//메뉴별 접근권한 정보 삭제
			prj2000DAO.deletePrj2000MenuUsrAuthListAjax(infoMap);
			
			//권한 프로젝트별 사용자 삭제
			prj2000DAO.deletePrj2000AuthPrjUsrListAjax(infoMap);
			
			//프로젝트 정보 삭제
			prj1000DAO.deletePrj1000PrjAjax(infoMap);
			
			//프로젝트 담당자 정보 삭제
			prj1000DAO.deletePrj1000PrjAuthInfo(infoMap);
			
			//산출물 정보 삭제
			prj3000DAO.deletePrj3000DocList(infoMap);
			
			//요구사항 정보 삭제
			req4100DAO.deleteReq4100ReqList(infoMap);
			
			//TODO 프로세스 관련 모든 테이블 정보 삭제
			//TODO 스프린트 관련 모든 테이블 정보 삭제
			//TODO 마일스톤 관련 모든 테이블 정보 삭제
			//TODO 소스저장소 관련 모든 테이블 정보 삭제
			//TODO API 관련 모든 테이블 정보 삭제
			//TODO 배포 관련 모든 테이블 정보 삭제
			//TODO 요구사항 분류 정보 삭제
			//TODO 요구사항 변경, 수정 이력 정보 삭제
			//TODO 요구사항 결재 정보 삭제
			
			//요구사항 목록에서 FILE_ATCH_ID 가져오기
			if(prjReqList.size() > 0){
				for(Map prjReqInfo : prjReqList){
					String atchFileId = (String) prjReqInfo.get("atchFileId");
					
					//fileId있는경우 목록 추가
					if(atchFileId != null && !"".equals(atchFileId)){
						atchFileIdList.add(atchFileId);
					}
				}
			}
			
			//산출물 목록에서 DOC_FORM_FILE_ID, DOC_ATCH_FILE_ID 가져오기
			if(prjDocList.size() > 0){
				for(Map prjDocInfo : prjDocList){
					//양식 fileId
					String docFormFileId = (String) prjDocInfo.get("docFormFileId");
					
					//산출물 fileId
					String docAtchFileId = (String) prjDocInfo.get("docAtchFileId");
					
					//fileId있는경우 목록 추가
					if(docFormFileId != null && !"".equals(docFormFileId)){
						atchFileIdList.add(docFormFileId);
					}
					
					//fileId있는경우 목록 추가
					if(docAtchFileId != null && !"".equals(docAtchFileId)){
						atchFileIdList.add(docAtchFileId);
					}
				}
			}
			
			//추가항목 + 값 목록에서 ITEM_VALUE 가져오기
			if(prjFlwOptList.size() > 0){
				for(Map prjFlwOptInfo : prjFlwOptList){
					String itemValue = (String) prjFlwOptInfo.get("itemValue");
					
					//fileId있는경우 목록 추가
					if(itemValue != null && !"".equals(itemValue)){
						atchFileIdList.add(itemValue);
					}
				}
			}
		}
		
		List<FileVO> delFileList = new ArrayList<FileVO>();
		
		//atchFileID로 생성된 파일 목록 조회
		if(atchFileIdList.size() > 0){
			for(String atchFileIdStr : atchFileIdList){
				FileVO fileVo = new FileVO();
				fileVo.setAtchFileId(atchFileIdStr);
				
				List<FileVO> selFileList = fileMngDAO.selectFileInfs(fileVo);
				delFileList.addAll(selFileList);
			}
		}
		
		//파일 목록
		if(delFileList.size() > 0){
			//파일 DB삭제
			for(FileVO delFileInfo : delFileList){
				//파일 DB 삭제
				fileMngDAO.deleteFileInf(delFileInfo);
			}
			//파일 물리적삭제
			for(FileVO delFileInfo : delFileList){
				try{
					//파일 물리적 삭제
					String fileDeletePath  = delFileInfo.getFileStreCours()+delFileInfo.getStreFileNm();
				    EgovFileMngUtil.deleteFile(fileDeletePath);
				}catch(Exception fileE){	//물리적 파일 삭제 오류시 skip
					continue;
				}
			}
		}
	}


	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectPrj1000ProjectGroupListAjax(
			Map<String, String> paramMap) {

		return prj1000DAO.selectPrj1000ProjectGroupListAjax(paramMap) ;
	}
	
	@SuppressWarnings("rawtypes")
	@Override
	public int selectPrj1000ProjectAcronymCount(Map paramMap) throws Exception{
		return prj1000DAO.selectPrj1000ProjectAcronymCount(paramMap);
	}
	

	
	@SuppressWarnings("rawtypes")
	public List selectPrj1000AdminPrjList(Map paramMap) throws Exception {
		return prj1000DAO.selectPrj1000AdminPrjList(paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public String insertPrj1000WizardProject(Map paramMap) throws Exception {
		
		
		String licGrpId = (String) paramMap.get("licGrpId");
		String regUsrId = (String) paramMap.get("regUsrId");
		String regUsrIp = (String) paramMap.get("regUsrIp");
		String modifyUsrId = (String) paramMap.get("modifyUsrId");
		String modifyUsrIp = (String) paramMap.get("modifyUsrIp");
		
		Map regModiMap = new HashMap();
		regModiMap.put("licGrpId", licGrpId);
		regModiMap.put("regUsrId", regUsrId);
		regModiMap.put("regUsrIp", regUsrIp);
		regModiMap.put("modifyUsrId", modifyUsrId);
		regModiMap.put("modifyUsrIp", modifyUsrIp);
		
		
		
		String wizardData = (String) paramMap.get("wizardData");
		
		JSONObject wizardJsonData = new JSONObject(wizardData);
		
		
		
		JSONObject projectJson = wizardJsonData.getJSONObject("project");
		
		//프로젝트 데이터
		Map projectMapData = new Gson().fromJson(projectJson.toString(), HashMap.class);
		
		//정보 입력
		projectMapData.putAll(regModiMap);
		
		
		//프로젝트 생성 DAO
		String newPrjId = prj1000DAO.insertPrj1000PrjWizardAjax(projectMapData);
		
		
		
		//프로세스 있는지 체크
		if(wizardJsonData.has("process")){
			JSONObject processJson = wizardJsonData.getJSONObject("process");
			
			//선택 프로세스 추가 (복사 service 사용)
			Iterator<String> keys = processJson.keys();
			while(keys.hasNext()) {
			    String key = keys.next();
			    
			    //json to map
			    Map processMapData = new Gson().fromJson(processJson.get(key).toString(), HashMap.class);
			    
			    //selPrjId넣기 - 생성된 prjId
			    processMapData.put("selPrjId", newPrjId);
			    processMapData.putAll(regModiMap);
				
			    //프로세스 복사 Service
			    prj1100Service.insertPrj1100ProcessCopyInfo(processMapData);
			}
		}
		
		
		//역할그룹 생성
		JSONArray authGrpArr = (JSONArray) wizardJsonData.get("authGrp");
		
		for(int i=0;i<authGrpArr.length();i++){
			JSONObject authGrpInfo = authGrpArr.getJSONObject(i);
			
			//json to map
		    Map authGrpMapData = new Gson().fromJson(authGrpInfo.toString(), HashMap.class);
		    authGrpMapData.put("licGrpId", licGrpId);
		    
		    //권한그룹 조회 - adm1100
		    Map prjAuthGrpInfo = stm2000DAO.selectStm2000StmAuthGrpInfo(authGrpMapData);
		    
		    //프로젝트 Id 교체
		    prjAuthGrpInfo.remove("prjId");
		    prjAuthGrpInfo.put("prjId", newPrjId);
		    prjAuthGrpInfo.put("selPrjId", newPrjId);
		    prjAuthGrpInfo.put("authGrpUseCd", prjAuthGrpInfo.get("useCd"));
		    prjAuthGrpInfo.put("authGrpOrd", prjAuthGrpInfo.get("ord"));
		    prjAuthGrpInfo.putAll(regModiMap);
		    
		    //권한그룹 추가
		    String newAuthGrpId = prj2000DAO.insertPrj2000AuthGrpInfoAjax(prjAuthGrpInfo);
		    
		    //메뉴별 접근권한 가져오기
		    List<Map> prjAuthGrpSystemList = stm2000DAO.selectStm2000AuthGrpSmallMenuList(authGrpMapData);
		    
		    
		    //권한그룹에 접근권한 추가
		    for(Map prjAuthGrpSystemInfo : prjAuthGrpSystemList){
		    	prjAuthGrpSystemInfo.put("prjId",newPrjId);
		    	prjAuthGrpSystemInfo.put("authGrpId",newAuthGrpId);
		    	prjAuthGrpSystemInfo.putAll(regModiMap);
    			
		    	stm2000Service.saveStm2000AuthGrpMenuAuthInfo(prjAuthGrpSystemInfo);
		    }
		    //사용자 배정
		    Map newMap = new HashMap<>();
		    newMap.put("licGrpId",licGrpId);
		    newMap.put("prjId",newPrjId);
		    newMap.put("authGrpId",newAuthGrpId);
		    newMap.putAll(regModiMap);
		    newMap.put("usrId", regUsrId);
		    
		    //사용자 배정 추가
		    prj2100DAO.insertPrj2100PrjUsrAuthInfo(newMap);
		}
		
		
		String docPrjId = wizardJsonData.getString("document");

		//Map Setting
		Map newMap = new HashMap<>();
		newMap.put("prjId",docPrjId);
		newMap.putAll(regModiMap);
		
		//개발문서 양식 메뉴 정보 불러오기
		List<Map> prjDocList = null;
		
		//rootsystem인지 체크
		if("ROOTSYSTEM_PRJ".equals(docPrjId)){
			 prjDocList = prj3000DAO.selectPrj3000RootMenuList(newMap);
		}else{
			prjDocList = prj3000DAO.selectPrj3000BaseMenuList(newMap);
		}
		
		//산출물 정보가 있는경우
		if(prjDocList != null && prjDocList.size() > 0){
			for(Map prjDocInfo : prjDocList){
				//atch_file_id 강제 생성
				String docFormFileId = idgenService.getNextStringId();
				fileMngService.insertFileMasterInfo(docFormFileId);
				//atch_file_id 강제 생성
				String docAtchFileId = idgenService.getNextStringId();
				fileMngService.insertFileMasterInfo(docAtchFileId);
				
				//데이터 교체
				prjDocInfo.remove("prjId");
				prjDocInfo.remove("docFormFileId");
				prjDocInfo.remove("docAtchFileId");
				prjDocInfo.remove("regUsrId");
				prjDocInfo.remove("regUsrIp");
				prjDocInfo.remove("modifyUsrId");
				prjDocInfo.remove("modifyUsrIp");
				
				prjDocInfo.put("prjId",newPrjId);
				prjDocInfo.put("docFormFileId",docFormFileId);
				prjDocInfo.put("docAtchFileId",docAtchFileId);
				
				prjDocInfo.putAll(regModiMap);
				
				//산출물 추가
				prj3000DAO.insertPrj3000ParamMenuInfo(prjDocInfo);
			}
		}
		
		
		
		
		if(wizardJsonData.has("class")){
			String clsPrjId = wizardJsonData.getString("class");
			
			//Map Setting
			Map clsNewMap = new HashMap<>();
			clsNewMap.put("selPrjId",clsPrjId);
			
			//분류 목록
			List<Map> clsList = req2000DAO.selectReq2000ReqClsList(clsNewMap);
			
			//분류 루프
			if(clsList != null && clsList.size() > 0){
				for(Map clsInfo : clsList){
					//데이터 교체
					clsInfo.remove("regUsrId");
					clsInfo.remove("regUsrIp");
					clsInfo.remove("modifyUsrId");
					clsInfo.remove("modifyUsrIp");
					clsInfo.remove("prjId");
					
					clsInfo.put("prjId",newPrjId);
					clsInfo.putAll(regModiMap);
					
					req2000DAO.insertReq2000WizardReqClsInfo(clsInfo);
				}
			}
		}
		//class 없는경우 요구사항 분류 '없음'으로 프로젝트 이름으로 ROOT를 생성해준다.
		else{
			//프로젝트 명
			String prjNm = (String)projectJson.getString("wizard_prjNm");
			
			//Map Setting
			Map clsNewMap = new HashMap<>();
			clsNewMap.put("selPrjId",newPrjId);
			clsNewMap.put("newReqClsNm",prjNm);
			clsNewMap.put("lvl",-1);
			clsNewMap.put("ord",0);
			clsNewMap.put("licGrpId", licGrpId);
			clsNewMap.put("regUsrId", regUsrId);
			clsNewMap.put("regUsrIp", regUsrIp);
			clsNewMap.put("modifyUsrId", modifyUsrId);
			clsNewMap.put("modifyUsrIp", modifyUsrIp);
			
			req2000DAO.insertReq2000ReqClsInfo(clsNewMap);
			
		}
		
		return newPrjId;
	}

	
	@SuppressWarnings("rawtypes")
	public String insertPrj1000PrjAuthInfo(Map paramMap) throws Exception{
		return prj1000DAO.insertPrj1000PrjAuthInfo(paramMap);
	}
}








