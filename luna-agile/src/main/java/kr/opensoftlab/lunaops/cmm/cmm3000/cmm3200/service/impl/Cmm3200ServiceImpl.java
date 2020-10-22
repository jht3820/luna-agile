package kr.opensoftlab.lunaops.cmm.cmm3000.cmm3200.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.utl.fcc.service.EgovStringUtil;
import egovframework.com.utl.sim.service.EgovFileScrty;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.opensoftlab.lunaops.cmm.cmm3000.cmm3200.service.Cmm3200Service;
import kr.opensoftlab.lunaops.stm.stm3000.stm3003.service.impl.Stm3003DAO;
import kr.opensoftlab.sdf.util.TableMakePrimaryKey;



@Service("cmm3200Service")
public class Cmm3200ServiceImpl extends EgovAbstractServiceImpl implements Cmm3200Service {

	
    @Resource(name="cmm3200DAO")
    private Cmm3200DAO cmm3200DAO;

    
    @Resource(name="stm3003DAO")
    private Stm3003DAO stm3003DAO;
    
    
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	
	@SuppressWarnings({ "rawtypes" })
	public int selectCmm3200idChk(Map paramMap) throws Exception {
		return cmm3200DAO.selectCmm3200idChk( paramMap ) ;
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public String insertCmm3200JoinIng(Map paramMap) throws Exception{
		
		String licGrpId 	= (String) paramMap.get("usrId") + "_GRP";		
		String usrPw 		= (String) paramMap.get("usrPw");
		String usrId 		= (String) paramMap.get("usrId");
		String enUsrPw 	= EgovFileScrty.encryptPassword(usrPw, usrId);	
		
		paramMap.put("licGrpId", licGrpId);
		paramMap.put("enUsrPw", enUsrPw);


		String menuBegin 		= cmm3200DAO.insertStm2000MenuBegin( paramMap );		
		if( "".equals(EgovStringUtil.isNullToString(menuBegin)) ){
			throw new Exception(egovMessageSource.getMessage("cmm3200.fail.menu.insert"));
		}
		
		String userInfo 			= cmm3200DAO.insertStm3000UserInfo( paramMap );			
		if( "".equals(EgovStringUtil.isNullToString(userInfo)) ){
			throw new Exception(egovMessageSource.getMessage("cmm3200.fail.user.insert"));
		}
		
		
		String licenceInfo 		= cmm3200DAO.insertStm11000LicenceInfo( paramMap );		
		if( "".equals(EgovStringUtil.isNullToString(licenceInfo)) ){
			throw new Exception(egovMessageSource.getMessage("cmm3200.fail.lic.insert"));
		}
		
		String codeM				= cmm3200DAO.insertStm4000CodeM( paramMap );				
		if( "".equals(EgovStringUtil.isNullToString(codeM)) ){
			throw new Exception(egovMessageSource.getMessage("cmm3200.fail.mstCd.insert"));
		}

		String codeD				= cmm3200DAO.insertStm4001CodeD( paramMap );				
		if( "".equals(EgovStringUtil.isNullToString(codeD)) ){
			throw new Exception(egovMessageSource.getMessage("cmm3200.fail.subCd.insert"));
		}
		
		String menuAuthInfo 		= cmm3200DAO.insertStm4001MenuAuthInfo( paramMap );			
		if( "".equals(EgovStringUtil.isNullToString(menuAuthInfo)) ){
			throw new Exception(egovMessageSource.getMessage("cmm3200.fail.menuAuth.insert"));
		}

		String authGroupInfo 		= cmm3200DAO.insertStm4001AuthGroupInfo( paramMap );		
		if( "".equals(EgovStringUtil.isNullToString(authGroupInfo)) ){
			throw new Exception(egovMessageSource.getMessage("cmm3200.fail.authGroup.insert"));
		}
		
		
		String deptId = TableMakePrimaryKey.makeKeyId("DPT", 5, 1);
		paramMap.put("deptId",deptId);
		
		String rootDeptInfo 		= cmm3200DAO.insertStm4001RootDeptInfo( paramMap );			
		if( "".equals(EgovStringUtil.isNullToString(rootDeptInfo)) ){
			throw new Exception(egovMessageSource.getMessage("cmm3200.fail.rootDept.insert"));
		}
		
		paramMap.put("logState", "I");		
		paramMap.put("pwChangeState", "N");	
		
		
		stm3003DAO.insertStm3003UserChangeLog(paramMap);
		
		String successYn = "Y";

		return successYn;
		
	}
    


}
