package kr.opensoftlab.lunaops.stm.stm4000.stm4000.service.impl;

import java.util.List;
import java.util.Map;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;
import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.sdf.excel.ExcelDataListResultHandler;

import org.springframework.stereotype.Repository;


@Repository("stm4000DAO")
public class Stm4000DAO extends ComOslitsAbstractDAO {
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map> selectStm4000CommonCodeMasterList(Map paramMap)  throws Exception{
		return (List<Map>) list("stm4000DAO.selectStm4000CommonCodeMasterList", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectStm4000CommonCodeMasterListCnt(Map paramMap) throws Exception {
		return  (Integer)select("stm4000DAO.selectStm4000CommonCodeMasterListCnt", paramMap);
	}
	
	
    @SuppressWarnings("rawtypes")
	public Map selectStm4000CommonCodeMasterInfo(Map paramMap) throws Exception {
        return (Map) select("stm4000DAO.selectStm4000CommonCodeMasterInfo", paramMap);    
    }
	
	
	@SuppressWarnings({"unchecked", "rawtypes" })
	public List<Map> selectStm4000CommonCodeDetailList(Map paramMap) throws Exception{
		return (List<Map>) list("stm4000DAO.selectStm4000CommonCodeDetailList", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectStm4000CommonCodeDetailListCnt(Map paramMap) throws Exception {
		return  (Integer)select("stm4000DAO.selectStm4000CommonCodeDetailListCnt", paramMap);
	}
	
	
    @SuppressWarnings("rawtypes")
	public Map selectStm4000CommonCodeDetailInfo(Map paramMap) throws Exception {
        return (Map) select("stm4000DAO.selectStm4000CommonCodeDetailInfo", paramMap);    
    }
	
    
	@SuppressWarnings("rawtypes")
	public void insertStm4000CommonCodeMaster(Map paramMap) throws Exception{
		insert("stm4000DAO.insertStm4000CommonCodeMaster", paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public void updateStm4000CommonCodeMaster(Map paramMap) throws Exception{
		update("stm4000DAO.updateStm4000CommonCodeMaster", paramMap );
	}

	
	@SuppressWarnings("rawtypes")
	public void deleteStm4000CommonCodeMaster(Map paramMap) throws Exception {
		
		delete("stm4000DAO.deleteStm4000CommonCodeMaster", paramMap);
	}
	

	
	@SuppressWarnings("rawtypes")
	public void deleteStm4000CommonCodeDetailAll(Map paramMap) throws Exception{
		
		delete("stm4000DAO.deleteStm4000CommonCodeDetailToMstCd", paramMap);
	}
	
    
	@SuppressWarnings("rawtypes")
	public void insertStm4000CommonCodeDetail(Map paramMap) throws Exception{
		insert("stm4000DAO.insertStm4000CommonCodeDetail", paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public void updateStm4000CommonCodeDetail(Map paramMap) throws Exception{
		update("stm4000DAO.updateStm4000CommonCodeDetail", paramMap );
	}
	
	
	@SuppressWarnings("rawtypes")
	public void deleteStm4000CommonCodeDetail(Map paramMap) throws Exception {
		delete("stm4000DAO.deleteStm4000CommonCodeDetail", paramMap);
	}

	
	public void  selectStm4000MasterExcelList(LoginVO loginVO, ExcelDataListResultHandler resultHandler) throws Exception {
		listExcelDownSql("stm4000DAO.selectStm4000MasterExcelList", loginVO, resultHandler);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void  selectStm4000DetailExcelList(Map paramMap, ExcelDataListResultHandler resultHandler) throws Exception {
		listExcelDownSql("stm4000DAO.selectStm4000DetailExcelList", paramMap, resultHandler);
	}

	
	@SuppressWarnings("rawtypes")
	public int selectStm4000CommonCodeCount(Map paramMap) throws Exception {
		return (Integer)select("stm4000DAO.selectStm4000CommonCodeCount", paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public int selectStm4000CommonDetailCodeCount(Map paramMap) throws Exception {
		return (Integer)select("stm4000DAO.selectStm4000CommonDetailCodeCount", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectStm4000MstCodeNextOrd(Map paramMap) throws Exception{
		return (Integer) select("stm4000DAO.selectStm4000MstCodeNextOrd",paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectStm4000DetailCodeNextOrd(Map paramMap) throws Exception{
		return (Integer) select("stm4000DAO.selectStm4000DetailCodeNextOrd",paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public List selectStm4000MultiCommonCodeList(Map paramMap) throws Exception{
		return list("stm4000DAO.selectStm4000MultiCommonCodeList", paramMap);
	}
}
