package kr.opensoftlab.lunaops.prj.prj3000.prj3000.service.impl;

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
		JSONArray jsonArray = (JSONArray) jsonParser.parse(deleteDataList);

		
		for (int i = 0; i < jsonArray.size(); i++) {
			JSONObject jsonObj = (JSONObject) jsonArray.get(i);

			
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
	
	
	
	
	
	
	
	
	
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Map insertPrj3000MenuInfo(Map paramMap) throws Exception {
		Map map = prj3000DAO.selectPrj3000MenuInfo(paramMap);

		
		map.put("regUsrId", paramMap.get("regUsrId"));
		map.put("modifyUsrId", paramMap.get("modifyUsrId"));
		map.put("regUsrIp", paramMap.get("regUsrIp"));
		map.put("modifyUsrIp", paramMap.get("modifyUsrIp"));

		
		map.put("docFormFileSn", 0);

		
		

		map.put("docFormFileId", paramMap.get("fileFormId"));
		fileMngDAO.insertFileMasterInfo((String) paramMap.get("fileFormId"));

		map.put("docAtchFileId", paramMap.get("fileAtchId"));
		fileMngDAO.insertFileMasterInfo((String) paramMap.get("fileAtchId"));

		
		String insDocId = prj3000DAO.insertPrj3000MenuInfo(map);

		
		if (insDocId == null || "".equals(insDocId)) {
			throw new Exception(egovMessageSource.getMessage("prj3000.fail.menu.insert"));
		}

		
		map.put("docId", insDocId);

		Map newMap = prj3000DAO.selectPrj3000MenuInfo(map);

		return newMap;
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void deletePrj3000MenuInfo(Map paramMap) throws Exception {

		
		List<Map<String, String>> list = (List<Map<String, String>>) paramMap.get("list");
		
		String licGrpId = (String) paramMap.get("licGrpId");
		String prjId = (String) paramMap.get("prjId");

		
		List<String> atchFileIdList = new ArrayList<String>();

		
		for (Map docMap : list) {

			
			docMap.put("licGrpId", licGrpId);
			docMap.put("prjId", prjId);

			
			prj3000DAO.deletePrj3000MenuInfo(docMap);

			
			String docAtchFileId = (String) docMap.get("docAtchFileId");
			
			String docFormFileId = (String) docMap.get("docFormFileId");

			
			if (docAtchFileId != null && !"".equals(docAtchFileId)) {
				atchFileIdList.add(docAtchFileId);
			}

			
			if (docFormFileId != null && !"".equals(docFormFileId)) {
				atchFileIdList.add(docFormFileId);
			}
		}

		
		List<FileVO> delFileList = new ArrayList<FileVO>();

		
		if (atchFileIdList.size() > 0) {

			for (String atchFileIdStr : atchFileIdList) {
				FileVO fileVo = new FileVO();
				fileVo.setAtchFileId(atchFileIdStr);

				
				List<FileVO> selFileList = fileMngDAO.selectFileInfs(fileVo);
				delFileList.addAll(selFileList);
			}
		}

		
		if (delFileList.size() > 0) {
			
			for (FileVO delFileInfo : delFileList) {
				
				fileMngDAO.deleteAllFileInf(delFileInfo);
				fileMngDAO.deleteFileInf(delFileInfo);
			}

			
			for (FileVO delFileInfo : delFileList) {
				try {
					
					String fileDeletePath = delFileInfo.getFileStreCours() + delFileInfo.getStreFileNm();
					EgovFileMngUtil.deleteFile(fileDeletePath);
				} catch (Exception fileE) {
					
					continue;
				}
			}
		}
	}
	
	
	@SuppressWarnings("rawtypes")
	public int deletePrj3000DocList(Map paramMap) throws Exception {
		return prj3000DAO.deletePrj3000DocList(paramMap);
	}

	
	
	@SuppressWarnings("rawtypes")
	public void updatePrj3000MenuInfo(Map paramMap) throws Exception {
		
		int upCnt = prj3000DAO.updatePrj3000MenuInfo(paramMap);

		
		if (upCnt == 0) {
			throw new Exception(egovMessageSource.getMessage("fail.common.update"));
		}
	}
	
	
	@SuppressWarnings("rawtypes")
	public void updatePrj3000FileSnSelect(Map paramMap) throws Exception {
		int upCnt = prj3000DAO.updatePrj3000FileSnSelect(paramMap);

		
		if (upCnt == 0) {
			throw new Exception(egovMessageSource.getMessage("fail.common.update"));
		}
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj3000MenuTree(Map paramMap) throws Exception {
		return prj3000DAO.selectPrj3000MenuTree(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj3000RootMenuList(Map paramMap) throws Exception {
		return prj3000DAO.selectPrj3000RootMenuList(paramMap);
	}
	
	
	
	@Override
	public int updatePrj3000FormFileId(Map<String, String> paramMap) throws Exception {
		return prj3000DAO.updatePrj3000FormFileId(paramMap);
	}
}
