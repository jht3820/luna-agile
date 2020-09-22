package kr.opensoftlab.lunaops.req.req2000.req2000.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.opensoftlab.lunaops.req.req2000.req2000.service.Req2000Service;
import kr.opensoftlab.sdf.excel.ExcelDataListResultHandler;



@Service("req2000Service")
public class Req2000ServiceImpl extends EgovAbstractServiceImpl implements Req2000Service {

	
    @Resource(name="req2000DAO")
    private Req2000DAO req2000DAO;
    
    
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

    
	@SuppressWarnings("rawtypes")
	public List selectReq2000ReqClsList(Map paramMap) throws Exception {
		return req2000DAO.selectReq2000ReqClsList(paramMap) ;
    }
	
	
	@SuppressWarnings("rawtypes")
	public Map selectReq2000ReqClsInfo(Map paramMap) throws Exception{
		return req2000DAO.selectReq2000ReqClsInfo(paramMap) ;
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Map insertReq2000ReqClsInfo(Map paramMap) throws Exception{
		Map map = req2000DAO.selectReq2000ReqClsInfo(paramMap);
		
		
		map.put("regUsrId", paramMap.get("regUsrId"));
		map.put("modifyUsrId", paramMap.get("modifyUsrId"));
		map.put("regUsrIp", paramMap.get("regUsrIp"));
		map.put("modifyUsrIp", paramMap.get("modifyUsrIp"));
		map.put("selPrjId", paramMap.get("selPrjId"));
		
		
		String insReqClsId = req2000DAO.insertReq2000ReqClsInfo(map);
		
		
		if(insReqClsId == null || "".equals(insReqClsId)){
			throw new Exception(egovMessageSource.getMessage("req4000.notFoundUpperMenu.fail"));
		}
		
		
		map.put("reqClsId", insReqClsId);
		
		Map newMap = req2000DAO.selectReq2000ReqClsInfo(map);
		
		return newMap;
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked"})
	public List<String> deleteReq2000ReqClsAssignChk(Map paramMap) throws Exception{
		
		List<Map<String,String>> list = (List<Map<String,String>>) paramMap.get("list");
		
		String prjId = (String)paramMap.get("selPrjId");
		
		
		List<String> notDelReqClsNmList = new ArrayList<String>();
		
		int listSize = list.size();
		for (int i = 0; i < listSize; i++) {
			
			Map<String,String> delClsMap = list.get(i);
			delClsMap.put("prjId", prjId);
			
			
			Map rsltMap = req2000DAO.selectReq2000DelPosibleYn(delClsMap);
			
			String delYn = (String) rsltMap.get("delYn");
			
			if("N".equals(delYn)){
				
				notDelReqClsNmList.add(delClsMap.get("reqClsNm"));
			}
		}
		return notDelReqClsNmList;
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked"})
	public void deleteReq2000ReqClsInfo(Map paramMap) throws Exception{
		
		List<Map<String,String>> list = (List<Map<String,String>>) paramMap.get("list");
	
		
		String prjId = (String)paramMap.get("selPrjId");
		
		int listSize = list.size();

		
		for (int i = 0; i < listSize; i++) {
			
			Map<String,String> delClsMap = list.get(i);
			delClsMap.put("prjId", prjId);

			
			int delCnt = req2000DAO.deleteReq2000ReqClsInfo(delClsMap);
				
			
			if(delCnt == 0 ){
				throw new Exception(egovMessageSource.getMessage("fail.common.delete"));
			}
		}
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public void updateReq2000ReqClsInfo(Map paramMap) throws Exception{
		
		
		int upCnt = req2000DAO.updateReq2000ReqClsInfo(paramMap);
		
		
		if(upCnt == 0 ){
			throw new Exception(egovMessageSource.getMessage("fail.common.update"));
		}
	}

	@SuppressWarnings("rawtypes")
	@Override
	public void selectReq2000ExcelList(Map paramMap,
			ExcelDataListResultHandler resultHandler) throws Exception {
		req2000DAO.selectReq2000ExcelList(paramMap,resultHandler);
		
	}
}
