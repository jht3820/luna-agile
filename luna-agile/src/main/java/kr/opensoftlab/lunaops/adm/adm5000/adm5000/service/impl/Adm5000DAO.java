package kr.opensoftlab.lunaops.adm.adm5000.adm5000.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;



@Repository("adm5000DAO")
public class Adm5000DAO extends ComOslitsAbstractDAO {
	
	
	@SuppressWarnings({ "rawtypes" })
	public List selectAdm5000HoliList(Map paramMap) throws Exception{
		return list("adm5000DAO.selectAdm5000HoliList",paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public Map selectAdm5000HoliInfo(Map paramMap) throws Exception{
		return (Map) select("adm5000DAO.selectAdm5000HoliInfo",paramMap);
	}

	
	
	@SuppressWarnings({ "rawtypes" })
	public String insertAdm5000HoliInfo(Map paramMap) throws Exception{
		return (String) insert("adm5000DAO.insertAdm5000HoliInfo",paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public void deleteAdm5000LicGrpHoliList(Map paramMap) throws Exception{
		delete("adm5000DAO.deleteAdm5000LicGrpHoliList",paramMap);
	}
}
