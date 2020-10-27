package kr.opensoftlab.lunaops.bad.bad1000.bad1000.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;



@Repository("bad1000DAO")
public class Bad1000DAO extends ComOslitsAbstractDAO {

	
	@SuppressWarnings({ "rawtypes" })
	public int selectBad1000BadListCnt(Map paramMap) throws Exception {
		return (int) select("bad1000DAO.selectBad1000BadListCnt", paramMap);
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map> selectBad1000BadList(Map paramMap) throws Exception {
		return (List<Map>) list("bad1000DAO.selectBad1000BadList", paramMap);
	}

	
	public String selectBad1000BadPwInfo(Map<String, String> paramMap) {
		return (String) select("bad1000DAO.selectBad1000BadPwInfo", paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public Map selectBad1000BadInfo(Map<String, String> paramMap) {
		return (Map) select("bad1000DAO.selectBad1000BadInfo", paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public Map selectBad1000ForBadHstInfo(Map<String, String> paramMap) {
		return (Map) select("bad1000DAO.selectBad1000ForBadHstInfo", paramMap);
	}
	
	
	public String insertBad1000BadInfo(Map<String, String> paramMap) {
		return (String) insert("bad1000DAO.insertBad1000BadInfo", paramMap);
	}
	
	
	public void insertBad1010BadTagInfo(Map<String, String> paramMap) {
		insert("bad1000DAO.insertBad1010BadTagInfo", paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Map> selectBad1000BadListTagList(Map<String, String> paramMap) {
		return (List<Map>) list("bad1000DAO.selectBad1000BadListTagList", paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Map> selectBad1000BadTagList(Map<String, String> paramMap) {
		return (List<Map>) list("bad1000DAO.selectBad1000BadTagList", paramMap);
	}
	
	
	public void deleteBad1000BadTagList(Map<String, String> paramMap) {
		delete("bad1000DAO.deleteBad1000BadTagList", paramMap);
	}

	
	public void updateBad1000BadHit(Map<String, String> paramMap) {
		update("bad1000DAO.updateBad1000BadHit", paramMap);
	}
	
	
	public void updateBad1000BadInfo(Map<String, String> paramMap) {
		update("bad1000DAO.updateBad1000BadInfo", paramMap);
	}
	
	
	public void deleteBad1000BadInfo(Map<String, String> paramMap) {
		update("bad1000DAO.deleteBad1000BadInfo", paramMap);
	}
	
	
	public void updateBad1000BadRestore(Map<String, String> paramMap) {
		update("bad1000DAO.updateBad1000BadRestore", paramMap);
	}
	
	
	public String selectBad1000NtcCnt(Map<String, String> paramMap) {
		return (String) select("bad1000DAO.selectBad1000NtcCnt", paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public Map selectBad1000NtcCurrent(Map<String, String> paramMap) {
		return (Map) select("bad1000DAO.selectBad1000NtcCurrent", paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public Map selectBad1000WriteCntInfo(Map<String, String> paramMap) {
		return (Map) select("bad1000DAO.selectBad1000WriteCntInfo", paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public Map selectBad1000HitMaxInfo(Map<String, String> paramMap) {
		return (Map) select("bad1000DAO.selectBad1000HitMaxInfo", paramMap);
	}
	
	
	public String selectBad1000PwCnt(Map<String, String> paramMap) {
		return (String) select("bad1000DAO.selectBad1000PwCnt", paramMap);
	}

	
	@SuppressWarnings({ "rawtypes" })
	public Map selectBad1000FileSummery(Map<String, String> paramMap) {
		return (Map) select("bad1000DAO.selectBad1000FileSummery", paramMap);
	}
	
}
