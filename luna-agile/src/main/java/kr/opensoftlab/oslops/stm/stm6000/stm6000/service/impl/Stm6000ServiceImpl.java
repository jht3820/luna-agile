package kr.opensoftlab.lunaops.stm.stm6000.stm6000.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.opensoftlab.lunaops.stm.stm6000.stm6000.service.Stm6000Service;
import kr.opensoftlab.lunaops.com.exception.UserDefineException;
import kr.opensoftlab.sdf.excel.ExcelDataListResultHandler;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;


@Service("stm6000Service")
public class Stm6000ServiceImpl extends EgovAbstractServiceImpl implements Stm6000Service {

	
    @Resource(name="stm6000DAO")
    private Stm6000DAO stm6000DAO;
    
    
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	
	
	@SuppressWarnings("rawtypes")
	@Override
	public List selectStm6000DeptList(Map paramMap) throws Exception {
		return stm6000DAO.selectStm6000DeptList(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectStm6000SubDeptList(Map paramMap) throws Exception {
		 return stm6000DAO.selectStm6000SubDeptList(paramMap);
    }
	
	
	@SuppressWarnings("rawtypes")
	public Map selectStm6000DeptInfo(Map paramMap) throws Exception{
		return stm6000DAO.selectStm6000DeptInfo(paramMap);
	}

	
	
	@SuppressWarnings("rawtypes")
	@Override
	public String insertStm6000RootDeptInfo(Map paramMap) throws Exception {
		return stm6000DAO.insertStm6000RootDeptInfo(paramMap);
	}

	
	
	@SuppressWarnings("rawtypes")
	@Override
	public String insertStm6000DeptInfo(Map paramMap) throws Exception {
	
		//상위 조직 정보를 이용해 하위 조직기본정보 등록
		String newDeptId = stm6000DAO.insertStm6000DeptInfo(paramMap);
		
		// 생성된 ID가 없으면 튕겨낸다.
		if(newDeptId == null || "".equals(newDeptId)){
			throw new UserDefineException(egovMessageSource.getMessage("stm6000.notFoundUpperDept.fail"));
		}
		
		return newDeptId;
	}


	
	@SuppressWarnings("rawtypes")
	@Override
	public void updateStm6000DpteInfo(Map paramMap) throws Exception {
		
		int updateCnt = stm6000DAO.updateStm6000DpteInfo(paramMap);
		
		// 수정된 건이 없으면 튕겨낸다.
		if(updateCnt == 0){
			throw new UserDefineException(egovMessageSource.getMessage("fail.common.update"));
		}
	}


	
	@SuppressWarnings({"rawtypes", "unchecked"})
	@Override
	public Map<String, Object> deleteStm6000DeptInfo(Map<String, String> paramMap) throws Exception {
		
		// 처리결과 코드와 메시지를 담을 Map
		Map<String, Object> resultMap = new HashMap<String, Object>();
		// 사용자가 배정된 조직 목록
		List<String> usrInDeptNmList = new ArrayList<String>();
		
		String licGrpId = paramMap.get("licGrpId");
		String deleteDataList = paramMap.get("deleteDataList");
		
		//JSON파서 선언
		JSONParser jsonParser = new JSONParser();
		JSONArray jsonArray = (JSONArray) jsonParser.parse(deleteDataList);
		
		int deptUsrCnt = 0; // 삭제 대상 조직 중 사용자가 배정된 조직 수
		
		for(int i=0;i<jsonArray.size();i++) {
			
			JSONObject jsonObj = (JSONObject) jsonArray.get(i);
			
			//json to Map
			Map deptMap = new Gson().fromJson(jsonObj.toJSONString(), new HashMap().getClass());
			deptMap.put("licGrpId", licGrpId);
			
			// root 삭제인지 체크
			if(deptMap.get("upperDeptId") == null){
				resultMap.put("code", "-1");
				resultMap.put("message", egovMessageSource.getMessage("stm6000.fail.delete.root"));
				return resultMap;
			}
			
			// 배정 사용자 조회
			int cnt = stm6000DAO.selectStm6000ExistUsrInDept(deptMap);
			if(cnt > 0) {
				deptUsrCnt++;
				usrInDeptNmList.add((String)deptMap.get("deptName"));
			}
		}
		
		// 사용자 배정된 조직이 있을 경우
		if(deptUsrCnt > 0) {
			resultMap.put("code", "-1");
			// 사용자가 배정된 조직명 전달
			resultMap.put("message", egovMessageSource.getMessage("stm6000.fail.delete.userAssignDept"));
			resultMap.put("resultData", usrInDeptNmList);
			return resultMap;
		}
		
		// 정상일 경우 조직 삭제
		for(int i=0;i<jsonArray.size();i++) {
			
			JSONObject deptJsonObj = (JSONObject) jsonArray.get(i);
			//json to Map
			Map delInfoMap = new Gson().fromJson(deptJsonObj.toJSONString(), new HashMap().getClass());
			delInfoMap.put("licGrpId", licGrpId);
			
			stm6000DAO.deleteStm6000DeptInfo(delInfoMap);
		}
		
		return resultMap;
	}

	
	
	@SuppressWarnings("rawtypes")
	@Override
	public List<Map> selectStm6000BeforeCmmDeptList(Map paramMap) throws Exception {
		return stm6000DAO.selectStm6000BeforeCmmDeptList(paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	@Override
	public int selectStm6000ExistDeptChk(Map paramMap) throws Exception {
		return stm6000DAO.selectStm6000ExistDeptChk(paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	@Override
	public void selectStm6000ExcelList(Map paramMap, ExcelDataListResultHandler resultHandler) throws Exception {
		stm6000DAO.selectStm6000ExcelList(paramMap,resultHandler);
	}

	
	@SuppressWarnings("rawtypes")
	public List selectStm6000NormalDeptList(Map paramMap) throws Exception {
		return stm6000DAO.selectStm6000NormalDeptList(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectStm6000DeptNextOrd(Map paramMap) throws Exception{
		return stm6000DAO.selectStm6000DeptNextOrd(paramMap);
	}
}
