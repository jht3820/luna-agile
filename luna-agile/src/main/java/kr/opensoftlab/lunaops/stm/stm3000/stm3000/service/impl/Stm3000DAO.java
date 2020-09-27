package kr.opensoftlab.lunaops.stm.stm3000.stm3000.service.impl;

import java.util.List;
import java.util.Map;

import kr.opensoftlab.lunaops.stm.stm3000.stm3000.vo.Stm3000VO;
import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;
import kr.opensoftlab.sdf.excel.ExcelDataListResultHandler;

import org.springframework.stereotype.Repository;



@Repository("stm3000DAO")
public class Stm3000DAO extends ComOslitsAbstractDAO {
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map> selectStm3000UsrList(Map paramMap) throws Exception{
		return (List<Map>) list("stm3000DAO.selectStm3000UsrList", paramMap);    
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectStm3000UsrListCnt(Map paramMap) throws Exception {
		return  (Integer)select("stm3000DAO.selectStm3000UsrListCnt", paramMap);
	} 
	
	
    @SuppressWarnings("rawtypes")
	public Map selectStm3000UsrInfo(Map paramMap) throws Exception {
        return (Map) select("stm3000DAO.selectStm3000UsrInfo", paramMap);    
    }
    
    
	@SuppressWarnings("rawtypes")
	public String insertStm3000UsrInfo(Map paramMap) throws Exception{
		return (String)insert("stm3000DAO.insertStm3000UsrInfo", paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public int updateStm3000UsrInfo(Map paramMap) throws Exception{
		return (int)update("stm3000DAO.updateStm3000UsrInfo", paramMap );
	}

	
	@SuppressWarnings("rawtypes")
	public int selectCmm2000IdCheck(Map paramMap)  throws Exception{
		return (Integer)select("stm3000DAO.selectCmm2000IdCheck", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectStm3000EmailCheck(Map paramMap)  throws Exception{
		return (Integer)select("stm3000DAO.selectStm3000EmailCheck", paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public int updateStm3000UseCd(Map paramMap) throws Exception{
		return (int) update("stm3000DAO.updateStm3000UseCd", paramMap );
	}

	
	@SuppressWarnings("rawtypes")
	public int deleteStm3000UsrInfo(Map paramMap) throws Exception{
		return (int) update("stm3000DAO.deleteStm3000UsrInfo", paramMap);
	}
	
	
	public void  selectStm3000ExcelList(Stm3000VO Stm3000VO, ExcelDataListResultHandler resultHandler) throws Exception {
		listExcelDownSql("stm3000DAO.selectStm3000ExcelList", Stm3000VO, resultHandler);
	}

	
	public String insertStm3000AdmInfoAjax(Map<String, String> paramMap) throws Exception {
		return (String)insert("stm3000DAO.insertStm3000UsrInfo", paramMap);
	}
	
	
	public int selectAdm1300ExistUsrInProject(Map<String, String> paramMap) throws Exception {
		return (int)select("stm3000DAO.selectAdm1300ExistUsrInProject", paramMap);
	}

	
	public String selectStm3000PwCheck(Map<String, String> paramMap) throws Exception {
		return (String) select("stm3000DAO.selectStm3000PwCheck", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int updateStm3000Block(Map paramMap) throws Exception{
		return (int) update("stm3000DAO.updateStm3000Block", paramMap );
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectStm3000PrjAuthUserList(Map paramMap) throws Exception {
		return(List) list("stm3000DAO.selectStm3000PrjAuthUserList", paramMap);
	}

	
	public int updateStm3000AccountInit(Map<String, String> paramMap) throws Exception {
		return update("stm3000DAO.updateStm3000AccountInit", paramMap );
	}

	
	@SuppressWarnings("rawtypes")
	public void insertStm3002BlockLog(Map paramMap) throws Exception {
		insert("stm3000DAO.insertStm3002BlockLog", paramMap );
	}
	
	
	public int updateStm3000PasswordExprInit(Map<String, String> paramMap) throws Exception{
		return update("stm3000DAO.updateStm3000PasswordExprInit", paramMap );
	}
	
}