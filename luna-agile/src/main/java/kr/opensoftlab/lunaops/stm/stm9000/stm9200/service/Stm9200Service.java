package kr.opensoftlab.lunaops.stm.stm9000.stm9200.service;

import java.util.List;

import kr.opensoftlab.lunaops.stm.stm9000.stm9200.vo.Stm9200VO;



public interface Stm9200Service {

	
	List<Stm9200VO> selectStm9200ProjectJenkinsJobAllList(Stm9200VO stm9200VO) throws Exception;

	
	int selectStm9200ProjectJenkinsJobAllListCnt(Stm9200VO stm9200VO) throws Exception;
}
