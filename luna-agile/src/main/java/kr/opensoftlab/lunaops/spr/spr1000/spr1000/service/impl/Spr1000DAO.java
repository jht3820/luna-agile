package kr.opensoftlab.lunaops.spr.spr1000.spr1000.service.impl;

import java.util.List;
import java.util.Map;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;

import org.springframework.stereotype.Repository;




@Repository("spr1000DAO")
public class Spr1000DAO  extends ComOslitsAbstractDAO {
	
	
	@SuppressWarnings("rawtypes")
	public int  selectSpr1000SprListCnt(Map paramMap) throws Exception {
		return  (Integer)select("spr1000DAO.selectSpr1000SprListCnt", paramMap);
	} 
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map>  selectSpr1000SprList(Map paramMap) throws Exception {
		return  (List<Map>) list("spr1000DAO.selectSpr1000SprList", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public String insertSpr1000SprInfo(Map paramMap) throws Exception{
		return (String) insert("spr1000DAO.insertSpr1000SprInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int updateSpr1000Info(Map paramMap) throws Exception{
		return (int) update("spr1000DAO.updateSpr1000Info", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int deleteSpr1000SprInfo(Map paramMap) throws Exception{
		return (int) update("spr1000DAO.deleteSpr1000SprInfo", paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public Map  selectSpr1000SprInfo(Map paramMap) throws Exception {
		return  (Map) select("spr1000DAO.selectSpr1000SprInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int  selectSpr1000SprReqListCnt(Map paramMap) throws Exception {
		return  (Integer)select("spr1000DAO.selectSpr1000SprReqListCnt", paramMap);
	} 
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map>  selectSpr1000SprReqList(Map paramMap) throws Exception {
		return  (List<Map>) list("spr1000DAO.selectSpr1000SprReqList", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int  selectSpr1000SprReqNotEndListCnt(Map paramMap) throws Exception {
		return  (Integer)select("spr1000DAO.selectSpr1000SprReqNotEndListCnt", paramMap);
	} 
	

	
	@SuppressWarnings("rawtypes")
	public void insertSpr1003SprProcessList(Map paramMap) throws Exception{
		insert("spr1000DAO.insertSpr1003SprProcessList", paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Map> selectSpr1003SprProcessList(Map paramMap) throws Exception{
		return (List<Map>) list("spr1000DAO.selectSpr1003SprProcessList", paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public Map  selectSpr1000SprInfoStat(Map paramMap) throws Exception {
		return  (Map) select("spr1000DAO.selectSpr1000SprInfoStat", paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public Map  selectSpr1000EndSprInfoStat(Map paramMap) throws Exception {
		return  (Map) select("spr1000DAO.selectSpr1000EndSprInfoStat", paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public Map  selectSpr1000ReqRealSpdTime(Map paramMap) throws Exception {
		return  (Map) select("spr1000DAO.selectSpr1000ReqRealSpdTime", paramMap);
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Map>  selectSpr1000ChartInfo(Map paramMap) throws Exception {
		return  (List<Map>) list("spr1000DAO.selectSpr1000ChartInfo", paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes"})
	public Map selectSpr1000SprTerm(Map paramMap) throws Exception {
		return  (Map) select("spr1000DAO.selectSpr1000SprTerm", paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes"})
	public Map  selectSpr1000VelocityChartInfo(Map paramMap) throws Exception {
		return  (Map) select("spr1000DAO.selectSpr1000VelocityChartInfo", paramMap);
	}
	
	public int insertStm3000SnapShot(Map<String, String> paramMap) throws Exception{
		return update("spr1000DAO.insertStm3000SnapShot", paramMap );
	}
	
	@SuppressWarnings("rawtypes")
	public void insertReq3000SnapShot(Map infoMap) {
		insert("spr1000DAO.insertReq3000SnapShot", infoMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void insertReq3001SnapShot(Map infoMap) {
		insert("spr1000DAO.insertReq3001SnapShot", infoMap);
	}
	
	@SuppressWarnings("rawtypes")
	public void insertReq4100SnapShot(Map paramMap) throws Exception {
		insert("spr1000DAO.insertReq4100SnapShot", paramMap);
	}
	
	@SuppressWarnings("rawtypes")
	public void insertReq6001SnapShot(Map paramMap) throws Exception{
		insert("spr1000DAO.insertReq6001SnapShot", paramMap);
	}
	
	@SuppressWarnings("rawtypes")
	public void insertPrj1100SnapShot(Map paramMap) throws Exception {
		insert("spr1000DAO.insertPrj1100SnapShot", paramMap);
	}
	
	@SuppressWarnings("rawtypes")
	public void insertPrj1101SnapShot(Map paramMap) throws Exception {
		insert("spr1000DAO.insertPrj1101SnapShot", paramMap);
	}
	
	@SuppressWarnings("rawtypes")
	public void insertPrj1102SnapShot(Map paramMap) throws Exception {
		insert("spr1000DAO.insertPrj1102SnapShot", paramMap);
	}
	
	@SuppressWarnings("rawtypes")
	public void insertPrj1103SnapShot(Map paramMap) throws Exception {
		insert("spr1000DAO.insertPrj1103SnapShot", paramMap);
	}
	
	@SuppressWarnings("rawtypes")
	public void insertPrj1106SnapShot(Map paramMap) throws Exception {
		insert("spr1000DAO.insertPrj1106SnapShot", paramMap);
	}
	
	@SuppressWarnings("rawtypes")
	public void insertPrj1107SnapShot(Map paramMap) throws Exception {
		insert("spr1000DAO.insertPrj1107SnapShot", paramMap);
	}
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Map> selectSpr1000EndSprReqList(Map paramMap) {
		return (List<Map>) list("spr1000DAO.selectSpr1000EndSprReqList", paramMap);
	}
}