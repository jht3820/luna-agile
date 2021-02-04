package kr.opensoftlab.lunaops.stm.stm1000.stm1000.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.opensoftlab.lunaops.stm.stm1000.stm1000.service.Stm1000Service;



@Service("stm1000Service")
public class Stm1000ServiceImpl extends EgovAbstractServiceImpl implements Stm1000Service {

    
	
    @Resource(name="stm1000DAO")
    private Stm1000DAO stm1000DAO;

   
	
	@SuppressWarnings("rawtypes")
	public List selectStm1000LicencePrjAllList(Map paramMap) throws Exception {
		 return stm1000DAO.selectStm1000LicencePrjAllList(paramMap);
    }
}