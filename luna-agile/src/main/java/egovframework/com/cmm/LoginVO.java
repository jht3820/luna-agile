package egovframework.com.cmm;

import java.io.Serializable;


public class LoginVO implements Serializable{
	
	
	private static final long serialVersionUID = -8274004534207618049L;
	
	
	private String id;
	
	private String name;
	
	private String ihidNum;
	
	private String email;
	
	private String password;
	
	private String passwordHint;
	
	private String passwordCnsr;
	
	private String userSe;
	
	private String orgnztId;
	
	private String orgnztNm;
	
	private String uniqId;
	
	private String url;
	
	private String ip;
	
	private String dn;
	
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getIhidNum() {
		return ihidNum;
	}
	
	public void setIhidNum(String ihidNum) {
		this.ihidNum = ihidNum;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getPasswordHint() {
		return passwordHint;
	}
	
	public void setPasswordHint(String passwordHint) {
		this.passwordHint = passwordHint;
	}
	
	public String getPasswordCnsr() {
		return passwordCnsr;
	}
	
	public void setPasswordCnsr(String passwordCnsr) {
		this.passwordCnsr = passwordCnsr;
	}
	
	public String getUserSe() {
		return userSe;
	}
	
	public void setUserSe(String userSe) {
		this.userSe = userSe;
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
	
	public String getUrl() {
		return url;
	}
	
	public void setUrl(String url) {
		this.url = url;
	}
	
	public String getIp() {
		return ip;
	}
	
	public void setIp(String ip) {
		this.ip = ip;
	}
	
	public String getDn() {
		return dn;
	}
	
	public void setDn(String dn) {
		this.dn = dn;
	}
	
	public String getOrgnztNm() {
		return orgnztNm;
	}
	
	public void setOrgnztNm(String orgnztNm) {
		this.orgnztNm = orgnztNm;
	}
	
}
