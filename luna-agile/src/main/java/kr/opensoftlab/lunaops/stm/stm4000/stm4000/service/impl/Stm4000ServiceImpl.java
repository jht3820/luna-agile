package kr.opensoftlab.lunaops.stm.stm4000.stm4000.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.lunaops.stm.stm4000.stm4000.service.Stm4000Service;
import kr.opensoftlab.sdf.excel.ExcelDataListResultHandler;


@Service("stm4000Service")
public class Stm4000ServiceImpl  extends EgovAbstractServiceImpl implements Stm4000Service{

	
    @Resource(name="stm4000DAO")
    private Stm4000DAO stm4000DAO;
    
    
	@SuppressWarnings("rawtypes")
	public List<Map> selectStm4000CommonCodeMasterList(Map paramMap) throws Exception {
		return stm4000DAO.selectStm4000CommonCodeMasterList(paramMap);
    }
	
	
	@SuppressWarnings("rawtypes")
	public int selectStm4000CommonCodeMasterListCnt(Map paramMap) throws Exception {
		return  stm4000DAO.selectStm4000CommonCodeMasterListCnt(paramMap);
	}
	
	
    @SuppressWarnings("rawtypes")
	public Map selectStm4000CommonCodeMasterInfo(Map paramMap) throws Exception {
        return stm4000DAO.selectStm4000CommonCodeMasterInfo(paramMap);    
    }
	
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectStm4000CommonCodeDetailList(Map paramMap) throws Exception {
		return stm4000DAO.selectStm4000CommonCodeDetailList(paramMap);
    }
	
	
	@SuppressWarnings("rawtypes")
	public int selectStm4000CommonCodeDetailListCnt(Map paramMap) throws Exception {
		return  stm4000DAO.selectStm4000CommonCodeDetailListCnt(paramMap);
	}
	
	
    @SuppressWarnings("rawtypes")
	public Map selectStm4000CommonCodeDetailInfo(Map paramMap) throws Exception {
        return stm4000DAO.selectStm4000CommonCodeDetailInfo(paramMap);    
    }
	
	
	@SuppressWarnings("rawtypes")
	public void saveStm4000CommonCodeMaster(Map paramMap) throws Exception{
		String type = (String)paramMap.get("type");
		
    	if("insert".equals(type)){
    		stm4000DAO.insertStm4000CommonCodeMaster(paramMap);
    	}else if("update".equals(type)){
    		stm4000DAO.updateStm4000CommonCodeMaster(paramMap);
    	}
    }

	
	@SuppressWarnings("rawtypes")
	public void saveStm4000CommonCodeDetail(Map paramMap)  throws Exception{
		String type = (String)paramMap.get("type");
		
    	if("insert".equals(type)){
    		stm4000DAO.insertStm4000CommonCodeDetail(paramMap);
    	}else if("update".equals(type)){
    		stm4000DAO.updateStm4000CommonCodeDetail(paramMap);
    	}
	}

	
	@Override
	@SuppressWarnings({"unchecked", "rawtypes"})
	public int deleteStm4000CommonCodeDetail(Map paramMap)  throws Exception{
		
		
		List<Map<String,String>> list = (List<Map<String,String>>) paramMap.get("list");
		
		int result = 0;
		
		int listSize = list.size();
		for(int i=0 ; i< listSize; i++) {
			
			Map<String,String> cmmCodeMap = list.get(i);
			
			
			if("Y".equals(cmmCodeMap.get("stmUseYn"))) {
				result = 1;
				return result;
			}
			
			
			stm4000DAO.deleteStm4000CommonCodeDetail(cmmCodeMap);
		}
		
		return result;
	}

	
	@Override
	@SuppressWarnings({"unchecked", "rawtypes"})
	public int deleteStm4000CommonCodeMaster(Map paramMap) throws Exception {
		
		
		List<Map<String,String>> list = (List<Map<String,String>>) paramMap.get("list");
		
		int result = 0;
		
		int listSize = list.size();
		for(int i=0 ; i< listSize; i++) {
			
			Map<String,String> cmmCodeMap = list.get(i);
			
			
			if("Y".equals(cmmCodeMap.get("stmUseYn"))) {
				result = 1;
				return result;
			}
			
			
			stm4000DAO.deleteStm4000CommonCodeDetailAll(cmmCodeMap);
			
			stm4000DAO.deleteStm4000CommonCodeMaster(cmmCodeMap);
		}
		
		return result;
	}

	
	@Override
	public void selectStm4000MasterExcelList(LoginVO loginVO, ExcelDataListResultHandler resultHandler) throws Exception {
		stm4000DAO.selectStm4000MasterExcelList(loginVO, resultHandler);
	}
	
	
	@Override
	@SuppressWarnings("rawtypes")
	public void selectStm4000DetailExcelList(Map paramMap, ExcelDataListResultHandler resultHandler) throws Exception {
		stm4000DAO.selectStm4000DetailExcelList(paramMap, resultHandler);
	}
	
	
	@Override
	@SuppressWarnings("rawtypes")
	public int selectStm4000CommonCodeCount(Map paramMap) throws Exception {
		return stm4000DAO.selectStm4000CommonCodeCount(paramMap);
	}
	
	
	@Override
	@SuppressWarnings("rawtypes")
	public int selectStm4000CommonDetailCodeCount(Map paramMap) throws Exception {
		return stm4000DAO.selectStm4000CommonDetailCodeCount(paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public int selectStm4000MstCodeNextOrd(Map paramMap) throws Exception{
		return stm4000DAO.selectStm4000MstCodeNextOrd(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectStm4000DetailCodeNextOrd(Map paramMap) throws Exception{
		return stm4000DAO.selectStm4000DetailCodeNextOrd(paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Map selectStm4000MultiCommonCodeList(Map paramMap) throws Exception {
		
		String licGrpId = (String)paramMap.get("licGrpId");
		
		
		String commonCodeArr = (String)paramMap.get("commonCodeArr");

		
		JSONParser jsonParser = new JSONParser();
		
		
		JSONArray jsonArray = (JSONArray) jsonParser.parse(commonCodeArr);

		
		Map reqDatas = new HashMap();
		
		for(int i=0; i<jsonArray.size(); i++){
			JSONObject token = (JSONObject)jsonArray.get(i);

			
			HashMap<String, String> tokenObj = new ObjectMapper().readValue(token.toString(), HashMap.class) ;
			tokenObj.put("licGrpId", licGrpId);
			
			
			List commonCodeInfo = (List)stm4000DAO.selectStm4000MultiCommonCodeList(tokenObj);
			
			reqDatas.put((String) tokenObj.get("targetObj"), commonCodeInfo);
		}
		
		return reqDatas;
	}
}
