package kr.opensoftlab.lunaops.req.req2000.req2000.service.impl;

import java.util.List;
import java.util.Map;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;
import kr.opensoftlab.sdf.excel.ExcelDataListResultHandler;

import org.springframework.stereotype.Repository;



@Repository("req2000DAO")
public class Req2000DAO extends ComOslitsAbstractDAO {
	
	
	@SuppressWarnings("rawtypes")
	public List selectReq2000ReqClsList(Map paramMap) throws Exception {
		 return (List) list("req2000DAO.selectReq2000ReqClsList", paramMap);
    }
	
	
	@SuppressWarnings("rawtypes")
	public Map selectReq2000ReqClsInfo(Map paramMap) throws Exception{
		return (Map) select("req2000DAO.selectReq2000ReqClsInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public String insertReq2000ReqClsInfo(Map paramMap) throws Exception{
		return (String) insert("req2000DAO.insertReq2000ReqClsInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public Map selectReq2000DelPosibleYn(Map paramMap) throws Exception{
		return (Map) select("req2000DAO.selectReq2000DelPosibleYn", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int deleteReq2000ReqClsInfo(Map paramMap) throws Exception{
		return (int) delete("req2000DAO.deleteReq2000ReqClsInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int updateReq2000ReqClsInfo(Map paramMap) throws Exception{
		return (int) update("req2000DAO.updateReq2000ReqClsInfo", paramMap);
	}

	@SuppressWarnings("rawtypes")
	public void selectReq2000ExcelList(Map paramMap,
			ExcelDataListResultHandler resultHandler) throws Exception {
		listExcelDownSql("req2000DAO.selectReq2000ReqClsList", paramMap, resultHandler);
		
	}

	
	@SuppressWarnings("rawtypes")
	public String insertReq2000WizardReqClsInfo(Map paramMap) throws Exception{
		return (String) insert("req2000DAO.insertReq2000WizardReqClsInfo", paramMap);
	}
}