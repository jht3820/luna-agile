package kr.opensoftlab.lunaops.stm.stm6000.stm6000.service;

import java.util.List;
import java.util.Map;

import kr.opensoftlab.sdf.excel.ExcelDataListResultHandler;


public interface Stm6000Service {
	
	
	@SuppressWarnings("rawtypes")
	public List selectStm6000DeptList(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	public List selectStm6000SubDeptList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	public Map selectStm6000DeptInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	public String insertStm6000RootDeptInfo(Map paramMap) throws Exception;
	
	
	
	@SuppressWarnings("rawtypes")
	public String insertStm6000DeptInfo(Map paramMap) throws Exception;
	
	
	
	@SuppressWarnings("rawtypes")
	public void updateStm6000DpteInfo(Map paramMap) throws Exception;
	
	
	
	public Map<String, Object> deleteStm6000DeptInfo(Map<String, String> paramMap) throws Exception;
	
	
	
	@SuppressWarnings("rawtypes")
	public List selectStm6000BeforeCmmDeptList(Map paramMap) throws Exception;
	
	
	
	@SuppressWarnings("rawtypes")
	int selectStm6000ExistDeptChk(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void selectStm6000ExcelList(Map paramMap, ExcelDataListResultHandler resultHandler) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	List selectStm6000NormalDeptList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	int selectStm6000DeptNextOrd(Map paramMap) throws Exception;
}
