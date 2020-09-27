package kr.opensoftlab.lunaops.stm.stm5000.stm5000.service.impl;

import java.util.List;
import java.util.Map;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;
import kr.opensoftlab.lunaops.stm.stm5000.stm5000.vo.Stm5000VO;
import kr.opensoftlab.sdf.excel.ExcelDataListResultHandler;

import org.springframework.stereotype.Repository;



@Repository("stm5000DAO")
public class Stm5000DAO  extends ComOslitsAbstractDAO {
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map>  selectStm5000List(Map paramMap) throws Exception {
		return  (List<Map>) list("stm5000DAO.selectStm5000List", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectStm5000ListCnt(Map paramMap) throws Exception {
		return  (Integer)select("stm5000DAO.selectStm5000ListCnt", paramMap);
	}
	
	
	public void selectStm5000ExcelList(Stm5000VO stm5000Vo, ExcelDataListResultHandler resultHandler) throws Exception {
		listExcelDownSql("stm5000DAO.selectStm5000ExcelList", stm5000Vo, resultHandler);	
	} 
	
	
	@SuppressWarnings("rawtypes")
	public void insertStm5000AuthLoginLog(Map paramMap) throws Exception{
		insert("stm5000DAO.insertStm5000AuthLoginLog", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	void updateStm5000AuthLogoutLog(Map paramMap) throws Exception{
		update("stm5000DAO.updateStm5000AuthLogoutLog", paramMap);
	}
		
	
	@SuppressWarnings("rawtypes")
	public Map selectStm5000LastLogin(Map paramMap) throws Exception{
		return (Map) select("stm5000DAO.selectStm5000LastLogin", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public Map selectStm5000RecentLogin(Map paramMap) throws Exception{
		return (Map) select("stm5000DAO.selectStm5000RecentLogin", paramMap);
	}
	
}