package kr.opensoftlab.lunaops.stm.stm3000.stm3003.service.impl;



import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.utl.fcc.service.EgovStringUtil;
import egovframework.com.utl.sim.service.EgovFileScrty;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.opensoftlab.lunaops.stm.stm3000.stm3000.service.impl.Stm3000DAO;
import kr.opensoftlab.lunaops.stm.stm3000.stm3003.service.Stm3003Service;



@Service("stm3003Service")
public class Stm3003ServiceImpl extends EgovAbstractServiceImpl implements Stm3003Service {
	
	
    @Resource(name="stm3000DAO")
    private Stm3000DAO stm3000DAO;
	
	
    @Resource(name="stm3003DAO")
    private Stm3003DAO stm3003DAO;

	
	@SuppressWarnings("rawtypes")
    @Override
	public void insertStm3003UserChangeLog(Map paramMap) throws Exception {
		stm3003DAO.insertStm3003UserChangeLog(paramMap);
	}


	
	@SuppressWarnings("rawtypes")
	@Override
	public int selectStm3003PwChangeDateCheck(Map paramMap) throws Exception{
		return stm3003DAO.selectStm3003PwChangeDateCheck(paramMap);
	}
	
	
	
	@SuppressWarnings({ "rawtypes", "unchecked"})
	@Override
	public String selectStm3003BeforeUsedPwCheck(Map paramMap) throws Exception {
	
		String usrPw 	= (String) paramMap.get("usrPw");
		String usrId 	= (String) paramMap.get("usrId");
		String isUsedPw = "";
		
		// 이전 패스워드 조회
		String bePw = stm3000DAO.selectStm3000PwCheck(paramMap);
		
		// 이전 패스워드와 , 넘어온 패스워드가 같다면 비밀번호 수정을 하지않은 상태
		// 이때는 1년간 비밀번호 사용여부 체크하지 않음
		if( bePw.equals(EgovStringUtil.isNullToString(usrPw)) ){
			isUsedPw = "N";
		}else{
			String enUsrPw 	= EgovFileScrty.encryptPassword(usrPw, usrId);	// 패스워드 암호화
			paramMap.put("usrPw", enUsrPw);
			
			// 비밀번호를 변경했을 경우, 1년간 사용한 비밀번호 체크
			isUsedPw = (String) stm3003DAO.selectStm3003BeforeUsedPwCheck(paramMap);
		}
		
		return isUsedPw;
	}  

    
}
