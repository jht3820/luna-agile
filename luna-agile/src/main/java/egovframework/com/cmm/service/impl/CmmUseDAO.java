package egovframework.com.cmm.service.impl;

import java.util.List;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.service.CmmnDetailCode;

import org.springframework.stereotype.Repository;


@Repository("cmmUseDAO")
public class CmmUseDAO extends EgovComAbstractDAO {

    
    @SuppressWarnings("unchecked")
    public List<CmmnDetailCode> selectCmmCodeDetail(ComDefaultCodeVO vo) throws Exception {
	return (List<CmmnDetailCode>) list("CmmUseDAO.selectCmmCodeDetail", vo);
    }

    
    @SuppressWarnings("unchecked")
    public List<CmmnDetailCode> selectOgrnztIdDetail(ComDefaultCodeVO vo) throws Exception {
	return (List<CmmnDetailCode>) list("CmmUseDAO.selectOgrnztIdDetail", vo);
    }

    
    @SuppressWarnings("unchecked")
    public List<CmmnDetailCode> selectGroupIdDetail(ComDefaultCodeVO vo) throws Exception {
	return (List<CmmnDetailCode>) list("CmmUseDAO.selectGroupIdDetail", vo);
    }
}
