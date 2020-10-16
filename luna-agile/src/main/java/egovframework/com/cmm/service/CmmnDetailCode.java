package egovframework.com.cmm.service;

import java.io.Serializable;


public class CmmnDetailCode implements Serializable {

	private static final long serialVersionUID = 1L;

	
    private String codeId = "";

    
    private String codeIdNm = "";

    
	private String code = "";

	
    private String codeNm = "";

    
    private String codeDc = "";

    
    private String useAt = "";

    
    private String frstRegisterId = "";

    
    private String lastUpdusrId   = "";

	
	public String getCodeId() {
		return codeId;
	}

	
	public void setCodeId(String codeId) {
		this.codeId = codeId;
	}

	
	public String getCodeIdNm() {
		return codeIdNm;
	}

	
	public void setCodeIdNm(String codeIdNm) {
		this.codeIdNm = codeIdNm;
	}

	
	public String getCode() {
		return code;
	}

	
	public void setCode(String code) {
		this.code = code;
	}

	
	public String getCodeNm() {
		return codeNm;
	}

	
	public void setCodeNm(String codeNm) {
		this.codeNm = codeNm;
	}

	
	public String getCodeDc() {
		return codeDc;
	}

	
	public void setCodeDc(String codeDc) {
		this.codeDc = codeDc;
	}

	
	public String getUseAt() {
		return useAt;
	}

	
	public void setUseAt(String useAt) {
		this.useAt = useAt;
	}

	
	public String getFrstRegisterId() {
		return frstRegisterId;
	}

	
	public void setFrstRegisterId(String frstRegisterId) {
		this.frstRegisterId = frstRegisterId;
	}

	
	public String getLastUpdusrId() {
		return lastUpdusrId;
	}

	
	public void setLastUpdusrId(String lastUpdusrId) {
		this.lastUpdusrId = lastUpdusrId;
	}


}
