package kr.opensoftlab.lunaops.prj.prj4000.prj4000.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;
import kr.opensoftlab.lunaops.prj.prj4000.prj4000.vo.Prj4000VO;


@Repository("prj4000DAO")
public class Prj4000DAO  extends ComOslitsAbstractDAO {
	
	
	@SuppressWarnings({ "unchecked" })
	public List<Prj4000VO>  selectPrj4000PrjWhkList(Prj4000VO prj4000vo) throws Exception {
		 return  (List<Prj4000VO>) list("prj4000DAO.selectPrj4000PrjWhkList", prj4000vo);
	}
	
	
	public int  selectPrj4000PrjWhkListCnt(Prj4000VO prj4000vo) throws Exception {
		 return  (Integer)select("prj4000DAO.selectPrj4000PrjWhkListCnt", prj4000vo);
	} 
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Map> selectPrj4000PrjWhkAllList(Map paramMap) throws Exception{
		return (List<Map>) list("prj4000DAO.selectPrj4000PrjWhkAllList", paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public Map selectPrj4000PrjWhkInfo(Map paramMap) throws Exception{
		return (Map) select("prj4000DAO.selectPrj4000PrjWhkInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public String insertPrj4000PrjWhkInfo(Map paramMap) throws Exception{
		return (String) insert("prj4000DAO.insertPrj4000PrjWhkInfo", paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public void updatePrj4000PrjWhkInfo(Map paramMap) throws Exception{
		update("prj4000DAO.updatePrj4000PrjWhkInfo",paramMap);
	}
	
	@SuppressWarnings("rawtypes")
	public int deletePrj4000PrjWhkInfo(Map paramMap) throws Exception{
		return (int) delete("prj4000DAO.deletePrj4000PrjWhkInfo", paramMap);
	}
}