package kr.opensoftlab.lunaops.dpl.dpl2000.dpl2100.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Timer;

import javax.annotation.Resource;

import kr.opensoftlab.lunaops.arm.arm1000.arm1000.service.impl.Arm1000DAO;
import kr.opensoftlab.lunaops.com.exception.UserDefineException;
import kr.opensoftlab.lunaops.dpl.dpl1000.dpl1000.service.impl.Dpl1000DAO;
import kr.opensoftlab.lunaops.dpl.dpl2000.dpl2100.service.Dpl2100Service;
import kr.opensoftlab.lunaops.dpl.dpl2000.dpl2100.vo.Dpl2100VO;
import kr.opensoftlab.sdf.jenkins.service.BuildService;
import kr.opensoftlab.sdf.jenkins.task.AutoJobBuildTask;
import kr.opensoftlab.sdf.jenkins.vo.AutoBuildVO;
import kr.opensoftlab.sdf.jenkins.vo.GlobalDplListVO;

import org.springframework.stereotype.Service;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;


@Service("dpl2100Service")
public class Dpl2100ServiceImpl  extends EgovAbstractServiceImpl implements Dpl2100Service{
	
    @Resource(name="arm1000DAO")
    private Arm1000DAO arm1000DAO;
    
	
    @Resource(name="dpl1000DAO")
    private Dpl1000DAO dpl1000DAO;
    
    
    @Resource(name="dpl2100DAO")
    private Dpl2100DAO dpl2100DAO;
    
	
	@Resource(name = "buildService")
	private BuildService buildService;
	
    
	@SuppressWarnings({"rawtypes" })
	public List selectDpl2100SignList(Dpl2100VO dpl2100vo)  throws Exception{
		return dpl2100DAO.selectDpl2100SignList(dpl2100vo);
	}
	
	
	public int selectDpl2100SignListCnt(Dpl2100VO dpl2100vo) throws Exception {
		return dpl2100DAO.selectDpl2100SignListCnt(dpl2100vo);
	}
	
	
	@SuppressWarnings({"rawtypes" })
	public Map selectDpl2100SignInfoAjax(Map map)  throws Exception{
		return dpl2100DAO.selectDpl2100SignInfoAjax(map);
	} 
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void insertDpl2100DplSignWaitInfo(Map paramMap) throws Exception{
		
		paramMap.put("signRejectTxt", "");
		
		dpl2100DAO.insertDpl2100DplSignInfo(paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void insertDpl2100DplSignInfo(Map paramMap) throws Exception{
		
		boolean autoDplInsert = false;
		
		
		Map requestSignInfo = dpl2100DAO.selectDpl2100SignInfoAjax(paramMap);
		
		
		String type = (String)paramMap.get("type");
		
		String signCdNm = "승인";
		String signRejectCmnt = "";	

		
		String prjId = (String)paramMap.get("prjId");
		
		
		String dplId = (String)paramMap.get("dplId");
		
		
		String dplNm = (String)requestSignInfo.get("dplNm");
		
		
		String signUsrId = (String) requestSignInfo.get("signUsrId");
		
		
		String signRegUsrId = (String) requestSignInfo.get("signRegUsrId");
		
		requestSignInfo.remove("signStsCd");
		
		
		Map dplInfo = null;
		
		
		if("accept".equals(type)){
			
			dplInfo = dpl1000DAO.selectDpl1000DeployVerInfo(paramMap);
			
			String dplTypeCd = (String)dplInfo.get("dplTypeCd");
			
			
			if("01".equals(dplTypeCd)){
				autoDplInsert = true;
			}
			
			String signAcceptTxt = (String)paramMap.get("signTxt");
			
			signCdNm = "승인";
			signRejectCmnt = "</br></br>승인사유: "+ signAcceptTxt;
			requestSignInfo.remove("signTxt");
			requestSignInfo.put("signTxt", signAcceptTxt);
			requestSignInfo.put("signStsCd", "02");
		}
		
		else if("reject".equals(type)){
			
			String signRejectTxt = (String)paramMap.get("signRejectTxt");
			
			signCdNm = "반려";
			signRejectCmnt = "</br></br>반려사유: "+ signRejectTxt;
			
			requestSignInfo.put("signRejectTxt", signRejectTxt);
			requestSignInfo.put("signStsCd", "03");
			
		}else{
			
			throw new UserDefineException();
		}
		
		
		if(!signUsrId.equals(signRegUsrId)){
			
			Map<String,String> armMap = new HashMap<String,String>();
    		armMap.put("usrId", signRegUsrId);
    		armMap.put("sendUsrId", signUsrId);
    		armMap.put("title", "["+dplNm+"] 배포계획의 결재가 "+signCdNm+" 되었습니다.");
    		armMap.put("content", "["+dplNm+"]  배포계획의 결재가 "+signCdNm+" 되었습니다.<br>해당 배포계획을 확인해주세요."+signRejectCmnt);
    		armMap.put("reqIds", "<span name='tagDplId' id='tagDplId' prj-id='"+prjId+"' dpl-id='"+dplId+"' onclick='fnSpanDplDetailOpen(this)'>"+dplNm+"<li class='fa fa-share'></li></span>");
    		armMap.put("armSendTypeCd", "07");
    		
			
			arm1000DAO.insertArm1000AlarmInfo(armMap);
		}
		
		
		dpl2100DAO.insertDpl2100DplSignInfo(requestSignInfo);
		
		
		if(autoDplInsert){
			
			AutoBuildVO autoBuildVo = buildService.selectAutoDplJobListSetting(dplInfo);
			
			AutoJobBuildTask autoJobBuildTask = new AutoJobBuildTask();
			autoJobBuildTask.setAutoBuildVo(autoBuildVo);
			
			Timer bldTimer = autoBuildVo.getAutoDplTimer();
			Long arriveTime = autoBuildVo.getArriveTime();
			
			
			if(arriveTime > 0){
				
				bldTimer.schedule(autoJobBuildTask, arriveTime);
				
				GlobalDplListVO.getDplList().add(autoBuildVo);
			}
		}
	}
}
