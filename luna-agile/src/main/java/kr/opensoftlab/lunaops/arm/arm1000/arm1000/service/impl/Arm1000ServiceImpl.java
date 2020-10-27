package kr.opensoftlab.lunaops.arm.arm1000.arm1000.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import kr.opensoftlab.lunaops.arm.arm1000.arm1000.service.Arm1000Service;
import kr.opensoftlab.lunaops.arm.arm1000.arm1000.vo.Arm1000VO;
import kr.opensoftlab.sdf.util.WebhookSend;

import org.springframework.stereotype.Service;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;



@Service("arm1000Service")
public class Arm1000ServiceImpl extends EgovAbstractServiceImpl implements Arm1000Service {

	
    @Resource(name="arm1000DAO")
    private Arm1000DAO arm1000DAO;

    
   	@Resource(name = "egovMessageSource")
   	EgovMessageSource egovMessageSource;

    
    @Resource(name = "webhookSend")
    private WebhookSend webhookSend;
   	
	@SuppressWarnings("rawtypes")
	public List selectArm1000AlarmList(Arm1000VO arm1000VO) throws Exception {
		 return arm1000DAO.selectArm1000AlarmList(arm1000VO);
    }
	
	
	@SuppressWarnings("rawtypes")
	public Map selectArm1000AlarmCnt(Map<String, String> paramMap) throws Exception {
		return arm1000DAO.selectArm1000AlarmCnt(paramMap);
	}
	
	@SuppressWarnings("rawtypes")
	public String insertArm1000AlarmInfo(Map paramMap) throws Exception{
		
		
		boolean webHookUsrStatus = false;
		String whkRegUsrNm = "";
		
		try{
			whkRegUsrNm =  (String)paramMap.get("whkRegUsrNm");

			
			String usrId = (String) paramMap.get("usrId");
			
			
			webHookUsrStatus = webhookSend.userWebhookSetting((String)paramMap.get("licGrpId"), usrId);
			
			
			if(webHookUsrStatus){
				
				String memoTitle = (String)paramMap.get("title");
				String memoContent = (String)paramMap.get("content");
				
				
				memoContent = memoContent.replaceAll("</br>", "\n");
				
				String messasgeJson = webhookSend.messageJsonSetting(whkRegUsrNm+"님으로부터 쪽지가 도착했습니다.\n\n["+memoTitle+"]\n"+memoContent,"#4b73eb");
				webhookSend.usrSend(messasgeJson, "whkSignRejectCd");
			}
			
		}catch(Exception e){
			
		}
		
		return arm1000DAO.insertArm1000AlarmInfo(paramMap);
	}
	
	
	@SuppressWarnings({"unchecked", "rawtypes" })
	public void updateArm1000AlarmInfo(Map<String, Object> paramMap) throws Exception{
		List<Map<String,String>> list = (List<Map<String,String>>) paramMap.get("list");
		
		
		if(list == null){
			arm1000DAO.updateArm1000AlarmInfo(paramMap);
		}else{
			int listSize = list.size();
			
			
			String viewCheck = (String) paramMap.get("viewCheck");
			String delCheck = (String) paramMap.get("delCheck");
			
			
			for (int i = 0; i < listSize; i++) {
				Map<String,String> reqMap = list.get(i);
				
				
				if(viewCheck == null) {
					viewCheck = (String)reqMap.get("viewCheck");
				}
				if(delCheck == null) {
					delCheck = (String)reqMap.get("delCheck");
				}
				
				
				String loginUsrId = (String) reqMap.get("regUsrId");
				
				reqMap.put("usrId", loginUsrId);
				if("01".equals(viewCheck)){
					reqMap.put("viewCheck", viewCheck);
				}
				else if("01".equals(delCheck)){
					
					Map armInfo = arm1000DAO.selectArm1000AlarmInfo(reqMap);
					
					
					String usrId = (String) armInfo.get("usrId");
					
					String sendUsrId = (String) armInfo.get("sendUsrId");
					
					
					if(sendUsrId.equals(usrId)) {
						reqMap.put("armTypeCd", "03");
					}
					
					else if(loginUsrId.equals(sendUsrId)) {
						reqMap.put("armTypeCd", "01");
					}
					
					else if(loginUsrId.equals(usrId)) {
						reqMap.put("armTypeCd", "02");
					}
					
					
					reqMap.put("delCheck", delCheck);
				}
				arm1000DAO.updateArm1000AlarmInfo(reqMap);
			}
		}
	}
	
	
	@SuppressWarnings("rawtypes")
	public Map selectArm1000AlarmInfo(Map paramMap) throws Exception {
		return arm1000DAO.selectArm1000AlarmInfo(paramMap);
	}
	
	
	@SuppressWarnings("rawtypes")
	public void updateArm1000AlarmList(Map paramMap) throws Exception{
		arm1000DAO.updateArm1000AlarmList(paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public List selectAdm1300AuthUsrList(Map paramMap) throws Exception {
		return arm1000DAO.selectAdm1300AuthUsrList(paramMap);
	}
}
