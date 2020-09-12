package egovframework.com.cmm.service;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;


@SuppressWarnings("serial")
public class FileVO implements Serializable {

    
    public String atchFileId = "";
    
    public String creatDt = "";
    
    public String fileCn = "";
    
    public String fileExtsn = "";
    
    public String fileMg = "";
    
    public String fileSn = "";
    
    public String fileStreCours = "";
    
    public String orignlFileNm = "";
    
    public String streFileNm = "";
    
    public String fileType = "";

    
    public String getAtchFileId() {
	return atchFileId;
    }

    
    public void setAtchFileId(String atchFileId) {
	this.atchFileId = atchFileId;
    }

    
    public String getCreatDt() {
	return creatDt;
    }

    
    public void setCreatDt(String creatDt) {
	this.creatDt = creatDt;
    }

    
    public String getFileCn() {
	return fileCn;
    }

    
    public void setFileCn(String fileCn) {
	this.fileCn = fileCn;
    }

    
    public String getFileExtsn() {
	return fileExtsn;
    }

    
    public void setFileExtsn(String fileExtsn) {
	this.fileExtsn = fileExtsn;
    }

    
    public String getFileMg() {
	return fileMg;
    }

    
    public void setFileMg(String fileMg) {
	this.fileMg = fileMg;
    }

    
    public String getFileSn() {
	return fileSn;
    }

    
    public void setFileSn(String fileSn) {
	this.fileSn = fileSn;
    }

    
    public String getFileStreCours() {
	return fileStreCours;
    }

    
    public void setFileStreCours(String fileStreCours) {
	this.fileStreCours = fileStreCours;
    }

    
    public String getOrignlFileNm() {
	return orignlFileNm;
    }

    
    public void setOrignlFileNm(String orignlFileNm) {
	this.orignlFileNm = orignlFileNm;
    }

    
    public String getStreFileNm() {
	return streFileNm;
    }

    
    public void setStreFileNm(String streFileNm) {
	this.streFileNm = streFileNm;
    }

    
    public String toString() {
	return ToStringBuilder.reflectionToString(this);
    }

	public String getFileType() {
		return fileType;
	}

	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	
    
}
