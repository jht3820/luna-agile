package kr.opensoftlab.lunaops.usr.usr1000.usr1100.service;

import java.util.List;
import java.util.Map;


public interface Usr1100Service {
	
	
	@SuppressWarnings({ "rawtypes" })
	List<Map> selectUsr1100ShortcutList(Map paramMap) throws Exception;
	
	
	void saveUsr1100ShortcutInfo(Map<String, String> paramMap) throws Exception;

}
