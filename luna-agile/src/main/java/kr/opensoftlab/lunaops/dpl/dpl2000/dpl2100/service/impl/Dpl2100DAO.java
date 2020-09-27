package kr.opensoftlab.lunaops.dpl.dpl2000.dpl2100.service.impl;

import java.util.List;
import java.util.Map;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;
import kr.opensoftlab.lunaops.dpl.dpl2000.dpl2100.vo.Dpl2100VO;

import org.springframework.stereotype.Repository;



@Repository("dpl2100DAO")
public class Dpl2100DAO extends ComOslitsAbstractDAO {
	
	
	@SuppressWarnings({"rawtypes" })
	public List selectDpl2100SignList(Dpl2100VO dpl2100vo)  throws Exception{
		return (List) list("dpl2100DAO.selectDpl2100SignList", dpl2100vo);
	}
	
	
	public int selectDpl2100SignListCnt(Dpl2100VO dpl2100vo) throws Exception {
		return (Integer) select("dpl2100DAO.selectDpl2100SignListCnt", dpl2100vo);
	}
	
	
	@SuppressWarnings({"rawtypes" })
	public Map selectDpl2100SignInfoAjax(Map map)  throws Exception{
		return (Map) select("dpl2100DAO.selectDpl2100SignInfoAjax", map);
	} 
	
	
	@SuppressWarnings("rawtypes")
	public void insertDpl2100DplSignInfo(Map paramMap) throws Exception{
		insert("dpl2100DAO.insertDpl2100DplSignInfo", paramMap);
	}
}
