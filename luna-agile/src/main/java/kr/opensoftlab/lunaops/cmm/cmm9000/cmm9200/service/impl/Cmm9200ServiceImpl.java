package kr.opensoftlab.lunaops.cmm.cmm9000.cmm9200.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.opensoftlab.lunaops.cmm.cmm9000.cmm9200.service.Cmm9200Service;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;



@Service("cmm9200Service")
public class Cmm9200ServiceImpl extends EgovAbstractServiceImpl implements Cmm9200Service {

    @Resource(name="cmm9200DAO")
    private Cmm9200DAO cmm9200DAO;
    
	
	@SuppressWarnings("rawtypes")
	public List selectCmm9200PrjUsrList(Map param) throws Exception{
		return cmm9200DAO.selectCmm9200PrjUsrList(param);
	}

}
