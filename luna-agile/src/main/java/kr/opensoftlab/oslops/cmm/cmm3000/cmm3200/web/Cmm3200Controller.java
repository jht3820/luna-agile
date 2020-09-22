package kr.opensoftlab.lunaops.cmm.cmm3000.cmm3200.web;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.opensoftlab.lunaops.cmm.cmm3000.cmm3200.service.Cmm3200Service;
import kr.opensoftlab.sdf.util.RequestConvertor;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.cop.ems.service.EgovSndngMailService;
import egovframework.com.cop.ems.service.SndngMailVO;
import egovframework.com.utl.fcc.service.EgovStringUtil;
import egovframework.com.utl.sim.service.EgovFileScrty;
import egovframework.rte.fdl.cmmn.trace.LeaveaTrace;
import egovframework.rte.fdl.property.EgovPropertyService;



@Controller
public class Cmm3200Controller {

	
	private static final Logger Log = Logger.getLogger(Cmm3200Controller.class);
	
	private static final int ReSendTime = Integer.parseInt(EgovProperties.getProperty("Globals.mail.reSend"));

	private static final int SessionTime = Integer.parseInt(EgovProperties.getProperty("Globals.mail.sessionTime"));
	
	
    @Resource(name = "cmm3200Service")
    private Cmm3200Service cmm3200Service;
    
    
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;

	
	@Resource(name = "propertiesService")
	protected EgovPropertyService propertiesService;

	
	@Resource(name = "egovSndngMailService")
	private EgovSndngMailService egovSndngMailService;
	
	
	@Resource(name = "leaveaTrace")
	LeaveaTrace leaveaTrace;
	
	
	@RequestMapping(value="/cmm/cmm3000/cmm3200/selectCmm3200View.do")
	public String selectCmm3200View(HttpServletRequest request, ModelMap model) throws Exception {
		
		String emailAuthChk = EgovProperties.getProperty("Globals.lunaops.emailAuth");
		model.addAttribute("emailAuthChk", emailAuthChk);
		
		return "/cmm/cmm3000/cmm3200/cmm3200";
	}

	
	@RequestMapping(value = "/cmm/cmm3000/cmm3200/selectCmm3200IdCheck.do", produces="text/plain;charset=UTF-8")
	  public ModelAndView selectCmm3200IdCheck (HttpServletRequest request, ModelMap model) throws Exception   {

		
		HashMap<String, String> map = new HashMap<String, String>();
		try{
			
			Map<String, String> param = RequestConvertor.requestParamToMap(request, true);
			
			if (Log.isDebugEnabled()) {
				Log.debug("\n=====> parameter map : " + param);
			}

			String UsrInId = param.get("InUsrId");

			if( "".equals(EgovStringUtil.isNullToString(UsrInId)) ) {
				map.put("idChk", "N");

				return new ModelAndView("jsonView", map);
			}

			Map<String, String> paramMap = new HashMap<String, String>();
			paramMap.put("usrId", UsrInId);

			int idChkCnt  = 1;
			
			idChkCnt =  cmm3200Service.selectCmm3200idChk( paramMap );
			
			
			if( idChkCnt == 0) {
				
				map.put("chkId", "Y");
				
			}else{
				map.put("chkId", "N");
			}

		}catch(Exception e){
			Log.error("selectCmm3200idChk", e);
			return new ModelAndView("jsonView", map);
		}
		return new ModelAndView("jsonView", map);
	}
	
	
	
	
	@RequestMapping(value = "/cmm/cmm3000/cmm3200/selectCmm3200MailSend.do", produces="text/plain;charset=UTF-8")
	  public ModelAndView selectCmm3200MailSend (HttpServletRequest request, ModelMap model) throws Exception   {

		
		HashMap<String, String> map = new HashMap<String, String>();
		
		try{
			
			Map<String, String> param = RequestConvertor.requestParamToMap(request, true);

			    
			if (Log.isDebugEnabled()) {
				Log.debug("\n=====> parameter map : " + param);
			}
			
			
			String UsrInEmail = param.get("InEmail");
			
			
			if("".equals(EgovStringUtil.isNullToString(UsrInEmail)) ) {
				 
				map.put("emailChk", "N");
				
				return new ModelAndView("jsonView", map);
			} else {
				map.put("emailChk", "Y");
			}
			
			map.put("emailSend","");
			map.put("emailSendTime", "N");

			
			if(request.getSession() != null && request.getSession().getAttribute("EmailAuthTime") != null) {
				
				Long unixtimeTemp = (Long)request.getSession().getAttribute("EmailAuthTime");

				
				Long systemTimeTemp = System.currentTimeMillis() / 1000;

				
				if(unixtimeTemp != null && ((unixtimeTemp+ReSendTime) > systemTimeTemp)) {
					
					map.put("emailSendTime",""+((unixtimeTemp+ReSendTime)-systemTimeTemp));
					
					return new ModelAndView("jsonView", map);
				}
			}
			
			StringBuffer buf =new StringBuffer();
			
			
			buf = randomAuthNumber(10);

			
			String enUsrCode = EgovFileScrty.encryptPassword(buf.toString(), "Search");
			
			
			SndngMailVO mailVO = new SndngMailVO();
			mailVO.setDsptchPerson("admin@opensoftlab.kr");				
			mailVO.setRecptnPerson(UsrInEmail);									
			mailVO.setSj(egovMessageSource.getMessage("cmm3200.success.emailTitle.send"));		
			mailVO.setEmailCn(
					egovMessageSource.getMessage("cmm3200.success.emailContents.send")
					+buf
					);
			
			
			boolean sendingMailResult = egovSndngMailService.sndngMail(mailVO);
			
			if(sendingMailResult){
				
				map.put("emailSend", egovMessageSource.getMessage("cmm3200.success.emailAuthNum.send"));
			}else{
				
				map.put("emailSend", egovMessageSource.getMessage("cmm3200.fail.emailAuthNum.send"));
			}
			request.getSession().setAttribute("EmailAuthValue", enUsrCode);
			request.getSession().setAttribute("EmailAuthTime", System.currentTimeMillis() / 1000);
			request.getSession().setMaxInactiveInterval(SessionTime*60);
			
		}catch(Exception e){
			Log.error("selectCmm3200MailSend", e);
			return new ModelAndView("jsonView", map);
		}
		
		return new ModelAndView("jsonView", map);
    }
	
	@RequestMapping(value = "/cmm/cmm3000/cmm3200/selectCmm3200SendValCheck.do", produces="text/plain;charset=UTF-8")
	  public ModelAndView selectCmm3200SendValCheck (HttpServletRequest request, ModelMap model) throws Exception   {

		
		HashMap<String, String> map = new HashMap<String, String>();
		try{
			
			Map<String, String> param = RequestConvertor.requestParamToMap(request, true);
			    
			if (Log.isDebugEnabled()) {
				Log.debug("\n=====> parameter map : " + param);
			}

			String InSendVal = param.get("InSendVal");

			
			 if( "".equals(EgovStringUtil.isNullToString(InSendVal)) ) {
				 
				map.put("authNum", "N");

				return new ModelAndView("jsonView", map);
			}
			
			if(request.getSession() != null && request.getSession().getAttribute("EmailAuthValue") != null){
				map.put("authNum", "Y");

				String enUsrInAN = EgovFileScrty.encryptPassword(InSendVal.toString(), "Search");
				
				String enSessionAuthNum = (String)request.getSession().getAttribute("EmailAuthValue");

				if(enSessionAuthNum != null){
					
					
					if(enUsrInAN.equals(enSessionAuthNum)){
						
						request.getSession().removeAttribute("EmailAuthValue");
						request.getSession().removeAttribute("EmailAuthTime");
					}else{
						
						map.put("authNum", "N");
						
						return new ModelAndView("jsonView", map);
					}
				}
			}else{
				
				map.put("authNum", "N");
				
				return new ModelAndView("jsonView", map);
			}
		}catch(Exception e){
			Log.error("selectCmm4001ChkAction", e);
			return new ModelAndView("jsonView", map);
		}
		return new ModelAndView("jsonView", map);
	}
	
	
	private StringBuffer randomAuthNumber(int MaxNum) throws Exception   {
		
		if(MaxNum < 0 && MaxNum > 30){
			MaxNum = 10;
		}
		Random rand =new Random();
		StringBuffer buf =new StringBuffer();
		
		for(int i=0;i<MaxNum;i++){
			
			if(rand.nextBoolean()){
				
				buf.append((char)((int)(rand.nextInt(26))+97));
			}else{
				
				buf.append((rand.nextInt(10))); 
			}
		}
		return buf;
	}
	
	
	@RequestMapping(value="/cmm/cmm3000/cmm3200/insertCmm3200JoinIng.do")
    public ModelAndView insertCmm3200JoinIng(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
		try{
			
        	Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
        	
        	paramMap.put("usrIp", request.getRemoteAddr()); 
        	
        	String successYn = cmm3200Service.insertCmm3200JoinIng(paramMap);
        	
        	model.addAttribute("successYn", successYn);
        	model.addAttribute("message", egovMessageSource.getMessage("success.common.insert"));
        	return new ModelAndView("jsonView");
        	
		}catch(Exception e){
			Log.error("insertCmm3200JoinIng()", e);
    		model.addAttribute("successYn", "N");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.insert"));
    		
    		return new ModelAndView("jsonView");
		}

	}
}
