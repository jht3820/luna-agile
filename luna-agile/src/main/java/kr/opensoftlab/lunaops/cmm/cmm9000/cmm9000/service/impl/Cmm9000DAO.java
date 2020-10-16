package kr.opensoftlab.lunaops.cmm.cmm9000.cmm9000.service.impl;

import java.util.List;
import java.util.Map;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;

import org.springframework.stereotype.Repository;



@Repository("cmm9000DAO")
public class Cmm9000DAO extends ComOslitsAbstractDAO {
	
	
	@SuppressWarnings("rawtypes")
	public Map selectCmm9000AlarmCntInfo(Map paramMap) throws Exception{
		return (Map) select("cmm9000DAO.selectCmm9000AlarmCntInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public Map selectCmm9000ChargeReqCntList(Map paramMap) throws Exception{
		return (Map) select("cmm9000DAO.selectCmm9000ChargeReqCntList", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public Map selectCmm9000AllReqCntList(Map paramMap) throws Exception{
		return (Map) select("cmm9000DAO.selectCmm9000AllReqCntList", paramMap);
	}
	
	
	
	@SuppressWarnings("rawtypes")
	public String selectCmm9000ProjectType(Map paramMap) throws Exception{
		return (String) select("cmm9000DAO.selectCmm9000ProjectType", paramMap);
	}
	

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Map> selectCmm9000FavoritesList(Map paramMap) throws Exception{
		return (List<Map>) list("cmm9000DAO.selectCmm9000FavoritesList", paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public int selectCmm9000FvrTypeCntInfo(Map paramMap) throws Exception{
		return (int) select("cmm9000DAO.selectCmm9000FvrTypeCntInfo", paramMap);
	}
	
	
	public String insertCmm9000FavoritesInfo(Map<String, String> paramMap) throws Exception {
		return (String) insert("cmm9000DAO.insertCmm9000FavoritesInfo", paramMap);	
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public int updateCmm9000FavoritesInfo(Map paramMap) throws Exception{
		return update("cmm9000DAO.updateCmm9000FavoritesInfo",paramMap);
	}
}
