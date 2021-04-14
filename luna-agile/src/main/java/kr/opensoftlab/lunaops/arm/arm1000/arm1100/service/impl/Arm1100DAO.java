package kr.opensoftlab.lunaops.arm.arm1000.arm1100.service.impl;

import java.util.List;
import java.util.Map;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;

import org.springframework.stereotype.Repository;



@Repository("arm1100DAO")
public class Arm1100DAO extends ComOslitsAbstractDAO {
	
	
	@SuppressWarnings("rawtypes")
	public int selectArm1100NtfListCnt(Map paramMap) throws Exception {
		return (int) select("arm1100DAO.selectArm1100NtfListCnt", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectArm1100NtfList(Map paramMap) throws Exception {
		 return (List) list("arm1100DAO.selectArm1100NtfList", paramMap);
    }
	
	
	@SuppressWarnings("rawtypes")
	public int selectArm1100NtfNotReadCnt(Map paramMap) throws Exception {
		return (int) select("arm1100DAO.selectArm1100NtfNotReadCnt", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectArm1100NtfNotReadList(Map paramMap) throws Exception {
		 return (List) list("arm1100DAO.selectArm1100NtfNotReadList", paramMap);
    }
	
	
	@SuppressWarnings("rawtypes")
	public void insertArm1100NtfInfo(Map paramMap) throws Exception {
		insert("arm1100DAO.insertArm1100NtfInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void insertArm1101NtfInfo(Map paramMap) throws Exception {
		insert("arm1100DAO.insertArm1101NtfInfo", paramMap);
	}
}
