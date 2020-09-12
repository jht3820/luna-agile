package kr.opensoftlab.lunaops.stm.stm9000.stm9200.service.impl;

import java.util.List;

import javax.annotation.Resource;

import kr.opensoftlab.lunaops.stm.stm9000.stm9200.service.Stm9200Service;
import kr.opensoftlab.lunaops.stm.stm9000.stm9200.vo.Stm9200VO;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;


@Service("stm9200Service")
public class Stm9200ServiceImpl extends EgovAbstractServiceImpl implements Stm9200Service{
	
	
	@Resource(name="stm9200DAO")
    private Stm9200DAO stm9200DAO;
	
	
	@Override
	public List<Stm9200VO> selectStm9200ProjectJenkinsJobAllList(Stm9200VO stm9200VO) throws Exception{
		return stm9200DAO.selectStm9200ProjectJenkinsJobAllList(stm9200VO);
	}

	
	@Override
	public int selectStm9200ProjectJenkinsJobAllListCnt(Stm9200VO stm9200VO) throws Exception{
		return stm9200DAO.selectStm9200ProjectJenkinsJobAllListCnt(stm9200VO);
	}
}
