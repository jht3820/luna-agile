package kr.opensoftlab.lunaops.stm.stm5000.stm5000.service.impl;



import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.opensoftlab.lunaops.stm.stm5000.stm5000.service.Stm5000Service;
import kr.opensoftlab.lunaops.stm.stm5000.stm5000.vo.Stm5000VO;
import kr.opensoftlab.sdf.excel.ExcelDataListResultHandler;


@Service("stm5000Service")
public class Stm5000ServiceImpl extends EgovAbstractServiceImpl implements Stm5000Service {
	
	
    @Resource(name="stm5000DAO")
    private Stm5000DAO stm5000DAO;  
    
    
    @SuppressWarnings("rawtypes")
	public List<Map> selectStm5000List(Map paramMap) throws Exception {
    	return stm5000DAO.selectStm5000List(paramMap);
	}
	
	
    @SuppressWarnings("rawtypes")
	public int selectStm5000ListCnt(Map paramMap) throws Exception {
    	return stm5000DAO.selectStm5000ListCnt(paramMap);
	}

    
	public void selectStm5000ExcelList(Stm5000VO stm5000vo,ExcelDataListResultHandler resultHandler) throws Exception {
		stm5000DAO.selectStm5000ExcelList(stm5000vo, resultHandler);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void insertStm5000AuthLoginLog(Map paramMap) throws Exception{
		stm5000DAO.insertStm5000AuthLoginLog(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void updateStm5000AuthLogoutLog(Map paramMap) throws Exception{
		stm5000DAO.updateStm5000AuthLogoutLog(paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	@Override
	public Map selectStm5000LastLogin(Map paramMap) throws Exception {
		return stm5000DAO.selectStm5000LastLogin(paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	@Override
	public Map selectStm5000RecentLogin(Map paramMap) throws Exception {
		return stm5000DAO.selectStm5000RecentLogin(paramMap);
	}
}