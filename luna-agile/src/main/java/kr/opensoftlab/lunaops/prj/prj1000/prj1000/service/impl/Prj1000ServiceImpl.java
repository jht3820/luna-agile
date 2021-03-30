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
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.service.impl.FileManageDAO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import kr.opensoftlab.lunaops.arm.arm1000.arm1100.service.impl.Arm1100DAO;
import kr.opensoftlab.lunaops.com.exception.UserDefineException;
import kr.opensoftlab.lunaops.com.fms.web.service.FileMngService;
import kr.opensoftlab.lunaops.prj.prj1000.prj1000.service.Prj1000Service;
import kr.opensoftlab.lunaops.prj.prj1000.prj1100.service.Prj1100Service;
import kr.opensoftlab.lunaops.prj.prj2000.prj2000.service.impl.Prj2000DAO;
import kr.opensoftlab.lunaops.prj.prj2000.prj2100.service.impl.Prj2100DAO;
import kr.opensoftlab.lunaops.prj.prj3000.prj3000.service.impl.Prj3000DAO;
import kr.opensoftlab.lunaops.req.req2000.req2000.service.impl.Req2000DAO;
import kr.opensoftlab.lunaops.req.req4000.req4100.service.impl.Req4100DAO;
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

	
    @Resource(name="arm1100DAO")
    private Arm1100DAO arm1100DAO;

	
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
	public List selectPrj1000PrjAuthNoneUsrList(Map paramMap) throws Exception {
		return prj1000DAO.selectPrj1000PrjAuthNoneUsrList(paramMap);
	}
	
	@SuppressWarnings("rawtypes")
	public int selectPrj1000PrjAuthNoneUsrListCnt(Map paramMap) throws Exception {
		return prj1000DAO.selectPrj1000PrjAuthNoneUsrListCnt(paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public Map selectPrj1000GrpInfo(Map paramMap) throws Exception {
		return prj1000DAO.selectPrj1000GrpInfo(paramMap) ;
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
		
		
		String prjAuthTargetId = (String) paramMap.get("prjAuthTargetId");
		String prjNm = (String) paramMap.get("prjNm");
		
		String prjGrpId = (String) prj1000DAO.insertPrj1000PrjGrpAjax(paramMap);

		
		paramMap.put("prjId", prjGrpId);
		prj1000DAO.insertPrj1000PrjAuthInfo(paramMap);
		
		
		Map<String, Object> ntfParam = new HashMap<String, Object>();
		ntfParam.put("licGrpId", paramMap.get("licGrpId"));
		ntfParam.put("sendUsrId", prjAuthTargetId); 
		ntfParam.put("armTypeCd", "04"); 
		ntfParam.put("armSendTypeCd", "01"); 
		
		ntfParam.put("usrId", prjAuthTargetId); 
		
		ntfParam.put("armTitle", "["+prjNm+"] 담당자 지정"); 
		ntfParam.put("armContent", "["+prjNm+"] 프로젝트에 담당자로 지정되었습니다."); 
		
		arm1100DAO.insertArm1100NtfInfo(ntfParam);
		
		
		String usrIdList = (String) paramMap.get("usrIdList");
		if(usrIdList != null && !"[]".equals(usrIdList)) {
			
			JSONArray jsonArray = new JSONArray(usrIdList);
			
			
			for(int i=0;i<jsonArray.length();i++) {
				JSONObject jsonObj = (JSONObject) jsonArray.get(i);
				String licGrpId = jsonObj.getString("licGrpId");
				String usrId = jsonObj.getString("usrId");
				String authTypeCd = jsonObj.getString("authTypeCd");
				
				
				if(!usrId.equals(prjAuthTargetId)) {

					
					ntfParam.put("licGrpId", licGrpId);
					ntfParam.put("sendUsrId", prjAuthTargetId); 
					ntfParam.put("armSendTypeCd", "01"); 

					if(authTypeCd.equals("01")) {
						ntfParam.put("armTypeCd", "04"); 
						ntfParam.put("usrId", usrId); 
					}else if(authTypeCd.equals("02")) {
						ntfParam.put("armTypeCd", "03"); 
						ntfParam.put("authGrpId", usrId); 
						ntfParam.put("prjId", prjGrpId); 
					}
					ntfParam.put("armTitle", "["+prjNm+"] 담당자 지정"); 
					ntfParam.put("armContent", "["+prjNm+"] 프로젝트에 담당자로 지정되었습니다."); 
					
					arm1100DAO.insertArm1100NtfInfo(ntfParam);
					
					paramMap.put("licGrpId", licGrpId);
					paramMap.put("prjAuthTargetId", usrId);
					paramMap.put("prjAuthTypeCd", authTypeCd);
					prj1000DAO.insertPrj1000PrjAuthInfo(paramMap);
				}
			}
		}
		
		
		return prjGrpId;
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public int updatePrj1000PrjGrp(Map paramMap) throws Exception{
		int rtnValue = 0;
		
		String prjAuthTargetId = (String) paramMap.get("prjAuthTargetId");
		String prjNm = (String) paramMap.get("prjNm");
		String prjId = (String) paramMap.get("paramPrjId");
		
		paramMap.put("prjId", prjId);
		
		
		
		rtnValue = (int) prj1000DAO.updatePrj1000(paramMap);

		
		paramMap.remove("prjAuthTargetId");
		paramMap.remove("prjAuthTypeCd");
		prj1000DAO.deletePrj1000PrjAuthInfo(paramMap);
		
		
		paramMap.put("prjAuthTargetId", prjAuthTargetId);
		paramMap.put("prjAuthTypeCd", "01");
		prj1000DAO.insertPrj1000PrjAuthInfo(paramMap);
		
		
		Map<String, Object> ntfParam = new HashMap<String, Object>();
		ntfParam.put("licGrpId", paramMap.get("licGrpId"));
		ntfParam.put("sendUsrId", prjAuthTargetId); 
		ntfParam.put("armTypeCd", "04"); 
		ntfParam.put("armSendTypeCd", "01"); 
		
		ntfParam.put("usrId", prjAuthTargetId); 
		
		ntfParam.put("armTitle", "["+prjNm+"] 담당자 지정"); 
		ntfParam.put("armContent", "["+prjNm+"] 프로젝트에 담당자로 지정되었습니다."); 
		
		arm1100DAO.insertArm1100NtfInfo(ntfParam);
		
		
		
		String usrIdList = (String) paramMap.get("usrIdList");
		
		if(usrIdList != null && !"[]".equals(usrIdList)) {
			
			JSONArray jsonArray = new JSONArray(usrIdList);
			
			
			for(int i=0;i<jsonArray.length();i++) {
				JSONObject jsonObj = (JSONObject) jsonArray.get(i);
				String licGrpId = jsonObj.getString("licGrpId");
				String usrId = jsonObj.getString("usrId");
				String authTypeCd = jsonObj.getString("authTypeCd");
				
				
				if(!usrId.equals(prjAuthTargetId)) {
					
					
					ntfParam.put("licGrpId", licGrpId);
					ntfParam.put("sendUsrId", prjAuthTargetId); 
					ntfParam.put("armSendTypeCd", "01"); 

					if(authTypeCd.equals("01")) {
						ntfParam.put("armTypeCd", "04"); 
						ntfParam.put("usrId", usrId); 
					}else if(authTypeCd.equals("02")) {
						ntfParam.put("armTypeCd", "03"); 
						ntfParam.put("authGrpId", usrId); 
						ntfParam.put("prjId", prjId); 
					}
					ntfParam.put("armTitle", "["+prjNm+"] 담당자 지정"); 
					ntfParam.put("armContent", "["+prjNm+"] 프로젝트에 담당자로 지정되었습니다."); 
					
					arm1100DAO.insertArm1100NtfInfo(ntfParam);
					
					paramMap.put("licGrpId", licGrpId);
					paramMap.put("prjAuthTargetId", usrId);
					paramMap.put("prjAuthTypeCd", authTypeCd);
					prj1000DAO.insertPrj1000PrjAuthInfo(paramMap);
				}
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
		
		
		String prjId = "";
		
		
		prjId = prj1000DAO.insertPrj1000PrjAjax(paramMap);
		paramMap.put("prjId", prjId);
		
		

		
		String prjAuthTargetId = (String) paramMap.get("prjAuthTargetId");
		
		
		prj1000DAO.insertPrj1000PrjAuthInfo(paramMap);
		
		
		String usrIdList = (String) paramMap.get("usrIdList");
		if(usrIdList != null && !"[]".equals(usrIdList)) {
			
			JSONArray jsonArray = new JSONArray(usrIdList);
			
			
			for(int i=0;i<jsonArray.length();i++) {
				JSONObject jsonObj = (JSONObject) jsonArray.get(i);
				String usrId = jsonObj.getString("usrId");
				String authTypeCd = jsonObj.getString("authTypeCd");
				
				
				if(!usrId.equals(prjAuthTargetId)) {
					paramMap.put("licGrpId", licGrpId);
					paramMap.put("prjAuthTargetId", usrId);
					paramMap.put("prjAuthTypeCd", authTypeCd);
					prj1000DAO.insertPrj1000PrjAuthInfo(paramMap);
				}
			}
		}
		
		
		
		List<Map> rootAuthGrpList = stm2000DAO.selectStm2000StmAuthGrpNoPagingList(paramMap);
		
		
		if(rootAuthGrpList == null || rootAuthGrpList.size() == 0) {
			throw new UserDefineException();
		}
		
		
		for(Map rootAuthGrpInfo: rootAuthGrpList) {
			String authGrpId = (String) rootAuthGrpInfo.get("authGrpId");
			
			
		    rootAuthGrpInfo.remove("prjId");
		    rootAuthGrpInfo.put("prjId", prjId);
		    rootAuthGrpInfo.put("selPrjId", prjId);
		    rootAuthGrpInfo.put("orginAuthGrpId", authGrpId);
		    rootAuthGrpInfo.put("authGrpUseCd", rootAuthGrpInfo.get("useCd"));
		    rootAuthGrpInfo.put("authGrpOrd", rootAuthGrpInfo.get("ord"));
		    rootAuthGrpInfo.putAll(regModiMap);
		    
		    
		    prj2000DAO.insertPrj2000AuthGrpInfoAjax(rootAuthGrpInfo);
		}
		
		
	    Map newMap = new HashMap<>();
	    newMap.put("prjId",prjId);
	    newMap.put("authGrpId",rootAuthGrpList.get(0).get("authGrpId"));
	    newMap.putAll(regModiMap);
	    newMap.put("usrId", regUsrId);
	    
	    
	    prj2000DAO.insertPrj2000PrjUsrAuthListAjax(newMap);
	    
	    
	    stm2000DAO.insertStm2001MenuRootAuthList(paramMap);
	    
	    
	    
	    
	    paramMap.put("docNm", prjNm);
	    prj3000DAO.insertPrj3000RootMenuInfo(paramMap);
	    
		
		return prjId;
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public int updatePrj1000Ajax(Map paramMap) throws Exception{
		
		return prj1000DAO.updatePrj1000(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void deletePrj1000PrjAjax(Map paramMap) throws Exception{
		String deleteDataList = (String) paramMap.get("deleteDataList");

		
		JSONArray jsonArray = new JSONArray(deleteDataList);
		
		
		for(int i=0;i<jsonArray.length();i++) {
			JSONObject jsonObj = (JSONObject) jsonArray.get(i);
			
			
			Map infoMap = new Gson().fromJson(jsonObj.toString(), new HashMap().getClass());
			
			
			prj1000DAO.deletePrj1000PrjAjax(infoMap);
			
		}
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void updatePrj1000PrjGrpTrashListAjax(Map paramMap) throws Exception{
		String deleteDataList = (String) paramMap.get("deleteDataList");
		String delCd = (String) paramMap.get("delCd");
		
		
		JSONArray jsonArray = new JSONArray(deleteDataList);
		
		
		for(int i=0;i<jsonArray.length();i++) {
			JSONObject jsonObj = (JSONObject) jsonArray.get(i);
			
			
			Map infoMap = new Gson().fromJson(jsonObj.toString(), new HashMap().getClass());
			
			
			infoMap.put("delCd", delCd);
			
			
			prj1000DAO.updatePrj1000PrjTrashMoveAjax(infoMap);
		}
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked"})
	public void deletePrj1001Ajax(Map paramMap) throws Exception{
		String deleteDataList = (String) paramMap.get("deleteDataList");

		
		JSONArray jsonArray = new JSONArray(deleteDataList);
		
		
		List<String> atchFileIdList = new ArrayList<String>();
				
		
		for(int i=0;i<jsonArray.length();i++) {
			JSONObject jsonObj = (JSONObject) jsonArray.get(i);
			
			
			Map infoMap = new Gson().fromJson(jsonObj.toString(), new HashMap().getClass());
			
			
			paramMap.put("atchFileIdNotNull", "Y"); 
			List<Map> prjReqList = req4100DAO.selectReq4100AllList(infoMap);
			
			
			List<Map> prjDocList = prj3000DAO.selectPrj3000BaseMenuList(infoMap);
			
			
			List<Map> prjFlwOptList = prj1100Service.selectPrj1102FlwOptExistFileIdList(infoMap);
			
			prj1000DAO.updatePrj1000UserProjectId(infoMap);
			
			
			
			
			prj2000DAO.deletePrj2000AuthGrpInfoAjax(infoMap);
			
			
			prj2000DAO.deletePrj2000MenuUsrAuthListAjax(infoMap);
			
			
			prj2000DAO.deletePrj2000AuthPrjUsrListAjax(infoMap);
			
			
			prj1000DAO.deletePrj1000PrjAjax(infoMap);
			
			
			prj1000DAO.deletePrj1000PrjAuthInfo(infoMap);
			
			
			prj3000DAO.deletePrj3000DocList(infoMap);
			
			
			req4100DAO.deleteReq4100ReqList(infoMap);
			
			
			
			
			
			
			
			
			
			
			
			
			if(prjReqList.size() > 0){
				for(Map prjReqInfo : prjReqList){
					String atchFileId = (String) prjReqInfo.get("atchFileId");
					
					
					if(atchFileId != null && !"".equals(atchFileId)){
						atchFileIdList.add(atchFileId);
					}
				}
			}
			
			
			if(prjDocList.size() > 0){
				for(Map prjDocInfo : prjDocList){
					
					String docFormFileId = (String) prjDocInfo.get("docFormFileId");
					
					
					String docAtchFileId = (String) prjDocInfo.get("docAtchFileId");
					
					
					if(docFormFileId != null && !"".equals(docFormFileId)){
						atchFileIdList.add(docFormFileId);
					}
					
					
					if(docAtchFileId != null && !"".equals(docAtchFileId)){
						atchFileIdList.add(docAtchFileId);
					}
				}
			}
			
			
			if(prjFlwOptList.size() > 0){
				for(Map prjFlwOptInfo : prjFlwOptList){
					String itemValue = (String) prjFlwOptInfo.get("itemValue");
					
					
					if(itemValue != null && !"".equals(itemValue)){
						atchFileIdList.add(itemValue);
					}
				}
			}
		}
		
		List<FileVO> delFileList = new ArrayList<FileVO>();
		
		
		if(atchFileIdList.size() > 0){
			for(String atchFileIdStr : atchFileIdList){
				FileVO fileVo = new FileVO();
				fileVo.setAtchFileId(atchFileIdStr);
				
				List<FileVO> selFileList = fileMngDAO.selectFileInfs(fileVo);
				delFileList.addAll(selFileList);
			}
		}
		
		
		if(delFileList.size() > 0){
			
			for(FileVO delFileInfo : delFileList){
				
				fileMngDAO.deleteFileInf(delFileInfo);
			}
			
			for(FileVO delFileInfo : delFileList){
				try{
					
					String fileDeletePath  = delFileInfo.getFileStreCours()+delFileInfo.getStreFileNm();
				    EgovFileMngUtil.deleteFile(fileDeletePath);
				}catch(Exception fileE){	
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
		
		
		Map projectMapData = new Gson().fromJson(projectJson.toString(), HashMap.class);
		
		
		projectMapData.putAll(regModiMap);
		
		
		
		String newPrjId = prj1000DAO.insertPrj1000PrjWizardAjax(projectMapData);
		
		
		
		
		if(wizardJsonData.has("process")){
			JSONObject processJson = wizardJsonData.getJSONObject("process");
			
			
			Iterator<String> keys = processJson.keys();
			while(keys.hasNext()) {
			    String key = keys.next();
			    
			    
			    Map processMapData = new Gson().fromJson(processJson.get(key).toString(), HashMap.class);
			    
			    
			    processMapData.put("selPrjId", newPrjId);
			    processMapData.putAll(regModiMap);
				
			    
			    prj1100Service.insertPrj1100ProcessCopyInfo(processMapData);
			}
		}
		
		
		
		JSONArray authGrpArr = (JSONArray) wizardJsonData.get("authGrp");
		
		for(int i=0;i<authGrpArr.length();i++){
			JSONObject authGrpInfo = authGrpArr.getJSONObject(i);
			
			
		    Map authGrpMapData = new Gson().fromJson(authGrpInfo.toString(), HashMap.class);
		    authGrpMapData.put("licGrpId", licGrpId);
		    
		    
		    Map prjAuthGrpInfo = stm2000DAO.selectStm2000StmAuthGrpInfo(authGrpMapData);
		    
		    
		    prjAuthGrpInfo.remove("prjId");
		    prjAuthGrpInfo.put("prjId", newPrjId);
		    prjAuthGrpInfo.put("selPrjId", newPrjId);
		    prjAuthGrpInfo.put("authGrpUseCd", prjAuthGrpInfo.get("useCd"));
		    prjAuthGrpInfo.put("authGrpOrd", prjAuthGrpInfo.get("ord"));
		    prjAuthGrpInfo.putAll(regModiMap);
		    
		    
		    String newAuthGrpId = prj2000DAO.insertPrj2000AuthGrpInfoAjax(prjAuthGrpInfo);
		    
		    
		    List<Map> prjAuthGrpSystemList = stm2000DAO.selectStm2000AuthGrpSmallMenuList(authGrpMapData);
		    
		    
		    
		    for(Map prjAuthGrpSystemInfo : prjAuthGrpSystemList){
		    	prjAuthGrpSystemInfo.put("prjId",newPrjId);
		    	prjAuthGrpSystemInfo.put("authGrpId",newAuthGrpId);
		    	prjAuthGrpSystemInfo.putAll(regModiMap);
    			
		    	stm2000Service.saveStm2000AuthGrpMenuAuthInfo(prjAuthGrpSystemInfo);
		    }
		    
		    Map newMap = new HashMap<>();
		    newMap.put("licGrpId",licGrpId);
		    newMap.put("prjId",newPrjId);
		    newMap.put("authGrpId",newAuthGrpId);
		    newMap.putAll(regModiMap);
		    newMap.put("usrId", regUsrId);
		    
		    
		    prj2100DAO.insertPrj2100PrjUsrAuthInfo(newMap);
		}
		
		
		String docPrjId = wizardJsonData.getString("document");

		
		Map newMap = new HashMap<>();
		newMap.put("prjId",docPrjId);
		newMap.putAll(regModiMap);
		
		
		List<Map> prjDocList = null;
		
		
		if("ROOTSYSTEM_PRJ".equals(docPrjId)){
			 prjDocList = prj3000DAO.selectPrj3000RootMenuList(newMap);
		}else{
			prjDocList = prj3000DAO.selectPrj3000BaseMenuList(newMap);
		}
		
		
		if(prjDocList != null && prjDocList.size() > 0){
			for(Map prjDocInfo : prjDocList){
				
				String docFormFileId = idgenService.getNextStringId();
				fileMngService.insertFileMasterInfo(docFormFileId);
				
				String docAtchFileId = idgenService.getNextStringId();
				fileMngService.insertFileMasterInfo(docAtchFileId);
				
				
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
				
				
				prj3000DAO.insertPrj3000ParamMenuInfo(prjDocInfo);
			}
		}
		
		
		
		
		if(wizardJsonData.has("class")){
			String clsPrjId = wizardJsonData.getString("class");
			
			
			Map clsNewMap = new HashMap<>();
			clsNewMap.put("selPrjId",clsPrjId);
			
			
			List<Map> clsList = req2000DAO.selectReq2000ReqClsList(clsNewMap);
			
			
			if(clsList != null && clsList.size() > 0){
				for(Map clsInfo : clsList){
					
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
		
		else{
			
			String prjNm = (String)projectJson.getString("wizard_prjNm");
			
			
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








