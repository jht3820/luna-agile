package kr.opensoftlab.lunaops.usr.usr1000.usr1100.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.opensoftlab.lunaops.usr.usr1000.usr1100.service.Usr1100Service;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;



@Service("usr1100Service")
public class Usr1100ServiceImpl extends EgovAbstractServiceImpl implements Usr1100Service {
	
	
	@Resource(name="usr1100DAO")
	private Usr1100DAO usr1100DAO;
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public List<Map> selectUsr1100ShortcutList(Map paramMap) throws Exception {
		
		
		Integer hasCnt = usr1100DAO.selectUsr1100ShortcutListCnt(paramMap);
		
		
		if(hasCnt == 0) {
			paramMap.put("usrId", "DEFAULT");
		}
		
		List<Map> usr1100List = usr1100DAO.selectUsr1100ShortcutList(paramMap);
		
		List<Map> shortcutInfo = new ArrayList<Map>();
		
		for(Map _shortcut: usr1100List) {
			
			Map shortcut = new HashMap();
			List<String> shortcutString= new ArrayList();
			
			if("01".equals(_shortcut.get("ctrlCd"))) {
				shortcutString.add("Ctrl");
			}
			if("01".equals(_shortcut.get("shiftCd"))) {
				shortcutString.add("Shift");
			}
			if("01".equals(_shortcut.get("altCd"))) {
				shortcutString.add("Alt");
			}
			
			
						
			shortcutString.add(_shortcut.get("keyCd").toString().replace(" ", ""));
			shortcut.put("actionCd", _shortcut.get("actionCd"));
			shortcut.put("shortcut", String.join(" + ",shortcutString));
			shortcut.put("subCdNm", _shortcut.get("subCdNm"));
			shortcut.put("popupActionCd", _shortcut.get("popupActionCd"));
			
			shortcutInfo.add(shortcut);
			
		}
		return shortcutInfo;
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	@Override
	public void saveUsr1100ShortcutInfo(Map paramMap) throws Exception {
		
		
		Integer hasCnt = usr1100DAO.selectUsr1100ShortcutListCnt(paramMap);
		
		JSONParser parser = new JSONParser();
		
		
		String shortcutString = (String) paramMap.get("shortcutList");
		JSONArray shortcutList = (JSONArray) parser.parse(shortcutString);
		
		for(int i=0;i<shortcutList.size();i++) {
			
			JSONObject shortcut = (JSONObject) shortcutList.get(i);
			Map param = new ObjectMapper().readValue(shortcut.toString(), Map.class);
			param.put("usrId", paramMap.get("usrId"));
			param.put("regUsrId", paramMap.get("regUsrId"));
			param.put("modifyUsrId", paramMap.get("modifyUsrId"));
			param.put("regUsrIp", paramMap.get("regUsrIp"));
			param.put("modifyUsrIp", paramMap.get("regUsrIp"));
			
			
			if(param.get("keyCd") == null || "".equals(param.get("keyCd"))) {
				param.put("keyCd", " ");
				param.put("useCd", "02");
			}else {
				param.put("useCd", "01");
			}
			
    		
    		if(hasCnt == 0) {
    			
    			usr1100DAO.insertUsr1100ShortcutList(param);
    			
    		
    		}else {
    			
    			usr1100DAO.updateUsr1100ShortcutList(param);
    			
    		}
        }
	}
	
}
