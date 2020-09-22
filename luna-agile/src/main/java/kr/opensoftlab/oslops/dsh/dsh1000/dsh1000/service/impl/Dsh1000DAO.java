package kr.opensoftlab.lunaops.dsh.dsh1000.dsh1000.service.impl;

import java.util.List;
import java.util.Map;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;
import kr.opensoftlab.lunaops.dsh.dsh1000.dsh1000.vo.Dsh1000VO;

import org.springframework.stereotype.Repository;

@Repository("dsh1000DAO")
public class Dsh1000DAO  extends ComOslitsAbstractDAO {
	
	@SuppressWarnings("rawtypes")
	public List selectDsh1000ProcessReqCntList(Map paramMap) throws Exception{
		return (List) list("dsh1000DAO.selectDsh1000ProcessReqCntList", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectDsh1000MonthProcessReqCntList(Map paramMap) throws Exception{
		return (List) list("dsh1000DAO.selectDsh1000MonthProcessReqCntList", paramMap);
	}

	@SuppressWarnings("rawtypes")
	public List selectDsh1000ReqList(Dsh1000VO dsh1000VO) throws Exception{
		return (List) list("dsh1000DAO.selectDsh1000ReqList", dsh1000VO);
	}

	public int selectDsh1000ReqListCnt(Dsh1000VO dsh1000VO) throws Exception{
		return (Integer) select("dsh1000DAO.selectDsh1000ReqListCnt", dsh1000VO);
	}

	
	@SuppressWarnings("rawtypes")
	public List selectDsh1000SortDataList(Map paramMap) throws Exception{
		return (List) list("dsh1000DAO.selectDsh1000SortDataList", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void insertDsh1000SortDataInfo(Map paramMap) throws Exception{
		insert("dsh1000DAO.insertDsh1000SortDataInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void deleteDsh1000SortDataList(Map paramMap) throws Exception{
		delete("dsh1000DAO.deleteDsh1000SortDataList", paramMap);
	}
}