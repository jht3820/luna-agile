package kr.opensoftlab.lunaops.stm.stm9000.stm9200.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;


@Repository("stm9200DAO")
public class Stm9200DAO extends ComOslitsAbstractDAO {
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map> selectStm9200PrjAssignJenkinsJobList(Map paramMap) throws Exception{
		return (List<Map>) list("stm9200DAO.selectStm9002PrjAssignJenkinsJobList", paramMap);
	}

	
	@SuppressWarnings("rawtypes" )
	public int selectStm9200PrjAssignJenkinsJobListCnt(Map paramMap) throws Exception{
		return (Integer) select("stm9200DAO.selectStm9002PrjAssignJenkinsJobListCnt", paramMap);
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map> selectStm9200PrjNotAssignJenkinsJobList(Map paramMap) throws Exception{
		return (List<Map>) list("stm9200DAO.selectStm9002PrjNotAssignJenkinsJobList", paramMap);
	}

	
	@SuppressWarnings("rawtypes" )
	public int selectStm9200PrjNotAssignJenkinsJobListCnt(Map paramMap) throws Exception{
		return (Integer) select("stm9200DAO.selectStm9002PrjNotAssignJenkinsJobListCnt", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void insertStm9200JenkinsJobInfo(Map paramMap) throws Exception {
		insert("stm9200DAO.insertStm9002JenkinsJobInfo", paramMap);
	} 
	
	
	@SuppressWarnings("rawtypes")
	public void deleteStm9200JenkinsJobInfo(Map paramMap) throws Exception {
		delete("stm9200DAO.deleteStm9002JenkinsJobInfo", paramMap);
	} 
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map> selectStm9200PrjAssignDplAuthList(Map paramMap) throws Exception{
		return (List<Map>) list("stm9200DAO.selectStm9003PrjAssignDplAuthList", paramMap);
	}

	
	@SuppressWarnings("rawtypes" )
	public int selectStm9200PrjAssignDplAuthListCnt(Map paramMap) throws Exception{
		return (Integer) select("stm9200DAO.selectStm9003PrjAssignDplAuthListCnt", paramMap);
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map> selectStm9200PrjNotAssignDplAuthList(Map paramMap) throws Exception{
		return (List<Map>) list("stm9200DAO.selectStm9003PrjNotAssignDplAuthList", paramMap);
	}

	
	@SuppressWarnings("rawtypes" )
	public int selectStm9200PrjNotAssignDplAuthListCnt(Map paramMap) throws Exception{
		return (Integer) select("stm9200DAO.selectStm9003PrjNotAssignDplAuthListCnt", paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public void insertStm9200DplAuthInfo(Map paramMap) throws Exception {
		insert("stm9200DAO.insertStm9003DplAuthInfo", paramMap);
	} 
	
	
	@SuppressWarnings("rawtypes")
	public void deleteStm9200DplAuthInfo(Map paramMap) throws Exception {
		delete("stm9200DAO.deleteStm9003DplAuthInfo", paramMap);
	} 
}
