package kr.opensoftlab.lunaops.stm.stm8000.stm8000.service.impl;

import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;
import org.tmatesoft.svn.core.SVNURL;
import org.tmatesoft.svn.core.io.SVNRepository;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import egovframework.com.cmm.service.EgovProperties;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.opensoftlab.lunaops.stm.stm8000.stm8000.service.Stm8000Service;
import kr.opensoftlab.sdf.svn.SVNConnector;
import kr.opensoftlab.sdf.svn.vo.SVNFileVO;
import kr.opensoftlab.sdf.svn.vo.SVNLogVO;
import kr.opensoftlab.sdf.util.CommonScrty;



@Service("stm8000Service")
public class Stm8000ServiceImpl extends EgovAbstractServiceImpl implements Stm8000Service {

	
	@Resource(name = "stm8000DAO")
	private Stm8000DAO stm8000DAO;
	
	
	@Resource(name = "svnConnector")
	private SVNConnector svnConnector;

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	private Map<String, String> selectStm8000JsonToMap(Map paramMap){
		Map rtnMap = new HashMap();
		for( Object key : paramMap.keySet() ) {
			String jsonVal = "";
			try{
				jsonVal = (String) paramMap.get(key);
			}catch(ClassCastException cce){	
				continue;
			}
			
			JSONObject jsonObj = null;
			
			
			try{
				JSONParser jsonParser = new JSONParser();
				jsonObj = (JSONObject) jsonParser.parse(jsonVal);
				rtnMap.put(key, jsonObj.get("optVal"));
			}catch(Exception e){
				rtnMap.put(key, jsonVal);
			}
		}
		return rtnMap;
	}
	
	
	public int selectStm8000ServerListCnt(Map<String, String> paramMap) throws Exception {
		return  stm8000DAO.selectStm8000ServerListCnt(paramMap);
	}
	
	
	@SuppressWarnings( "rawtypes" )
	public List<Map> selectStm8000ServerList(Map<String, String> paramMap) throws Exception {
		return  stm8000DAO.selectStm8000ServerList(paramMap);
	}
	
	
	public Map<String, String> selectStm8000ServerInfo(Map<String, String> paramMap) throws Exception {
		return  stm8000DAO.selectStm8000ServerInfo(paramMap);
	}
	
	
	public void insertStm8000ServerInfo(Map<String, String> paramMap) throws Exception {
		Map<String, String> convertParamMap = selectStm8000JsonToMap(paramMap);

		
		
		String strgRepId = stm8000DAO.insertStm8000ServerInfo(convertParamMap);
		
		
		String strgUsrPw = (String) paramMap.get("strgUsrPw");
		if(strgUsrPw != null && ! strgUsrPw.isEmpty()) {
			
			String salt = EgovProperties.getProperty("Globals.lunaops.salt");
			String newStrgUsrPw = CommonScrty.encryptedAria(strgUsrPw, salt);
			
			
			paramMap.put("strgUsrPw", newStrgUsrPw);
			paramMap.put("strgRepId", strgRepId);
			
			
			stm8000DAO.updateStm8000ServerPwInfo(paramMap);
		}
	}

	
	public void updateStm8000ServerInfo(Map<String, String> paramMap) throws Exception {
		Map<String, String> convertParamMap = selectStm8000JsonToMap(paramMap);
		stm8000DAO.updateStm8000ServerInfo(convertParamMap);
	}
	
	
	public void deleteStm8000ServerInfo(Map<String, String> paramMap) throws Exception {
		stm8000DAO.deleteStm8000ServerInfo(paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes"})
	public List<Map> selectStm8000RevisionList(Map<String, String> paramMap) throws Exception {
		List<Map> returnList = null;
		
		
		String type = paramMap.get("type");
		
		if(!type.isEmpty()){
			if("01".equals(type)) {
				
				returnList = selectStm8000SvnList(paramMap);
			}else {
				
				returnList = selectStm8000GitList(paramMap);
			}
		}
		
		return returnList;
	}

	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Map> selectStm8000SvnList(Map<String, String> paramMap) throws Exception {
		List list = null;
		
		String url = paramMap.get("linkUrl");
		String id = paramMap.get("linkId");
		String pw = paramMap.get("linkPw"); 
		
		
		String salt = EgovProperties.getProperty("Globals.lunaops.salt");
		
		
		String newPw = CommonScrty.decryptedAria(pw, salt);
		
		
		SVNRepository repository = svnConnector.svnConnect(url, id, newPw);
		
		
		repository.testConnection();
		
		int currentPage = Integer.parseInt(paramMap.get("pagination[page]"))-1;
		int perPage = Integer.parseInt(paramMap.get("pagination[perpage]"));

		
		
		long lastRevision = repository.getLatestRevision(); 
		long startRevision = lastRevision - 99;
		
		
		String startRevisionVal = (String)paramMap.get("searchStNum");
		String endRevisionVal = (String)paramMap.get("searchEdNum");
		
		
		if(startRevisionVal != null && endRevisionVal != null && !"".equals(startRevisionVal) && !"".equals(endRevisionVal)) {
			
			startRevisionVal = startRevisionVal.replaceAll("/[^0-9]/g", "");
			endRevisionVal = endRevisionVal.replaceAll("/[^0-9]/g", "");
			
			long startRevisionValL = Long.valueOf(startRevisionVal);
			long endRevisionValL = Long.valueOf(endRevisionVal);
			
			
			if(endRevisionValL > lastRevision) {
				endRevisionValL = lastRevision;
			}
			if(startRevisionValL > lastRevision) {
				startRevisionValL = lastRevision;
			}
			
			
			if(startRevisionValL > endRevisionValL) {
				startRevisionValL = endRevisionValL;
			}
			
			startRevision = startRevisionValL;
			lastRevision = endRevisionValL;
		}
		
		
		if(startRevision < 0 ) {
			startRevision = 0;
		}
		
		if(lastRevision < 0) {
			lastRevision = 0;
		}
		
		
		String searchFilePath = (String)paramMap.get("filePath");
		
		String[] filePath = new String[] {};
		
		
		if(searchFilePath != null && !"".equals(searchFilePath)) {
			filePath = new String[] {searchFilePath};
		}
		
		
		Map searchMap = null;
		
		
		String searchTargetId = (String)paramMap.get("searchTargetId");
		
		
		String searchTargetData = (String)paramMap.get("searchTargetData");
		String searchStartDt = (String)paramMap.get("searchStartDt");
		String searchEndDt = (String)paramMap.get("searchEndDt");
		
		
		if(searchTargetId != null && !"".equals(searchTargetId)) {
			searchMap = new HashMap<>();
			searchMap.put("searchSelect", searchTargetId);
			searchMap.put("searchTxt", searchTargetData);
			searchMap.put("searchStDate", searchStartDt);
			searchMap.put("searchEdDate", searchEndDt);
		}
		
		
		Map svnLogMap = svnConnector.selectSVNLogPageList(filePath, repository, startRevision, lastRevision, currentPage, perPage, searchMap);
		
		
		if(!svnLogMap.isEmpty()) {
			list = new ArrayList<>();
			
			Map info = new HashMap<>();
			
			info.put("totalCnt", String.valueOf(svnLogMap.get("svnLogAllSize")));
			info.put("searchStNum", svnLogMap.get("stNum"));
			info.put("searchEdNum", svnLogMap.get("edNum"));
			list.add(info);
			
			List<SVNLogVO> svnLogMapList = (List<SVNLogVO>) svnLogMap.get("svnLogList");
			
			for(int i=0; i<svnLogMapList.size(); i++) {
				Map listInfo = new HashMap<>();
				listInfo.put("revision", svnLogMapList.get(i).getRevision());
				listInfo.put("author", svnLogMapList.get(i).getAuthor());
				listInfo.put("logDate", svnLogMapList.get(i).getLogDate());
				listInfo.put("sDate", svnLogMapList.get(i).getsDate());
				
				listInfo.put("comment", svnLogMapList.get(i).getComment());
				list.add(listInfo);
			}
		}
		
		
		svnConnector.close(repository);
		
		return list;
	}
	
	
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public List<Map> selectStm8000GitList(Map<String, String> paramMap) throws Exception {
		List<Map<String, Object>> commits = null;
		List<Map> list = null;
		int count = 0;
		
		ObjectMapper mapper = new ObjectMapper();

		String url = paramMap.get("linkUrl");
		String id = paramMap.get("linkId");
		String pw = paramMap.get("linkPw"); 
		
		String repo = paramMap.get("linkRepo");
		String auth = "token "+pw;
		
		
		int startPage = 1;
		boolean nextPage = true;
		while(nextPage) {
			String linkUrl = url + "/repos/"+id+"/"+repo+"/commits?page="+startPage+"&perPage=100";
			
			
			URL obj = new URL(String.format(linkUrl));
			HttpURLConnection conn = (HttpURLConnection)obj.openConnection();

			conn.setRequestMethod("GET");
			conn.setRequestProperty("Authorization", auth);
			
			
			commits = mapper.readValue(conn.getInputStream(), new TypeReference<ArrayList<Map<String, Object>>>(){}); 

			if(commits.size()>0) {
				if(list == null) {
					list = new ArrayList<>();
				}
				for(int i=0; i<commits.size(); i++) {
					String sha = (String) commits.get(i).get("sha");
					String nodeId = (String) commits.get(i).get("node_id");
					String commitUrl = (String) commits.get(i).get("url");
					
					LinkedHashMap commit = (LinkedHashMap) commits.get(i).get("commit");
					Map<String, String> author = (Map<String, String>) commit.get("author");
					Map<String, String> committer = (Map<String, String>) commit.get("committer");
					Map<String, String> tree = (Map<String, String>) commit.get("tree");
					
					String message = (String) commit.get("message");
					
					String name = author.get("name");
					String email = author.get("email");
					String dtm = author.get("date");
					
					String committerName = committer.get("name");
					String committerEmail = committer.get("email");
					
					String treeSha = tree.get("sha");
					String treeUrl = tree.get("url");
					
					Map params = new HashMap<>();
					
					params.put("nodeId", nodeId);
					params.put("sha", sha);
					params.put("commitUrl", commitUrl);
					params.put("message", message);
					params.put("name", name);
					params.put("email", email);
					params.put("dtm", dtm);
					params.put("committerName", committerName);
					params.put("committerEmail", committerEmail);
					params.put("treeSha", treeSha);
					params.put("treeUrl", treeUrl);
					
					
					if("GitHub".equals(committerName)) {
						continue;
					}else {
						
						count++;
						params.put("rn", count);
						list.add(params);
						
						
						if(count == 50) {
							nextPage = false;
							break;
						}
					}
				}
			}else {
				nextPage = false;
				break;
			}
			
			
			if(startPage==10) {
				nextPage = false;
				break;
				
			}else {
				startPage++;
			}
		}

		
		if(list.size()>0) {
			
			int currentPage = Integer.parseInt(paramMap.get("pagination[page]"));
			int perPage = Integer.parseInt(paramMap.get("pagination[perpage]"));
			
			int startRow = (currentPage-1)*perPage;
			int endRow = (currentPage * perPage);
			
			list = list.subList(startRow, endRow);
			list.get(0).put("totalCnt", Integer.toString(count));
		}else {
			
			Map params = new HashMap<>();
			params.put("totalCnt", Integer.toString(count));
			list.add(params);
		}
		
		return list;
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked"})
	public List<Map> selectStm8000FileDirList(Map<String, String> paramMap) throws Exception {
		List<Map> returnList = null;
		if(paramMap.get("strgRepId") == null || "".equals(paramMap.get("strgRepId"))) {
			return null;
		}
		
		Map repInfo = stm8000DAO.selectStm8000ServerInfo(paramMap);
		
		String strgRepUrl = (String)repInfo.get("strgRepUrl");
		String strgUsrId = (String)repInfo.get("strgUsrId");
		String strgPw;
		
		
		if("01".equals(repInfo.get("strgTypeCd"))) {
			strgPw =  (String)repInfo.get("strgUsrPw");
			
			
			String salt = EgovProperties.getProperty("Globals.lunaops.salt");
			
			strgPw = CommonScrty.decryptedAria(strgPw, salt);
			
			
			SVNRepository repository = svnConnector.svnConnect(strgRepUrl, strgUsrId, strgPw);
			
			
			long revision = 0l;
			
			
			if(paramMap.get("revision") != null && !paramMap.get("revision").isEmpty()) {
				
				revision = Integer.parseInt(paramMap.get("revision"));
			}
			
			
			List<SVNLogVO> list = svnConnector.selectSVNLogList(repository,revision,revision);

			Map<String,Map> pathMap = new HashMap<String,Map>();			

			for(SVNLogVO logVO  : list ) {
				for(SVNFileVO fileVO  : logVO.getSvnFileList() ) {
					pathMap = svnConnector.setDirectoryMap( fileVO.getPath() , fileVO.getType()  , pathMap );
				}
			}
			
			
			Map revisionPathList = svnConnector.setDirectoryFileList(pathMap);
			
			
			List<Map> revisionDirList = (List<Map>) revisionPathList.get("dirList");
			
			
			List<Map> revisionFileList = (List<Map>) revisionPathList.get("fileList");
			
			
			
			if(paramMap.containsKey("filePath") && !paramMap.get("filePath").isEmpty()) {
				if(revisionFileList.size()>0) {
					
					List<Map> fileList = new ArrayList<>();
					for (Map map : revisionFileList) {
						
						String path = (String) map.get("path");
						path = path.substring(0, path.lastIndexOf("/"));
						if(path.indexOf(paramMap.get("filePath"))==0) {
							fileList.add(map);
						}
					}
					revisionFileList = fileList;
				}
			}
			
			
			if("name".equals(paramMap.get("searchTargetId"))) {
				
				if(paramMap.get("searchTargetData") != null && !paramMap.get("searchTargetData").isEmpty()) {
					
					if(revisionFileList.size()>0) {
						
						List<Map> fileNameList = new ArrayList<>();
						for (Map map : revisionFileList) {
							
							String name = (String) map.get("name");
							if(name.indexOf(paramMap.get("searchTargetData"))>-1) {
								fileNameList.add(map);
							}
						}
						revisionFileList = fileNameList;
					}
				}
			}
			
			if("dir".equals(paramMap.get("selectFileDirType"))) {
				returnList = revisionDirList;
			}else {
				
				if(paramMap.containsKey("sortFieldId") && paramMap.get("sortFieldId") != "") {
					if(paramMap.containsKey("sortDirection")) {
						List<String> sortList = new LinkedList<>();
					
						for (Map map : revisionFileList) {
							
							sortList.add((String)map.get(paramMap.get("sortFieldId")));
						}
						
						Collections.sort(sortList);
						
						if("asc".equals(paramMap.get("sortDirection"))) { 
							
							for (String str : sortList) {
								for(Map map : revisionFileList) {
									if(str.equals(map.get(paramMap.get("sortFieldId")))) {
										if(returnList==null) {
											returnList = new ArrayList<>();
										}
										returnList.add(map);
									}
								}
							}
						}else {
							
							Collections.reverse(sortList);
							for (String str : sortList) {
								for(Map map : revisionFileList) {
									if(str.equals(map.get(paramMap.get("sortFieldId")))) {
										if(returnList==null) {
											returnList = new ArrayList<>();
										}
										returnList.add(map);
									}
								}
							}
						}
					}
				}else {
					returnList = revisionFileList;
				}
			}
			
		}else {
			
			strgPw =  (String)repInfo.get("strgKey");
		}

		return returnList;
	}
	
	
	@SuppressWarnings("rawtypes")
	public String selectStm8000RevisionFileInfo(Map<String, String> paramMap) throws Exception {
		String content = null;
		
		
		Map repInfo = stm8000DAO.selectStm8000ServerInfo(paramMap);
		
		String strgRepUrl = (String)repInfo.get("strgRepUrl");
		String strgUsrId = (String)repInfo.get("strgUsrId");
		String strgPw;
		
		
		if("01".equals(repInfo.get("strgTypeCd"))) {
			strgPw =  (String)repInfo.get("strgUsrPw");
			
			
			String salt = EgovProperties.getProperty("Globals.lunaops.salt");
			
			strgPw = CommonScrty.decryptedAria(strgPw, salt);
			
			
			SVNRepository repository = svnConnector.svnConnect(strgRepUrl, strgUsrId, strgPw);
			
			String filePath = (String) paramMap.get("filePath");
			
			long revision = (long) Integer.parseInt(paramMap.get("revision"));
			
			content = svnConnector.getFileContent(repository, filePath, revision);
			
			svnConnector.close(repository);
			
		}else {
			
		}
		
		return content;
	}
}
