package kr.opensoftlab.lunaops.prj.prj3000.prj3200.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;


@Repository("prj3200DAO")
public class Prj3200DAO extends ComOslitsAbstractDAO{

	
	public int selectPrj3200DocConListCnt(Map<String, String> paramMap) throws Exception{
		return (Integer) select("prj3200DAO.selectPrj3200DocConCnt", paramMap);
	}

	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map> selectPrj3200DocConList(Map<String, String> paramMap) throws Exception{
		return (List<Map>) list("prj3200DAO.selectPrj3200DocConList",paramMap);
	}

	
	public int selectPrj3200ConTargetCnt(Map<String, String> paramMap) {
		return (Integer) select("prj3200DAO.selectPrj3200ConTargetCnt", paramMap);
	}

	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List selectPrj3200ConTargetList(Map<String, String> paramMap) {
		return (List<Map>) list("prj3200DAO.selectPrj3000ConTargetList", paramMap);
	}

	
	public void insertPrj3200DocConInfo(Map<String, String> paramMap) throws Exception{
		insert("prj3200DAO.selectPrj3200DocConInfo", paramMap);
	}

	
	public void deletePrj3200DocConInfo(Map<String, String> paramMap) throws Exception{
		delete("prj3200DAO.deletePrj3200DocConInfo", paramMap);
		
	}

}
