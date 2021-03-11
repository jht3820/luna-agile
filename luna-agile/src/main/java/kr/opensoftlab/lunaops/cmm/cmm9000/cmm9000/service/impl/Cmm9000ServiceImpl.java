package kr.opensoftlab.lunaops.cmm.cmm9000.cmm9000.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.opensoftlab.lunaops.cmm.cmm9000.cmm9000.service.Cmm9000Service;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;



@Service("cmm9000Service")
public class Cmm9000ServiceImpl extends EgovAbstractServiceImpl implements Cmm9000Service {

	
    @Resource(name="cmm9000DAO")
    private Cmm9000DAO cmm9000DAO;
    
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Map selectCmm9000LeftMenuInfos(Map paramMap) throws Exception{
		Map menuInfoMap = new HashMap();
		
		Map alarmMap = new HashMap();
		Map chargeReqList = new HashMap();
		Map allReqList = new HashMap();
		
		
		alarmMap = cmm9000DAO.selectCmm9000AlarmCntInfo(paramMap);
		
		
		chargeReqList = cmm9000DAO.selectCmm9000ChargeReqCntList(paramMap);
		
		
		allReqList = cmm9000DAO.selectCmm9000AllReqCntList(paramMap);
		
		
		String selPrjType = cmm9000DAO.selectCmm9000ProjectType(paramMap);
		
		menuInfoMap.put("alarmMap", alarmMap);
		menuInfoMap.put("chargeReqList", chargeReqList);
		menuInfoMap.put("allReqList", allReqList);
		menuInfoMap.put("selPrjType", selPrjType);
		
		return menuInfoMap;
	}
}
