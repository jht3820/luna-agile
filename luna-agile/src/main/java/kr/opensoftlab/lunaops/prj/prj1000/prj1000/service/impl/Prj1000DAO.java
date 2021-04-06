package kr.opensoftlab.lunaops.prj.prj1000.prj1000.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;



@Repository("prj1000DAO")
public class Prj1000DAO extends ComOslitsAbstractDAO {
	
	@SuppressWarnings("rawtypes")
	public List selectPrj1000PrjGrpAllList(Map paramMap) throws Exception {
		 return (List) list("prj1000DAO.selectPrj1000PrjGrpAllList", paramMap);
    }
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj1000PrjGrpList(Map paramMap) throws Exception {
		return (List) list("prj1000DAO.selectPrj1000PrjGrpList", paramMap);
	}
	
	@SuppressWarnings("rawtypes")
	public int selectPrj1000PrjGrpListCnt(Map paramMap) throws Exception {
		return (int) select("prj1000DAO.selectPrj1000PrjGrpListCnt", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj1000PrjList(Map paramMap) throws Exception {
		return (List) list("prj1000DAO.selectPrj1000PrjList", paramMap);
	}
	
	@SuppressWarnings("rawtypes")
	public int selectPrj1000PrjListCnt(Map paramMap) throws Exception {
		return (int) select("prj1000DAO.selectPrj1000PrjListCnt", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj1000PrjAuthUsrList(Map paramMap) throws Exception {
		return (List) list("prj1000DAO.selectPrj1000PrjAuthUsrList", paramMap);
	}
	
	@SuppressWarnings("rawtypes")
	public int selectPrj1000PrjAuthUsrListCnt(Map paramMap) throws Exception {
		return (int) select("prj1000DAO.selectPrj1000PrjAuthUsrListCnt", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj1000PrjAuthNoneUsrList(Map paramMap) throws Exception {
		return (List) list("prj1000DAO.selectPrj1000PrjAuthNoneUsrList", paramMap);
	}
	
	@SuppressWarnings("rawtypes")
	public int selectPrj1000PrjAuthNoneUsrListCnt(Map paramMap) throws Exception {
		return (int) select("prj1000DAO.selectPrj1000PrjAuthNoneUsrListCnt", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public Map selectPrj1000GrpInfo(Map paramMap) throws Exception {
		 return (Map) select("prj1000DAO.selectPrj1000GrpInfo", paramMap);
    }
	
	
	@SuppressWarnings("rawtypes")
	public Map selectPrj1000Info(Map paramMap) throws Exception {
		return (Map) select("prj1000DAO.selectPrj1000Info", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj1001PrjGrpAuthList(Map paramMap) throws Exception {
		return (List) list("prj1000DAO.selectPrj1001PrjGrpAuthList", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj1000PrjGrpExistCheck(Map paramMap) throws Exception {
		return (List) list("prj1000DAO.selectPrj1000PrjGrpExistCheck", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj1000PrjGrpIdExistCheck(Map paramMap) throws Exception {
		return (List) list("prj1000DAO.selectPrj1000PrjGrpIdExistCheck", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public String insertPrj1000PrjGrpAjax(Map paramMap) throws Exception{
		return (String) insert("prj1000DAO.insertPrj1000PrjGrpAjax", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public String insertPrj1000PrjAjax(Map paramMap) throws Exception{
		return (String) insert("prj1000DAO.insertPrj1000PrjAjax", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int updatePrj1000(Map paramMap) throws Exception{
		return (int) update("prj1000DAO.updatePrj1000", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void deletePrj1000PrjAjax(Map paramMap) throws Exception{
		delete("prj1000DAO.deletePrj1000PrjAjax", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void updatePrj1000PrjTrashMoveAjax(Map paramMap) throws Exception{
		delete("prj1000DAO.updatePrj1000PrjTrashMoveAjax", paramMap);
	}
	
	
	@SuppressWarnings({"rawtypes", "unchecked"})
	public List<Map> selectPrj1000ProjectGroupListAjax(Map<String, String> paramMap) {
		return (List) list("prj1000DAO.selectPrj1000ProjectGroupListAjax", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectPrj1000ProjectAcronymCount(Map paramMap) throws Exception{
		return (Integer)select("prj1000DAO.selectPrj1000ProjectAcronymCount",paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int updatePrj1000UserProjectId(Map paramMap) throws Exception{
		return update("prj1000DAO.updatePrj1000UserProjectId",paramMap);
	}
	

	
	@SuppressWarnings("rawtypes")
	public List selectPrj1000AdminPrjList(Map paramMap) throws Exception {
		return (List) list("prj1000DAO.selectPrj1000AdminPrjList", paramMap);
	}
	

	
	@SuppressWarnings("rawtypes")
	public String insertPrj1000PrjWizardAjax(Map paramMap) throws Exception{
		return (String) insert("prj1000DAO.insertPrj1000PrjWizardAjax", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public String insertPrj1000PrjAuthInfo(Map paramMap) throws Exception{
		return (String) insert("prj1000DAO.insertPrj1000PrjAuthInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int deletePrj1000PrjAuthInfo(Map paramMap) throws Exception{
		return (int) delete("prj1000DAO.deletePrj1000PrjAuthInfo", paramMap);
	}
}
