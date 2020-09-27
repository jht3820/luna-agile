package egovframework.com.cmm;

import java.io.Serializable;


@SuppressWarnings("serial")
public class SessionVO implements Serializable {
	
	
	private String sUserId;
	
	private String sUserNm;
	
	private String sEmail;
	
	private String sUserSe;
	
	private String orgnztId;
	
	private String uniqId;
	
	public String getSUserId() {
		return sUserId;
	}
	
	public void setSUserId(String userId) {
		sUserId = userId;
	}
	
	public String getSUserNm() {
		return sUserNm;
	}
	
	public void setSUserNm(String userNm) {
		sUserNm = userNm;
	}
	
	public String getSEmail() {
		return sEmail;
	}
	
	public void setSEmail(String email) {
		sEmail = email;
	}
	
	public String getSUserSe() {
		return sUserSe;
	}
	
	public void setSUserSe(String userSe) {
		sUserSe = userSe;
	}
	
	public String getOrgnztId() {
		return orgnztId;
	}
	
	public void setOrgnztId(String orgnztId) {
		this.orgnztId = orgnztId;
	}
	
	public String getUniqId() {
		return uniqId;
	}
	
	public void setUniqId(String uniqId) {
		this.uniqId = uniqId;
	}
}
