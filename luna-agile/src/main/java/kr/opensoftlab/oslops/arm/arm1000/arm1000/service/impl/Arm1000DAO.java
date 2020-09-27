package kr.opensoftlab.lunaops.arm.arm1000.arm1000.service.impl;

import java.util.List;
import java.util.Map;

import kr.opensoftlab.lunaops.arm.arm1000.arm1000.vo.Arm1000VO;
import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;

import org.springframework.stereotype.Repository;



@Repository("arm1000DAO")
public class Arm1000DAO extends ComOslitsAbstractDAO {
	
	
	@SuppressWarnings("rawtypes")
	public List selectArm1000AlarmList(Arm1000VO arm1000VO) throws Exception {
		 return (List) list("arm1000DAO.selectArm1000AlarmList", arm1000VO);
    }
	
	
	@SuppressWarnings("rawtypes")
	public Map selectArm1000AlarmCnt(Map<String, String> paramMap) throws Exception {
		return (Map) select("arm1000DAO.selectArm1000AlarmCnt", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public String insertArm1000AlarmInfo(Map paramMap) throws Exception{
		return (String) insert("arm1000DAO.insertArm1000AlarmInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void updateArm1000AlarmInfo(Map paramMap) throws Exception{
		update("arm1000DAO.updateArm1000AlarmInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public Map selectArm1000AlarmInfo(Map paramMap) throws Exception {
		return (Map) select("arm1000DAO.selectArm1000AlarmInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void updateArm1000AlarmList(Map paramMap) throws Exception{
		update("arm1000DAO.updateArm1000AlarmList", paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public List selectAdm1300AuthUsrList(Map paramMap) throws Exception {
		return (List) list("arm1000DAO.selectAdm1300AuthUsrList", paramMap);
	}
}
