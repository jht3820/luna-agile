package kr.opensoftlab.lunaops.prj.prj2000.prj2000.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.opensoftlab.lunaops.com.exception.UserDefineException;
import kr.opensoftlab.lunaops.prj.prj2000.prj2000.service.Prj2000Service;
import kr.opensoftlab.lunaops.prj.prj2000.prj2000.vo.Prj2000VO;
import kr.opensoftlab.lunaops.stm.stm2000.stm2000.service.Stm2000Service;



@Service("prj2000Service")
public class Prj2000ServiceImpl extends EgovAbstractServiceImpl implements Prj2000Service {

    
    @Resource(name = "stm2000Service")
    private Stm2000Service stm2000Service;
    
	
    @Resource(name="prj2000DAO")
    private Prj2000DAO prj2000DAO;

    
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectPrj2000PrjAuthGrpPageList(Map paramMap) throws Exception{
		return prj2000DAO.selectPrj2000PrjAuthGrpPageList(paramMap);
    }
	
	
	@SuppressWarnings("rawtypes")
	public int selectPrj2000PrjAuthGrpListCnt(Map paramMap) throws Exception {
		return  prj2000DAO.selectPrj2000PrjAuthGrpListCnt(paramMap);
	} 
	
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectPrj2000PrjAuthGrpList(Map paramMap) throws Exception{
		return prj2000DAO.selectPrj2000PrjAuthGrpList(paramMap) ;
    }
	
	
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectPrj2000PrjAuthGrpList_new(Prj2000VO prj2000VO) throws Exception{
		return prj2000DAO.selectPrj2000PrjAuthGrpList_new(prj2000VO) ;
    }
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj2000AuthGrpSmallMenuList(Map paramMap) throws Exception{
		return prj2000DAO.selectPrj2000AuthGrpSmallMenuList(paramMap) ;
    }
	
	
	
	@SuppressWarnings("rawtypes")
	public String insertPrj2000AuthGrpInfoAjax(Map paramMap) throws Exception{
		return (String) prj2000DAO.insertPrj2000AuthGrpInfoAjax(paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void deletePrj2000AuthGrpInfoAjax(Map<String, String> paramMap) throws Exception{
		
		String licGrpId = paramMap.get("licGrpId");
		String deleteDataList = paramMap.get("deleteDataList");
		
		
		JSONParser jsonParser = new JSONParser();
		JSONArray jsonArray = (JSONArray) jsonParser.parse(deleteDataList);
		
		
		int totalCnt = prj2000DAO.selectPrj2000PrjAuthGrpListCnt(paramMap);
		
		int deleteCnt = jsonArray.size();
		
		
		if(deleteCnt >= totalCnt){
			throw new UserDefineException(egovMessageSource.getMessage("prj2000.fail.prjAuth.minAuthCnt"));
		}
		
		
		for(int i=0;i<deleteCnt;i++) {
			
			JSONObject jsonObj = (JSONObject) jsonArray.get(i);
			
			Map authInfoMap = new Gson().fromJson(jsonObj.toJSONString(), new HashMap().getClass());
			authInfoMap.put("licGrpId", licGrpId);
			
			
			prj2000DAO.deletePrj2000AuthGrpInfoAjax(authInfoMap);
			
			
			prj2000DAO.deletePrj2000AuthPrjUsrListAjax(authInfoMap);
			
			
			prj2000DAO.deletePrj2000MenuUsrAuthListAjax(authInfoMap);
		}
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void savePrj2000AuthGrpMenuAuthListAjax(List paramList) throws Exception{
		
		for(Map paramMap : (List<Map>)paramList){
			
			String strStatus = (String) paramMap.get("status");
			
			
			if("U".equals(strStatus)){
				stm2000Service.saveStm2000AuthGrpMenuAuthInfo(paramMap);
			}

		}
	}
	
	
	@SuppressWarnings("rawtypes")
	@Override
	public Map selectPrj2000AuthGrpInfoAjax(Map paramMap) throws Exception{
		return prj2000DAO.selectPrj2000AuthGrpInfoAjax(paramMap);
	}
	
	
	@Override
	@SuppressWarnings({ "rawtypes" })
	public int updatePrj2000AuthGrpInfoAjax(Map paramMap) throws Exception{
		return prj2000DAO.updatePrj2000AuthGrpInfoAjax(paramMap);
	}


	
	@SuppressWarnings("rawtypes")
	public List selectPrj2000AuthGrpCopyList(Map paramMap) throws Exception{
		return prj2000DAO.selectPrj2000AuthGrpCopyList(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectPrj2000AuthGrpNextOrd(Map paramMap) throws Exception{
		return prj2000DAO.selectPrj2000AuthGrpNextOrd(paramMap);
	}
}
