package kr.opensoftlab.lunaops.stm.stm7000.stm7000.service.impl;



import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.opensoftlab.lunaops.stm.stm7000.stm7000.service.Stm7000Service;
import kr.opensoftlab.lunaops.stm.stm7000.stm7000.vo.Stm7000VO;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;



@Service("stm7000Service")
public class Stm7000ServiceImpl extends EgovAbstractServiceImpl implements Stm7000Service {

	
    @Resource(name="stm7000DAO")
    private Stm7000DAO stm7000DAO;  
	
    	
    @Override
	public List<Stm7000VO> selectStm7000List(Stm7000VO stm7000vo) throws Exception {
		return stm7000DAO.selectStm7000List(stm7000vo);
	}

    
	@Override
	public int selectStm7000ListCnt(Stm7000VO stm7000vo) throws Exception {
		return stm7000DAO.selectStm7000ListCnt(stm7000vo);
	}

	
	@Override
	public Object saveStm7000Info(Map<String, String> paramMap) throws Exception {
		
		String popupGb = (String)paramMap.get("popupGb");
		
		if("insert".equals(popupGb)){
			stm7000DAO.insertStm1001Info(paramMap);
		}else if("update".equals(popupGb)){
			stm7000DAO.updateStm1001Info(paramMap);
		}

		return null;
	}
	
		
	@SuppressWarnings("rawtypes")
	@Override
	public Map selectStm7000Info(Map<String, String> paramMap) throws Exception{
		return stm7000DAO.selectStm7000Info(paramMap);
	}

	
	@Override
	public void deleteStm7000Info(Map<String, String> paramMap) throws Exception{
		stm7000DAO.deleteStm7000Info(paramMap);
	}
	
	
	@Override
	public int selectStm7000UseCountInfo(Map<String, String> paramMap) throws Exception{
		return stm7000DAO.selectStm7000UseCountInfo(paramMap);
	}
	
	
	@Override
	public List<Map<String, String> > selectStm7000ApiUrlList(Map<String, String> paramMap) throws Exception{
		return stm7000DAO.selectStm7000ApiUrlList(paramMap) ;
	}
	
}
