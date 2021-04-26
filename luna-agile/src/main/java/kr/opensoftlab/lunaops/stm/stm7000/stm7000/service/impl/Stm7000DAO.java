package kr.opensoftlab.lunaops.stm.stm7000.stm7000.service.impl;

import java.util.List;
import java.util.Map;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;
import kr.opensoftlab.lunaops.stm.stm7000.stm7000.vo.Stm7000VO;

import org.springframework.stereotype.Repository;



@Repository("stm7000DAO")
public class Stm7000DAO extends ComOslitsAbstractDAO {
	
		
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Stm7000VO> selectStm7000List(Stm7000VO stm7000vo) throws Exception{
		return (List) list("stm7000DAO.selectStm7000List", stm7000vo);
	}

		
	public int selectStm7000ListCnt(Stm7000VO stm7000vo) throws Exception{
		return (Integer)select("stm7000DAO.selectStm7000ListCnt", stm7000vo);
	}

		
	public String insertStm1001Info(Map<String, String> paramMap) throws Exception{
		return (String) insert("stm7000DAO.insertStm1001Info", paramMap);
	}

		
	@SuppressWarnings("rawtypes")
	public Map selectStm7000Info(Map<String, String> paramMap) throws Exception{
		return (Map)select("stm7000DAO.selectStm7000Info", paramMap);
	}

		
	public int updateStm1001Info(Map<String, String> paramMap) throws Exception{
		return update("stm7000DAO.updateStm1001Info", paramMap);
	}
	
		
	public void deleteStm7000Info(Map<String, String> paramMap) throws Exception{
		delete("stm7000DAO.deleteStm7000Info", paramMap);
	}	
	
		
	public int selectStm7000UseCountInfo(Map<String, String> paramMap) throws Exception{
		return (Integer)select("stm7000DAO.selectStm7000UseCountInfo", paramMap);
	}
	
		
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Map<String, String> > selectStm7000ApiUrlList(Map<String, String> paramMap) throws Exception{
		return (List) list("stm7000DAO.selectStm7000ApiUrlList", paramMap);
	}

}
