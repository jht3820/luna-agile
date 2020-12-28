package kr.opensoftlab.lunaops.stm.stm9000.stm9000.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.codehaus.jettison.json.JSONObject;
import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.opensoftlab.lunaops.stm.stm9000.stm9000.service.Stm9000Service;
import kr.opensoftlab.lunaops.stm.stm9000.stm9000.vo.Stm9001VO;
import kr.opensoftlab.lunaops.stm.stm9000.stm9100.service.impl.Stm9100DAO;


@Service("stm9000Service")
public class Stm9000ServiceImpl  extends EgovAbstractServiceImpl implements Stm9000Service{

	
    @Resource(name="stm9000DAO")
    private Stm9000DAO stm9000DAO;
  
	
    @Resource(name="stm9100DAO")
    private Stm9100DAO stm9100DAO;    

    
    @SuppressWarnings("rawtypes")
	public List<Map> selectStm9000JenkinsList(Map paramMap) throws Exception {
		return stm9000DAO.selectStm9000JenkinsList(paramMap);
	}
	
	
    @SuppressWarnings("rawtypes")
	public int selectStm9000JenkinsListCnt(Map paramMap) throws Exception {
		return stm9000DAO.selectStm9000JenkinsListCnt(paramMap);
	}
    
    
    
	
	@SuppressWarnings({ "rawtypes" })
	public List<Map> selectStm9000JenkinsNormalList(Map paramMap) throws Exception {
		return stm9000DAO.selectStm9000JenkinsNormalList(paramMap);
	}
	
	
	@SuppressWarnings({"rawtypes" })
	public List<Map> selectStm9000JobNormalList(Map paramMap) throws Exception {
		return stm9000DAO.selectStm9000JobNormalList(paramMap);
	}
	
	
	
	public List<Stm9001VO> selectStm9000JobList(Stm9001VO jen1100VO) throws Exception {
		return stm9000DAO.selectStm9000JobList(jen1100VO);
	}
	
	
	
	public int selectStm9000JobListCnt(Stm9001VO jen1100VO) throws Exception {
		return stm9000DAO.selectStm9000JobListCnt(jen1100VO);
	}
	
	
	@SuppressWarnings("rawtypes")
	public Map selectStm9000JenkinsInfo(Map<String, String> paramMap) throws Exception {
		return stm9000DAO.selectStm9000JenkinsInfo(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public Map selectStm9000JobInfo(Map<String, String> paramMap) throws Exception {
		return stm9000DAO.selectStm9000JobInfo(paramMap);
	}
	
	
	public String insertStm9000JenkinsInfo(Map<String, String> paramMap) throws Exception {
		return stm9000DAO.insertStm9000JenkinsInfo(paramMap);
	}
	
	
	public String insertStm9000JobInfo(Map<String, String> paramMap) throws Exception {
		return stm9000DAO.insertStm9000JobInfo(paramMap);
	}
	
	
	public int updateStm9000JenkinsInfo(Map<String, String> paramMap) throws Exception {
		return stm9000DAO.updateStm9000JenkinsInfo(paramMap);
	}
	
	
	public int updateStm9000JobInfo(Map<String, String> paramMap) throws Exception {
		return stm9000DAO.updateStm9000JobInfo(paramMap);
	}

	
	public void deleteStm9000JenkinsInfo(Map<String, String> paramMap)  throws Exception{
		stm9000DAO.deleteStm9000JenkinsInfo(paramMap);
	}
	
	
	public void deleteStm9000JobInfo(Map<String, String> paramMap) throws Exception {
		
		
		stm9000DAO.deleteStm9000JobInfo(paramMap);
		
		
		stm9100DAO.deleteStm9100ProjectDelJob(paramMap);
		
		
		stm9100DAO.deleteStm9100JenkinsJobAuthGrpInfo(paramMap);

		
		stm9100DAO.updateJen1100JenkinsJobRestoreInfo(paramMap);
	}
	
	
	public int selectStm9000JenkinsUseCountInfo(Map<String, String> paramMap)  throws Exception{
		return stm9000DAO.selectStm9000JenkinsUseCountInfo(paramMap);
	}
	
	
	public int selectStm9000JobUseCountInfo(Map<String, String> paramMap) throws Exception {
		return stm9000DAO.selectStm9000JobUseCountInfo(paramMap);
	}

	
	public Object saveStm9000JenkinsInfo(Map<String, String> paramMap)  throws Exception{
		String insNewJenId ="";
		int result = 0;
		String popupGb = (String)paramMap.get("popupGb");
		
		if("insert".equals(popupGb)){
			insNewJenId = stm9000DAO.insertStm9000JenkinsInfo(paramMap);
			return insNewJenId;
		}else if("update".equals(popupGb)){
			result = stm9000DAO.updateStm9000JenkinsInfo(paramMap);
			return result;
		}
		return null;
	}
	
	
	public Object saveStm9000JobInfo(Map<String, String> paramMap)  throws Exception{
		String insNewJenId ="";
		int result = 0;
		String popupGb = (String)paramMap.get("popupGb");
		
		if("insert".equals(popupGb)){
			insNewJenId = stm9000DAO.insertStm9000JobInfo(paramMap);
			return insNewJenId;
		}else if("update".equals(popupGb)){
			
			String beforeJobTypeCd = (String)paramMap.get("beforeJobTypeCd");
			String jobTypeCd = (String)paramMap.get("jobTypeCd");
			
			
			if("03".equals(beforeJobTypeCd)){
				
				if(!jobTypeCd.equals(beforeJobTypeCd)) {
					
					stm9100DAO.updateJen1100JenkinsJobRestoreInfo(paramMap);
				}
			}
			
			result = stm9000DAO.updateStm9000JobInfo(paramMap);
			return result;
		}
		return null;
	}
	
	
	@SuppressWarnings({"rawtypes"})
	public List<Map> selectStm9000JenkinsUserList(Map map) throws Exception{
		return stm9000DAO.selectStm9000JenkinsUserList(map);
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public int insertStm9000JenAuthGrpList(Map paramMap) throws Exception {
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
				newMap.put("jenId", String.valueOf(paramMap.get("jenId")));
				newMap.put("authGrpId", String.valueOf(jsonObj.get("authGrpId")));
				
				
				int flowAuthCnt = stm9000DAO.selectStm9000JenAuthGrpCnt(newMap);
				
				
				if(flowAuthCnt == 0){
					stm9000DAO.insertStm9000JenAuthGrpInfo(newMap);
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
			newMap.put("jenId", String.valueOf(paramMap.get("jenId")));
			newMap.put("authGrpId", String.valueOf(jsonObj.get("authGrpId")));
			
			
			int reqRepCnt = stm9000DAO.selectStm9000JenAuthGrpCnt(newMap);
			
			
			if(reqRepCnt == 0){
				stm9000DAO.insertStm9000JenAuthGrpInfo(newMap);
			}else{
				addFailAuthCnt++;
			}
		}
		
		return addFailAuthCnt;
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void deleteStm9000JenAuthGrpList(Map paramMap) throws Exception {
		int selAuthCnt = Integer.parseInt((String)paramMap.get("selAuthCnt"));
		
		if(selAuthCnt > 1){
			List<String> selAuthList = (List<String>) paramMap.get("selAuth");
			
			for(String selAuthInfo : selAuthList){
				Map newMap = new HashMap<String, String>();
				
				JSONObject jsonObj = null;
				jsonObj = new JSONObject(selAuthInfo);
				
				newMap.put("prjId", String.valueOf(paramMap.get("prjId")));
				newMap.put("jenId", String.valueOf(paramMap.get("jenId")));
				newMap.put("authGrpId", String.valueOf(jsonObj.get("authGrpId")));
				
				
				stm9000DAO.deleteStm9000JenAuthGrpInfo(newMap);
			}
		}else{
			String selAuthInfo = (String) paramMap.get("selAuth");
			
			Map newMap = new HashMap<String, String>();
			
			JSONObject jsonObj = null;
			jsonObj = new JSONObject(selAuthInfo);
			
			newMap.put("prjId", String.valueOf(paramMap.get("prjId")));
			newMap.put("jenId", String.valueOf(paramMap.get("jenId")));
			newMap.put("authGrpId", String.valueOf(jsonObj.get("authGrpId")));
			
			
			stm9000DAO.deleteStm9000JenAuthGrpInfo(newMap);
		}
	}

	
	@SuppressWarnings("rawtypes")
	public void insertStm9000JenAuthGrpInfo(Map paramMap) throws Exception {
		stm9000DAO.insertStm9000JenAuthGrpInfo(paramMap);
	}
	
	@SuppressWarnings("rawtypes")
	public void deleteStm9000JenAuthGrpInfo(Map paramMap) throws Exception {
		stm9000DAO.deleteStm9000JenAuthGrpInfo(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectStm9000JenAuthGrpList(Map paramMap) throws Exception {
		return stm9000DAO.selectStm9000JenAuthGrpList(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectStm9000JenAuthGrpCnt(Map paramMap) throws Exception {
		return stm9000DAO.selectStm9000JenAuthGrpCnt(paramMap);
	}
}
