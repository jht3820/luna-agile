package egovframework.com.cmm;

import java.io.Serializable;

import org.apache.commons.lang3.builder.ToStringBuilder;


@SuppressWarnings("serial")
public class ComDefaultCodeVO implements Serializable {
    
    private String codeId = "";
    
    
    private String code = "";
    
    
    private String codeNm = "";
    
    
    private String codeDc = "";
    
    
    private String tableNm = "";	
    
    
    private String haveDetailCondition = "N";
    
    
    private String detailCondition = "";
    
    
    public String getCodeId() {
	return codeId;
    }

    
    public void setCodeId(String codeId) {
	this.codeId = codeId;
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

    
    public String getTableNm() {
	return tableNm;
    }

    
    public void setTableNm(String tableNm) {
	this.tableNm = tableNm;
    }

    
    public String getHaveDetailCondition() {
	return haveDetailCondition;
    }

    
    public void setHaveDetailCondition(String haveDetailCondition) {
	this.haveDetailCondition = haveDetailCondition;
    }

    
    public String getDetailCondition() {
	return detailCondition;
    }

    
    public void setDetailCondition(String detailCondition) {
	this.detailCondition = detailCondition;
    }

    
    public String toString() {
	return ToStringBuilder.reflectionToString(this);
    }
}
