package kr.opensoftlab.lunaops.stm.stm6000.stm6000.service.impl;

import java.util.List;
import java.util.Map;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;
import kr.opensoftlab.sdf.excel.ExcelDataListResultHandler;

import org.springframework.stereotype.Repository;


@Repository("stm6000DAO")
public class Stm6000DAO extends ComOslitsAbstractDAO {
	
	
	@SuppressWarnings("rawtypes")
	public List selectStm6000DeptList(Map paramMap) throws Exception {
		 return (List) list("stm6000DAO.selectStm6000DeptList", paramMap);
    }
	
	
	@SuppressWarnings("rawtypes")
	public List selectStm6000SubDeptList(Map paramMap) throws Exception {
		 return (List) list("stm6000DAO.selectStm6000SubDeptList", paramMap);
    }
	
	
	@SuppressWarnings("rawtypes")
	public Map selectStm6000DeptInfo(Map paramMap) throws Exception{
		return (Map) select("stm6000DAO.selectStm6000DeptInfo", paramMap);
	}
	
	
	
	@SuppressWarnings("rawtypes")
	public String insertStm6000RootDeptInfo(Map paramMap) throws Exception{
		return (String) insert("stm6000DAO.insertStm6000RootDeptInfo", paramMap);
	}
	
	
	
	@SuppressWarnings("rawtypes")
	public String insertStm6000DeptInfo(Map paramMap) throws Exception{
		return (String) insert("stm6000DAO.insertStm6000DeptInfo", paramMap);
	}
	
	
	
	@SuppressWarnings("rawtypes")
	public int updateStm6000DpteInfo(Map paramMap) throws Exception{
		return (int) update("stm6000DAO.updateStm6000DpteInfo", paramMap);
	}
	
	
	
	@SuppressWarnings("rawtypes")
	public int deleteStm6000DeptInfo(Map paramMap) throws Exception{
		return (int) delete("stm6000DAO.deleteStm6000DeptInfo", paramMap);
	}
	
	
	
	@SuppressWarnings({"rawtypes", "unchecked"})
	public List<Map> selectStm6000BeforeCmmDeptList(Map paramMap) throws Exception {
		 return (List<Map>) list("stm6000DAO.selectStm6000BeforeCmmDeptList", paramMap);
    }
	
	
	
	@SuppressWarnings("rawtypes")
	public int selectStm6000ExistDeptChk(Map paramMap) throws Exception{
		return (int)select("stm6000DAO.selectStm6000ExistDeptChk", paramMap);
	}
	
	
	
	@SuppressWarnings("rawtypes")
	public void selectStm6000ExcelList(Map paramMap, ExcelDataListResultHandler resultHandler) throws Exception {
		listExcelDownSql("stm6000DAO.selectStm6000NormalDeptList", paramMap, resultHandler);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectStm6000NormalDeptList(Map paramMap) throws Exception {
		return (List) list("stm6000DAO.selectStm6000NormalDeptList", paramMap);
	}
	
	
	
	@SuppressWarnings("rawtypes")
	public int selectStm6000DeptNextOrd(Map paramMap) throws Exception{
		return (int) select("stm6000DAO.selectStm6000DeptNextOrd", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectStm6000ExistUsrInDept(Map paramMap) throws Exception{
		return (int) select("stm6000DAO.selectStm6000ExistUsrInDept", paramMap);
	}
	
}
