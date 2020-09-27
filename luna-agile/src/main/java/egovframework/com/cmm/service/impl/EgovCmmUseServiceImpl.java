package egovframework.com.cmm.service.impl;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import egovframework.com.cmm.ComDefaultCodeVO;
import egovframework.com.cmm.service.CmmnDetailCode;
import egovframework.com.cmm.service.EgovCmmUseService;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


@Service("EgovCmmUseService")
public class EgovCmmUseServiceImpl extends EgovAbstractServiceImpl implements EgovCmmUseService {

    @Resource(name = "cmmUseDAO")
    private CmmUseDAO cmmUseDAO;

    
    public List<CmmnDetailCode> selectCmmCodeDetail(ComDefaultCodeVO vo) throws Exception {
    	return cmmUseDAO.selectCmmCodeDetail(vo);
    }

    
    public Map<String, List<CmmnDetailCode>> selectCmmCodeDetails(List<?> voList) throws Exception {
		ComDefaultCodeVO vo;
		Map<String, List<CmmnDetailCode>> map = new HashMap<String, List<CmmnDetailCode>>();

		Iterator<?> iter = voList.iterator();
		while (iter.hasNext()) {
		    vo = (ComDefaultCodeVO)iter.next();
		    map.put(vo.getCodeId(), cmmUseDAO.selectCmmCodeDetail(vo));
		}

		return map;
    }

    
    public List<CmmnDetailCode> selectOgrnztIdDetail(ComDefaultCodeVO vo) throws Exception {
    	return cmmUseDAO.selectOgrnztIdDetail(vo);
    }

    
    public List<CmmnDetailCode> selectGroupIdDetail(ComDefaultCodeVO vo) throws Exception {
    	return cmmUseDAO.selectGroupIdDetail(vo);
    }
}
