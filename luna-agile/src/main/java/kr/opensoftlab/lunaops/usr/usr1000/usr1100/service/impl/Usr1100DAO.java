package kr.opensoftlab.lunaops.usr.usr1000.usr1100.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import kr.opensoftlab.lunaops.com.dao.ComOslitsAbstractDAO;

@Repository("usr1100DAO")
public class Usr1100DAO extends ComOslitsAbstractDAO {
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public List<Map>  selectUsr1100ShortcutList(Map paramMap) throws Exception {
		return  (List<Map>) list("usr1100DAO.selectUsr1100ShortcutList", paramMap);
	}
	
	
	@SuppressWarnings({"rawtypes" })
	public Integer  selectUsr1100ShortcutListCnt(Map paramMap) throws Exception {
		return  (Integer) select("usr1100DAO.selectUsr1100ShortcutListCnt", paramMap);
	}
	
	
	@SuppressWarnings({"rawtypes" })
	public void  insertUsr1100ShortcutList(Map paramMap) throws Exception {
		insert("usr1100DAO.insertUsr1100ShortcutList", paramMap);
	}
	
	
	@SuppressWarnings({"rawtypes" })
	public void  updateUsr1100ShortcutList(Map paramMap) throws Exception {
		update("usr1100DAO.updateUsr1100ShortcutList", paramMap);
	}
	
	
	
	
}
