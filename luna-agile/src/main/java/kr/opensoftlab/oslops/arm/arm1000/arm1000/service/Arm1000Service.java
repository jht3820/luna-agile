package kr.opensoftlab.lunaops.arm.arm1000.arm1000.service;

import java.util.List;
import java.util.Map;

import kr.opensoftlab.lunaops.arm.arm1000.arm1000.vo.Arm1000VO;


public interface Arm1000Service {
	
	
	@SuppressWarnings("rawtypes")
	List selectArm1000AlarmList(Arm1000VO arm1000VO) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	Map selectArm1000AlarmCnt(Map<String, String> paramMap) throws Exception;
	
	@SuppressWarnings("rawtypes")
	String insertArm1000AlarmInfo(Map paramMap) throws Exception;
	
	
	void updateArm1000AlarmInfo(Map<String, Object> paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	Map selectArm1000AlarmInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	void updateArm1000AlarmList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes" })
	List selectAdm1300AuthUsrList(Map paramMap) throws Exception;
}
