package kr.opensoftlab.lunaops.req.req1000.req1000.service.impl;

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
import egovframework.com.utl.sim.service.EgovFileScrty;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import kr.opensoftlab.lunaops.arm.arm1000.arm1000.service.impl.Arm1000DAO;
import kr.opensoftlab.lunaops.com.exception.UserDefineException;
import kr.opensoftlab.lunaops.com.fms.web.service.FileMngService;
import kr.opensoftlab.lunaops.prj.prj1000.prj1300.service.impl.Prj1300DAO;
import kr.opensoftlab.lunaops.req.req1000.req1000.service.Req1000Service;
import kr.opensoftlab.lunaops.req.req1000.req1000.vo.Req1000VO;
import kr.opensoftlab.lunaops.req.req6000.req6000.service.Req6000Service;
import kr.opensoftlab.sdf.excel.ExcelDataListResultHandler;
import kr.opensoftlab.sdf.util.CommonScrty;
import kr.opensoftlab.sdf.util.WebhookSend;

@Service("req1000Service")
public class Req1000ServiceImpl extends EgovAbstractServiceImpl implements Req1000Service {
	
	
    @Resource(name="arm1000DAO")
    private Arm1000DAO arm1000DAO;

	
    @Resource(name="req1000DAO")
    private Req1000DAO req1000DAO;

	
    @Resource(name="prj1300DAO")
    private Prj1300DAO prj1300DAO;

	@Resource(name = "FileManageDAO")
	private FileManageDAO fileMngDAO;
	
	
   	@Resource(name="fileMngService")
   	private FileMngService fileMngService;
   	
    @Resource(name = "egovFileIdGnrService")
	private EgovIdGnrService idgenService;
    
    
	@Resource(name = "req6000Service")
	private Req6000Service req6000Service;
	
    
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

    
    @Resource(name = "webhookSend")
    private WebhookSend webhookSend;
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private Map<String, String> selectReq1000JsonToMap(Map paramMap){
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
	

	
	@SuppressWarnings({ "rawtypes" })
	public List<Map>  selectReq1000ReqList(Map paramMap) throws Exception {
		return  req1000DAO.selectReq1000ReqList(paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public int  selectReq1000ReqListCnt(Map paramMap) throws Exception {
		 return req1000DAO.selectReq1000ReqListCnt(paramMap);
	} 
	
	
	public List<Req1000VO>  selectReq1000AllList(Req1000VO req1000vo) throws Exception {
		 return  req1000DAO.selectReq1000AllList(req1000vo);
	}
	
	
	public List<Req1000VO> selectReq1000List(Req1000VO req1000vo) throws Exception {
		return req1000DAO.selectReq1000List(req1000vo);
	}
	
	
	@SuppressWarnings("rawtypes")
	public Map selectReq1000ReqInfo(Map paramMap) throws Exception{
		return req1000DAO.selectReq1000ReqInfo(paramMap);
	}
	
	
	public int selectReq1000ListCnt(Req1000VO req1000vo) throws Exception {
		 return req1000DAO.selectReq1000ListCnt(req1000vo);
	}
	
	@SuppressWarnings({ "rawtypes" })
	public void updateReq1001ReqSubInfo(Map paramMap) throws Exception{
		req1000DAO.updateReq1001ReqSubInfo(paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public Object saveReq1000ReqInfo(Map paramMap) throws Exception{
		
		Map<String, String> convertParamMap = selectReq1000JsonToMap(paramMap);

		
    	Map prjInfo = req1000DAO.selectReq1000ReqPrjInfo(convertParamMap);
    	
		String popupType	= convertParamMap.get("type");
		String prjAcrm 		= (String) prjInfo.get("prjAcrm");
		
		
		String prjId = (String)convertParamMap.get("prjId");
		
		
		if("insert".equals(popupType)){
			
			
			String nextOrd = req1000DAO.selectReq1000NextReqOrd(convertParamMap);
			String newReqOrd = nextOrd;
			
			
			
			if(prjAcrm != null && !"".equals(prjAcrm)){
				newReqOrd = prjAcrm+"-"+nextOrd;
			}
			
			convertParamMap.put("reqOrd", newReqOrd);

			String insNewReqId = req1000DAO.insertReq1001ReqInfo(convertParamMap);
			
			
			if(insNewReqId == null || "".equals(insNewReqId)){
				throw new Exception(egovMessageSource.getMessage("fail.common.insert"));
			}
	
			
			
    		
    		String enReqKey = CommonScrty.encryptedAria(prjId, insNewReqId);
    		
			Map<String, String> newReqMap = new HashMap<String, String>();
			
			newReqMap.put("prjId", prjId);
			newReqMap.put("reqId", insNewReqId);
			newReqMap.put("reqKey", enReqKey);
			
    		
    		req1000DAO.updateReq1000ReqKey(newReqMap);
    		
    		
    		String reqPw = (String) convertParamMap.get("reqPw");
    		if(reqPw != null && !reqPw.isEmpty()) {
    			
    			newReqMap.put("reqPw", EgovFileScrty.encryptPassword(reqPw, insNewReqId));
    			
    			
    			req1000DAO.updateReq1000ReqPwInfo(newReqMap);
    		}
			
			return insNewReqId;
		}
		
		else if("update".equals(popupType)){
			
			Map reqInfoMap = (Map) req1000DAO.selectReq1000ReqInfo(convertParamMap);		
			String reqProType = (String) reqInfoMap.get("reqProType");
			
			
			if(!"01".equals(reqProType)){
				throw new Exception(egovMessageSource.getMessage("fail.common.update"));
			}
			
			
			
			
			String reqPw = (String) convertParamMap.get("reqPw");
    		if(reqPw != null && !reqPw.isEmpty()) {
    			convertParamMap.put("changePw", "Y");
    			
    			
    			String enReqPw = EgovFileScrty.encryptPassword(reqPw, (String) reqInfoMap.get("reqId"));
				
				convertParamMap.put("reqPw", enReqPw);
    		}
			
			
			int uptCnt = req1000DAO.updateReq1001ReqInfo(convertParamMap);

			
			String atchFileId = (String)convertParamMap.get("atchFileId");
			
			
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
			
			
			if(uptCnt == 0 ){
				throw new Exception(egovMessageSource.getMessage("fail.common.update"));
			}
			return uptCnt;
		}

		return false;
	}

	@Override
	public void selectReq1000ExcelList(Req1000VO req1000vo,
			ExcelDataListResultHandler resultHandler) throws Exception{
		req1000DAO.selectReq1000ExcelList(req1000vo, resultHandler);
		
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public void deleteReq1000ReqList(Map<String, String> paramMap)  throws Exception{
		String deleteDataList = paramMap.get("deleteDataList");
		
		
		JSONParser jsonParser = new JSONParser();
		JSONArray jsonArray = (JSONArray) jsonParser.parse(deleteDataList);

		
		List<FileVO> removeFileList = new ArrayList();
		
		
		for(int i=0;i<jsonArray.size();i++) {
			JSONObject jsonObj = (JSONObject) jsonArray.get(i);
			
			
			Map infoMap = new Gson().fromJson(jsonObj.toJSONString(), new HashMap().getClass());
			
			
			String reqProType = (String) infoMap.get("reqProType");
			
			
			if( !"01".equals(reqProType) ){
				throw new UserDefineException(egovMessageSource.getMessage("req1000.canNotDeleted.ReceptionType"));
			}

			
			req1000DAO.deleteReq1001ReqInfo(infoMap);
			
			
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
	
	
	
	@SuppressWarnings("rawtypes")
	@Override
	public Map selectReq1000ReqUserInfo(Map paramMap) throws Exception {
		return	req1000DAO.selectReq1000ReqUserInfo(paramMap);
	}
	
	
	
	@SuppressWarnings("rawtypes")
	public Map selectReq1000ReqPrjInfo(Map paramMap) throws Exception {
		return	req1000DAO.selectReq1000ReqPrjInfo(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectReq1000IntegratedDshAcceptReqList(Map paramMap) throws Exception {
		return req1000DAO.selectReq1000IntegratedDshAcceptReqList(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectReq1000IntegratedDshAcceptReqListCnt(Map paramMap) throws Exception {
		 return req1000DAO.selectReq1000IntegratedDshAcceptReqListCnt(paramMap);
	} 
}
