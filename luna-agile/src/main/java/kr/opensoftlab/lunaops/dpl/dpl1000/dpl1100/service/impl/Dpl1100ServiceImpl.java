package kr.opensoftlab.lunaops.dpl.dpl1000.dpl1100.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.opensoftlab.lunaops.dpl.dpl1000.dpl1000.service.impl.Dpl1000DAO;
import kr.opensoftlab.lunaops.dpl.dpl1000.dpl1100.service.Dpl1100Service;
import kr.opensoftlab.lunaops.dpl.dpl1000.dpl1100.vo.Dpl1100VO;


@Service("dpl1100Service")
public class Dpl1100ServiceImpl  extends EgovAbstractServiceImpl implements Dpl1100Service{

	
    @Resource(name="dpl1000DAO")
    private Dpl1000DAO dpl1000DAO;
    
    
    @Resource(name="dpl1100DAO")
    private Dpl1100DAO dpl1100DAO;
    
    
	@SuppressWarnings("rawtypes")
	public int  selectDpl1100ReqListCnt(Map paramMap) throws Exception {
		return  dpl1100DAO.selectDpl1100ReqListCnt(paramMap);
	} 
	
	
	@SuppressWarnings("rawtypes" )
	public List<Map> selectDpl1100ReqList(Map paramMap) throws Exception {
		return dpl1100DAO.selectDpl1100ReqList(paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void insertDpl1100ReqList(Map paramMap) throws Exception{

		
		String prjId = (String)paramMap.get("prjId");
		
		
    	JSONArray selReqList = new JSONArray(paramMap.get("selReqList").toString());
    	
		
		String newChgId = "";
		
		
		int chgNum = 0;
		
    	
    	for(int i=0; i < selReqList.length(); i++){
    		
    		JSONObject jsonObj = selReqList.getJSONObject(i);
    		
    		
    		HashMap<String, Object> addReqInfoMap = new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ;
			
    		
    		addReqInfoMap.put("prjId", prjId);
    		addReqInfoMap.put("reqId", String.valueOf(jsonObj.get("reqId")));
    		addReqInfoMap.put("processId", String.valueOf(jsonObj.get("processId"))); 
    		addReqInfoMap.put("flowId", String.valueOf(jsonObj.get("flowId"))); 
    		addReqInfoMap.put("dplId", paramMap.get("dplId"));
    		
    		if(i == 0){
				
				newChgId = dpl1000DAO.selectDpl1500NewChgId(addReqInfoMap);
			}
    		
    		
			dpl1100DAO.insertDpl1100ReqInfo(addReqInfoMap);
			
			
			addReqInfoMap.put("chgId", newChgId);
			addReqInfoMap.put("chgNum", chgNum);
			addReqInfoMap.put("chgTypeCd", "02");
			addReqInfoMap.put("chgNm", String.valueOf(jsonObj.get("reqId")));	
			addReqInfoMap.put("chgOptTypeCd", "04");	
			addReqInfoMap.put("chgUsrId", paramMap.get("regUsrId"));
			
			
			dpl1000DAO.insertDpl1500ModifyHistoryInfo(addReqInfoMap);
			chgNum++;
    	}
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void deleteDpl1100ReqList(Map paramMap) throws Exception{

		
		String prjId = (String)paramMap.get("prjId");
				
		
		JSONArray selReqList = new JSONArray(paramMap.get("selReqList").toString());
		
		
		String newChgId = "";
		
		
		int chgNum = 0;
		
		
		
		for(int i=0; i < selReqList.length(); i++){
		    		
			JSONObject jsonObj = selReqList.getJSONObject(i);
		    		
			
			HashMap<String, Object> delReqInfoMap = new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ;
					
			
			delReqInfoMap.put("prjId", prjId);
			delReqInfoMap.put("reqId", String.valueOf(jsonObj.get("reqId")));
			delReqInfoMap.put("processId", String.valueOf(jsonObj.get("processId")));
			delReqInfoMap.put("flowId", String.valueOf(jsonObj.get("flowId")));
			delReqInfoMap.put("dplId", paramMap.get("dplId"));
		    		
			if(i == 0){
				
				newChgId = dpl1000DAO.selectDpl1500NewChgId(delReqInfoMap);
			}
			
			
			dpl1100DAO.deleteDpl1100ReqInfo(delReqInfoMap);
			
			
			delReqInfoMap.put("chgId", newChgId);
			delReqInfoMap.put("chgNum", chgNum);
			delReqInfoMap.put("chgTypeCd", "03");
			delReqInfoMap.put("chgNm", String.valueOf(jsonObj.get("reqId")));	
			delReqInfoMap.put("chgOptTypeCd", "04");	
			delReqInfoMap.put("chgUsrId", paramMap.get("regUsrId"));
			
			
			dpl1000DAO.insertDpl1500ModifyHistoryInfo(delReqInfoMap);
			chgNum++;
		}
	}
	

    
    
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectDpl1100ExistDplList(Dpl1100VO dpl1100VO) throws Exception{
		return dpl1100DAO.selectDpl1100ExistDplList(dpl1100VO);
	}

	
	public int selectDpl1100ExistDplListCnt(Dpl1100VO dpl1100VO) throws Exception {
		return dpl1100DAO.selectDpl1100ExistDplListCnt(dpl1100VO);
	}

	
	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectDpl1100NotExistDplList(Dpl1100VO dpl1100VO) throws Exception {
		return dpl1100DAO.selectDpl1100NotExistDplList(dpl1100VO);
	}
	
	
	public int selectDpl1100NotExistDplListCnt(Dpl1100VO dpl1100VO) throws Exception {
		return dpl1100DAO.selectDpl1100NotExistDplListCnt(dpl1100VO);
	}


	@SuppressWarnings({ "unchecked", "rawtypes" })
	@Override
	public void updateDpl1100Dpl(Map<String, Object> paramMap) throws Exception{
		List<Map<String,String>> list = (List<Map<String,String>>) paramMap.get("list");
		
		if(list == null){
			dpl1100DAO.updateDpl1100Dpl(paramMap);
		}else{
			
			int listSize = list.size();
			
			for (int i = 0; i < listSize; i++) {
				Map reqMap = list.get(i);
				reqMap.put("selPrjId", (String)paramMap.get("selPrjId"));
				if(list.size() > 1){
					reqMap.put("dplId", (String)paramMap.get("dplId"));
				}
	
				dpl1100DAO.updateDpl1100Dpl(reqMap);
			}
		}
	}

	
	@SuppressWarnings("rawtypes")
	@Override
	public String selectDpl1100ExistBuildInfo(Map paramMap) throws Exception {
		return dpl1100DAO.selectDpl1100ExistBuildInfo(paramMap);
	}
	

	
	@SuppressWarnings("rawtypes")
	public List selectDpl1100ReqDplList(Map paramMap) throws Exception {
		return dpl1100DAO.selectDpl1100ReqDplList(paramMap);
	}
	
	
	
	@SuppressWarnings("rawtypes")
	public int updateDpl1200ReqDplInfo(Map paramMap) throws Exception {
		return dpl1100DAO.updateDpl1200ReqDplInfo(paramMap);
	}
	

	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void insertDpl1100ReqDplList(Map paramMap) throws Exception {
		
		
		String prjId = (String)paramMap.get("prjId");
		
		
    	JSONArray selReqList = new JSONArray(paramMap.get("selReqList").toString());
    	
		
		String newChgId = "";
		
		
		int chgNum = 0;
		
    	
    	for(int i=0; i < selReqList.length(); i++){
    		
    		JSONObject jsonObj = selReqList.getJSONObject(i);
    		
    		
    		HashMap<String, Object> addReqInfoMap = new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ;
			
    		
    		addReqInfoMap.put("prjId", prjId);
    		addReqInfoMap.put("reqId", String.valueOf(jsonObj.get("reqId")));
    		addReqInfoMap.put("processId", String.valueOf(jsonObj.get("processId")));
    		addReqInfoMap.put("flowId", String.valueOf(jsonObj.get("flowId")));
    		addReqInfoMap.put("dplId", String.valueOf(jsonObj.get("dplId")));
    		
    		if(i == 0){
				
				newChgId = dpl1000DAO.selectDpl1500NewChgId(addReqInfoMap);
			}
    		
    		
			dpl1100DAO.insertDpl1100ReqDplInfo(addReqInfoMap);
			
			
			addReqInfoMap.put("chgId", newChgId);
			addReqInfoMap.put("chgNum", chgNum);
			addReqInfoMap.put("chgTypeCd", "02");
			addReqInfoMap.put("chgNm", String.valueOf(jsonObj.get("reqId")));	
			addReqInfoMap.put("chgOptTypeCd", "04");	
			addReqInfoMap.put("chgUsrId", paramMap.get("regUsrId"));
			
			
			dpl1000DAO.insertDpl1500ModifyHistoryInfo(addReqInfoMap);
			chgNum++;
    	}
	}

	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void deleteDpl1100ReqDplList(Map paramMap) throws Exception {
		
		
		String prjId = (String)paramMap.get("prjId");
				
		
		JSONArray selReqList = new JSONArray(paramMap.get("selReqList").toString());
		
		
		String newChgId = "";
		
		
		int chgNum = 0;
		
		
		
		for(int i=0; i < selReqList.length(); i++){
		    		
			JSONObject jsonObj = selReqList.getJSONObject(i);
		    		
			
			HashMap<String, Object> delReqInfoMap = new ObjectMapper().readValue(jsonObj.toString(), HashMap.class) ;
					
			
			delReqInfoMap.put("prjId", prjId);
			delReqInfoMap.put("reqId", String.valueOf(jsonObj.get("reqId")));
			delReqInfoMap.put("processId", String.valueOf(jsonObj.get("processId")));
			delReqInfoMap.put("flowId", String.valueOf(jsonObj.get("flowId")));
			delReqInfoMap.put("dplId", String.valueOf(jsonObj.get("dplId")));
		    		
			if(i == 0){
				
				newChgId = dpl1000DAO.selectDpl1500NewChgId(delReqInfoMap);
			}
			
			
			dpl1100DAO.deleteDpl1100ReqDplInfo(delReqInfoMap);
			
			
			delReqInfoMap.put("chgId", newChgId);
			delReqInfoMap.put("chgNum", chgNum);
			delReqInfoMap.put("chgTypeCd", "03");
			delReqInfoMap.put("chgNm", String.valueOf(jsonObj.get("reqId")));	
			delReqInfoMap.put("chgOptTypeCd", "04");	
			delReqInfoMap.put("chgUsrId", paramMap.get("regUsrId"));
			
			
			dpl1000DAO.insertDpl1500ModifyHistoryInfo(delReqInfoMap);
			chgNum++;
		}
	}
	
}
