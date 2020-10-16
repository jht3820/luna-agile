package kr.opensoftlab.lunaops.cmm.cmm9000.cmm9200.service.impl;

import java.util.List;
import java.util.Map;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;

import org.springframework.stereotype.Repository;



@Repository("cmm9200DAO")
public class Cmm9200DAO extends ComOslitsAbstractDAO {

	
    @SuppressWarnings("rawtypes")
    public List selectCmm9200PrjUsrList(Map param) throws Exception {
    	return list("cmm9200DAO.selectCmm9200PrjUsrList", param);   
    }



}
