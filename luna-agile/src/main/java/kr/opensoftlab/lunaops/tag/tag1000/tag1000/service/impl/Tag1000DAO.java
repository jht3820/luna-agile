package kr.opensoftlab.lunaops.tag.tag1000.tag1000.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;



@Repository("tag1000DAO")
public class Tag1000DAO extends ComOslitsAbstractDAO  {

	
	@SuppressWarnings({ "rawtypes" })
	public int selectTag1000TagListCnt() throws Exception {
		return (int) select("tag1000DAO.selectTag1000TagListCnt");
	}

	
	@SuppressWarnings({ "rawtypes" })
	public String selectTag1000TagInfo(Map paramMap) throws Exception {
		return (String) select("tag1000DAO.selectTag1000TagInfo", paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public String selectTag1000TagInfoCheck(Map paramMap) throws Exception {
		return (String) select("tag1000DAO.selectTag1000TagInfoCheck", paramMap);
	}

	
	@SuppressWarnings({ "rawtypes" })
	public String insertTag1000TagInfo(Map paramMap) throws Exception {
		return (String) insert("tag1000DAO.insertTag1000TagInfo", paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Map> selectTag1000TopInfo(Map paramMap) throws Exception {
		return (List<Map>) list("tag1000DAO.selectTag1000TopInfo", paramMap);
	}
}
