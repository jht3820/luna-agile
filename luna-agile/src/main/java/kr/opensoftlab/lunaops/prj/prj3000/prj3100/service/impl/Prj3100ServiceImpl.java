package kr.opensoftlab.lunaops.prj.prj3000.prj3100.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.service.EgovFileMngUtil;
import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.service.impl.FileManageDAO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import kr.opensoftlab.lunaops.prj.prj3000.prj3100.service.Prj3100Service;


@Service("prj3100Service")
public class Prj3100ServiceImpl extends EgovAbstractServiceImpl implements Prj3100Service{
	
	@Resource(name = "FileManageDAO")
	private FileManageDAO fileMngDAO;

	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	@Resource(name = "prj3100DAO")
	private Prj3100DAO prj3100DAO;
	
	@Override
	public void deletePrj3100File(Map<String, String> paramMap) throws Exception {

		FileVO fileVo = new FileVO();
		fileVo.setAtchFileId(paramMap.get("atchFileId"));
		fileVo.setFileSn(paramMap.get("fileSn"));
		fileVo = fileMngDAO.selectFileInf(fileVo);

		
		fileMngDAO.deleteFileInf(fileVo);

		
		String fileDeletePath = fileVo.getFileStreCours() + fileVo.getStreFileNm();
		EgovFileMngUtil.deleteFile(fileDeletePath);

	}
	
	
	@Override
	public void updatePrj3100FileType(Map<String, String> paramMap) throws Exception {
		
		String updateType = paramMap.get("updateType");
		
		
		if("atchFile".equals(updateType)) {
			
			
			prj3100DAO.deletePrj3001CngInf(paramMap);
			
		}
		
		
		prj3100DAO.updatePrj3100FileType(paramMap);
		
		
		
		if("waitFile".equals(updateType)) {
			
			FileVO fileVO = new FileVO();
			
			
			fileVO.setAtchFileId(paramMap.get("afterFileId"));
			fileVO.setFileSn(paramMap.get("afterFileSn"));
			fileVO = fileMngDAO.selectFileInf(fileVO);
			
			paramMap.put("fileSn", fileVO.getFileSn());
			paramMap.put("fileStreCours", fileVO.getFileStreCours());
			paramMap.put("streFileNm", fileVO.getStreFileNm());
			paramMap.put("orignlFileNm", fileVO.getOrignlFileNm());
			paramMap.put("fileExtsn", fileVO.getFileExtsn());
			paramMap.put("fileType", fileVO.getFileType());
			paramMap.put("fileSize", fileVO.getFileMg());
			
			String infType = "";
			String signUseCd = paramMap.get("signUseCd");
			
			
			if("01".equals(signUseCd)) {
				
				infType = "02";
			
			}else if("02".equals(signUseCd)) {
				
				infType = "01";
			}
			
			paramMap.put("infType", infType);
			
			
			String cngInfId = prj3100DAO.insertPrj3001CngInf(paramMap);
		}
		
	}

	
	@SuppressWarnings("rawtypes")
	@Override
	public List selectPrj3100MenuTree(Map<String, String> paramMap) throws Exception {
		return prj3100DAO.selectPrj3100MenuTree(paramMap);
	}

	
	@Override
	public Map selectPrj3001CngInf(Map<String, String> paramMap) throws Exception {
		return prj3100DAO.selectPrj3001CngInf(paramMap);
	}
}
