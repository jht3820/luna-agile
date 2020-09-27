package kr.opensoftlab.lunaops.prj.prj2000.prj2000.vo;



import kr.opensoftlab.lunaops.com.vo.PageVO;


public class Prj2000VO extends PageVO {
	
	
	private String srchEvent;  
	
	private String rn;
	
	private String licGrpId;
	
	private String prjId;
	
	private String reqId;
	
	private String processId;
	
	private String flowId;
	
	private String usrId;
	
	private String authGrpId;
	
	private Integer rnum; 
	private Integer totalCnt; 
	private String view;
	
	public String getSrchEvent() {
		return srchEvent;
	}
	public void setSrchEvent(String srchEvent) {
		this.srchEvent = srchEvent;
	}
	public String getRn() {
		return rn;
	}
	public void setRn(String rn) {
		this.rn = rn;
	}
	public String getLicGrpId() {
		return licGrpId;
	}
	public void setLicGrpId(String licGrpId) {
		this.licGrpId = licGrpId;
	}
	public String getPrjId() {
		return prjId;
	}
	public void setPrjId(String prjId) {
		this.prjId = prjId;
	}
	public String getReqId() {
		return reqId;
	}
	public void setReqId(String reqId) {
		this.reqId = reqId;
	}
	public String getProcessId() {
		return processId;
	}
	public void setProcessId(String processId) {
		this.processId = processId;
	}
	public String getFlowId() {
		return flowId;
	}
	public void setFlowId(String flowId) {
		this.flowId = flowId;
	}
	public String getUsrId() {
		return usrId;
	}
	public void setUsrId(String usrId) {
		this.usrId = usrId;
	}
	public String getAuthGrpId() {
		return authGrpId;
	}
	public void setAuthGrpId(String authGrpId) {
		this.authGrpId = authGrpId;
	}
	public Integer getRnum() {
		return rnum;
	}
	public void setRnum(Integer rnum) {
		this.rnum = rnum;
	}
	public Integer getTotalCnt() {
		return totalCnt;
	}
	public void setTotalCnt(Integer totalCnt) {
		this.totalCnt = totalCnt;
	}
	public String getView() {
		return view;
	}
	public void setView(String view) {
		this.view = view;
	}
	
}
