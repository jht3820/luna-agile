package kr.opensoftlab.lunaops.prj.prj5000.prj5000.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import kr.opensoftlab.lunaops.prj.prj5000.prj5000.service.Prj5000Service;



@Service("prj5000Service")
public class Prj5000ServiceImpl extends EgovAbstractServiceImpl implements Prj5000Service {

	
    @Resource(name="prj5000DAO")
    private Prj5000DAO prj5000DAO;
	

   	@Resource(name = "egovFileIdGnrService")
	private EgovIdGnrService idgenService;
   	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj5000EvtList(Map paramMap) throws Exception {
		 return prj5000DAO.selectPrj5000EvtList(paramMap);
    }

	
	@Override
	public Map selectPrjEvt5000Info(Map paramMap) throws Exception {
		return prj5000DAO.selectPrjEvt5000Info(paramMap);
	}

	
	@Override
	public String insertPrj5000PrjEvtAjax(Map paramMap) throws Exception {
		return prj5000DAO.insertPrj5000PrjEvtAjax(paramMap);
	}

	
	@Override
	public int updatePrj5000PrjEvtAjax(Map paramMap) throws Exception {
		return prj5000DAO.updatePrj5000PrjEvtAjax(paramMap);
	}


	
	@Override
	public void deletePrj5000PrjEvtInfo(Map paramMap) throws Exception {
		prj5000DAO.deletePrj5000PrjEvtInfo(paramMap);
	}

	
	@SuppressWarnings({ "rawtypes" })
	public List selectPrj5000ReqList(Map paramMap) throws Exception{
		return prj5000DAO.selectPrj5000ReqList(paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public Map selectPrj5000ReqInfo(Map paramMap) throws Exception{
		return prj5000DAO.selectPrj5000ReqInfo(paramMap);
	}
}