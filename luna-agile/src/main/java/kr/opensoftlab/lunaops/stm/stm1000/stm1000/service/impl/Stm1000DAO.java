package kr.opensoftlab.lunaops.stm.stm1000.stm1000.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;



@Repository("stm1000DAO")
public class Stm1000DAO extends ComOslitsAbstractDAO {
	
	
	@SuppressWarnings("rawtypes")
	public List selectStm1000LicencePrjAllList(Map paramMap) throws Exception {
		 return (List) list("stm1000DAO.selectPrj1000LicencePrjAllListBase", paramMap);
    }
	
}
