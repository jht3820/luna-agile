package kr.opensoftlab.lunaops.stm.stm9000.stm9300.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;


@Repository("stm9300DAO")
public class Stm9300DAO extends ComOslitsAbstractDAO {
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map> selectStm9300ProjectJenkinsJobAllList(Map paramMap) throws Exception{
		return (List<Map>) list("stm9300DAO.selectStm9002ProjectJenkinsJobAllList", paramMap);
	}

	
	@SuppressWarnings("rawtypes" )
	public int selectStm9300ProjectJenkinsJobAllListCnt(Map paramMap) throws Exception{
		return (Integer) select("stm9300DAO.selectStm9002ProjectJenkinsJobAllListCnt", paramMap);
	}

}
