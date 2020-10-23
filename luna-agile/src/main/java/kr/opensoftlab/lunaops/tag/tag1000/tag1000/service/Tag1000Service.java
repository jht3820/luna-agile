package kr.opensoftlab.lunaops.tag.tag1000.tag1000.service;

import java.util.List;
import java.util.Map;


public interface Tag1000Service {

	
	@SuppressWarnings("rawtypes")
	int selectTag1000TagListCnt() throws Exception;
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	String selectTag1000TagInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	String selectTag1000TagInfoCheck(Map paramMap) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	String insertTag1000TagInfo(Map paramMap) throws Exception;
}
