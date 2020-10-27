package kr.opensoftlab.lunaops.com.fms.web.service;

import java.util.List;

import egovframework.com.cmm.service.EgovFileMngService;
import egovframework.com.cmm.service.FileVO;


public interface FileMngService extends EgovFileMngService{
	
	public void insertFileMasterInfo(String atchFileId) throws Exception;
	
	
	public String insertFileInfs(List<?> fvoList) throws Exception;
	
	
	public List<FileVO> fileDownList(FileVO fileVO) throws Exception;
	
	
	public int selectFileListCntByFileId(FileVO fvo) throws Exception;
	
	
    public int getFileSN(FileVO fvo) throws Exception;
}
