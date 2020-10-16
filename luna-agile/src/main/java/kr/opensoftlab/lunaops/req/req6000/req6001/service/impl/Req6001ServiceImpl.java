package kr.opensoftlab.lunaops.req.req6000.req6001.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.opensoftlab.lunaops.req.req6000.req6001.service.Req6001Service;


@Service("req6001Service")
public class Req6001ServiceImpl  extends EgovAbstractServiceImpl implements Req6001Service{

    @Resource(name="req6001DAO")
    private Req6001DAO req6001DAO;

    	
	@SuppressWarnings("rawtypes")
	public String insertReq6001ReqChangeLogInfo(Map paramMap) throws Exception{
		return req6001DAO.insertReq6001ReqChangeLogInfo(paramMap);
	}

}
