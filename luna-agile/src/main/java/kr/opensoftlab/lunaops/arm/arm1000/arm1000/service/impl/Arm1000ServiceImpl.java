package kr.opensoftlab.lunaops.arm.arm1000.arm1000.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.jfree.util.Log;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.service.impl.FileManageDAO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.opensoftlab.lunaops.arm.arm1000.arm1000.service.Arm1000Service;



@Service("arm1000Service")
public class Arm1000ServiceImpl extends EgovAbstractServiceImpl implements Arm1000Service {

	
    @Resource(name="arm1000DAO")
    private Arm1000DAO arm1000DAO;
    
    @Resource(name = "FileManageDAO")
	private FileManageDAO fileMngDAO;
    
    
   	@Resource(name = "egovMessageSource")
   	EgovMessageSource egovMessageSource;

   	
    

   	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private Map<String, String> selectArm1000JsonToMap(Map paramMap){
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
	public int selectArm1000AlarmListCnt(Map paramMap) throws Exception {
		return arm1000DAO.selectArm1000AlarmListCnt(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectArm1000AlarmList(Map paramMap) throws Exception {
		 return arm1000DAO.selectArm1000AlarmList(paramMap);
    }
	
	
	@SuppressWarnings("rawtypes")
	public Map selectArm1000AlarmInfo(Map paramMap) throws Exception {
		return arm1000DAO.selectArm1000AlarmInfo(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void insertArm1000AlarmInfo(Map paramMap) throws Exception {
		Map<String, String> convertParamMap = selectArm1000JsonToMap(paramMap);
		
		
		
		String idStr = (String) convertParamMap.get("idList");

		
		if(idStr != null && !"[]".equals(idStr)) {
			idStr = idStr.substring(1, idStr.length()-1);
			idStr = idStr.replaceAll("\"", "");
			String[] usrId = idStr.split(",");
			
			if(usrId.length>0 && usrId[0] != "") {
				for(int i=0; i<usrId.length; i++) {
					convertParamMap.put("getUsrId", usrId[i]);
					
					
					arm1000DAO.insertArm1000AlarmInfo(convertParamMap);
				}
			}
		}
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void updateArm1000AlarmInfo(Map paramMap) throws Exception {
		String dataList = (String) paramMap.get("dataList");
		
		
		JSONParser jsonParser = new JSONParser();
		JSONArray jsonArray = (JSONArray) jsonParser.parse(dataList);

		
		for(int i=0;i<jsonArray.size();i++) {
			JSONObject jsonObj = (JSONObject) jsonArray.get(i);
			
			
			Map infoMap = new Gson().fromJson(jsonObj.toJSONString(), new HashMap().getClass());
			
			
			infoMap.put("licGrpId", paramMap.get("licGrpId"));
			infoMap.put("modifyUsrId", paramMap.get("modifyUsrId"));
			infoMap.put("modifyUsrIp", paramMap.get("modifyUsrIp"));
		
			
			arm1000DAO.updateArm1000AlarmInfo(infoMap);
		}
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void deleteArm1000AlarmInfo(Map paramMap) throws Exception {
		String dataList = (String) paramMap.get("dataList");
		
		
		JSONParser jsonParser = new JSONParser();
		JSONArray jsonArray = (JSONArray) jsonParser.parse(dataList);

		
		for(int i=0;i<jsonArray.size();i++) {
			JSONObject jsonObj = (JSONObject) jsonArray.get(i);
			
			
			Map infoMap = new Gson().fromJson(jsonObj.toJSONString(), new HashMap().getClass());
			
			
			infoMap.put("licGrpId", paramMap.get("licGrpId"));
			infoMap.put("modifyUsrId", paramMap.get("modifyUsrId"));
			infoMap.put("modifyUsrIp", paramMap.get("modifyUsrIp"));
		
			
			arm1000DAO.deleteArm1000AlarmInfo(infoMap);
			
			
			
			String atchFileId = (String) infoMap.get("atchFileId");
			
			FileVO fileVo = new FileVO();
			fileVo.setAtchFileId(atchFileId);
			
			List<FileVO> selFileList = fileMngDAO.selectFileInfs(fileVo);
			
			
			for(FileVO fileInfo : selFileList) {
				
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
