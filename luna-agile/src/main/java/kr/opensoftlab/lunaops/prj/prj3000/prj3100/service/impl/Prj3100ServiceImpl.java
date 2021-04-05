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
		prj3100DAO.updatePrj3100FileType(paramMap);
		
	}

	
	@SuppressWarnings("rawtypes")
	@Override
	public List selectPrj3100MenuTree(Map<String, String> paramMap) throws Exception {
		return prj3100DAO.selectPrj3100MenuTree(paramMap);
	}
}
