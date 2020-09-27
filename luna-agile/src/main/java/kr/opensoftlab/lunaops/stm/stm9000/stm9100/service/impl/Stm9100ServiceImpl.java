package kr.opensoftlab.lunaops.stm.stm9000.stm9100.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.opensoftlab.lunaops.stm.stm9000.stm9100.service.Stm9100Service;
import kr.opensoftlab.lunaops.stm.stm9000.stm9100.vo.Stm9100VO;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;


@Service("stm9100Service")
public class Stm9100ServiceImpl extends EgovAbstractServiceImpl implements Stm9100Service{

	
	@Resource(name="stm9100DAO")
    private Stm9100DAO stm9100DAO;
	
	
	@Override
	public List<Stm9100VO> selectStm9100JenkinsProjectList(Stm9100VO stm9100VO) throws Exception{
		return stm9100DAO.selectStm9100JenkinsProjectList(stm9100VO);
	}
	
	
	public int selectStm9100JenkinsProjectListCnt(Stm9100VO stm9100VO) throws Exception {
		return stm9100DAO.selectStm9100JenkinsProjectListCnt(stm9100VO);
	}
	
	
	@SuppressWarnings("rawtypes")
	@Override
	public List selectStm9100JenkinsProjectAuthList(Stm9100VO stm9100VO) throws Exception {
		return stm9100DAO.selectStm9100JenkinsProjectAuthList(stm9100VO);
	}
	
	
	public int selectStm9100JenkinsProjectAuthListCnt(Stm9100VO stm9100VO) throws Exception {
		return stm9100DAO.selectStm9100JenkinsProjectAuthListCnt(stm9100VO);
	}
    
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void insertStm9100ProjectAddJob(Map paramMap) throws Exception{
		
		
		List<Map<String,String>> list = (List<Map<String,String>>) paramMap.get("list");
		
		
		String licGrpId = (String)paramMap.get("licGrpId");

		int listSize = list.size();
		
		
		for (int i = 0; i < listSize; i++) {
			
			Map<String,String> addJobMap = list.get(i);
			addJobMap.put("licGrpId", licGrpId);
			
			stm9100DAO.insertStm9100ProjectAddJob(addJobMap);
		}
	}

	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void deleteStm9100ProjectDelJob(Map paramMap) throws Exception{
				
		
		List<Map<String,String>> list = (List<Map<String,String>>) paramMap.get("list");
				
		
		String licGrpId = (String)paramMap.get("licGrpId");

		int listSize = list.size();
				
		
		for (int i = 0; i < listSize; i++) {
					
			Map<String,String> delJobMap = list.get(i);
			delJobMap.put("licGrpId", licGrpId);
			
			stm9100DAO.deleteStm9100ProjectDelJob(delJobMap);
		}

	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectJen1300JenkinsJobAuthGrpNormalList(Map paramMap) throws Exception {
		return stm9100DAO.selectJen1300JenkinsJobAuthGrpNormalList(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectStm9100JenkinsJobAuthGrpList(Stm9100VO stm9100VO) throws Exception {
		return stm9100DAO.selectStm9100JenkinsJobAuthGrpList(stm9100VO);
	}
	
	
	public int selectStm9100JenkinsJobAuthGrpListCnt(Stm9100VO stm9100VO) throws Exception {
		return stm9100DAO.selectStm9100JenkinsJobAuthGrpListCnt(stm9100VO);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectStm9100JenkinsJobAuthGrpCnt(Map paramMap) throws Exception {
		return stm9100DAO.selectStm9100JenkinsJobAuthGrpCnt(paramMap);
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public int insertStm9100JenkinsJobAuthGrpInfo(Map paramMap) throws Exception {

		
		List<Map<String,String>> list = (List<Map<String,String>>) paramMap.get("list");

		
		int addFailAuthCnt = 0;
		int listSize = list.size();
		
		
		for (int i = 0; i < listSize; i++) {
					
			Map<String,String> addAuthGrpMap = list.get(i);
			
			
			int flowAuthCnt = stm9100DAO.selectStm9100JenkinsJobAuthGrpCnt(addAuthGrpMap);
			
			
			if(flowAuthCnt == 0){
				stm9100DAO.insertStm9100JenkinsJobAuthGrpInfo(addAuthGrpMap);
			}else{
				addFailAuthCnt++;
			}
		}
		return addFailAuthCnt;
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void deleteStm9100JenkinsJobAuthGrpInfo(Map paramMap) throws Exception {
		
		
		List<Map<String,String>> list = (List<Map<String,String>>) paramMap.get("list");

		int listSize = list.size();
				
		
		for (int i = 0; i < listSize; i++) {
							
			Map<String,String> delAuthGrpMap = list.get(i);
			
			stm9100DAO.deleteStm9100JenkinsJobAuthGrpInfo(delAuthGrpMap);
		}	
	}

	
	@SuppressWarnings("rawtypes")
	public void updateJen1100JenkinsJobRestoreInfo(Map paramMap) throws Exception {
		stm9100DAO.updateJen1100JenkinsJobRestoreInfo(paramMap);
	}
}
