package kr.opensoftlab.lunaops.arm.arm1000.arm1100.service;

import java.util.List;
import java.util.Map;



public interface Arm1100Service {
	
	
	
	@SuppressWarnings("rawtypes")
	public int selectArm1100NtfNotReadCnt(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	public int selectArm1100NtfListCnt(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	public List selectArm1100NtfList(Map paramMap) throws Exception;
	
	
	
	@SuppressWarnings("rawtypes")
	public void insertArm1100NtfInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	public void insertArm1101NtfInfo(Map paramMap) throws Exception;
	
}
