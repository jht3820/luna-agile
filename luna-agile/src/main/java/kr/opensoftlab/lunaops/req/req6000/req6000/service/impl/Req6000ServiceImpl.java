package kr.opensoftlab.lunaops.req.req6000.req6000.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.codehaus.jettison.json.JSONException;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.stereotype.Service;

import egovframework.com.cmm.service.FileVO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.opensoftlab.lunaops.dpl.dpl1000.dpl1100.service.impl.Dpl1100DAO;
import kr.opensoftlab.lunaops.prj.prj1000.prj1100.service.impl.Prj1100DAO;
import kr.opensoftlab.lunaops.req.req4000.req4100.service.impl.Req4100DAO;
import kr.opensoftlab.lunaops.req.req6000.req6000.service.Req6000Service;


@Service("req6000Service")
public class Req6000ServiceImpl  extends EgovAbstractServiceImpl implements Req6000Service{

	private final String MOD_CHG_GB_CD  = "01"; 
	private final String FLOW_MOD_CHG_GB_CD  = "02"; 
	private final String FILE_ADD_CHG_GB_CD  = "03"; 
	private final String FILE_DEL_CHG_GB_CD  = "04"; 
	private final String DPL_CHG_GB_CD  = "05"; 
	
	
	
    @Resource(name="req4100DAO")
    private Req4100DAO req4100DAO;
    
    @Resource(name="prj1100DAO")
    private Prj1100DAO prj1100DAO;
    
    @Resource(name="req6000DAO")
    private Req6000DAO req6000DAO;
    
    @Resource(name="dpl1100DAO")
    private Dpl1100DAO dpl1100DAO;
    
    	
	@SuppressWarnings("rawtypes")
	public List<Map> selectReq6000ChgDetailList(Map paramMap) throws Exception{
		return req6000DAO.selectReq6000ChgDetailList(paramMap);
	}
	
    	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public void insertReq6000ModifyHistoryList(Map paramMap) throws Exception{

		
		
		Map reqInfoMap = (Map) req4100DAO.selectReq4100ReqInfo(paramMap);
		
		
		List<Map> addOptList = (List<Map>) prj1100DAO.selectPrj1102ReqOptList(paramMap);
		
		
		Map addOptMap = new HashMap<>();
		for (Map addOptInfo : addOptList) {
			addOptMap.put(addOptInfo.get("itemId"),addOptInfo.get("itemValue"));
		}
		
		
		List<Map> dplList = (List<Map>) dpl1100DAO.selectDpl1100ReqDplList(paramMap);
		      
		
		Map dplMap = new HashMap<>();
		for (Map dplInfo : dplList) {
		   dplMap.put("dplId_"+dplInfo.get("flowId"),dplInfo.get("dplId"));
		}
		
		
		String newChgDetailId = req6000DAO.selectReq6000NewChgDetailId(paramMap);
		paramMap.put("newChgDetailId", newChgDetailId);
		
		
		int chgDetailNum = 0;
		
		for( Object key : paramMap.keySet() ) {
			
			if(key.equals("fileList")){
				String fileActionType = (String)paramMap.get("fileActionType");
				String CHG_GB_CD = "00";
				if("add".equals(fileActionType)){
					CHG_GB_CD = this.FILE_ADD_CHG_GB_CD;
				}
				else if("del".equals(fileActionType)){
					CHG_GB_CD = this.FILE_DEL_CHG_GB_CD;
				}
				
				
				List<FileVO> files = (List<FileVO>)paramMap.get(key);
				if(files != null){
					for(FileVO vo : files ){
						
						Map<String, Object> map = new HashMap<String, Object>();
						map.putAll(paramMap);
						
						
						map.put("chgDetailNum", chgDetailNum);
						map.put("chgDetailType", CHG_GB_CD);	
						map.put("chgDetailNm", "첨부 파일");	
						map.put("chgDetailVal", vo.getOrignlFileNm());	
						
						
						req6000DAO.insertReq6000ModifyHistoryInfo(map);
						
						
						chgDetailNum++;
					}
				}
				
			}else{	
				String jsonVal = "";
				if(paramMap.get(key) instanceof ArrayList){
					jsonVal = paramMap.get(key).toString();
				}else{
					jsonVal = (String) paramMap.get(key);
				}
				
				JSONObject jsonObj = null;
				
				
				Map defaultReqInfo = new HashMap();
				
				
				try{
					jsonObj = new JSONObject(jsonVal);
				}catch(JSONException jsonE){
					defaultReqInfo.put(key, paramMap.get(key).toString());
					continue;
				}catch(Exception e){
					continue;
				}
				
				String modifyset = String.valueOf(jsonObj.get("modifySetCd"));
				
				
				if("02".equals(modifyset)){
					continue;
				}
				
				
				String paramVal = String.valueOf(jsonObj.get("optVal"));
				
				
				String opttarget = String.valueOf(jsonObj.get("chgDetailOptTarget"));
				String reqInfoVal = "";
				String chgDetailType = "00";
				
				
				if("01".equals(opttarget)){
					
					if(reqInfoMap.containsKey(key)){
						reqInfoVal = String.valueOf(reqInfoMap.get(key));
						chgDetailType = this.MOD_CHG_GB_CD;
					}else{
						continue;
					}
				}
				
				else if("02".equals(opttarget)){
					reqInfoVal = String.valueOf(addOptMap.get(key));
					chgDetailType = this.FLOW_MOD_CHG_GB_CD;
				}
				
				else if("03".equals(opttarget)){
					reqInfoVal = String.valueOf(dplMap.get(key));
					chgDetailType = this.DPL_CHG_GB_CD;
				}
				
				
				if(paramVal == null || "".equals(paramVal) || "undefined".equals(paramVal)){
					
					paramVal = "";
				}
				if(reqInfoVal == null || "".equals(reqInfoVal) || "null".equals(reqInfoVal)){
					reqInfoVal = "";
				}
				
				
				
				if(!(paramVal).equals(reqInfoVal)){
					
					Map<String, Object> map = new HashMap<String, Object>();
					map.putAll(paramMap);
					
					
					map.put("chgDetailNum", chgDetailNum);
					map.put("chgDetailType", chgDetailType);
					map.put("chgDetailNm", jsonObj.get("optNm"));	
					map.put("preDetailVal", reqInfoVal); 
					map.put("chgDetailVal", jsonObj.get("optVal"));	
					map.put("chgDetailOptType", jsonObj.get("chgDetailOptType"));	
					map.put("chgDetailCommonCd", jsonObj.get("chgDetailCommonCd"));	
					
					
					req6000DAO.insertReq6000ModifyHistoryInfo(map);
					
					
					chgDetailNum++;
				}
				
			}
		}
		
		
	}
	
		
	@SuppressWarnings("rawtypes")
	@Override
	public String insertReq6000ModifyHistoryInfo(Map paramMap) throws Exception{
		return req6000DAO.insertReq6000ModifyHistoryInfo(paramMap);
	}
	
	
	
	@SuppressWarnings("rawtypes")
	public int deleteReq6000ReqHistoryInfo(Map paramMap) throws Exception{
		return req6000DAO.deleteReq6000ReqHistoryInfo(paramMap);
	}
}
