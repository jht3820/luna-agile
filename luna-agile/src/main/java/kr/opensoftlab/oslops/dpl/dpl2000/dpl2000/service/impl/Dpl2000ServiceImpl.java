package kr.opensoftlab.lunaops.dpl.dpl2000.dpl2000.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.opensoftlab.lunaops.arm.arm1000.arm1000.service.impl.Arm1000DAO;
import kr.opensoftlab.lunaops.dpl.dpl2000.dpl2000.service.Dpl2000Service;
import kr.opensoftlab.lunaops.dpl.dpl2000.dpl2000.vo.Dpl2000VO;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;


@Service("dpl2000Service")
public class Dpl2000ServiceImpl  extends EgovAbstractServiceImpl implements Dpl2000Service{
	
    @Resource(name="arm1000DAO")
    private Arm1000DAO arm1000DAO;
    
	
    @Resource(name="dpl2000DAO")
    private Dpl2000DAO dpl2000DAO;
    
    
	@SuppressWarnings({"rawtypes" })
	public List selectDpl2000SignList(Dpl2000VO dpl2000vo)  throws Exception{
		return dpl2000DAO.selectDpl2000SignList(dpl2000vo);
	}
	
	
	public int selectDpl2000SignListCnt(Dpl2000VO dpl2000vo) throws Exception {
		return dpl2000DAO.selectDpl2000SignListCnt(dpl2000vo);
	}
	
	
	@SuppressWarnings({"rawtypes" })
	public Map selectDpl2000SignInfoAjax(Map map)  throws Exception{
		return dpl2000DAO.selectDpl2000SignInfoAjax(map);
	} 
}
