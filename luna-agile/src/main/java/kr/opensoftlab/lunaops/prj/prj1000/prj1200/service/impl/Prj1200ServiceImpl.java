package kr.opensoftlab.lunaops.prj.prj1000.prj1200.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import kr.opensoftlab.lunaops.prj.prj1000.prj1200.service.Prj1200Service;



@Service("prj1200Service")
public class Prj1200ServiceImpl extends EgovAbstractServiceImpl implements Prj1200Service {

	
    @Resource(name="prj1200DAO")
    private Prj1200DAO prj1200DAO;
	

   	@Resource(name = "egovFileIdGnrService")
	private EgovIdGnrService idgenService;
   	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj1200PrjList(Map paramMap) throws Exception {
		 return prj1200DAO.selectPrj1200PrjList(paramMap);
    }

	
	@SuppressWarnings("rawtypes")
	public int selectPrj1200PrjListCnt(Map paramMap) throws Exception {
		 return prj1200DAO.selectPrj1200PrjListCnt(paramMap);
    }

	
	@Override
	public Map selectPrjSet1200Info(Map paramMap) throws Exception {
		return prj1200DAO.selectPrjSet1200Info(paramMap);
	}

	
	@Override
	public int insertPrj1200PrjSetAjax(Map paramMap) throws Exception {
		return prj1200DAO.insertPrj1200PrjSetAjax(paramMap);
	}

	
	@Override
	public int updatePrj1200PrjSetAjax(Map paramMap) throws Exception {
		return prj1200DAO.updatePrj1200PrjSetAjax(paramMap);
	}
	
	
}