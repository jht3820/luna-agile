package kr.opensoftlab.lunaops.arm.arm1000.arm1000.service;

import java.util.List;
import java.util.Map;



public interface Arm1000Service {
	
	
	@SuppressWarnings("rawtypes")
	public int selectArm1000AlarmListCnt(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	public List selectArm1000AlarmList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	public Map selectArm1000AlarmInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	public void insertArm1000AlarmInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	public void updateArm1000AlarmInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	public void deleteArm1000AlarmInfo(Map paramMap) throws Exception;
    
}
