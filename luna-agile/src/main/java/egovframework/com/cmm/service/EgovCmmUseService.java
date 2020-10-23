package egovframework.com.cmm.service;

import java.util.List;
import java.util.Map;

import egovframework.com.cmm.ComDefaultCodeVO;




public interface EgovCmmUseService {

    
    public List<CmmnDetailCode> selectCmmCodeDetail(ComDefaultCodeVO vo) throws Exception;

    
    public Map<String, List<CmmnDetailCode>> selectCmmCodeDetails(List<?> voList) throws Exception;

    
    public List<CmmnDetailCode> selectOgrnztIdDetail(ComDefaultCodeVO vo) throws Exception;

    
    public List<CmmnDetailCode> selectGroupIdDetail(ComDefaultCodeVO vo) throws Exception;
}
