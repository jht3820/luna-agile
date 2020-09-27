package kr.opensoftlab.lunaops.usr.usr4000.usr4000.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;
import kr.opensoftlab.lunaops.usr.usr4000.usr4000.vo.Usr4000VO;


@Repository("usr4000DAO")
public class Usr4000DAO  extends ComOslitsAbstractDAO {
	
	
	@SuppressWarnings({ "unchecked" })
	public List<Usr4000VO>  selectUsr4000UsrWhkList(Usr4000VO usr4000vo) throws Exception {
		 return  (List<Usr4000VO>) list("usr4000DAO.selectUsr4000UsrWhkList", usr4000vo);
	}
	
	
	public int  selectUsr4000UsrWhkListCnt(Usr4000VO usr4000vo) throws Exception {
		 return  (Integer)select("usr4000DAO.selectUsr4000UsrWhkListCnt", usr4000vo);
	} 
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Map> selectUsr4000UsrWhkAllList(Map paramMap) throws Exception{
		return (List<Map>) list("usr4000DAO.selectUsr4000UsrWhkAllList", paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public Map selectUsr4000UsrWhkInfo(Map paramMap) throws Exception{
		return (Map) select("usr4000DAO.selectUsr4000UsrWhkInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public String insertUsr4000UsrWhkInfo(Map paramMap) throws Exception{
		return (String) insert("usr4000DAO.insertUsr4000UsrWhkInfo", paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public void updateUsr4000UsrWhkInfo(Map paramMap) throws Exception{
		update("usr4000DAO.updateUsr4000UsrWhkInfo",paramMap);
	}
	
	@SuppressWarnings("rawtypes")
	public int deleteUsr4000UsrWhkInfo(Map paramMap) throws Exception{
		return (int) delete("usr4000DAO.deleteUsr4000UsrWhkInfo", paramMap);
	}
}