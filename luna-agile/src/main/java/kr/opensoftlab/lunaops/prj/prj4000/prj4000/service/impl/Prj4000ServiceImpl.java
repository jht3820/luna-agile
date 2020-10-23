package kr.opensoftlab.lunaops.prj.prj4000.prj4000.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.opensoftlab.lunaops.prj.prj4000.prj4000.service.Prj4000Service;
import kr.opensoftlab.lunaops.prj.prj4000.prj4000.vo.Prj4000VO;

@Service("prj4000Service")
public class Prj4000ServiceImpl extends EgovAbstractServiceImpl implements Prj4000Service {
	
	
    @Resource(name="prj4000DAO")
    private Prj4000DAO prj4000DAO;
	

	
	public List<Prj4000VO>  selectPrj4000PrjWhkList(Prj4000VO prj4000vo) throws Exception {
		 return  (List<Prj4000VO>) prj4000DAO.selectPrj4000PrjWhkList(prj4000vo);
	}
	
	
	public int selectPrj4000PrjWhkListCnt(Prj4000VO prj4000vo) throws Exception {
		 return  prj4000DAO.selectPrj4000PrjWhkListCnt(prj4000vo);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectPrj4000PrjWhkAllList(Map paramMap) throws Exception{
		return prj4000DAO.selectPrj4000PrjWhkAllList(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public String insertPrj4000PrjWhkInfo(Map paramMap) throws Exception{
		return prj4000DAO.insertPrj4000PrjWhkInfo(paramMap);
	}

	
	@SuppressWarnings({ "rawtypes" })
	public Map selectPrj4000PrjWhkInfo(Map paramMap) throws Exception{
		return prj4000DAO.selectPrj4000PrjWhkInfo(paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public void updatePrj4000PrjWhkInfo(Map paramMap) throws Exception{
		prj4000DAO.updatePrj4000PrjWhkInfo(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int deletePrj4000PrjWhkInfo(Map paramMap) throws Exception{
		return prj4000DAO.deletePrj4000PrjWhkInfo(paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void deletePrj4000PrjWhkList(Map paramMap) throws Exception{
		List<Map<String,String>> list = (List<Map<String,String>>) paramMap.get("list");
		
		String prjId = (String)paramMap.get("prjId");
		
		int listSize = list.size();
		
		for (int i = 0; i < listSize; i++) {
			Map<String,String> whkMap = list.get(i);
			whkMap.put("prjId", prjId);
			
			prj4000DAO.deletePrj4000PrjWhkInfo(whkMap);
		}
	}
}
