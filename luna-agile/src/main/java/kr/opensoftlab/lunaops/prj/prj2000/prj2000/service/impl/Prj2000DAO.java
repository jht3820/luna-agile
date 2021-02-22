package kr.opensoftlab.lunaops.prj.prj2000.prj2000.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;
import kr.opensoftlab.lunaops.prj.prj2000.prj2000.vo.Prj2000VO;



@Repository("prj2000DAO")
public class Prj2000DAO extends ComOslitsAbstractDAO {
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Map> selectPrj2000PrjAuthGrpPageList(Map paramMap) throws Exception{
		return (List<Map>) list("prj2000DAO.selectPrj2000PrjAuthGrpPageList", paramMap);
    }
	
	
	@SuppressWarnings("rawtypes")
	public int selectPrj2000PrjAuthGrpListCnt(Map paramMap) throws Exception {
		return  (Integer)select("prj2000DAO.selectPrj2000PrjAuthGrpListCnt", paramMap);
	} 
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Map> selectPrj2000PrjAuthGrpList(Map paramMap) throws Exception{
		return (List<Map>) list("prj2000DAO.selectPrj2000PrjAuthGrpList", paramMap);
    }
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Map> selectPrj2000PrjAuthGrpList_new(Prj2000VO prj2000VO) throws Exception{
		return  (List<Map>) list("prj2000DAO.selectPrj2000PrjAuthGrpList_new", prj2000VO);
    }
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj2000AuthGrpSmallMenuList(Map paramMap) throws Exception{
		return (List) list("prj2000DAO.selectPrj2000AuthGrpSmallMenuList", paramMap);
    }
	
	
	
	@SuppressWarnings("rawtypes")
	public String insertPrj2000AuthGrpInfoAjax(Map paramMap) throws Exception{
		return (String) insert("prj2000DAO.insertPrj2000AuthGrpInfoAjax", paramMap);
	}	
	
	
	@SuppressWarnings("rawtypes")
	public String insertPrj2000PrjUsrAuthListAjax(Map paramMap) throws Exception{
		return (String) insert("prj2000DAO.insertPrj2000PrjUsrAuthListAjax", paramMap);
	}	
	
	
	@SuppressWarnings("rawtypes")
	public int deletePrj2000AuthGrpInfoAjax(Map paramMap) throws Exception{
		return (int) delete("prj2000DAO.deletePrj2000AuthGrpInfoAjax", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int deletePrj2000AuthPrjUsrListAjax(Map paramMap) throws Exception{
		return (int) delete("prj2000DAO.deletePrj2000AuthPrjUsrListAjax", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int deletePrj2000MenuUsrAuthListAjax(Map paramMap) throws Exception{
		return (int) delete("prj2000DAO.deletePrj2000MenuUsrAuthListAjax", paramMap);
	}
	
	
	
	@SuppressWarnings({ "rawtypes" })
	public int savePrj2000AuthGrpMenuAuthListOracleAjax(Map paramMap) throws Exception{
		return update("prj2000DAO.savePrj2000AuthGrpMenuAuthListAjax", paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public void savePrj2000AuthGrpMenuAuthListCubridAjax(Map paramMap) throws Exception{
		 select("prj2000DAO.savePrj2000AuthGrpMenuAuthListAjax", paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public int savePrj2000AuthGrpMenuAuthListMariaDBAjax(Map paramMap) throws Exception{
		return update("prj2000DAO.savePrj2000AuthGrpMenuAuthListAjax", paramMap);
	}
	
	
	
	@SuppressWarnings("rawtypes")
	public int deletePrj2000PrjUsrAuthListAjax(Map paramMap) throws Exception{
		return (int) delete("prj2000DAO.deletePrj2000PrjUsrAuthListAjax", paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public Map selectPrj2000AuthGrpInfoAjax(Map paramMap) throws Exception{
		return (Map)select("prj2000DAO.selectPrj2000AuthGrpInfoAjax", paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public int updatePrj2000AuthGrpInfoAjax(Map paramMap) throws Exception{
		return update("prj2000DAO.updatePrj2000AuthGrpInfoAjax", paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public List selectPrj2000AuthGrpCopyList(Map paramMap) throws Exception{
		return list("prj2000DAO.selectPrj2000AuthGrpCopyList", paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public int selectPrj2000AuthGrpNextOrd(Map paramMap) throws Exception{
		return (int) select("prj2000DAO.selectPrj2000AuthGrpNextOrd",paramMap);
	}
}
