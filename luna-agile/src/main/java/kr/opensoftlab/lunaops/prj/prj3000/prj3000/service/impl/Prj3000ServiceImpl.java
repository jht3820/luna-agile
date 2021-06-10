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
		
		
		//확정 산출물 양식 파일 ID 저장
		fileMngDAO.insertFileMasterInfo((String) paramMap.get("docFormConfFileId"));
		
		//확정 대기 산출물 양식 파일 ID 저장
		fileMngDAO.insertFileMasterInfo((String) paramMap.get("docFormFileId"));
		
		//확정 산출물 파일 ID 저장
		fileMngDAO.insertFileMasterInfo((String) paramMap.get("docAtchFileId"));
		
		//확정 대기 산출물 파일 ID 저장
		fileMngDAO.insertFileMasterInfo((String) paramMap.get("docWaitFileId"));
		
		// 상위 조직 정보를 이용해 새 아이디 생성
		String newDocId = prj3000DAO.insertPrj3000DocInfo(paramMap);

		// 생성된 ID가 없으면 튕겨낸다.
		if (newDocId == null || "".equals(newDocId)) {
			throw new UserDefineException(egovMessageSource.getMessage("prj3000.notFoundUpperDept.fail"));
		}

		return newDocId;
	}

	
	@Override
	public void updatePrj3000DocInfo(Map<String, String> paramMap) throws Exception {

		// 산출물 양식 정보 수정하기
		int updateCnt = prj3000DAO.updatePrj3000DocInfo(paramMap);

		// 수정된 건수 없으면 튕기기
		if (updateCnt == 0) {
			throw new UserDefineException(egovMessageSource.getMessage("fail.common.update"));
		}
	}

	
	@SuppressWarnings({ "rawtypes"})
	@Override
	public void deletePrj3000DocInfo(Map<String, String> paramMap) throws Exception {
		String deleteDataList = paramMap.get("deleteDataList");

		// JSON파서 선언
		JSONParser jsonParser = new JSONParser();
		org.json.simple.JSONArray jsonArray = (org.json.simple.JSONArray) jsonParser.parse(deleteDataList);

		// 삭제 하려는 산출물 목록 지우면서 그 목록에 파일 존재할 경우 지우기
		for (int i = 0; i < jsonArray.size(); i++) {
			org.json.simple.JSONObject jsonObj = (org.json.simple.JSONObject) jsonArray.get(i);

			// json to Map
			Map infoMap = new Gson().fromJson(jsonObj.toJSONString(), new HashMap().getClass());
			
			//값을 가져오기 위한 FileVO
			FileVO fileVo = new FileVO();
			fileVo.setAtchFileId((String) infoMap.get("docFormConfFileId"));
			System.out.println((String) infoMap.get("docFormConfFileId"));
			//산출물 양식 확정 파일 리스트 가져오기
			List<FileVO> formConfFileList = fileMngDAO.selectFileInfs(fileVo);

			// 산출물 양식 확정 파일 존재할 경우 삭제
			for (FileVO fileInfo : formConfFileList) {
				
				// 파일 DB 삭제
				fileMngDAO.deleteFileInf(fileInfo);

				// 파일 물리적 삭제
				try {
					// 파일 물리적 삭제
					String fileDeletePath = fileInfo.getFileStreCours() + fileInfo.getStreFileNm();
					EgovFileMngUtil.deleteFile(fileDeletePath);
				} catch (Exception fileE) { // 물리적 파일 삭제 오류시 skip
					Log.error(fileE);
				}
			}
			
			//산출물 양식 확정 대기 파일 아이디 넣기
			fileVo.setAtchFileId((String) infoMap.get("docFormFileId"));
			System.out.println((String) infoMap.get("docFormFileId"));
			//산출물 양식 확정 대기 파일 리스트 가져오기
			List<FileVO> formFileList = fileMngDAO.selectFileInfs(fileVo);
			
			// 산출물 양식 확정 대기 파일 존재할 경우 삭제
			for (FileVO fileInfo : formFileList) {

				// 파일 DB 삭제
				fileMngDAO.deleteFileInf(fileInfo);

				// 파일 물리적 삭제
				try {
					// 파일 물리적 삭제
					String fileDeletePath = fileInfo.getFileStreCours() + fileInfo.getStreFileNm();
					EgovFileMngUtil.deleteFile(fileDeletePath);
				} catch (Exception fileE) { // 물리적 파일 삭제 오류시 skip
					Log.error(fileE);
				}
				
			}
			
			//산출물 확정 파일 아이디 넣기
			fileVo.setAtchFileId((String) infoMap.get("docAtchFileId"));
			
			//산출물 확정 파일 리스트 가져오기
			List<FileVO> atchFileList = fileMngDAO.selectFileInfs(fileVo);
			
			// 산출물 확정 파일 존재할 경우 삭제
			for (FileVO fileInfo : atchFileList) {

				// 파일 DB 삭제
				fileMngDAO.deleteFileInf(fileInfo);

				// 파일 물리적 삭제
				try {
					// 파일 물리적 삭제
					String fileDeletePath = fileInfo.getFileStreCours() + fileInfo.getStreFileNm();
					EgovFileMngUtil.deleteFile(fileDeletePath);
				} catch (Exception fileE) { // 물리적 파일 삭제 오류시 skip
					Log.error(fileE);
				}
			}
			
			//산출물 확정 대기 파일 아이디 넣기
			fileVo.setAtchFileId((String) infoMap.get("docWaitFileId"));
			
			//산출물 확정 대기 파일 리스트 가져오기
			List<FileVO> waitFileList = fileMngDAO.selectFileInfs(fileVo);
			
			// 산출물 확정 대기 파일 존재할 경우 삭제
			for (FileVO fileInfo : waitFileList) {

				// 파일 DB 삭제
				fileMngDAO.deleteFileInf(fileInfo);

				// 파일 물리적 삭제
				try {
					// 파일 물리적 삭제
					String fileDeletePath = fileInfo.getFileStreCours() + fileInfo.getStreFileNm();
					EgovFileMngUtil.deleteFile(fileDeletePath);
				} catch (Exception fileE) { // 물리적 파일 삭제 오류시 skip
					Log.error(fileE);
				}
			}			
			
			// 요구사항 삭제
			prj3000DAO.deletePrj3000DocInfo(infoMap);

		}
	}

	

	
	@Override
	public void deletePrj3000File(Map<String, String> paramMap) throws Exception {

		FileVO fileVo = new FileVO();
		fileVo.setAtchFileId(paramMap.get("atchFileId"));
		fileVo.setFileSn(paramMap.get("fileSn"));
		fileVo = fileMngDAO.selectFileInf(fileVo);

		// 파일 DB 삭제
		fileMngDAO.deleteFileInf(fileVo);

		// 파일 물리적 삭제
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
		
		
		//추가된 산출물 연결 정보
		String targetIdList = (String) paramMap.get("targetIdList");
		if(targetIdList != null && !"[]".equals(targetIdList)) {
			//JSON파서 선언
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
		
		
		//추가된 산출물 연결 정보
		String deleteDataList = (String) paramMap.get("deleteDataList");
		if(deleteDataList != null && !"[]".equals(deleteDataList)) {
			//JSON파서 선언
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

	
	
	@SuppressWarnings("rawtypes")
	public int deletePrj3000DocList(Map paramMap) throws Exception {
		return prj3000DAO.deletePrj3000DocList(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj3000RootMenuList(Map paramMap) throws Exception {
		return prj3000DAO.selectPrj3000RootMenuList(paramMap);
	}
}
