package kr.opensoftlab.lunaops.cmm.cmm9000.cmm9100.service.impl;

import java.util.List;
import java.util.Map;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;

import org.springframework.stereotype.Repository;



@Repository("cmm9100DAO")
public class Cmm9100DAO extends ComOslitsAbstractDAO {

    
    @SuppressWarnings("rawtypes")
    public List selectCmm9100MultiCommonCodeList(Map param) throws Exception {
    	return list("cmm9100DAO.selectCmm9100MultiCommonCodeList", param);   
    }

}
