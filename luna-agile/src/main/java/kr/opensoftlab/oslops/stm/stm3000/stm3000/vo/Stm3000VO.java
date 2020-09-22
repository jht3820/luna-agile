package kr.opensoftlab.lunaops.stm.stm3000.stm3000.vo;

import kr.opensoftlab.lunaops.com.vo.PageVO;
import kr.opensoftlab.sdf.excel.annotation.ExcelColumn;


public class Stm3000VO extends PageVO {
	
	
	private String rn;
	
	@ExcelColumn(position=0)
	private String usrId;
	
	@ExcelColumn(position=1)
	private String usrNm;
	
	@ExcelColumn(position=3)
	private String email;
	
	@ExcelColumn(position=2)
	private String telno;
	
	@ExcelColumn(position=4)
	private String deptId;
	
	@ExcelColumn(position=5)
	private String etc;
	
	private String licGrpId;
	
	@ExcelColumn(position=6)
	private String useCd;
	
	private String useCdNm;
	
	private String wkStTm;
	
	private String wkEdTm;
	
	private String bkStTm;
	
	private String bkEdTm;
	
	private String pwFailCnt;
	
	private String block;
	
	private String blockNm;
	
	private String recLoginDtm;
	
	private String loginExprYn;
	
	private String deptName;
	
	private String beforeBlock;
	
	private String reqMainColor;
	
	private String reqFontColor;
	
	private String dshDisplayCd;
	
	private String dshDisplayNm;
	
	
	private String prjId;
	
	private String searchPopTxt;

	public String getLicGrpId() {
		return licGrpId;
	}

	public void setLicGrpId(String licGrpId) {
		this.licGrpId = licGrpId;
	}

	public String getUsrId() {
		return usrId;
	}

	public void setUsrId(String usrId) {
		this.usrId = usrId;
	}

	public String getUsrNm() {
		return usrNm;
	}

	public void setUsrNm(String usrNm) {
		this.usrNm = usrNm;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelno() {
		return telno;
	}

	public void setTelno(String telno) {
		this.telno = telno;
	}

	public String getDeptId() {
		return deptId;
	}

	public void setDeptId(String deptId) {
		this.deptId = deptId;
	}
	
	public String getEtc() {
		return etc;
	}

	public void setEtc(String etc) {
		this.etc = etc;
	}

	public String getRn() {
		return rn;
	}

	public void setRn(String rn) {
		this.rn = rn;
	}

	public String getUseCd() {
		return useCd;
	}

	public void setUseCd(String useCd) {
		this.useCd = useCd;
	}
	
	public String getUseCdNm() {
		return useCdNm;
	}

	public void setUseCdNm(String useCdNm) {
		this.useCdNm = useCdNm;
	}

	public String getWkStTm() {
		return wkStTm;
	}

	public void setWkStTm(String wkStTm) {
		this.wkStTm = wkStTm;
	}

	public String getWkEdTm() {
		return wkEdTm;
	}

	public void setWkEdTm(String wkEdTm) {
		this.wkEdTm = wkEdTm;
	}

	public String getBkStTm() {
		return bkStTm;
	}

	public void setBkStTm(String bkStTm) {
		this.bkStTm = bkStTm;
	}

	public String getBkEdTm() {
		return bkEdTm;
	}

	public void setBkEdTm(String bkEdTm) {
		this.bkEdTm = bkEdTm;
	}
	
	public String getPwFailCnt() {
		return pwFailCnt;
	}

	public void setPwFailCnt(String pwFailCnt) {
		this.pwFailCnt = pwFailCnt;
	}

	public String getBlock() {
		return block;
	}

	public void setBlock(String block) {
		this.block = block;
	}
	
	public String getBlockNm() {
		return blockNm;
	}

	public void setBlockNm(String blockNm) {
		this.blockNm = blockNm;
	}
	
	public String getRecLoginDtm() {
		return recLoginDtm;
	}

	public void setRecLoginDtm(String recLoginDtm) {
		this.recLoginDtm = recLoginDtm;
	}
	
	public String getLoginExprYn() {
		return loginExprYn;
	}

	public void setLoginExprYn(String loginExprYn) {
		this.loginExprYn = loginExprYn;
	}
	
	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
	}
	
	public String getBeforeBlock() {
		return beforeBlock;
	}

	public void setBeforeBlock(String beforeBlock) {
		this.beforeBlock = beforeBlock;
	}

	public String getReqMainColor() {
		return reqMainColor;
	}

	public void setReqMainColor(String reqMainColor) {
		this.reqMainColor = reqMainColor;
	}

	public String getReqFontColor() {
		return reqFontColor;
	}

	public void setReqFontColor(String reqFontColor) {
		this.reqFontColor = reqFontColor;
	}
	
	public String getDshDisplayCd() {
		return dshDisplayCd;
	}

	public void setDshDisplayCd(String dshDisplayCd) {
		this.dshDisplayCd = dshDisplayCd;
	}

	public String getDshDisplayNm() {
		return dshDisplayNm;
	}

	public void setDshDisplayNm(String dshDisplayNm) {
		this.dshDisplayNm = dshDisplayNm;
	}

	public String getPrjId() {
		return prjId;
	}

	public void setPrjId(String prjId) {
		this.prjId = prjId;
	}
	
	public String getSearchPopTxt() {
		return searchPopTxt;
	}

	public void setSearchPopTxt(String searchPopTxt) {
		this.searchPopTxt = searchPopTxt;
	}

	
}
