package kr.opensoftlab.lunaops.stm.stm5000.stm5100.service.impl;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.opensoftlab.lunaops.stm.stm5000.stm5100.service.Stm5100Service;
import kr.opensoftlab.lunaops.stm.stm5000.stm5100.vo.Stm5100VO;
import kr.opensoftlab.sdf.excel.ExcelDataListResultHandler;


@Service("stm5100Service")
public class Stm5100ServiceImpl extends EgovAbstractServiceImpl implements Stm5100Service {
	
	
    @Resource(name="stm5100DAO")
    private Stm5100DAO stm5100DAO;  

    
    @SuppressWarnings("rawtypes")
	public List<Map> selectStm5100List(Map paramMap) throws Exception {
    	return stm5100DAO.selectStm5100List(paramMap);
	}
	
    
    @SuppressWarnings("rawtypes")
	public int selectStm5100ListCnt(Map paramMap) throws Exception {
    	return stm5100DAO.selectStm5100ListCnt(paramMap);
	}

    
	public void selectStm5100ExcelList(Stm5100VO stm5100vo, ExcelDataListResultHandler resultHandler) throws Exception {
		stm5100DAO.selectStm5100ExcelList(stm5100vo,resultHandler);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void insertStm5100AuthLoginLog(Map paramMap) throws Exception{
		stm5100DAO.insertStm5100AuthLoginLog(paramMap);
	}
}