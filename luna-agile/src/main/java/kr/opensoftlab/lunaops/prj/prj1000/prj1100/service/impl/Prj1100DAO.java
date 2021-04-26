package kr.opensoftlab.lunaops.prj.prj1000.prj1100.service.impl;

import java.util.List;
import java.util.Map;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;

import org.springframework.stereotype.Repository;

@Repository("prj1100DAO")
public class Prj1100DAO  extends ComOslitsAbstractDAO {
	
	
	@SuppressWarnings("rawtypes")
	public int  selectPrj1100ProcessListCnt(Map paramMap) throws Exception {
		return  (Integer)select("prj1100DAO.selectPrj1100ProcessListCnt", paramMap);
	} 
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map>  selectPrj1100ProcessList(Map paramMap) throws Exception {
		return  (List<Map>) list("prj1100DAO.selectPrj1100ProcessList", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public Map selectPrj1100ProcessInfo(Map paramMap) throws Exception {
		return (Map) select("prj1100DAO.selectPrj1100ProcessInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void updatePrj1100ProcessInfo(Map paramMap) throws Exception {
		 update("prj1100DAO.updatePrj1100ProcessInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public String insertPrj1100ProcessInfo(Map paramMap) throws Exception {
		 return (String) insert("prj1100DAO.insertPrj1100ProcessInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void deletePrj1100ProcessInfo(Map paramMap) throws Exception {
		update("prj1100DAO.deletePrj1100ProcessInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj1100ProcessAuthUsrList(Map paramMap) throws Exception {
		return (List) list("prj1100DAO.selectPrj1100ProcessAuthUsrList", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectPrj1100ProcessAuthUsrListCnt(Map paramMap) throws Exception {
		return (int) select("prj1100DAO.selectPrj1100ProcessAuthUsrListCnt", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj1100ProcessAuthNoneUsrList(Map paramMap) throws Exception {
		return (List) list("prj1100DAO.selectPrj1100ProcessAuthNoneUsrList", paramMap);
	}
	
	@SuppressWarnings("rawtypes")
	public int selectPrj1100ProcessAuthNoneUsrListCnt(Map paramMap) throws Exception {
		return (int) select("prj1100DAO.selectPrj1100ProcessAuthNoneUsrListCnt", paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public String insertPrj1100ProcessAuthInfo(Map paramMap) throws Exception{
		return (String) insert("prj1100DAO.insertPrj1100ProcessAuthInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int deletePrj1100ProcessAuthInfo(Map paramMap) throws Exception{
		return (int) delete("prj1100DAO.deletePrj1100ProcessAuthInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectPrj1100ProcessReqCnt(Map paramMap) throws Exception {
		return (int) select("prj1100DAO.selectPrj1100ProcessReqCnt", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj1101FlowList(Map paramMap) throws Exception {
		return (List) list("prj1100DAO.selectPrj1101FlowList", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public Map selectPrj1101FlowInfo(Map paramMap) throws Exception {
		return (Map) select("prj1100DAO.selectPrj1101FlowInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void updatePrj1101FlowInfo(Map paramMap) throws Exception {
		 update("prj1100DAO.updatePrj1101FlowInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void insertPrj1101FlowInfo(Map paramMap) throws Exception {
		 insert("prj1100DAO.insertPrj1101FlowInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void deletePrj1101FlowInfo(Map paramMap) throws Exception {
		update("prj1100DAO.deletePrj1101FlowInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj1102ReqOptList(Map paramMap) throws Exception {
		return (List) list("prj1100DAO.selectPrj1102ReqOptList", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj1102OptList(Map paramMap) throws Exception {
		return (List) list("prj1100DAO.selectPrj1102OptList", paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public List selectPrj1103OptFileList(Map paramMap) throws Exception {
		return (List) list("prj1100DAO.selectPrj1103OptFileList", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectPrj1102OptCntInfo(Map paramMap) throws Exception {
		 return (int) select("prj1100DAO.selectPrj1102OptCntInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void updatePrj1102OtpInfo(Map paramMap) throws Exception {
		 update("prj1100DAO.updatePrj1102OtpInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void insertPrj1102OtpInfo(Map paramMap) throws Exception {
		 insert("prj1100DAO.insertPrj1102OtpInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void insertPrj1102OtpCopyInfo(Map paramMap) throws Exception {
		insert("prj1100DAO.insertPrj1102OtpCopyInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void deletePrj1102OtpInfo(Map paramMap) throws Exception {
		update("prj1100DAO.deletePrj1102OtpInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void insertPrj1103OtpValueInfo(Map paramMap) throws Exception {
		 insert("prj1100DAO.insertPrj1103OtpValueInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void updatePrj1103OtpValueInfo(Map paramMap) throws Exception {
		update("prj1100DAO.updatePrj1103OtpValueInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void insertPrj1105RevisionNumInfo(Map paramMap) throws Exception {
		insert("prj1100DAO.insertPrj1105RevisionNumInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void deletePrj1104RevisionNumInfo(Map paramMap) throws Exception {
		delete("prj1100DAO.deletePrj1104RevisionNumInfo", paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public List selectPrj1104ReqRevisionNumList(Map paramMap) throws Exception {
		return (List) list("prj1100DAO.selectPrj1104ReqRevisionNumList", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectPrj1104ReqRevisionNumListCnt(Map paramMap) throws Exception {
		return (Integer) select("prj1100DAO.selectPrj1104ReqRevisionNumListCnt", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectPrj1104ReqRevisionNumCnt(Map paramMap) throws Exception {
		return (int) select("prj1100DAO.selectPrj1104ReqRevisionNumCnt", paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public void insertPrj1105FlowAuthGrpInfo(Map paramMap) throws Exception {
		insert("prj1100DAO.insertPrj1105FlowAuthGrpInfo", paramMap);
	}
	
	@SuppressWarnings("rawtypes")
	public void deletePrj1105FlowAuthGrpInfo(Map paramMap) throws Exception {
		delete("prj1100DAO.deletePrj1105FlowAuthGrpInfo", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj1105FlowAuthGrpList(Map paramMap) throws Exception {
		return (List) list("prj1100DAO.selectPrj1105FlowAuthGrpList", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectPrj1105FlowAuthGrpCnt(Map paramMap) throws Exception {
		return (int) select("prj1100DAO.selectPrj1105FlowAuthGrpCnt", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj1100ProcessCopyList(Map paramMap) throws Exception {
		return (List) list("prj1100DAO.selectPrj1100ProcessCopyList", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj1102FlwOptExistFileIdList(Map paramMap) throws Exception {
		return (List) list("prj1100DAO.selectPrj1102FlwOptExistFileIdList", paramMap);
	}
}