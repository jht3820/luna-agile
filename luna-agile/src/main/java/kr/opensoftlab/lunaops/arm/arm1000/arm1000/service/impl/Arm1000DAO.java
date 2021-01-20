package kr.opensoftlab.lunaops.arm.arm1000.arm1000.service.impl;

import java.util.List;
import java.util.Map;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;

import org.springframework.stereotype.Repository;



@Repository("arm1000DAO")
public class Arm1000DAO extends ComOslitsAbstractDAO {
	
	
	@SuppressWarnings("rawtypes")
	public int selectArm1000AlarmListCnt(Map paramMap) throws Exception {
		return (int) select("arm1000DAO.selectArm1000AlarmListCnt", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectArm1000AlarmList(Map paramMap) throws Exception {
		 return (List) list("arm1000DAO.selectArm1000AlarmList", paramMap);
    }
	
	
	@SuppressWarnings("rawtypes")
	public Map selectArm1000AlarmInfo(Map paramMap) throws Exception {
		return (Map) select("arm1000DAO.selectArm1000AlarmInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void insertArm1000AlarmInfo(Map paramMap) throws Exception {
		insert("arm1000DAO.insertArm1000AlarmInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void updateArm1000AlarmInfo(Map paramMap) throws Exception {
		update("arm1000DAO.updateArm1000AlarmInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void deleteArm1000AlarmInfo(Map paramMap) throws Exception {
		update("arm1000DAO.deleteArm1000AlarmInfo", paramMap);
	}
}
