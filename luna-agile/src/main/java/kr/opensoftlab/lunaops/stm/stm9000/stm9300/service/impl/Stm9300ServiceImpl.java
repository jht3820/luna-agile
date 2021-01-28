package kr.opensoftlab.lunaops.stm.stm9000.stm9300.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.opensoftlab.lunaops.stm.stm9000.stm9300.service.Stm9300Service;


@Service("stm9300Service")
public class Stm9300ServiceImpl extends EgovAbstractServiceImpl implements Stm9300Service{
	
	
	@Resource(name="stm9300DAO")
    private Stm9300DAO stm9300DAO;
	
	
	@SuppressWarnings("rawtypes")
	public List<Map> selectStm9300ProjectJenkinsJobAllList(Map paramMap) throws Exception{
		return stm9300DAO.selectStm9300ProjectJenkinsJobAllList(paramMap);
	}

	
	@SuppressWarnings("rawtypes" )
	public int selectStm9300ProjectJenkinsJobAllListCnt(Map paramMap) throws Exception{
		return stm9300DAO.selectStm9300ProjectJenkinsJobAllListCnt(paramMap);
	}
}
