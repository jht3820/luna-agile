package kr.opensoftlab.lunaops.usr.usr4000.usr4000.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.opensoftlab.lunaops.usr.usr4000.usr4000.service.Usr4000Service;
import kr.opensoftlab.lunaops.usr.usr4000.usr4000.vo.Usr4000VO;

@Service("usr4000Service")
public class Usr4000ServiceImpl extends EgovAbstractServiceImpl implements Usr4000Service {
	
	
    @Resource(name="usr4000DAO")
    private Usr4000DAO usr4000DAO;
	


	
	public List<Usr4000VO>  selectUsr4000UsrWhkList(Usr4000VO usr4000vo) throws Exception {
		 return  usr4000DAO.selectUsr4000UsrWhkList(usr4000vo);
	}
	
	
	public int  selectUsr4000UsrWhkListCnt(Usr4000VO usr4000vo) throws Exception {
		 return  usr4000DAO.selectUsr4000UsrWhkListCnt(usr4000vo);
	} 
	
	
	@SuppressWarnings({ "rawtypes" })
	public List<Map> selectUsr4000UsrWhkAllList(Map paramMap) throws Exception{
		return usr4000DAO.selectUsr4000UsrWhkAllList(paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public Map selectUsr4000UsrWhkInfo(Map paramMap) throws Exception{
		return usr4000DAO.selectUsr4000UsrWhkInfo(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public String insertUsr4000UsrWhkInfo(Map paramMap) throws Exception{
		return usr4000DAO.insertUsr4000UsrWhkInfo(paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public void updateUsr4000UsrWhkInfo(Map paramMap) throws Exception{
		usr4000DAO.updateUsr4000UsrWhkInfo(paramMap);
	}

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void deleteUsr4000UsrWhkList(Map paramMap) throws Exception{
		List<Map<String,String>> list = (List<Map<String,String>>) paramMap.get("list");
		
		
		String prjId = (String)paramMap.get("prjId");
		
		
		String usrId = (String)paramMap.get("usrId");
		
		int listSize = list.size();
		
		for (int i = 0; i < listSize; i++) {
			Map<String,String> whkMap = list.get(i);
			whkMap.put("prjId", prjId);
			whkMap.put("usrId", usrId);
			
			
			usr4000DAO.deleteUsr4000UsrWhkInfo(whkMap);
		}
	}
}
