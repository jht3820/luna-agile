package kr.opensoftlab.lunaops.cmm.cmm10000.cmm17000.service.Impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.opensoftlab.lunaops.cmm.cmm10000.cmm17000.service.Cmm17000Service;



@Service("cmm17000Service")
public class Cmm17000ServiceImpl extends EgovAbstractServiceImpl implements Cmm17000Service {
	
	
	
    @Resource(name="cmm17000DAO")
    private Cmm17000DAO cmm17000DAO;
    
	
	@SuppressWarnings({ "rawtypes" })
	@Override
	public List<Map>  selectReq1000ReqList(Map paramMap) throws Exception {
		return  cmm17000DAO.selectCmm17000PrjList(paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	@Override
	public int  selectReq1000ReqListCnt(Map paramMap) throws Exception {
		 return cmm17000DAO.selectCmm17000PrjListCnt(paramMap);
	}
	
	
	
	@Override
	public void updateCmm17000UsrMainPrj(Map<String, String> paramMap) throws Exception {
		
		cmm17000DAO.updateCmm17000UsrMainPrj(paramMap);
	} 
	
	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectCmm17000UsrMainPrj(Map<String, String> paramMap) throws Exception {
		
		return cmm17000DAO.selectCmm17000UsrMainPrj(paramMap);
	} 

}
