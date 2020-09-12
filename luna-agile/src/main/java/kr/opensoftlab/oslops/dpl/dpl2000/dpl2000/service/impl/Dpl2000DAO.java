package kr.opensoftlab.lunaops.dpl.dpl2000.dpl2000.service.impl;

import java.util.List;
import java.util.Map;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;
import kr.opensoftlab.lunaops.dpl.dpl2000.dpl2000.vo.Dpl2000VO;

import org.springframework.stereotype.Repository;



@Repository("dpl2000DAO")
public class Dpl2000DAO extends ComOslitsAbstractDAO {
	
	
	@SuppressWarnings({"rawtypes" })
	public List selectDpl2000SignList(Dpl2000VO dpl2000vo)  throws Exception{
		return (List) list("dpl2000DAO.selectDpl2000SignList", dpl2000vo);
	}
	
	
	public int selectDpl2000SignListCnt(Dpl2000VO dpl2000vo) throws Exception {
		return (Integer) select("dpl2000DAO.selectDpl2000SignListCnt", dpl2000vo);
	}
	
	
	@SuppressWarnings({"rawtypes" })
	public Map selectDpl2000SignInfoAjax(Map map)  throws Exception{
		return (Map) select("dpl2000DAO.selectDpl2000SignInfoAjax", map);
	} 
}
