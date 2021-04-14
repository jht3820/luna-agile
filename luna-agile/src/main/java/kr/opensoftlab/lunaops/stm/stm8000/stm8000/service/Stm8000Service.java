package kr.opensoftlab.lunaops.stm.stm8000.stm8000.service;

import java.util.List;
import java.util.Map;


public interface Stm8000Service {

	
	public int selectStm8000ServerListCnt(Map<String, String> paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes" )
	public List<Map> selectStm8000ServerList(Map<String, String> paramMap) throws Exception;
	
	
	public Map<String, String> selectStm8000ServerInfo(Map<String, String> paramMap) throws Exception;
	
	
	public void insertStm8000ServerInfo(Map<String, String> paramMap) throws Exception;
	
	
	public void updateStm8000ServerInfo(Map<String, String> paramMap) throws Exception;
	
	
	public void deleteStm8000ServerInfo(Map<String, String> paramMap) throws Exception;


	
	@SuppressWarnings("rawtypes")
	public List<Map> selectStm8000RevisionList(Map<String, String> paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectStm8000SvnList(Map<String, String> paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectStm8000GitList(Map<String, String> paramMap) throws Exception;
	
	
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectStm8000FileDirList(Map<String, String> paramMap) throws Exception;

	
	public String selectStm8000RevisionFileInfo(Map<String, String> paramMap) throws Exception;
}
