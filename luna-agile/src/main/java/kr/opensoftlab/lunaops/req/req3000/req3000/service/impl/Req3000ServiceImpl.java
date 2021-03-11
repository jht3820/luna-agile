package kr.opensoftlab.lunaops.req.req3000.req3000.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.jfree.util.Log;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.service.impl.FileManageDAO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.opensoftlab.lunaops.com.fms.web.service.FileMngService;
import kr.opensoftlab.lunaops.req.req3000.req3000.service.Req3000Service;
import kr.opensoftlab.lunaops.req.req4000.req4100.service.impl.Req4100DAO;
import kr.opensoftlab.sdf.util.CommonScrty;




@Service("req3000Service")
public class Req3000ServiceImpl extends EgovAbstractServiceImpl implements Req3000Service{
	
	
	@Resource(name="req3000DAO")
	private Req3000DAO req3000DAO;
	
	
    @Resource(name="req4100DAO")
    private Req4100DAO req4100DAO;
    
    @Resource(name = "FileManageDAO")
	private FileManageDAO fileMngDAO;
    
    
   	@Resource(name="fileMngService")
   	private FileMngService fileMngService;
   	
    
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	
	@SuppressWarnings("rawtypes")
	@Override
	public List selectReq3000ReqGrpList(Map<String, String> paramMap) throws Exception{
		return req3000DAO.selectReq3000ReqGrpList(paramMap);
	}
	
	
	@Override
	public int selectReq3000ReqGrpListCnt(Map<String, String> paramMap) throws Exception{
		return req3000DAO.selectReq3000ReqGrpListCnt(paramMap);
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes"})
	@Override
	public Object saveReq3000ReqGrpInfo(Map<String, String> paramMap)  throws Exception{
		
		Map<String, String> convertParamMap = selectReq3000JsonToMap(paramMap);
		
		
    	Map prjInfo = req4100DAO.selectReq4100ReqPrjInfo(convertParamMap);
    	
    	String prjAcrm = (String) prjInfo.get("prjAcrm");
    	
    	String popupType = convertParamMap.get("type");
    	
		
		String prjId = (String) convertParamMap.get("prjId");
		String prjGrpId = (String) convertParamMap.get("prjGrpId");
		String regUsrId = (String)convertParamMap.get("regUsrId");
		String regUsrIp = (String)convertParamMap.get("regUsrIp");
		
		
		if("insert".equals(popupType) ){
			
			String nextOrd = req4100DAO.selectReq4100NextReqOrd(convertParamMap);
			String newReqOrd = nextOrd;
						
			
			if(prjAcrm != null && !"".equals(prjAcrm)){
				newReqOrd = prjAcrm+"-"+nextOrd;
			}
			
			convertParamMap.put("reqOrd", newReqOrd);			
			
			
			String insNewReqGrpId = req3000DAO.insertReq3000ReqGrpInfo(convertParamMap);
			
			
			String enReqGrpKey = CommonScrty.encryptedAria(prjId, insNewReqGrpId);
			
			
			convertParamMap.put("reqGrpId", insNewReqGrpId);
			convertParamMap.put("reqGrpKey", enReqGrpKey);
			convertParamMap.put("useCd", "01");
			
			
			req3000DAO.updateReq3000ReqGrpInfo(convertParamMap);
			
			
			JSONParser jsonParser = new JSONParser();
			
			String reqGrpLinkReqList = convertParamMap.get("reqGrpLinkReqList");
			
			
			List<Map<String, String>> reqLinkDatas = new ArrayList();
					
			
			JSONArray jsonArray = (JSONArray) jsonParser.parse(reqGrpLinkReqList);
			for(int i=0; i<jsonArray.size(); i++){
				org.json.simple.JSONObject token = (org.json.simple.JSONObject) jsonArray.get(i);
				token.put("prjGrpId", prjGrpId);
				token.put("regGrpId", insNewReqGrpId);
				token.put("regUsrId", regUsrId);
				token.put("regUsrIp", regUsrIp);
				
				HashMap<String, String> tokenObj = new ObjectMapper().readValue(token.toString(), HashMap.class) ;
				
				reqLinkDatas.add(tokenObj);
			}
			
			for(Map data : reqLinkDatas){
				data.put("regUsrId", paramMap.get("regUsrId"));
				data.put("regUsrIp", paramMap.get("regUsrIp"));
				data.put("reqGrpId", insNewReqGrpId);
				
				
				req3000DAO.insertReq3001ReqGrpLinkReqInfo(data);
			}
			return insNewReqGrpId;
		}
		
		else if("update".equals(popupType)) {
			
			
			convertParamMap.put("useCd", "01");
			
			int uptCnt = req3000DAO.updateReq3000ReqGrpInfo(convertParamMap);
			
			
			req3000DAO.deleteReq3001ReqConList(convertParamMap);
			
			
			
			JSONParser jsonParser = new JSONParser();
			
			String reqGrpLinkReqList = convertParamMap.get("reqGrpLinkReqList");
			String reqGrpId = convertParamMap.get("reqGrpId");
			
			
			
			List<Map<String, String>> reqLinkDatas = new ArrayList();
			
			
			JSONArray jsonArray = (JSONArray) jsonParser.parse(reqGrpLinkReqList);
			for(int i=0; i<jsonArray.size(); i++){
				org.json.simple.JSONObject token = (org.json.simple.JSONObject) jsonArray.get(i);
				token.put("prjGrpId", prjGrpId);
				token.put("regGrpId", reqGrpId);
				token.put("regUsrId", regUsrId);
				token.put("regUsrIp", regUsrIp);
				
				HashMap<String, String> tokenObj = new ObjectMapper().readValue(token.toString(), HashMap.class) ;
				
				reqLinkDatas.add(tokenObj);
			}
			
			for(Map data : reqLinkDatas){
				data.put("regUsrId", paramMap.get("regUsrId"));
				data.put("regUsrIp", paramMap.get("regUsrIp"));
				data.put("reqGrpId", reqGrpId);
				
				
				req3000DAO.insertReq3001ReqGrpLinkReqInfo(data);
			}
		
			
			String atchFileId = (String) convertParamMap.get("atchFileId"); 
			
			
			String removeFileStr = (String) paramMap.get("fileHistory");
			
			
			jsonArray = (JSONArray) jsonParser.parse(removeFileStr);
			
			List<String> removeFileSn = new ArrayList<String>();
			
			
			for(int i=0;i<jsonArray.size();i++) {
				JSONObject jsonObj = (JSONObject) jsonArray.get(i);
				
				String source = (String) jsonObj.get("source");
				
				
				if("remove".equals(source)) {
					
					JSONObject fileMetaInfo = (JSONObject) jsonObj.get("meta");
					Object fileSn;
					try {
						fileSn = (Long) fileMetaInfo.get("fileSn");
					}catch(ClassCastException cce) {
						fileSn = (String) fileMetaInfo.get("fileSn");
					}
				
					removeFileSn.add(String.valueOf(fileSn));
				}
			}
			
			FileVO fileVo = new FileVO();
			fileVo.setAtchFileId(atchFileId);
			
			List<FileVO> selFileList = fileMngDAO.selectFileInfs(fileVo);
			
			
			for(FileVO fileInfo : selFileList) {
				String fileSn = fileInfo.getFileSn();
				
				
				if(removeFileSn.indexOf(fileSn) != -1) {
					
					fileMngDAO.deleteFileInf(fileInfo);
					
					
					try{
						
						String fileDeletePath  = fileInfo.getFileStreCours()+fileInfo.getStreFileNm();
					    EgovFileMngUtil.deleteFile(fileDeletePath);
					}catch(Exception fileE){	
						Log.error(fileE);
					}
				}
			}
			
			
			if(uptCnt == 0 ){
				throw new Exception(egovMessageSource.getMessage("fail.common.update"));
			}
			return uptCnt;
		}

	
		return false;
	}
	
	
	@SuppressWarnings("rawtypes")
	@Override
	public List selectReq3001ReqGrpLinkReqList(Map<String, String> paramMap) throws Exception {
		return req3000DAO.selectReq3001ReqGrpLinkReqList(paramMap);
	}
	
	@Override
	public int selectReq3001ReqGrpLinkReqListCnt(Map<String, String> paramMap) throws Exception {
		return req3000DAO.selectReq3001ReqGrpLinkReqListCnt(paramMap);
	}
	
	@SuppressWarnings("rawtypes")
	@Override
	public List selectReq3002ReqGrpAddReqList(Map<String, String> paramMap) throws Exception {
		return req3000DAO.selectReq3002ReqGrpAddReqList(paramMap);
		
	}
	
	
	@Override
	public int selectReq3002ReqGrpAddReqListCnt(Map<String, String> paramMap) throws Exception {
		return req3000DAO.selectReq3002ReqGrpAddReqListCnt(paramMap);
		
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked"})
	private Map<String, String> selectReq3000JsonToMap(Map paramMap){
		Map rtnMap = new HashMap();
		for( Object key : paramMap.keySet() ) {
			String jsonVal = "";
			try{
				jsonVal = (String) paramMap.get(key);
			}catch(ClassCastException cce){	
				continue;
			}
			
			JSONObject jsonObj = null;
			
			
			try{
				JSONParser jsonParser = new JSONParser();
				jsonObj = (JSONObject) jsonParser.parse(jsonVal);
				rtnMap.put(key, jsonObj.get("optVal"));
			}catch(Exception e){
				rtnMap.put(key, jsonVal);
			}
		}
		return rtnMap;
	}

	
	@SuppressWarnings("rawtypes")
	@Override
	public Map selectReq3000ReqGrpInfo(Map<String, String> paramMap) throws Exception {
		return req3000DAO.selectReq3000ReqGrpInfo(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectReq3001ReqConList(Map<String, String> paramMap) {
		
		return req3000DAO.selectReq3001ReqConList(paramMap);
	}
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public void deleteReq3000ReqList(Map<String, String> paramMap) throws Exception {
		String deleteDataList = paramMap.get("deleteDataList");
		
		
		JSONParser jsonParser = new JSONParser();
		JSONArray jsonArray = (JSONArray) jsonParser.parse(deleteDataList);

		
		List<FileVO> removeFileList = new ArrayList();
		
		
		for(int i=0;i<jsonArray.size();i++) {
			JSONObject jsonObj = (JSONObject) jsonArray.get(i);
			
			
			Map infoMap = new Gson().fromJson(jsonObj.toJSONString(), new HashMap().getClass());
			

			
			req3000DAO.deleteReq3000ReqInfo(infoMap);
			
			
			req3000DAO.deleteReq3001ReqConList(infoMap);
			
			
			String atchFileId = (String) infoMap.get("atchFileId");
			
			
        	FileVO fileVO = new FileVO();
        	fileVO.setAtchFileId(atchFileId);
        	
        	
			List<FileVO> fileList = fileMngService.fileDownList(fileVO);
			
			if(fileList.size() > 0) {
				removeFileList.addAll(fileList);
			}
		}
		
		if(removeFileList.size() > 0) {
			
			for(FileVO fileInfo : removeFileList) {
				
				fileMngDAO.deleteFileInf(fileInfo);
				
				
				try{
					
					String fileDeletePath  = fileInfo.getFileStreCours()+fileInfo.getStreFileNm();
				    EgovFileMngUtil.deleteFile(fileDeletePath);
				}catch(Exception fileE){	
					Log.error(fileE);
				}
			}
		}
		
	}
	
}
