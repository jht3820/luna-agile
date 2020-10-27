package kr.opensoftlab.lunaops.stm.stm3000.stm3001.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.opensoftlab.lunaops.stm.stm3000.stm3001.service.Stm3001Service;



@Service("stm3001Service")
public class Stm3001ServiceImpl extends EgovAbstractServiceImpl implements Stm3001Service {

	
    @Resource(name="stm3001DAO")
    private Stm3001DAO stm3001DAO;

    
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	
	@SuppressWarnings("rawtypes")
	public List selectStm3001UsrOptList(Map paramMap) throws Exception {
		return stm3001DAO.selectStm3001UsrOptList(paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public Map selectStm3001UsrOptInfo(Map paramMap) throws Exception {
		return stm3001DAO.selectStm3001UsrOptInfo(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectStm3001UsrOptCnt(Map paramMap) throws Exception {
		return stm3001DAO.selectStm3001UsrOptCnt(paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public String insertStm3001UsrOptInfo(Map paramMap) throws Exception {
		return stm3001DAO.insertStm3001UsrOptInfo(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int updateStm3001UsrOptInfo(Map paramMap) throws Exception{
		return stm3001DAO.updateStm3001UsrOptInfo(paramMap);
	}
}
