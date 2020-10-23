package egovframework.com.cmm.service.impl;

import java.util.Iterator;
import java.util.List;

import egovframework.com.cmm.service.FileVO;

import org.springframework.stereotype.Repository;


@Repository("FileManageDAO")
public class FileManageDAO extends EgovComAbstractDAO {

	
	public String insertFileInfs(List<?> fileList) throws Exception {
		FileVO vo = (FileVO) fileList.get(0);
		String atchFileId = vo.getAtchFileId();

		insert("FileManageDAO.insertFileMaster", vo);

		Iterator<?> iter = fileList.iterator();
		while (iter.hasNext()) {
			vo = (FileVO) iter.next();

			insert("FileManageDAO.insertFileDetail", vo);
		}

		return atchFileId;
	}
	
	
	public void insertFileMasterInfo(String atchFileId) throws Exception {
		FileVO vo = new FileVO();
		vo.setAtchFileId(atchFileId);
		insert("FileManageDAO.insertFileMaster", vo);
	}
	
	
	public String insertFileDetail(List<?> fileList) throws Exception {
		FileVO vo = (FileVO) fileList.get(0);
		String atchFileId = vo.getAtchFileId();

		Iterator<?> iter = fileList.iterator();
		while (iter.hasNext()) {
			vo = (FileVO) iter.next();

			insert("FileManageDAO.insertFileDetail", vo);
		}

		return atchFileId;
	}

	
	public void insertFileInf(FileVO vo) throws Exception {
		insert("FileManageDAO.insertFileMaster", vo);
		insert("FileManageDAO.insertFileDetail", vo);
	}

	
	public void updateFileInfs(List<?> fileList) throws Exception {
		FileVO vo;
		Iterator<?> iter = fileList.iterator();
		while (iter.hasNext()) {
			vo = (FileVO) iter.next();
			insert("FileManageDAO.insertFileDetail", vo);
		}
	}

	
	public void deleteFileInfs(List<?> fileList) throws Exception {
		Iterator<?> iter = fileList.iterator();
		FileVO vo;
		while (iter.hasNext()) {
			vo = (FileVO) iter.next();

			delete("FileManageDAO.deleteFileDetail", vo);
		}
	}

	
	public void deleteFileInf(FileVO fvo) throws Exception {
		delete("FileManageDAO.deleteFileDetail", fvo);
	}

	
	@SuppressWarnings("unchecked")
	public List<FileVO> selectFileInfs(FileVO vo) throws Exception {
		return (List<FileVO>) list("FileManageDAO.selectFileList", vo);
	}

	
	public int getMaxFileSN(FileVO fvo) throws Exception {
		return (Integer) select("FileManageDAO.getMaxFileSN", fvo);
	}

	
	public FileVO selectFileInf(FileVO fvo) throws Exception {
		return (FileVO) select("FileManageDAO.selectFileInf", fvo);
	}

	
	public void deleteAllFileInf(FileVO fvo) throws Exception {
		update("FileManageDAO.deleteCOMTNFILE", fvo);
	}

	
	@SuppressWarnings("unchecked")
	public List<FileVO> selectFileListByFileNm(FileVO fvo) throws Exception {
		return (List<FileVO>) list("FileManageDAO.selectFileListByFileNm", fvo);
	}

	
	public int selectFileListCntByFileId(FileVO fvo) throws Exception {
		return (Integer) select("FileManageDAO.selectFileListCntByFileId", fvo);
	}

	
	@SuppressWarnings("unchecked")
	public List<FileVO> selectImageFileList(FileVO vo) throws Exception {
		return (List<FileVO>) list("FileManageDAO.selectImageFileList", vo);
	}
}
