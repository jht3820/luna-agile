package kr.opensoftlab.lunaops.stm.stm5000.stm5100.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;
import kr.opensoftlab.lunaops.stm.stm5000.stm5100.vo.Stm5100VO;
import kr.opensoftlab.sdf.excel.ExcelDataListResultHandler;


@Repository("stm5100DAO")
public class Stm5100DAO  extends ComOslitsAbstractDAO {
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map>  selectStm5100List(Map paramMap) throws Exception {
		return  (List<Map>) list("stm5100DAO.selectStm5100List", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectStm5100ListCnt(Map paramMap) throws Exception {
		return (Integer)select("stm5100DAO.selectStm5100ListCnt", paramMap);
	}

	
	public void selectStm5100ExcelList(Stm5100VO stm5100vo, ExcelDataListResultHandler resultHandler) throws Exception {
		listExcelDownSql("stm5100DAO.selectStm5100ExcelList", stm5100vo, resultHandler);
	} 
	
	
	@SuppressWarnings("rawtypes")
	public void insertStm5100AuthLoginLog(Map paramMap) throws Exception{
		insert("stm5100DAO.insertStm5100SystemUseLog", paramMap);
	}
}