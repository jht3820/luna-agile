package kr.opensoftlab.lunaops.cmm.cmm9000.cmm9000.service;

import java.util.List;
import java.util.Map;


public interface Cmm9000Service {
	
	
	@SuppressWarnings("rawtypes")
	Map selectCmm9000LeftMenuInfos(Map paramMap) throws Exception;

	
	@SuppressWarnings({ "rawtypes"})
	List<Map> selectCmm9000FavoritesList(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	int selectCmm9000FvrTypeCntInfo(Map paramMap) throws Exception;
	
	
	String insertCmm9000FavoritesInfo(Map<String, String> paramMap) throws Exception ;
	
	
	@SuppressWarnings({ "rawtypes" })
	int updateCmm9000FavoritesInfo(Map paramMap) throws Exception;
}
