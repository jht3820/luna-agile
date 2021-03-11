package kr.opensoftlab.lunaops.stm.stm2000.stm2000.service;

import java.util.List;
import java.util.Map;


public interface Stm2000Service {
	
	
	@SuppressWarnings("rawtypes")
	List selectStm2000BaseMenuList(Map paramMap) throws Exception;	
	
	
	@SuppressWarnings("rawtypes")
	Map selectStm2000MenuInfo(Map paramMap) throws Exception;	
	
	
	@SuppressWarnings("rawtypes")
	void insertStm2000MenuInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void deleteStm2000MenuInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void updateStm2000MenuInfo(Map paramMap) throws Exception;
	

	
	@SuppressWarnings({ "rawtypes" })
	void saveStm2000AuthGrpMenuAuthInfo(Map paramMap) throws Exception;
	
	
	
	
	@SuppressWarnings("rawtypes")
	List<Map> selectStm2000StmAuthGrpList(Map paramMap) throws Exception;	
	
	
	@SuppressWarnings("rawtypes")
	int selectStm2000StmAuthGrpListCnt(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	List<Map> selectStm2000StmAuthGrpNoPagingList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	Map selectStm2000StmAuthGrpInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	int selectStm2000StmAuthGrpNextOrd(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void insertStm2000StmAuthGrpInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes" })
	void updateStm2000StmAuthGrpInfo(Map paramMap) throws Exception;
	
	
	void deleteStm2000StmAuthGrpInfo(Map<String, String> paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	List<Map> selectStm2000AuthGrpSmallMenuList(Map paramMap) throws Exception;	
	
	
	@SuppressWarnings("rawtypes")
	void saveStm2000AuthGrpMenuAuthList(List paramList) throws Exception;
	
	
	
	@SuppressWarnings({ "rawtypes"})
	List<Map> selectStm2002FavoritesList(Map paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	int selectStm2002FvrTypeCntInfo(Map paramMap) throws Exception;
	
	
	String insertStm2002FavoritesInfo(Map<String, String> paramMap) throws Exception ;
	
	
	@SuppressWarnings({ "rawtypes" })
	int updateStm2002FavoritesInfo(Map paramMap) throws Exception;
}
