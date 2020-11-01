package kr.opensoftlab.lunaops.bad.bad1000.bad1000.service.impl;

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

import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.service.impl.FileManageDAO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.opensoftlab.lunaops.bad.bad1000.bad1000.service.Bad1000Service;
import kr.opensoftlab.lunaops.bad.bad1000.bad1100.service.impl.Bad1100DAO;
import kr.opensoftlab.lunaops.bad.bad1000.bad1200.service.impl.Bad1200DAO;
import kr.opensoftlab.lunaops.com.fms.web.service.FileMngService;
import kr.opensoftlab.lunaops.stm.stm2000.stm2100.service.impl.Stm2100DAO;
import kr.opensoftlab.lunaops.tag.tag1000.tag1000.service.impl.Tag1000DAO;



@Service("bad1000Service")
public class Bad1000ServiceImpl extends EgovAbstractServiceImpl implements Bad1000Service {

	
	@Resource(name="bad1000DAO")
	private Bad1000DAO bad1000DAO;
	
	
	@Resource(name="bad1100DAO")
	private Bad1100DAO bad1100DAO;
	
	
	@Resource(name="bad1200DAO")
	private Bad1200DAO bad1200DAO;

	
	@Resource(name="tag1000DAO")
	private Tag1000DAO tag1000DAO;
	
	
	@Resource(name="stm2100DAO")
	private Stm2100DAO stm2100DAO;

	
	@Resource(name = "FileManageDAO")
	private FileManageDAO fileMngDAO;
	
	
   	@Resource(name="fileMngService")
   	private FileMngService fileMngService;
   	
	
	@SuppressWarnings({ "rawtypes" })
	public int selectBad1000BadListCnt(Map paramMap) throws Exception {
		return bad1000DAO.selectBad1000BadListCnt(paramMap);
	}

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Map> selectBad1000BadList(Map paramMap) throws Exception {
		
		Map stmInfo = stm2100DAO.selectStm2100BadInfo(paramMap);
		
		
		paramMap.put("dsTypeCd", stmInfo.get("stmDsTypeCd"));
		
		
		paramMap.put("stmNtcYnCd", stmInfo.get("stmNtcYnCd"));

		
		if(paramMap.get("searchTargetId") != null && paramMap.get("searchTargetId") != "-1") {
			if("badWtdtm".equals(paramMap.get("searchTargetId"))) {
				String searchDate[] = ((String) paramMap.get("searchTargetData")).split(" - ");
				paramMap.put("searchStartDt", searchDate[0]+" 00:00:00");
				paramMap.put("searchEndDt", searchDate[1]+" 23:59:59");
			}
		}
		
		


				



		
		return bad1000DAO.selectBad1000BadList(paramMap);
	}
	
	
	public String selectBad1000BadPwInfo(Map<String, String> paramMap) throws Exception{
		String badId = bad1000DAO.selectBad1000BadPwInfo(paramMap);
		if(badId == null || badId == "") {
			return "N";
		}else {
			return "Y";
		}
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Map selectBad1000BadInfo(Map paramMap) throws Exception{

		
		Map bad1000Info = bad1000DAO.selectBad1000BadInfo(paramMap);
		
		
		if("true".equals(paramMap.get("badHit"))) {
			bad1000DAO.updateBad1000BadHit(paramMap);
		}
			
		return bad1000Info;
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Map> selectBad1000BadListTagList(Map paramMap) throws Exception{
		
		List<Map> tagList = bad1000DAO.selectBad1000BadListTagList(paramMap);
		
		
		for(int i=0; i<tagList.size(); i++) {
			tagList.get(i).put("tagNm", tag1000DAO.selectTag1000TagInfo(tagList.get(i)));
		}
		
		return tagList;
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<String> selectBad1000BadTagList(Map paramMap) throws Exception{
		
		List<Map> tagList = bad1000DAO.selectBad1000BadTagList(paramMap);
		
		List<String> tags = null;
		
		if( tagList != null) {
			tags = new ArrayList<>();
			for(int i=0; i<tagList.size(); i++) {
				tags.add(tag1000DAO.selectTag1000TagInfo(tagList.get(i)));
			}
		}
		return tags;
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void insertBad1000Badinfo(Map paramMap) throws Exception{
		
		String badIdStr = bad1000DAO.insertBad1000BadInfo(paramMap);
		paramMap.put("badId", badIdStr);

		
		String str = (String) paramMap.get("tagList");

		
		if(str != null && !"[]".equals(str)) {
			str = str.substring(1, str.length()-1);
			str = str.replaceAll("\"", "");
			String[] tagNm = str.split(",");
			
			if(tagNm.length>0 && tagNm[0] != "") {
				List<String> tagList = new ArrayList<>();
				
				
				for(int i=0; i<tagNm.length; i++) {
					paramMap.put("tagNm", tagNm[i]);
					String tag = tag1000DAO.selectTag1000TagInfoCheck(paramMap);
					
					if(tag == null || tag.length() == 0) {
						
						tag = tag1000DAO.insertTag1000TagInfo(paramMap);
						tagList.add(tag);
					}else {
						
						tagList.add(tag);
					}
				}
				
				
				for(int i=0; i<tagList.size(); i++) {
					paramMap.put("tagId", tagList.get(i));
					bad1000DAO.insertBad1010BadTagInfo(paramMap);
				}
			}
		}
		
		
		Map histInfo = bad1000DAO.selectBad1000ForBadHstInfo(paramMap);
		
		histInfo.put("modifyUsrId", paramMap.get("modifyUsrId"));
		histInfo.put("modifyUsrIp", paramMap.get("modifyUsrIp"));
		
		histInfo.put("badHstTypeCd", "01");
		
		bad1200DAO.insertBad1200BadInfo(histInfo);
	}
		
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void updateBad1000BadInfo(Map paramMap) throws Exception{
		
		bad1000DAO.updateBad1000BadInfo(paramMap);
		
		
		bad1000DAO.deleteBad1000BadTagList(paramMap);
		
		
		
		String str = (String) paramMap.get("tagList");

		
		if(!"[]".equals(str)) {
			str = str.substring(1, str.length()-1);
			str = str.replaceAll("\"", "");
			String[] tagNm = str.split(",");
			
			if(tagNm.length>0) {
				List<String> tagList = new ArrayList<>();
				
				
				for(int i=0; i<tagNm.length; i++) {
					paramMap.put("tagNm", tagNm[i]);
					String tag = tag1000DAO.selectTag1000TagInfoCheck(paramMap);
					
					if(tag == null || tag.length() == 0) {
						
						tag = tag1000DAO.insertTag1000TagInfo(paramMap);
						tagList.add(tag);
					}else {
						
						tagList.add(tag);
					}
				}
				
				
				for(int i=0; i<tagList.size(); i++) {
					paramMap.put("tagId", tagList.get(i));
					bad1000DAO.insertBad1010BadTagInfo(paramMap);
				}
			}
		}

		
		String atchFileId = (String) paramMap.get("atchFileId");
		
		
		String removeFileStr = (String) paramMap.get("fileHistory");
		
		
		JSONParser jsonParser = new JSONParser();
		JSONArray jsonArray = (JSONArray) jsonParser.parse(removeFileStr);
		
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
		
		
		Map histInfo = bad1000DAO.selectBad1000ForBadHstInfo(paramMap);
		
		histInfo.put("modifyUsrId", paramMap.get("modifyUsrId"));
		histInfo.put("modifyUsrIp", paramMap.get("modifyUsrIp"));
		
		histInfo.put("badHstTypeCd", "02");
		
		bad1200DAO.insertBad1200BadInfo(histInfo);
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void deleteBad1000BadList(Map paramMap) throws Exception{

		
		String deleteDataList = (String) paramMap.get("deleteDataList");
		Map deleteDataType =  new Gson().fromJson((String) paramMap.get("deleteDataType"), new HashMap().getClass());
		
		
		JSONParser jsonParser = new JSONParser();
		JSONArray jsonArray = (JSONArray) jsonParser.parse(deleteDataList);

		JSONObject jsonObj = null;
		


		
		
		Map<String, String> deleteBadCmt = new HashMap<>();
		
		deleteBadCmt.put("delTypeCd", "01");
		deleteBadCmt.put("delTxt", "(일괄) 게시글 삭제");
		deleteBadCmt.put("dsTypeCd", (String) paramMap.get("dsTypeCd"));
		deleteBadCmt.put("licGrpId", (String) paramMap.get("licGrpId"));
		deleteBadCmt.put("modifyUsrId", (String) paramMap.get("modifyUsrId"));
		deleteBadCmt.put("modifyUsrIp", (String) paramMap.get("modifyUsrIp"));
				
		
		
		for(int i=0; i<jsonArray.size(); i++) {
			jsonObj = (JSONObject) jsonArray.get(i);
			
			Map infoMap = new Gson().fromJson(jsonObj.toJSONString(), new HashMap().getClass());
			
			infoMap.put("delTypeCd", deleteDataType.get("delTypeCd"));
			infoMap.put("delTxt", deleteDataType.get("delTxt"));
			
			infoMap.put("menuId", paramMap.get("menuId"));
			infoMap.put("licGrpId", paramMap.get("licGrpId"));
			infoMap.put("modifyUsrId", paramMap.get("modifyUsrId"));
			infoMap.put("modifyUsrIp", paramMap.get("modifyUsrIp"));
			
			
			Map histInfo = bad1000DAO.selectBad1000ForBadHstInfo(infoMap);
			
			histInfo.put("modifyUsrId", paramMap.get("modifyUsrId"));
			histInfo.put("modifyUsrIp", paramMap.get("modifyUsrIp"));
			
			histInfo.put("badHstTypeCd", "03");
			
			bad1200DAO.insertBad1200BadInfo(histInfo);
			
			
			bad1000DAO.deleteBad1000BadInfo(infoMap);
			













			
			
			deleteBadCmt.put("badId", (String) histInfo.get("badId")); 
			deleteBadCmt.put("menuId", (String) histInfo.get("menuId"));
			deleteBadCmt.put("prjGrpId", (String) deleteDataType.get("prjGrpId"));
			deleteBadCmt.put("prjId", (String) deleteDataType.get("prjId"));
			bad1100DAO.deleteBad1100CmtInfo(deleteBadCmt);
		}

















	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void updateBad1000BadRestore(Map paramMap) throws Exception{
		
		
		bad1000DAO.updateBad1000BadRestore(paramMap);
		
		Map histInfo = bad1000DAO.selectBad1000BadInfo(paramMap);
		
		histInfo.put("badHstTypeCd", "04");
		
		histInfo.put("modifyUsrId", paramMap.get("modifyUsrId"));
		histInfo.put("modifyUsrIp", paramMap.get("modifyUsrIp"));
		
		bad1200DAO.insertBad1200BadInfo(histInfo);
		
		bad1100DAO.updateBad1100CmtRestore(paramMap);
	}

}
