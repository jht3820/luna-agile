package kr.opensoftlab.lunaops.spr.spr1000.spr1000.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.opensoftlab.lunaops.spr.spr1000.spr1000.service.Spr1000Service;



@Service("spr1000Service")
public class Spr1000ServiceImpl extends EgovAbstractServiceImpl implements Spr1000Service {

	
    @Resource(name="spr1000DAO")
    private Spr1000DAO spr1000DAO;
    
    
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	
	@SuppressWarnings("rawtypes")
	public int selectSpr1000SprListCnt(Map paramMap) throws Exception {
		return  spr1000DAO.selectSpr1000SprListCnt(paramMap);
	} 
	
	
	@SuppressWarnings({ "rawtypes" })
	public List<Map> selectSpr1000SprList(Map paramMap) throws Exception {
		return  spr1000DAO.selectSpr1000SprList(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public String insertSpr1000SprInfo(Map paramMap) throws Exception{
		return spr1000DAO.insertSpr1000SprInfo(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int updateSpr1000Info(Map paramMap) throws Exception{
		return spr1000DAO.updateSpr1000Info(paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public int deleteSpr1000SprInfo(Map paramMap) throws Exception{
		String deleteDataList = (String) paramMap.get("deleteDataList");

		//JSON파서 선언
		JSONArray jsonArray = new JSONArray(deleteDataList);
		
		int deleteCnt = 0;
		
		//삭제 요구사항 목록
		for(int i=0;i<jsonArray.length();i++) {
			JSONObject jsonObj = (JSONObject) jsonArray.get(i);
			
			//json to Map
			Map infoMap = new Gson().fromJson(jsonObj.toString(), new HashMap().getClass());
			
			//삭제 유무 변경
			infoMap.put("delCd", "01");
			
			//스프린트 삭제
			int resultCnt = spr1000DAO.deleteSpr1000SprInfo(infoMap);
			deleteCnt += resultCnt;
		}
		
		return deleteCnt;
	}

	
	@SuppressWarnings({ "rawtypes" })
	public Map selectSpr1000SprInfo(Map paramMap) throws Exception {
		return spr1000DAO.selectSpr1000SprInfo(paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public int selectSpr1000SprReqListCnt(Map paramMap) throws Exception {
		return spr1000DAO.selectSpr1000SprReqListCnt(paramMap);
	} 
	
	
	@SuppressWarnings({"rawtypes" })
	public List<Map>  selectSpr1000SprReqList(Map paramMap) throws Exception {
		return spr1000DAO.selectSpr1000SprReqList(paramMap);
	}
}
