package kr.opensoftlab.lunaops.prj.prj3000.prj3000.service.impl;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.service.impl.FileManageDAO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.opensoftlab.lunaops.prj.prj3000.prj3000.service.Prj3000Service;



@Service("prj3000Service")
public class Prj3000ServiceImpl extends EgovAbstractServiceImpl implements Prj3000Service {

	
    @Resource(name="prj3000DAO")
    private Prj3000DAO prj3000DAO;
    
    @Resource(name = "FileManageDAO")
	private FileManageDAO fileMngDAO;
    
    
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	@SuppressWarnings("rawtypes")
	public List selectPrj3000BaseMenuList(Map paramMap) throws Exception{
		return prj3000DAO.selectPrj3000BaseMenuList(paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public Map selectPrj3000MenuInfo(Map paramMap) throws Exception{
		return prj3000DAO.selectPrj3000MenuInfo(paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public Map insertPrj3000MenuInfo(Map paramMap) throws Exception{
		Map map = prj3000DAO.selectPrj3000MenuInfo(paramMap);
		
		
		map.put("regUsrId", paramMap.get("regUsrId"));
		map.put("modifyUsrId", paramMap.get("modifyUsrId"));
		map.put("regUsrIp", paramMap.get("regUsrIp"));
		map.put("modifyUsrIp", paramMap.get("modifyUsrIp"));

		
		map.put("docFormFileSn", 0);
		
		
		

		map.put("docFormFileId", paramMap.get("fileFormId"));
		fileMngDAO.insertFileMasterInfo((String) paramMap.get("fileFormId"));
			
		map.put("docAtchFileId", paramMap.get("fileAtchId"));
		fileMngDAO.insertFileMasterInfo((String) paramMap.get("fileAtchId"));
		
		
		String insDocId = prj3000DAO.insertPrj3000MenuInfo(map);
		
		
		if(insDocId == null || "".equals(insDocId)){
			throw new Exception(egovMessageSource.getMessage("prj3000.fail.menu.insert"));
		}
		
		
		
		map.put("docId", insDocId);
		
		Map newMap = prj3000DAO.selectPrj3000MenuInfo(map);
		
		return newMap;
	}
	
	
	@SuppressWarnings("rawtypes")
	public String insertPrj3000RootMenuInfo(Map paramMap) throws Exception{
		return prj3000DAO.insertPrj3000RootMenuInfo(paramMap);
	}
	
	
	@SuppressWarnings({"rawtypes", "unchecked"})
	public void deletePrj3000MenuInfo(Map paramMap) throws Exception{
		
		
		List<Map<String,String>> list = (List<Map<String,String>>) paramMap.get("list");
		
		String licGrpId = (String)paramMap.get("licGrpId");
		String prjId = (String)paramMap.get("prjId");
		
		
		List<String> atchFileIdList = new ArrayList<String>();
		
		
		for(Map docMap : list) {

			
			docMap.put("licGrpId", licGrpId);
			docMap.put("prjId", prjId);
			
			
			prj3000DAO.deletePrj3000MenuInfo(docMap);
			
			
			String docAtchFileId = (String)docMap.get("docAtchFileId");
			
			String docFormFileId = (String)docMap.get("docFormFileId");
			
			
			if(docAtchFileId != null && !"".equals(docAtchFileId)){
				atchFileIdList.add(docAtchFileId);
			}
			
			
			if(docFormFileId != null && !"".equals(docFormFileId)){
				atchFileIdList.add(docFormFileId);
			}
		}
		
		
		List<FileVO> delFileList = new ArrayList<FileVO>();
		
		
		if(atchFileIdList.size() > 0){
			
			for(String atchFileIdStr : atchFileIdList){
				FileVO fileVo = new FileVO();
				fileVo.setAtchFileId(atchFileIdStr);
				
				
				List<FileVO> selFileList = fileMngDAO.selectFileInfs(fileVo);
				delFileList.addAll(selFileList);
			}
		}
		
		
		if(delFileList.size() > 0){
			
			for(FileVO delFileInfo : delFileList){
				
				fileMngDAO.deleteAllFileInf(delFileInfo);
				fileMngDAO.deleteFileInf(delFileInfo);
			}
			
			
			for(FileVO delFileInfo : delFileList){
				try{
					
					String fileDeletePath  = delFileInfo.getFileStreCours()+delFileInfo.getStreFileNm();
				    EgovFileMngUtil.deleteFile(fileDeletePath);
				}catch(Exception fileE){	
					
					continue;
				}
			}
		}
	}

	
	@SuppressWarnings("rawtypes")
	public int deletePrj3000DocList(Map paramMap) throws Exception{
		return prj3000DAO.deletePrj3000DocList(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void updatePrj3000MenuInfo(Map paramMap) throws Exception{
		
		int upCnt = prj3000DAO.updatePrj3000MenuInfo(paramMap);
				
		
		if(upCnt == 0 ){
			throw new Exception(egovMessageSource.getMessage("fail.common.update"));
		}
	}
	
	
	@SuppressWarnings("rawtypes")
	public void updatePrj3000FileSnSelect(Map paramMap) throws Exception{
		int upCnt = prj3000DAO.updatePrj3000FileSnSelect(paramMap);
		
		
		if(upCnt == 0 ){
			throw new Exception(egovMessageSource.getMessage("fail.common.update"));
		}
	}
	
	
	@SuppressWarnings("rawtypes")
	public List selectPrj3000MenuTree(Map paramMap) throws Exception{
		return prj3000DAO.selectPrj3000MenuTree(paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public List selectPrj3000RootMenuList(Map paramMap) throws Exception{
		return prj3000DAO.selectPrj3000RootMenuList(paramMap);
	}

	
	@SuppressWarnings("rawtypes")
	public Map selectPrj3000WizardMenuInfo(Map paramMap) throws Exception{
		return prj3000DAO.selectPrj3000WizardMenuInfo(paramMap);
	}
}
