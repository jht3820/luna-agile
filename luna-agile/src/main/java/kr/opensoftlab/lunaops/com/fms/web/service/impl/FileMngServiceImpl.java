package kr.opensoftlab.lunaops.com.fms.web.service.impl;

import java.util.List;

import javax.annotation.Resource;

import kr.opensoftlab.lunaops.com.fms.web.service.FileMngService;

import org.springframework.stereotype.Service;

import egovframework.com.cmm.service.FileVO;
import egovframework.com.cmm.service.impl.EgovFileMngServiceImpl;
import egovframework.com.cmm.service.impl.FileManageDAO;



@Service("fileMngService")
public class FileMngServiceImpl extends EgovFileMngServiceImpl implements FileMngService {
	
	@Resource(name = "FileManageDAO")
	private FileManageDAO fileMngDAO;
	
	public void insertFileMasterInfo(String atchFileId) throws Exception {
		fileMngDAO.insertFileMasterInfo(atchFileId);
	}
	

	
	public String insertFileInfs(List<?> fvoList) throws Exception {
		String atchFileId = "";

		if (fvoList.size() != 0) {
			atchFileId = fileMngDAO.insertFileInfs(fvoList);
		}
		if (atchFileId == "") {
			atchFileId = null;
		}
		return atchFileId;
	}
	
	public List<FileVO> fileDownList(FileVO fileVO) throws Exception{
   		List<FileVO> _result = null;

		_result = fileMngDAO.selectFileInfs(fileVO);

		return _result;
	}
	
	public int selectFileListCntByFileId(FileVO fvo) throws Exception {
		return fileMngDAO.selectFileListCntByFileId(fvo);
	}
	
    public int getFileSN(FileVO fvo) throws Exception{
    	return fileMngDAO.getMaxFileSN(fvo);
    }
}
