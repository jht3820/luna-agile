package kr.opensoftlab.lunaops.stm.stm3000.stm3000.service.impl;

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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.service.impl.FileManageDAO;
import egovframework.com.utl.fcc.service.EgovStringUtil;
import egovframework.com.utl.sim.service.EgovFileScrty;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.opensoftlab.lunaops.com.fms.web.service.FileMngService;
import kr.opensoftlab.lunaops.stm.stm2000.stm2000.service.impl.Stm2000DAO;
import kr.opensoftlab.lunaops.stm.stm3000.stm3000.service.Stm3000Service;
import kr.opensoftlab.lunaops.stm.stm3000.stm3000.vo.Stm3000VO;
import kr.opensoftlab.lunaops.stm.stm3000.stm3003.service.impl.Stm3003DAO;
import kr.opensoftlab.sdf.excel.ExcelDataListResultHandler;



@Service("stm3000Service")
public class Stm3000ServiceImpl extends EgovAbstractServiceImpl implements Stm3000Service {

	
    @Resource(name="stm3000DAO")
    private Stm3000DAO stm3000DAO;
    
    
    @Resource(name="stm2000DAO")
    private Stm2000DAO stm2000DAO;
    
    
    @Resource(name="stm3003DAO")
    private Stm3003DAO stm3003DAO;
    
    
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	
   	@Resource(name="fileMngService")
   	private FileMngService fileMngService;
   	
	
	@Resource(name="EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;
	
	@Resource(name = "FileManageDAO")
	private FileManageDAO fileMngDAO;

	
	@SuppressWarnings("rawtypes")
	public int selectStm3000UsrListCnt(Map paramMap) throws Exception {
		 return stm3000DAO.selectStm3000UsrListCnt(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectStm3000UsrList(Map paramMap) throws Exception {
		return stm3000DAO.selectStm3000UsrList(paramMap);
	}
	
	
    @SuppressWarnings("rawtypes")
	public Map selectStm3000UsrInfo(Map paramMap) throws Exception {
    	return stm3000DAO.selectStm3000UsrInfo(paramMap); 
    }
    
	
	
	public void insertStm3000UsrInfo(Map<String, String> paramMap) throws Exception{
	
		String usrPw = paramMap.get("usrPw");
		String usrId = paramMap.get("usrId");
		
		String enUsrPw 	= EgovFileScrty.encryptPassword(usrPw, usrId);	
		paramMap.put("enUsrPw", enUsrPw);
		
		
		String newUsrId = stm3000DAO.insertStm3000UsrInfo(paramMap);
		
		
		if("".equals(EgovStringUtil.isNullToString(newUsrId)) ){
			throw new Exception(egovMessageSource.getMessage("stm3000.fail.user.insert"));
		}
		
		
		paramMap.put("logState", "I");		
		paramMap.put("pwChangeState", "N");	
		
		
		stm3003DAO.insertStm3003UserChangeLog(paramMap);
	}
	
	
	public void updateStm3000UsrInfo(Map<String, String> paramMap, MultipartHttpServletRequest mptRequest) throws Exception{
		
		String usrPw = paramMap.get("usrPw");
		String usrId = paramMap.get("usrId");
		String atchFileId = paramMap.get("usrImgId");
		String defaultImgYn = paramMap.get("defaultImgYn"); 
		
		
		if(usrPw != null &&  !"".equals(usrPw)) {
			
			String enUsrPw 	= EgovFileScrty.encryptPassword(usrPw, usrId);
			paramMap.put("enUsrPw", enUsrPw);
			
			paramMap.put("pwChangeState", "Y");
		}
		
		
		if(paramMap.get("licGrpId").equals(usrId+"_GRP")){
			paramMap.put("useCd", "01");
		}
		
		
		int uCnt = stm3000DAO.updateStm3000UsrInfo( paramMap );
		if(uCnt == 0){
			
			throw new Exception(egovMessageSource.getMessage("stm3000.fail.user.update"));
		}
		
		
		if("02".equals(paramMap.get("block")) && paramMap.get("blkLog") != null && !"".equals(paramMap.get("blkLog")) ){
			
			stm3000DAO.insertStm3002BlockLog(paramMap);
		}
		
		
		paramMap.put("logState", "U");
		
		
		stm3003DAO.insertStm3003UserChangeLog(paramMap);
		
		
		if(mptRequest.getFileMap().size() > 0 || "Y".equals(defaultImgYn) ){
			
			
			FileVO fileVo = new FileVO();
			fileVo.setAtchFileId(atchFileId);
			fileVo.setFileSn("0");
			
			
			fileVo = fileMngDAO.selectFileInf(fileVo);
			
			
			if(fileVo != null){
				
				fileMngDAO.deleteFileInf(fileVo);
			}
			
			
			if(!"Y".equals(defaultImgYn)){
				List<FileVO> _result = fileUtil.fileUploadInsert(mptRequest,atchFileId,0,"UsrImg");
				fileMngDAO.insertFileDetail(_result);
			}

			if(fileVo != null){
				
				try{
					
					String fileDeletePath  = fileVo.getFileStreCours()+fileVo.getStreFileNm();
					EgovFileMngUtil.deleteFile(fileDeletePath);
				}catch(Exception fileE){	
					Log.error(fileE);
				}
			}
			
		}
		
	}
	
	
	@SuppressWarnings( { "rawtypes", "unchecked" } )
	public Map<String, Object> deleteStm3000UsrInfo(Map paramMap) throws Exception {
		
		
		Map<String,Object> resultMap = new HashMap<String,Object>();
		
		List<String> prjUsrList = new ArrayList<String>();
		
		String licGrpId = (String)paramMap.get("licGrpId");
		
		
		List<Map<String,String>> list = (List<Map<String,String>>) paramMap.get("list");
		int listSize = list.size();
		
		int prjUsrCnt = 0; 
		
		for(int i=0 ; i< listSize; i++) {
			Map<String,String> userMap = list.get(i);
			
			if(licGrpId.equals(userMap.get("usrId")+"_GRP")){
				resultMap.put("code", "-1");
				resultMap.put("message", egovMessageSource.getMessage("stm3000.fail.licUser.delete"));
				return resultMap;
			}
			
			
			int cnt = stm3000DAO.selectAdm1300ExistUsrInProject(userMap);
			if(cnt > 0){
				prjUsrCnt++;
				prjUsrList.add((String)userMap.get("usrNm"));
			}	
		}
		
		
		if(prjUsrCnt > 0){
			resultMap.put("code", "-1");
			
			resultMap.put("message", egovMessageSource.getMessage("stm3000.fail.prjUser.delete"));
			resultMap.put("resultData", prjUsrList);
			return resultMap;
		}
		
		
		for(int i=0 ; i< listSize; i++) {
			Map<String,String> userMap = list.get(i);
			
			userMap.put("logState", "D");
			stm3003DAO.insertStm3003UserChangeLog(userMap);
			
			stm3000DAO.deleteStm3000UsrInfo(userMap);
			
			
		}	
		
		
		resultMap.put("code", "0");
		return resultMap;
	}

	
	@SuppressWarnings({ "rawtypes" })
	public int selectCmm2000IdCheck(Map paramMap) throws Exception {
		return stm3000DAO.selectCmm2000IdCheck( paramMap ) ;
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public int selectStm3000EmailCheck(Map paramMap) throws Exception {
		return stm3000DAO.selectStm3000EmailCheck( paramMap ) ;
	}

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void updateStm3000UseCd(Map paramMap) throws Exception {

		String usrIdAttr = (String) paramMap.get("usrId");
		String useCdAttr = (String) paramMap.get("useCd");
		
		String[] usrIdList = usrIdAttr.split(",");
		String[] useCdList = useCdAttr.split(",");
		
		for( int i=0; i < usrIdList.length; i++ ){
			
			paramMap.put("usrId", usrIdList[i]);
			paramMap.put("useCd", useCdList[i]);
			
			stm3000DAO.updateStm3000UseCd( paramMap ) ;
			
		}
	}

	
	@Override
	public void selectStm3000ExcelList(Stm3000VO Stm3000VO, ExcelDataListResultHandler resultHandler) throws Exception {
		stm3000DAO.selectStm3000ExcelList(Stm3000VO, resultHandler);
	}
	
	
	@SuppressWarnings({"rawtypes", "unchecked" })
	@Override
	public void insertStm3000AdmInfoListAjax(Map<String, String> paramMap, String prjId) throws Exception{
		
		List<Map> userData = new ArrayList();
		
		
		String jsonData = paramMap.get("jsonData");
		
		
		JSONParser jsonParser = new JSONParser();
		
		
		JSONArray jsonArray = (JSONArray) jsonParser.parse(jsonData);
		for(int i=0; i<jsonArray.size(); i++){
			JSONObject token = (JSONObject) jsonArray.get(i);
			
			
			HashMap<String, Object> tokenObj = new ObjectMapper().readValue(token.toString(), HashMap.class) ;
			
			userData.add(tokenObj);
		}
		
		for(Map data : userData){
			Map<String,String> admMap = data;
			String enUsrPw 	= EgovFileScrty.encryptPassword(admMap.get("usrId").toString(), admMap.get("usrId").toString());	
			
			String srtuUseCd = admMap.get("useCd").toString();
			
			admMap.put("enUsrPw", enUsrPw);                    
			admMap.put("useCd", srtuUseCd.toUpperCase().equals("Y")?"01":"02");
			admMap.put("usrEmail", admMap.get("email").toString());                                                                                    
			admMap.put("usrTelNo", admMap.get("telno").toString());                                                                                    
			admMap.put("usrEtc", admMap.get("etc").toString());
			
			admMap.put("regUsrId", paramMap.get("regUsrId"));
			admMap.put("regUsrIp", paramMap.get("regUsrIp"));
			admMap.put("licGrpId", paramMap.get("licGrpId"));
			stm3000DAO.insertStm3000AdmInfoAjax(admMap);   
			
			
			admMap.put("logState", "I");		
			admMap.put("pwChangeState", "N");	
			
			
			stm3003DAO.insertStm3003UserChangeLog(admMap);
		}
	}
	
	
	@SuppressWarnings("rawtypes")
	public int updateStm3000Block(Map paramMap) throws Exception{
		
		if("02".equals(paramMap.get("block"))){
			stm3000DAO.insertStm3002BlockLog(paramMap);
		}
		return stm3000DAO.updateStm3000Block(paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public List selectStm3000PrjAuthUserList(Map paramMap) throws Exception {
		return stm3000DAO.selectStm3000PrjAuthUserList(paramMap);
	}
	
	
	@Override
	public void updateStm3000AccountInit(Map<String, String> paramMap) throws Exception {
		
		String usrId = (String) paramMap.get("usrId");
		String enUsrPw = EgovFileScrty.encryptPassword(usrId, usrId);	
		
		paramMap.put("enUsrPw", enUsrPw);
		paramMap.put("iniYn", "Y");
		
		stm3000DAO.updateStm3000AccountInit(paramMap);
		
		
		paramMap.put("logState", "U");
		paramMap.put("pwChangeState", "Y");
		stm3003DAO.insertStm3003UserChangeLog(paramMap);
	}
	
}
