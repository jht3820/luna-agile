package kr.opensoftlab.lunaops.prj.prj3000.prj3000.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.jfree.util.Log;
import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.service.impl.FileManageDAO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.opensoftlab.lunaops.com.exception.UserDefineException;
import kr.opensoftlab.lunaops.prj.prj3000.prj3000.service.Prj3000Service;



@Service("prj3000Service")
public class Prj3000ServiceImpl extends EgovAbstractServiceImpl implements Prj3000Service {

	
	@Resource(name = "prj3000DAO")
	private Prj3000DAO prj3000DAO;

	@Resource(name = "FileManageDAO")
	private FileManageDAO fileMngDAO;

	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	
	@SuppressWarnings("rawtypes")
	public List selectPrj3000BaseMenuList(Map paramMap) throws Exception {
		return prj3000DAO.selectPrj3000BaseMenuList(paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public Map selectPrj3000MenuInfo(Map paramMap) throws Exception {
		return prj3000DAO.selectPrj3000MenuInfo(paramMap);
	}
	
	

	
	@SuppressWarnings("rawtypes")
	public String insertPrj3000RootMenuInfo(Map paramMap) throws Exception {
		
		
		fileMngDAO.insertFileMasterInfo((String) paramMap.get("docFormConfFileId"));
		
		
		fileMngDAO.insertFileMasterInfo((String) paramMap.get("docFormFileId"));
		
		
		fileMngDAO.insertFileMasterInfo((String) paramMap.get("docAtchFileId"));
		
		
		fileMngDAO.insertFileMasterInfo((String) paramMap.get("docWaitFileId"));
		
		return prj3000DAO.insertPrj3000RootMenuInfo(paramMap);
	}


	
	@SuppressWarnings("rawtypes")
	public Map selectPrj3000WizardMenuInfo(Map paramMap) throws Exception {
		return prj3000DAO.selectPrj3000WizardMenuInfo(paramMap);
	}

	
	@Override
	public int selectPrj3000DocNextOrd(Map<String, String> paramMap) throws Exception {
		return prj3000DAO.selectPrj3000DocNextOrd(paramMap);
	}

	
	@Override
	public String insertPrj3000DocInfo(Map<String, String> paramMap) throws Exception {
		
		
		
		fileMngDAO.insertFileMasterInfo((String) paramMap.get("docFormConfFileId"));
		
		
		fileMngDAO.insertFileMasterInfo((String) paramMap.get("docFormFileId"));
		
		
		fileMngDAO.insertFileMasterInfo((String) paramMap.get("docAtchFileId"));
		
		
		fileMngDAO.insertFileMasterInfo((String) paramMap.get("docWaitFileId"));
		
		
		String newDocId = prj3000DAO.insertPrj3000DocInfo(paramMap);

		
		if (newDocId == null || "".equals(newDocId)) {
			throw new UserDefineException(egovMessageSource.getMessage("prj3000.notFoundUpperDept.fail"));
		}

		return newDocId;
	}

	
	@Override
	public void updatePrj3000DocInfo(Map<String, String> paramMap) throws Exception {

		
		int updateCnt = prj3000DAO.updatePrj3000DocInfo(paramMap);

		
		if (updateCnt == 0) {
			throw new UserDefineException(egovMessageSource.getMessage("fail.common.update"));
		}
	}

	
	@SuppressWarnings({ "rawtypes"})
	@Override
	public void deletePrj3000DocInfo(Map<String, String> paramMap) throws Exception {
		String deleteDataList = paramMap.get("deleteDataList");

		
		JSONParser jsonParser = new JSONParser();
		org.json.simple.JSONArray jsonArray = (org.json.simple.JSONArray) jsonParser.parse(deleteDataList);

		
		for (int i = 0; i < jsonArray.size(); i++) {
			org.json.simple.JSONObject jsonObj = (org.json.simple.JSONObject) jsonArray.get(i);

			
			Map infoMap = new Gson().fromJson(jsonObj.toJSONString(), new HashMap().getClass());
			
			
			FileVO fileVo = new FileVO();
			fileVo.setAtchFileId((String) infoMap.get("docFormConfFileId"));
			System.out.println((String) infoMap.get("docFormConfFileId"));
			
			List<FileVO> formConfFileList = fileMngDAO.selectFileInfs(fileVo);

			
			for (FileVO fileInfo : formConfFileList) {
				
				
				fileMngDAO.deleteFileInf(fileInfo);

				
				try {
					
					String fileDeletePath = fileInfo.getFileStreCours() + fileInfo.getStreFileNm();
					EgovFileMngUtil.deleteFile(fileDeletePath);
				} catch (Exception fileE) { 
					Log.error(fileE);
				}
			}
			
			
			fileVo.setAtchFileId((String) infoMap.get("docFormFileId"));
			System.out.println((String) infoMap.get("docFormFileId"));
			
			List<FileVO> formFileList = fileMngDAO.selectFileInfs(fileVo);
			
			
			for (FileVO fileInfo : formFileList) {

				
				fileMngDAO.deleteFileInf(fileInfo);

				
				try {
					
					String fileDeletePath = fileInfo.getFileStreCours() + fileInfo.getStreFileNm();
					EgovFileMngUtil.deleteFile(fileDeletePath);
				} catch (Exception fileE) { 
					Log.error(fileE);
				}
				
			}
			
			
			fileVo.setAtchFileId((String) infoMap.get("docAtchFileId"));
			
			
			List<FileVO> atchFileList = fileMngDAO.selectFileInfs(fileVo);
			
			
			for (FileVO fileInfo : atchFileList) {

				
				fileMngDAO.deleteFileInf(fileInfo);

				
				try {
					
					String fileDeletePath = fileInfo.getFileStreCours() + fileInfo.getStreFileNm();
					EgovFileMngUtil.deleteFile(fileDeletePath);
				} catch (Exception fileE) { 
					Log.error(fileE);
				}
			}
			
			
			fileVo.setAtchFileId((String) infoMap.get("docWaitFileId"));
			
			
			List<FileVO> waitFileList = fileMngDAO.selectFileInfs(fileVo);
			
			
			for (FileVO fileInfo : waitFileList) {

				
				fileMngDAO.deleteFileInf(fileInfo);

				
				try {
					
					String fileDeletePath = fileInfo.getFileStreCours() + fileInfo.getStreFileNm();
					EgovFileMngUtil.deleteFile(fileDeletePath);
				} catch (Exception fileE) { 
					Log.error(fileE);
				}
			}			
			
			
			prj3000DAO.deletePrj3000DocInfo(infoMap);

		}
	}

	

	
	@Override
	public void deletePrj3000File(Map<String, String> paramMap) throws Exception {

		FileVO fileVo = new FileVO();
		fileVo.setAtchFileId(paramMap.get("atchFileId"));
		fileVo.setFileSn(paramMap.get("fileSn"));
		fileVo = fileMngDAO.selectFileInf(fileVo);

		
		fileMngDAO.deleteFileInf(fileVo);

		
		String fileDeletePath = fileVo.getFileStreCours() + fileVo.getStreFileNm();
		EgovFileMngUtil.deleteFile(fileDeletePath);

	}

	
	@Override
	public void updatePrj3000FileType(Map<String, String> paramMap) throws Exception {
		prj3000DAO.updatePrj3000FileType(paramMap);
		
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj3000MenuTree(Map paramMap) throws Exception {
		return prj3000DAO.selectPrj3000MenuTree(paramMap);
	}
	
	
	@Override
	public int selectPrj3002DocConListCnt(Map<String, String> paramMap) throws Exception {
		return prj3000DAO.selectPrj3002DocConListCnt(paramMap);
	}

	
	@SuppressWarnings({ "rawtypes" })
	@Override
	public List<Map> selectPrj3002DocConList(Map<String, String> paramMap) throws Exception {
		return prj3000DAO.selectPrj3002DocConList(paramMap);
	}

	
	@Override
	public int selectPrj3002ConTargetCnt(Map<String, String> paramMap) throws Exception {
		return prj3000DAO.selectPrj3002ConTargetCnt(paramMap);
	}

	
	@SuppressWarnings({ "rawtypes" })
	@Override
	public List selectPrj3002ConTargetList(Map<String, String> paramMap) throws Exception {
		return prj3000DAO.selectPrj3002ConTargetList(paramMap);
	}

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public void insertPrj3002DocConInfo(Map<String, String> paramMap) throws Exception {
		
		
		
		
		String targetIdList = (String) paramMap.get("targetIdList");
		if(targetIdList != null && !"[]".equals(targetIdList)) {
			
			JSONArray jsonArray = new JSONArray(targetIdList);
			
			
			for(int i=0;i<jsonArray.length();i++) {
				JSONObject jsonObj = (JSONObject) jsonArray.get(i);
				String targetId = jsonObj.getString("targetId");
				String targetCd = jsonObj.getString("targetCd");
				String docId = jsonObj.getString("docId");
				paramMap.put("targetId", targetId);
				paramMap.put("targetCd", targetCd);
				paramMap.put("docId", docId);
				prj3000DAO.insertPrj3002DocConInfo(paramMap);
			}
		}
		
		
		
	}

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public void deletePrj3002DocConInfo(Map<String, String> paramMap) throws Exception {
		
		
		
		String deleteDataList = (String) paramMap.get("deleteDataList");
		if(deleteDataList != null && !"[]".equals(deleteDataList)) {
			
			JSONArray jsonArray = new JSONArray(deleteDataList);
			
			
			for(int i=0;i<jsonArray.length();i++) {
				JSONObject jsonObj = (JSONObject) jsonArray.get(i);
				String prjGrpId = jsonObj.getString("prjGrpId");
				String prjId = jsonObj.getString("prjId");
				String targetId = jsonObj.getString("targetId");
				String targetCd = jsonObj.getString("targetCd");
				String docId = jsonObj.getString("docId");
				paramMap.put("prjGrpId", prjGrpId);
				paramMap.put("prjId", prjId);
				paramMap.put("targetId", targetId);
				paramMap.put("targetCd", targetCd);
				paramMap.put("docId", docId);
				prj3000DAO.deletePrj3002DocConInfo(paramMap);
			}
		}
	}

	
	
	
	
}
