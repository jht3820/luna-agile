package kr.opensoftlab.lunaops.dsh.dsh1000.dsh1000.service.impl;

import java.util.HashMap;



import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.opensoftlab.lunaops.dsh.dsh1000.dsh1000.service.Dsh1000Service;
import kr.opensoftlab.lunaops.dsh.dsh1000.dsh1000.vo.Dsh1000VO;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

@Service("dsh1000Service")
public class Dsh1000ServiceImpl extends EgovAbstractServiceImpl implements Dsh1000Service {
	
	
    @Resource(name="dsh1000DAO")
    private Dsh1000DAO dsh1000DAO;  
    
	
	@SuppressWarnings("rawtypes")
	public List selectDsh1000ProcessReqCntList(Map paramMap) throws Exception{
		return dsh1000DAO.selectDsh1000ProcessReqCntList(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectDsh1000MonthProcessReqCntList(Map paramMap) throws Exception{
		return dsh1000DAO.selectDsh1000MonthProcessReqCntList(paramMap);
	}
	
	@SuppressWarnings("rawtypes")
	@Override	
	public List selectDsh1000ReqList(Dsh1000VO dsh1000VO) throws Exception{
		return dsh1000DAO.selectDsh1000ReqList(dsh1000VO);
	}

	@Override
	public int selectDsh1000ReqListCnt(Dsh1000VO dsh1000VO) throws Exception{
		return dsh1000DAO.selectDsh1000ReqListCnt(dsh1000VO);
	}

	
	@SuppressWarnings("rawtypes")
	public List selectDsh1000SortDataList(Map paramMap) throws Exception{
		return dsh1000DAO.selectDsh1000SortDataList(paramMap);
	}

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void insertDsh1000SortDataList(Map paramMap) throws Exception{
		
		dsh1000DAO.deleteDsh1000SortDataList(paramMap);
		
		
		String sortDataArr = (String) paramMap.get("sortDataArr");
		
		JSONArray jsonArr = new JSONArray();

		
		JSONParser jsonParser = new JSONParser();
		
		
		jsonArr = (JSONArray) jsonParser.parse(sortDataArr);
		
		
		for(int i=0;i<jsonArr.size();i++) {
			JSONObject jsonObject = (JSONObject)jsonArr.get(i);
			
			
			Map newMap = new HashMap<>();
			
			
			newMap.put("prjId", (String)paramMap.get("prjId"));
			newMap.put("usrId", (String)paramMap.get("usrId"));
			newMap.put("menuId", (String)paramMap.get("menuId"));
			
			
			newMap.put("sortId", (String)jsonObject.get("sortId"));
			newMap.put("sortCd", (String)jsonObject.get("sortCd"));
			newMap.put("ord", Integer.parseInt(String.valueOf(jsonObject.get("ord"))));

			dsh1000DAO.insertDsh1000SortDataInfo(newMap);
			
		}
	}
	
	
	@SuppressWarnings("rawtypes")
	public void deleteDsh1000SortDataList(Map paramMap) throws Exception{
		dsh1000DAO.deleteDsh1000SortDataList(paramMap);
	}
}
