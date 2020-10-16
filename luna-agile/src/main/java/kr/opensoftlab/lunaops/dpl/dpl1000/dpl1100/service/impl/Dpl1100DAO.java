package kr.opensoftlab.lunaops.dpl.dpl1000.dpl1100.service.impl;

import java.util.List;
import java.util.Map;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;
import kr.opensoftlab.lunaops.dpl.dpl1000.dpl1100.vo.Dpl1100VO;

import org.springframework.stereotype.Repository;



@Repository("dpl1100DAO")
public class Dpl1100DAO extends ComOslitsAbstractDAO {
	
	
	@SuppressWarnings({"rawtypes", "unchecked" })
	public List<Map> selectDpl1100ExistDplList(Dpl1100VO dpl1100VO) throws Exception{ // Dpl1100VO dpl1100VO
		return (List) list("dpl1100DAO.selectDpl1100ExistDplList", dpl1100VO);
	}

	
	public int selectDpl1100ExistDplListCnt(Dpl1100VO dpl1100VO) throws Exception {
		return (Integer) select("dpl1100DAO.selectDpl1100ExistDplListCnt", dpl1100VO);
	}

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Map> selectDpl1100NotExistDplList(Dpl1100VO dpl1100VO)  throws Exception{
		return (List) list("dpl1100DAO.selectDpl1100NotExistDplList", dpl1100VO);
	}

	
	public int selectDpl1100NotExistDplListCnt(Dpl1100VO dpl1100VO) throws Exception {
		return (Integer) select("dpl1100DAO.selectDpl1100NotExistDplListCnt", dpl1100VO);
	}
	
	
	
	@SuppressWarnings("rawtypes")
	public int updateDpl1100Dpl(Map paramMap) throws Exception {
		return update("dpl1100DAO.updateDpl1100Dpl", paramMap);
	}
	
	@SuppressWarnings("rawtypes")
	public void insertDpl1100logHistory(Map paramMap) throws Exception {
		insert("dpl1100DAO.insertDpl1100logHistory", paramMap);
	}
	
	@SuppressWarnings("rawtypes")
	public String selectDpl1100ExistBuildInfo(Map paramMap) throws Exception {
		return (String) select("dpl1100DAO.selectDpl1100ExistBuildInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectDpl1100ReqDplList(Map paramMap) throws Exception {
		return (List) list("dpl1100DAO.selectDpl1100ReqDplList", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void insertDpl1100ReqDplInfo(Map paramMap) throws Exception {
		insert("dpl1100DAO.insertDpl1100ReqDplInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void deleteDpl1100ReqDplInfo(Map paramMap) throws Exception {
		delete("dpl1100DAO.deleteDpl1100ReqDplInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int updateDpl1200ReqDplInfo(Map paramMap) throws Exception {
		return update("dpl1100DAO.updateDpl1200ReqDplInfo", paramMap);
	}
	
	
}
