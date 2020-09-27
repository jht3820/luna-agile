package kr.opensoftlab.lunaops.stm.stm9000.stm9200.service.impl;

import java.util.List;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;
import kr.opensoftlab.lunaops.stm.stm9000.stm9200.vo.Stm9200VO;

import org.springframework.stereotype.Repository;



@Repository("stm9200DAO")
public class Stm9200DAO extends ComOslitsAbstractDAO {
	
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Stm9200VO> selectStm9200ProjectJenkinsJobAllList(Stm9200VO stm9200VO) throws Exception{
		return (List) list("stm9200DAO.selectJen1200ProjectJenkinsJobAllList", stm9200VO);
	}

	
	public int selectStm9200ProjectJenkinsJobAllListCnt(Stm9200VO stm9200VO) throws Exception{
		return (Integer) select("stm9200DAO.selectJen1200ProjectJenkinsJobAllListCnt", stm9200VO);
	}

}
