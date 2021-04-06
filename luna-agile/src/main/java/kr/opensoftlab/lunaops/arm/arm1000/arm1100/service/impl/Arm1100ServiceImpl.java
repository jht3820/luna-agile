package kr.opensoftlab.lunaops.arm.arm1000.arm1100.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.service.impl.FileManageDAO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.psl.dataaccess.util.EgovMap;
import kr.opensoftlab.lunaops.arm.arm1000.arm1100.service.Arm1100Service;



@Service("arm1100Service")
public class Arm1100ServiceImpl extends EgovAbstractServiceImpl implements Arm1100Service {

	
    @Resource(name="arm1100DAO")
    private Arm1100DAO arm1100DAO;
    
    @Resource(name = "FileManageDAO")
	private FileManageDAO fileMngDAO;
    
    
   	@Resource(name = "egovMessageSource")
   	EgovMessageSource egovMessageSource;

	
	
	@SuppressWarnings("rawtypes")
	public int selectArm1100NtfListCnt(Map paramMap) throws Exception {
		return arm1100DAO.selectArm1100NtfListCnt(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectArm1100NtfNotReadCnt(Map paramMap) throws Exception {
		return arm1100DAO.selectArm1100NtfNotReadCnt(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectArm1100NtfList(Map paramMap) throws Exception {
		 return arm1100DAO.selectArm1100NtfList(paramMap);
    }
	
	
	@SuppressWarnings("rawtypes")
	public void insertArm1100NtfInfo(Map paramMap) throws Exception {
		arm1100DAO.insertArm1100NtfInfo(paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void insertArm1101NtfInfo(Map paramMap) throws Exception {
		
		int notReadCnt = arm1100DAO.selectArm1100NtfNotReadCnt(paramMap);
		if(notReadCnt > 0 ) {
			
			List notReadList = arm1100DAO.selectArm1100NtfNotReadList(paramMap);
			paramMap.put("checkUsrId", paramMap.get("usrId"));
			
			for(int idx = 0; idx < notReadList.size();idx++) {
				EgovMap map = (EgovMap) notReadList.get(idx);
				paramMap.put("ntfId", map.get("ntfId"));
				arm1100DAO.insertArm1101NtfInfo(paramMap);
			}
		}
	}
    
}
