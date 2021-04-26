package kr.opensoftlab.lunaops.prj.prj1000.prj1100.service.impl;



import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.codehaus.jettison.json.JSONArray;
import org.codehaus.jettison.json.JSONObject;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import kr.opensoftlab.lunaops.com.fms.web.service.FileMngService;
import kr.opensoftlab.lunaops.prj.prj1000.prj1100.service.Prj1100Service;

@Service("prj1100Service")
public class Prj1100ServiceImpl extends EgovAbstractServiceImpl implements Prj1100Service {
	
	
    @Resource(name="prj1100DAO")
    private Prj1100DAO prj1100DAO; 
    
    
   	@Resource(name="fileMngService")
   	private FileMngService fileMngService;
   	
   	@Resource(name = "egovFileIdGnrService")
	private EgovIdGnrService idgenService;

	
	@SuppressWarnings("rawtypes")
	public int  selectPrj1100ProcessListCnt(Map paramMap) throws Exception {
		return  prj1100DAO.selectPrj1100ProcessListCnt(paramMap);
	} 
	
    
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List selectPrj1100ProcessList(Map paramMap) throws Exception {
		return prj1100DAO.selectPrj1100ProcessList(paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public Map selectPrj1100ProcessInfo(Map paramMap) throws Exception {
		return prj1100DAO.selectPrj1100ProcessInfo(paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public String insertPrj1100ProcessInfo(Map paramMap) throws Exception {
		String processId = (String) prj1100DAO.insertPrj1100ProcessInfo(paramMap);
		paramMap.put("processId", processId);
		
		
		String usrIdList = (String) paramMap.get("usrIdList");
		if(usrIdList != null && !"[]".equals(usrIdList)) {
			
			JSONArray jsonArray = new JSONArray(usrIdList);
			
			
			for(int i=0;i<jsonArray.length();i++) {
				JSONObject jsonObj = (JSONObject) jsonArray.get(i);
				String usrId = jsonObj.getString("usrId");
				String authTypeCd = jsonObj.getString("authTypeCd");
				
				paramMap.put("processAuthTargetId", usrId);
				paramMap.put("processAuthTypeCd", authTypeCd);
				prj1100DAO.insertPrj1100ProcessAuthInfo(paramMap);
			}
		}
		
		return processId;
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void updatePrj1100ProcessInfo(Map paramMap) throws Exception {
		
		prj1100DAO.updatePrj1100ProcessInfo(paramMap);
		
		
		prj1100DAO.deletePrj1100ProcessAuthInfo(paramMap);
		
		
		String usrIdList = (String) paramMap.get("usrIdList");
		if(usrIdList != null && !"[]".equals(usrIdList)) {
			
			JSONArray jsonArray = new JSONArray(usrIdList);
			
			
			for(int i=0;i<jsonArray.length();i++) {
				JSONObject jsonObj = (JSONObject) jsonArray.get(i);
				String usrId = jsonObj.getString("usrId");
				String authTypeCd = jsonObj.getString("authTypeCd");
				
				paramMap.put("processAuthTargetId", usrId);
				paramMap.put("processAuthTypeCd", authTypeCd);
				prj1100DAO.insertPrj1100ProcessAuthInfo(paramMap);
			}
		}
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void savePrj1100ProcessDataInfo(Map paramMap) throws Exception{
		String processData = (String) paramMap.get("processData");
		
		String prjId = (String) paramMap.get("prjId");
		String processId = (String) paramMap.get("processId");
		
		
		String endFlowId = (String) paramMap.get("endFlowId");
		
		
		JSONObject jsonObj = new JSONObject(processData);
		
		
		prj1100DAO.deletePrj1100FlowNextIdList(paramMap);
		
		
		Iterator<String> keys = jsonObj.keys();
		while(keys.hasNext()) {
		    String key = keys.next();
		    paramMap.put("flowId", key);
		    
		    
		    if(endFlowId.equals(key)) {
		    	paramMap.put("flowDoneCd", "01");
		    }else {
		    	paramMap.put("flowDoneCd", "02");
		    }
		    
		    JSONObject flowInfo = jsonObj.getJSONObject(key);
		    
		    int left = flowInfo.getInt("left");
		    int top = flowInfo.getInt("top");
		    
		    
		    JSONObject properties = flowInfo.getJSONObject("properties");
		    
		    JSONArray flowNextIdList = null;
		    
		    
		    if(properties.has("flowNextId")) {
		    	flowNextIdList = properties.getJSONArray("flowNextId");
		    	if(flowNextIdList.length() > 0) {
		    		for(int i=0;i<flowNextIdList.length();i++) {
		    			String flowNextId = flowNextIdList.getString(i);
		    			paramMap.put("flowNextId", flowNextId);
		    		
		    			
				    	prj1100DAO.insertPrj1100FlowNextIdInfo(paramMap);
		    		}
		    	}
		    }
		    
		    
		    Map flowMapData = new Gson().fromJson(properties.toString(), HashMap.class);
		    flowMapData.put("prjId", prjId);
		    flowMapData.put("processId", processId);
		    flowMapData.put("flowId", key);
		    flowMapData.put("flowLeft", left);
		    flowMapData.put("flowTop", top);
		    flowMapData.put("flowNm", flowMapData.get("title"));
		    flowMapData.put("modifyUsrId", paramMap.get("modifyUsrId"));
		    flowMapData.put("modifyUsrIp", paramMap.get("modifyUsrIp"));
		    
		    
		    prj1100DAO.updatePrj1101FlowInfo(flowMapData);
		    
		}
		
	}
	
	
	@SuppressWarnings({ "rawtypes"})
	public void deletePrj1100ProcessInfo(Map paramMap) throws Exception {
		String deleteDataList = (String) paramMap.get("deleteDataList");

		
		JSONArray jsonArray = new JSONArray(deleteDataList);
		
		
		for(int i=0;i<jsonArray.length();i++) {
			JSONObject jsonObj = (JSONObject) jsonArray.get(i);
			
			
			Map infoMap = new Gson().fromJson(jsonObj.toString(), new HashMap().getClass());
			
			
			prj1100DAO.deletePrj1100ProcessInfo(infoMap);
		
			
		}
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj1100ProcessAuthUsrList(Map paramMap) throws Exception {
		return prj1100DAO.selectPrj1100ProcessAuthUsrList(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectPrj1100ProcessAuthUsrListCnt(Map paramMap) throws Exception {
		return prj1100DAO.selectPrj1100ProcessAuthUsrListCnt(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj1100ProcessAuthNoneUsrList(Map paramMap) throws Exception {
		return prj1100DAO.selectPrj1100ProcessAuthNoneUsrList(paramMap);
	}
	
	@SuppressWarnings("rawtypes")
	public int selectPrj1100ProcessAuthNoneUsrListCnt(Map paramMap) throws Exception {
		return prj1100DAO.selectPrj1100ProcessAuthNoneUsrListCnt(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public String insertPrj1100ProcessAuthInfo(Map paramMap) throws Exception{
		return prj1100DAO.insertPrj1100ProcessAuthInfo(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int deletePrj1100ProcessAuthInfo(Map paramMap) throws Exception{
		return prj1100DAO.deletePrj1100ProcessAuthInfo(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectPrj1100ProcessReqCnt(Map paramMap) throws Exception {
		return prj1100DAO.selectPrj1100ProcessReqCnt(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj1101FlowList(Map paramMap) throws Exception {
		return prj1100DAO.selectPrj1101FlowList(paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public Map selectPrj1101FlowInfo(Map paramMap) throws Exception {
		return prj1100DAO.selectPrj1101FlowInfo(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void updatePrj1101FlowInfo(Map paramMap) throws Exception {
		
		prj1100DAO.updatePrj1101FlowInfo(paramMap);
	}
	
	
	
	@SuppressWarnings("rawtypes")
	public String insertPrj1101FlowInfo(Map paramMap) throws Exception {
		
		return prj1100DAO.insertPrj1101FlowInfo(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void deletePrj1101FlowInfo(Map paramMap) throws Exception {
		
		prj1100DAO.deletePrj1101FlowInfo(paramMap);
		
		
		prj1100DAO.deletePrj1102OtpInfo(paramMap);
		
		
		prj1100DAO.updatePrj1100ProcessInfo(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj1107FlowLinkList(Map paramMap) throws Exception {
		return prj1100DAO.selectPrj1107FlowLinkList(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj1102ReqOptList(Map paramMap) throws Exception {
		return prj1100DAO.selectPrj1102ReqOptList(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj1102OptList(Map paramMap) throws Exception {
		return prj1100DAO.selectPrj1102OptList(paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public List selectPrj1103OptFileList(Map paramMap) throws Exception {
		return prj1100DAO.selectPrj1103OptFileList(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectPrj1102OptCntInfo(Map paramMap) throws Exception {
		 return prj1100DAO.selectPrj1102OptCntInfo(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void updatePrj1102OtpInfo(Map paramMap) throws Exception {
		prj1100DAO.updatePrj1102OtpInfo(paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public void insertPrj1102OtpInfo(Map paramMap) throws Exception {
		
		prj1100DAO.insertPrj1102OtpInfo(paramMap);
		
		
		prj1100DAO.updatePrj1100ProcessInfo(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void deletePrj1102OtpInfo(Map paramMap) throws Exception {
		
		prj1100DAO.deletePrj1102OtpInfo(paramMap);
		
		
		prj1100DAO.updatePrj1100ProcessInfo(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void insertPrj1103OtpValueInfo(Map paramMap) throws Exception {
		prj1100DAO.insertPrj1103OtpValueInfo(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void updatePrj1103OtpValueInfo(Map paramMap) throws Exception {
		prj1100DAO.updatePrj1103OtpValueInfo(paramMap);
	}
	

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public int insertPrj1105RevisionNumList(Map paramMap) throws Exception {
		int selRepNumCnt = Integer.parseInt((String)paramMap.get("selRepNumCnt"));
		
		
		int addFailRepNumCnt = 0;
		
		if(selRepNumCnt > 1){
			List<String> selRepNumList = (List<String>) paramMap.get("selRepNum");
			
			for(String selRepNumInfo : selRepNumList){
				Map newMap = new HashMap<String, String>();
				
				JSONObject jsonObj = null;
				jsonObj = new JSONObject(selRepNumInfo);
				
				newMap.put("licGrpId", String.valueOf(paramMap.get("licGrpId")));
				newMap.put("prjId", String.valueOf(paramMap.get("prjId")));
				newMap.put("reqId", String.valueOf(paramMap.get("reqId")));
				newMap.put("processId", String.valueOf(paramMap.get("processId")));
				newMap.put("flowId", String.valueOf(paramMap.get("flowId")));
				newMap.put("svnRepId", String.valueOf(jsonObj.get("svnRepId")));
				newMap.put("revisionNum", String.valueOf(jsonObj.get("revisionNum")));
				newMap.put("revisionComment", String.valueOf(jsonObj.get("revisionComment")));
				
				
				int reqRepCnt = prj1100DAO.selectPrj1104ReqRevisionNumCnt(newMap);
				
				
				if(reqRepCnt == 0){
					prj1100DAO.insertPrj1105RevisionNumInfo(newMap);
				}else{
					addFailRepNumCnt++;
				}
			}
		}else{
			String selRepNumInfo = (String) paramMap.get("selRepNum");
			
			Map newMap = new HashMap<String, String>();
			
			JSONObject jsonObj = null;
			jsonObj = new JSONObject(selRepNumInfo);
			
			newMap.put("licGrpId", String.valueOf(paramMap.get("licGrpId")));
			newMap.put("prjId", String.valueOf(paramMap.get("prjId")));
			newMap.put("reqId", String.valueOf(paramMap.get("reqId")));
			newMap.put("processId", String.valueOf(paramMap.get("processId")));
			newMap.put("flowId", String.valueOf(paramMap.get("flowId")));
			newMap.put("svnRepId", String.valueOf(jsonObj.get("svnRepId")));
			newMap.put("revisionNum", String.valueOf(jsonObj.get("revisionNum")));
			newMap.put("revisionComment", String.valueOf(jsonObj.get("revisionComment")));
			
			
			int reqRepCnt = prj1100DAO.selectPrj1104ReqRevisionNumCnt(newMap);
			
			
			if(reqRepCnt == 0){
				prj1100DAO.insertPrj1105RevisionNumInfo(newMap);
			}else{
				addFailRepNumCnt++;
			}
		}
		
		return addFailRepNumCnt;
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void deletePrj1104RevisionNumList(Map paramMap) throws Exception {
		int selRepNumCnt = Integer.parseInt((String)paramMap.get("selRepNumCnt"));
		
		if(selRepNumCnt > 1){
			List<String> selRepNumList = (List<String>) paramMap.get("selRepNum");
			
			for(String selRepNumInfo : selRepNumList){
				Map newMap = new HashMap<String, String>();
				
				JSONObject jsonObj = null;
				jsonObj = new JSONObject(selRepNumInfo);
				
				newMap.put("prjId", String.valueOf(paramMap.get("prjId")));
				newMap.put("reqId", String.valueOf(paramMap.get("reqId")));
				newMap.put("processId", String.valueOf(paramMap.get("processId")));
				newMap.put("flowId", String.valueOf(paramMap.get("flowId")));
				newMap.put("svnRepId", String.valueOf(jsonObj.get("svnRepId")));
				newMap.put("revisionNum", String.valueOf(jsonObj.get("revisionNum")));
				
				
				prj1100DAO.deletePrj1104RevisionNumInfo(newMap);
			}
		}else{
			String selRepNumInfo = (String) paramMap.get("selRepNum");
			
			Map newMap = new HashMap<String, String>();
			
			JSONObject jsonObj = null;
			jsonObj = new JSONObject(selRepNumInfo);
			
			newMap.put("prjId", String.valueOf(paramMap.get("prjId")));
			newMap.put("reqId", String.valueOf(paramMap.get("reqId")));
			newMap.put("processId", String.valueOf(paramMap.get("processId")));
			newMap.put("flowId", String.valueOf(paramMap.get("flowId")));
			newMap.put("svnRepId", String.valueOf(jsonObj.get("svnRepId")));
			newMap.put("revisionNum", String.valueOf(jsonObj.get("revisionNum")));
			
			
			prj1100DAO.deletePrj1104RevisionNumInfo(newMap);
		}
	}
	
	
	@SuppressWarnings("rawtypes")
	public void deletePrj1104RevisionNumInfo(Map paramMap) throws Exception {
		prj1100DAO.deletePrj1104RevisionNumInfo(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj1104ReqRevisionNumList(Map paramMap) throws Exception {
		return prj1100DAO.selectPrj1104ReqRevisionNumList(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectPrj1104ReqRevisionNumListCnt(Map paramMap) throws Exception {
		return prj1100DAO.selectPrj1104ReqRevisionNumListCnt(paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public int selectPrj1104ReqRevisionNumCnt(Map paramMap) throws Exception {
		return prj1100DAO.selectPrj1104ReqRevisionNumCnt(paramMap);
	}

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public int insertPrj1105FlowAuthGrpList(Map paramMap) throws Exception {
		int selAuthCnt = Integer.parseInt((String)paramMap.get("selAuthCnt"));
		
		
		int addFailAuthCnt = 0;
		
		if(selAuthCnt > 1){
			List<String> selAuthList = (List<String>) paramMap.get("selAuth");
			
			for(String selAuthInfo : selAuthList){
				Map newMap = new HashMap<String, String>();
				
				JSONObject jsonObj = null;
				jsonObj = new JSONObject(selAuthInfo);
				
				newMap.put("licGrpId", String.valueOf(paramMap.get("licGrpId")));
				newMap.put("prjId", String.valueOf(paramMap.get("prjId")));
				newMap.put("processId", String.valueOf(paramMap.get("processId")));
				newMap.put("flowId", String.valueOf(paramMap.get("flowId")));
				newMap.put("authGrpId", String.valueOf(jsonObj.get("authGrpId")));
				newMap.put("authGrpTargetCd", String.valueOf(jsonObj.get("authGrpTargetCd")));
				
				
				int flowAuthCnt = prj1100DAO.selectPrj1105FlowAuthGrpCnt(newMap);
				
				
				if(flowAuthCnt == 0){
					prj1100DAO.insertPrj1105FlowAuthGrpInfo(newMap);
				}else{
					addFailAuthCnt++;
				}
			}
		}else{
			String selAuthInfo = (String) paramMap.get("selAuth");
			
			Map newMap = new HashMap<String, String>();
			
			JSONObject jsonObj = null;
			jsonObj = new JSONObject(selAuthInfo);
			
			newMap.put("licGrpId", String.valueOf(paramMap.get("licGrpId")));
			newMap.put("prjId", String.valueOf(paramMap.get("prjId")));
			newMap.put("processId", String.valueOf(paramMap.get("processId")));
			newMap.put("flowId", String.valueOf(paramMap.get("flowId")));
			newMap.put("authGrpId", String.valueOf(jsonObj.get("authGrpId")));
			newMap.put("authGrpTargetCd", String.valueOf(jsonObj.get("authGrpTargetCd")));
			
			
			int reqRepCnt = prj1100DAO.selectPrj1105FlowAuthGrpCnt(newMap);
			
			
			if(reqRepCnt == 0){
				prj1100DAO.insertPrj1105FlowAuthGrpInfo(newMap);
			}else{
				addFailAuthCnt++;
			}
		}
		
		return addFailAuthCnt;
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void deletePrj1105FlowAuthGrpList(Map paramMap) throws Exception {
		int selAuthCnt = Integer.parseInt((String)paramMap.get("selAuthCnt"));
		
		if(selAuthCnt > 1){
			List<String> selAuthList = (List<String>) paramMap.get("selAuth");
			
			for(String selAuthInfo : selAuthList){
				Map newMap = new HashMap<String, String>();
				
				JSONObject jsonObj = null;
				jsonObj = new JSONObject(selAuthInfo);
				
				newMap.put("prjId", String.valueOf(paramMap.get("prjId")));
				newMap.put("processId", String.valueOf(paramMap.get("processId")));
				newMap.put("flowId", String.valueOf(paramMap.get("flowId")));
				newMap.put("authGrpId", String.valueOf(jsonObj.get("authGrpId")));
				newMap.put("authGrpTargetCd", String.valueOf(jsonObj.get("authGrpTargetCd")));
				
				
				prj1100DAO.deletePrj1105FlowAuthGrpInfo(newMap);
			}
		}else{
			String selAuthInfo = (String) paramMap.get("selAuth");
			
			Map newMap = new HashMap<String, String>();
			
			JSONObject jsonObj = null;
			jsonObj = new JSONObject(selAuthInfo);
			
			newMap.put("prjId", String.valueOf(paramMap.get("prjId")));
			newMap.put("processId", String.valueOf(paramMap.get("processId")));
			newMap.put("flowId", String.valueOf(paramMap.get("flowId")));
			newMap.put("authGrpId", String.valueOf(jsonObj.get("authGrpId")));
			newMap.put("authGrpTargetCd", String.valueOf(jsonObj.get("authGrpTargetCd")));
			
			
			prj1100DAO.deletePrj1105FlowAuthGrpInfo(newMap);
		}
	}
	
	
	@SuppressWarnings("rawtypes")
	public void insertPrj1105FlowAuthGrpInfo(Map paramMap) throws Exception {
		prj1100DAO.insertPrj1105FlowAuthGrpInfo(paramMap);
	}
	
	@SuppressWarnings("rawtypes")
	public void deletePrj1105FlowAuthGrpInfo(Map paramMap) throws Exception {
		prj1100DAO.deletePrj1105FlowAuthGrpInfo(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj1105FlowAuthGrpList(Map paramMap) throws Exception {
		return prj1100DAO.selectPrj1105FlowAuthGrpList(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectPrj1105FlowAuthGrpCnt(Map paramMap) throws Exception {
		return prj1100DAO.selectPrj1105FlowAuthGrpCnt(paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public List selectPrj1100ProcessCopyList(Map paramMap) throws Exception {
		return prj1100DAO.selectPrj1100ProcessCopyList(paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void insertPrj1100ProcessCopyInfo(Map paramMap) throws Exception{
		
		List<Map> flowList = prj1100DAO.selectPrj1101FlowList(paramMap);

		
		List<Map> flowOptList = prj1100DAO.selectPrj1102OptList(paramMap);
		
		
		List<Map> flowAuthGrpList = prj1100DAO.selectPrj1105FlowAuthGrpList(paramMap);
				
		paramMap.remove("prjId");
		paramMap.put("prjId", paramMap.get("selPrjId"));
		
		
		paramMap.put("processConfirmCd", "02");
		String processJsonData = (String) paramMap.get("processJsonData");
		paramMap.remove("processJsonData");
		
		String newProcessId = prj1100DAO.insertPrj1100ProcessInfo(paramMap);
		
		paramMap.put("processJsonData", processJsonData);
		paramMap.put("processId", newProcessId);
		
		prj1100DAO.updatePrj1100ProcessInfo(paramMap);
		
		for(Map flowInfo: flowList){
			
			flowInfo.remove("prjId");
			flowInfo.remove("processId");
			
			flowInfo.put("prjId", paramMap.get("prjId"));
			flowInfo.put("processId", newProcessId);
			
			
			prj1100DAO.insertPrj1101FlowInfo(flowInfo);
		}
		

		for(Map flowOptInfo: flowOptList){
			
			flowOptInfo.remove("prjId");
			flowOptInfo.remove("processId");
			
			flowOptInfo.put("prjId", paramMap.get("prjId"));
			flowOptInfo.put("processId",newProcessId);
			
			
			prj1100DAO.insertPrj1102OtpCopyInfo(flowOptInfo);
		}
		
		
		for(Map flowAuthGrpInfo: flowAuthGrpList){
			
			flowAuthGrpInfo.remove("prjId");
			flowAuthGrpInfo.remove("processId");
			
			flowAuthGrpInfo.put("prjId", paramMap.get("prjId"));
			flowAuthGrpInfo.put("processId", newProcessId);
			
			
			prj1100DAO.insertPrj1105FlowAuthGrpInfo(flowAuthGrpInfo);
		}
	}
	

	
	@SuppressWarnings("rawtypes")
	public List selectPrj1102FlwOptExistFileIdList(Map paramMap) throws Exception {
		return prj1100DAO.selectPrj1102FlwOptExistFileIdList(paramMap);
	}
}
