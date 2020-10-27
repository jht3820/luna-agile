package kr.opensoftlab.lunaops.prj.prj1000.prj1300.service.impl;


import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.opensoftlab.lunaops.prj.prj1000.prj1300.service.Prj1300Service;



@Service("prj1300Service")
public class Prj1300ServiceImpl extends EgovAbstractServiceImpl implements Prj1300Service {
	
	
    @Resource(name="prj1300DAO")
    private Prj1300DAO prj1300DAO; 
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj1300PrjReqOptList(Map paramMap) throws Exception {
		return prj1300DAO.selectPrj1300PrjReqOptList(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj1300PrjProOptList(Map paramMap) throws Exception {
		return prj1300DAO.selectPrj1300PrjProOptList(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public Map selectPrj1300PrjProOptInfo(Map paramMap) throws Exception {
		return prj1300DAO.selectPrj1300PrjProOptInfo(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectPrj1300PrjProOptCnt(Map paramMap) throws Exception {
		 return prj1300DAO.selectPrj1300PrjProOptCnt(paramMap);
	}

	
	@SuppressWarnings({ "rawtypes" })
	public void insertPrj1300PrjProOptInfo(Map paramMap) throws Exception {
		
		prj1300DAO.insertPrj1300PrjProOptInfo(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void updatePrj1300PrjPrpOptInfo(Map paramMap) throws Exception {
		prj1300DAO.updatePrj1300PrjPrpOptInfo(paramMap);
	}
	
	
	
	@SuppressWarnings("rawtypes")
	public void deletePrj1300PrjProOptInfo(Map paramMap) throws Exception {
		
		prj1300DAO.deletePrj1300PrjProOptInfo(paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void deletePrj1300PrjProOptList(Map paramMap) throws Exception {
		List<Map<String,String>> list = (List<Map<String,String>>) paramMap.get("list");
		
		
		
		if(list.size() == 1) {
			
			prj1300DAO.deletePrj1300PrjProOptInfo(list.get(0));
		}else {
			
			String prjId = (String)paramMap.get("prjId");
			String processId = (String)paramMap.get("processId");
			
			
			for(int i=0; i<list.size(); i++){
				Map newMap = list.get(i);
				newMap.put("prjId", prjId);
				newMap.put("processId", processId);
				
				
				prj1300DAO.deletePrj1300PrjProOptInfo(newMap);
			}
		}
	}
	
	
	@SuppressWarnings("rawtypes")
	public void insertPrj1300PrjProOptValueInfo(Map paramMap) throws Exception {
		prj1300DAO.insertPrj1300PrjProOptValueInfo(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void updatePrj1300PrjProOptValueInfo(Map paramMap) throws Exception {
		prj1300DAO.updatePrj1300PrjProOptValueInfo(paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public List selectPrj1300PrjProOptExistFileIdList(Map paramMap) throws Exception {
		return prj1300DAO.selectPrj1300PrjProOptExistFileIdList(paramMap);
	}
}
