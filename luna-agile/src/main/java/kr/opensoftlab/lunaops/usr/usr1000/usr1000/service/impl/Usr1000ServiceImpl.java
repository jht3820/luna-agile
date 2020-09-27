package kr.opensoftlab.lunaops.usr.usr1000.usr1000.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.opensoftlab.lunaops.com.exception.UserDefineException;
import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.lunaops.stm.stm3000.stm3003.service.impl.Stm3003DAO;
import kr.opensoftlab.lunaops.usr.usr1000.usr1000.service.Usr1000Service;

import org.jfree.util.Log;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.service.impl.FileManageDAO;
import egovframework.com.utl.fcc.service.EgovStringUtil;
import egovframework.com.utl.sim.service.EgovFileScrty;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;


@Service("usr1000Service")
public class Usr1000ServiceImpl extends EgovAbstractServiceImpl implements Usr1000Service{
	
	
    @Resource(name="usr1000DAO")
    private Usr1000DAO usr1000DAO;
    
    
    @Resource(name="stm3003DAO")
    private Stm3003DAO stm3003DAO;
    
    
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	@Resource(name = "FileManageDAO")
	private FileManageDAO fileMngDAO;
	
	
	@Resource(name="EgovFileMngUtil")
	private EgovFileMngUtil fileUtil;
    
	
    @SuppressWarnings("rawtypes")
   	public Map selectUsr1000UsrInfo(Map paramMap) throws Exception {
   		return (Map) usr1000DAO.selectUsr1000UsrInfo(paramMap) ;
   	}
	
    
    @SuppressWarnings("rawtypes")
   	public int selectUsr1000emailChRepAjax(Map paramMap) throws Exception {
   		return usr1000DAO.selectUsr1000emailChRepAjax(paramMap) ;
   	}
    
    
   	public int updateUsr1000UsrInfo(Map<String, String> paramMap, MultipartHttpServletRequest mptRequest) throws Exception {
    	
		String atchFileId = paramMap.get("usrImgId");
		String defaultImgYn = paramMap.get("defaultImgYn"); 
    	
		
		int uCnt = usr1000DAO.updateUsr1000UsrInfo(paramMap);
    	
    	
		if(uCnt == 0){
			
			throw new UserDefineException(egovMessageSource.getMessage("stm3000.fail.user.update"));
		}
		
		
		paramMap.put("logState", "U");	
		paramMap.put("pwChangeState", "N");	
		
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
		
		return uCnt;
   	}

    
	@Override
	public Map<String, String> updateUsr1000PasswordChange(Map<String, String> paramMap) throws Exception {
		
		
		Map<String,String> resultMap = new HashMap<String,String>();
		
		String usrId = paramMap.get("usrId");
		String usrPw = paramMap.get("usrPw");
		String newUsrPw = paramMap.get("newUsrPw");
		
		
    	String bePw = usr1000DAO.selectUsr1000BeforePwCheck(paramMap);
    	
		
		String enUsrPw 	= EgovFileScrty.encryptPassword(usrPw, usrId);
		
		
		newUsrPw = EgovFileScrty.encryptPassword(newUsrPw, usrId);
		paramMap.put("usrPw", newUsrPw);
		
		
		if(bePw.equals(EgovStringUtil.isNullToString(enUsrPw))) {
			
			
			String isUsedPw = (String) stm3003DAO.selectStm3003BeforeUsedPwCheck(paramMap);
			
			
			if(!isUsedPw.equals("Y")) {
				
				
				usr1000DAO.updateUsr1000PasswordChange(paramMap) ;
				
				
				paramMap.put("logState", "U");
				paramMap.put("pwChangeState", "Y");	
				
				
				stm3003DAO.insertStm3003UserChangeLog(paramMap);
				
			}else{
				resultMap.put("code", "-1");
				resultMap.put("message", egovMessageSource.getMessage("prs3000.fail.user.usedPw"));
			}
			
		
		}else{
			resultMap.put("code", "-1");
			resultMap.put("message", egovMessageSource.getMessage("fail.user.wrongCurrPassword"));
		}
		
		return resultMap;
	}

	
	@SuppressWarnings("rawtypes")
	@Override
	public Map selectUsr1002(Map<String, String> paramMap) throws Exception {
		return usr1000DAO.selectUsr1002(paramMap);
	}

	
	@Override
	public int updateUsr1002(Map<String, String> paramMap) throws Exception {
		
		int dCnt = usr1000DAO.updateUsr1002(paramMap);
		
		
		paramMap.put("logState", "U");
		paramMap.put("pwChangeState", "N");	
		
		
		stm3003DAO.insertStm3003UserChangeLog(paramMap);
		
		return dCnt;
	}

	
	@Override
	public LoginVO selectUsr1000LoginVO(Map<String, String> paramMap) throws Exception {
		return usr1000DAO.selectUsr1000LoginVO(paramMap);
	}
    
}
