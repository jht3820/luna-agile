package kr.opensoftlab.lunaops.stm.stm2000.stm2200.service.impl;

import java.util.List;
import java.util.Map;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;

import org.springframework.stereotype.Repository;



@Repository("stm2200DAO")
public class Stm2200DAO extends ComOslitsAbstractDAO {
	
	
	
	@SuppressWarnings({"rawtypes", "unchecked"})
	public List<Map> selectStm2200StmAuthGrpList(Map paramMap) throws Exception{
		return (List<Map>) list("stm2200DAO.selectStm2200StmAuthGrpList", paramMap);
    }
	
	
	@SuppressWarnings("rawtypes")
	public int selectStm2200StmAuthGrpListCnt(Map paramMap) throws Exception {
		 return (Integer)select("stm2200DAO.selectStm2200StmAuthGrpListCnt", paramMap);
	}
	
	
	@SuppressWarnings({"rawtypes", "unchecked"})
	public List<Map> selectStm2200StmAuthGrpNoPagingList(Map paramMap) throws Exception{
		return (List<Map>) list("stm2200DAO.selectStm2200StmAuthGrpNoPagingList", paramMap);
    }
	
	
	@SuppressWarnings("rawtypes")
	public Map selectStm2200StmAuthGrpInfo(Map paramMap) throws Exception{
		return (Map) select("stm2200DAO.selectStm2200StmAuthGrpInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectStm2200StmAuthGrpNextOrd(Map paramMap) throws Exception{
		return (int) select("stm2200DAO.selectStm2200StmAuthGrpNextOrd",paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void insertStm2200StmAuthGrpInfo(Map paramMap) throws Exception{
		insert("stm2200DAO.insertStm2200StmAuthGrpInfo", paramMap);
	}	
	
	
	@SuppressWarnings({ "rawtypes" })
	public int updateStm2200StmAuthGrpInfo(Map paramMap) throws Exception{
		return update("stm2200DAO.updateStm2200StmAuthGrpInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int deleteStm2200StmAuthGrpInfo(Map paramMap) throws Exception{
		return (int) delete("stm2200DAO.deleteStm2200StmAuthGrpInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int deleteStm2200StmAuthMenuList(Map paramMap) throws Exception{
		return (int) delete("stm2200DAO.deleteStm2200StmAuthMenuList", paramMap);
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map> selectStm2200AuthGrpSmallMenuList(Map paramMap) throws Exception{
		return (List<Map>) list("stm2200DAO.selectStm2200AuthGrpSmallMenuList", paramMap);
    }	
	

	
	@SuppressWarnings("rawtypes")
	public Map selectStm2200MenuInfo(Map paramMap) throws Exception{
		return (Map) select("stm2200DAO.selectStm2200MenuInfo", paramMap);
	}
	

	
	@SuppressWarnings("rawtypes")
	public int selectStm2201AuthUpMenuAccessCheck(Map paramMap) throws Exception{
		return (int) select("stm2200DAO.selectStm2201AuthUpMenuAccessCheck",paramMap);
	}
	

	
	
	@SuppressWarnings("rawtypes")
	public int selectStm2201AuthMenuAccessCheck(Map paramMap) throws Exception{
		return (int) select("stm2200DAO.selectStm2201AuthMenuAccessCheck",paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void insertStm2201AuthMenuAccess(Map paramMap) throws Exception{
		insert("stm2200DAO.insertStm2201AuthMenuAccess", paramMap);
	}	
	
	
	@SuppressWarnings({ "rawtypes" })
	public int updateStm2201AuthMenuAccess(Map paramMap) throws Exception{
		return update("stm2200DAO.updateStm2201AuthMenuAccess", paramMap);
	}
}
