package kr.opensoftlab.lunaops.tag.tag1000.tag1000.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.opensoftlab.lunaops.tag.tag1000.tag1000.service.Tag1000Service;


public class Tag1000ServiceImpl extends EgovAbstractServiceImpl implements Tag1000Service {

	
	@Resource(name="tag1000DAO")
	private Tag1000DAO tag1000DAO;

	
	@SuppressWarnings({ "rawtypes" })
	public int selectTag1000TagListCnt() throws Exception {
		return tag1000DAO.selectTag1000TagListCnt();
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public String selectTag1000TagInfo(Map paramMap) throws Exception {
		return tag1000DAO.selectTag1000TagInfo(paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public String selectTag1000TagInfoCheck(Map paramMap) throws Exception {
		return tag1000DAO.selectTag1000TagInfoCheck(paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public String insertTag1000TagInfo(Map paramMap) throws Exception {
		return tag1000DAO.insertTag1000TagInfo(paramMap);
	}
}
