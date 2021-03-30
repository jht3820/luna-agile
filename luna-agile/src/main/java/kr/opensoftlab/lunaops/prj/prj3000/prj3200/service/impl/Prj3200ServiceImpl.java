package kr.opensoftlab.lunaops.prj.prj3000.prj3200.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.service.impl.FileManageDAO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import kr.opensoftlab.lunaops.com.fms.web.service.FileMngService;
import kr.opensoftlab.lunaops.prj.prj3000.prj3200.service.Prj3200Service;


@Service("prj3200Service")
public class Prj3200ServiceImpl extends EgovAbstractServiceImpl implements Prj3200Service{


	
    @Resource(name="prj3200DAO")
    private Prj3200DAO prj3200DAO;

	@Resource(name = "FileManageDAO")
	private FileManageDAO fileMngDAO;
	
	
   	@Resource(name="fileMngService")
   	private FileMngService fileMngService;
   	
    @Resource(name = "egovFileIdGnrService")
	private EgovIdGnrService idgenService;
    
    
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	
	@Override
	public int selectPrj3200DocConListCnt(Map<String, String> paramMap) throws Exception {
		return prj3200DAO.selectPrj3200DocConListCnt(paramMap);
	}

	
	@SuppressWarnings({ "rawtypes" })
	@Override
	public List<Map> selectPrj3200DocConList(Map<String, String> paramMap) throws Exception {
		return prj3200DAO.selectPrj3200DocConList(paramMap);
	}

	
	@Override
	public int selectPrj3200ConTargetCnt(Map<String, String> paramMap) throws Exception {
		return prj3200DAO.selectPrj3200ConTargetCnt(paramMap);
	}

	
	@SuppressWarnings({ "rawtypes" })
	@Override
	public List selectPrj3200ConTargetList(Map<String, String> paramMap) throws Exception {
		return prj3200DAO.selectPrj3200ConTargetList(paramMap);
	}

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public void insertPrj3200DocConInfo(Map<String, String> paramMap) throws Exception {
		
		
		
		
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
				prj3200DAO.insertPrj3200DocConInfo(paramMap);
			}
		}
		
		
		
	}

	
	@Override
	public void deletePrj3200DocConInfo(Map<String, String> paramMap) throws Exception {
		
		
		
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
				prj3200DAO.deletePrj3200DocConInfo(paramMap);
			}
		}
	}

}
