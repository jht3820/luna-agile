package egovframework.com.cmm.listener;


import java.util.Enumeration;
import java.util.Hashtable;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import kr.opensoftlab.lunaops.com.vo.LoginVO;


public class SesssionEventListener implements HttpSessionListener {

	public static SesssionEventListener loginSessionListener = null;
	
	@SuppressWarnings("rawtypes")
	public static Hashtable sessionMonitor;
		
	@SuppressWarnings("rawtypes")
	public SesssionEventListener() {
		if (sessionMonitor == null) sessionMonitor = new Hashtable();
		loginSessionListener = this;
	}
	
	public static synchronized SesssionEventListener getInstance() {
		if (loginSessionListener == null) loginSessionListener = new SesssionEventListener();
		return loginSessionListener;
	}
	
	
	public int getActiveSessionCount() {
		return sessionMonitor.size();
	}

	
	@SuppressWarnings("rawtypes")
	public Enumeration getIds() {
		return sessionMonitor.keys();
	}
	
	
	@SuppressWarnings("rawtypes")
	public boolean isDuplicateLogin(String sessionId, String userId){
		boolean ret = false;
		
		Enumeration eNum = sessionMonitor.elements();

		while(eNum.hasMoreElements()){
			HttpSession sh_session = null;
			
			try{
				
				sh_session = (HttpSession) eNum.nextElement();
			}catch(Exception e){
				continue;
			}

			
			LoginVO sessionVO = (LoginVO) sh_session.getAttribute("loginVO");
			if(sessionVO != null){
				if(userId.equals(sessionVO.getUsrId()) && !sessionId.equals(sh_session.getId())){
					ret = true;
					
				}
			}
		}
		
		return ret;
	}
	
	
	
	@SuppressWarnings("rawtypes")
	public boolean closeDuplicateSession(String sessionId, String userId){
		boolean ret = false;
		
		Enumeration eNum = sessionMonitor.elements();

		System.out.println("session count : " + getActiveSessionCount());
		
		while(eNum.hasMoreElements()){
			HttpSession sh_session = null;
			
			try{
				
				sh_session = (HttpSession) eNum.nextElement();
			}catch(Exception e){
				continue;
			}

			
			LoginVO sessionVO = (LoginVO) sh_session.getAttribute("loginVO");
			if(sessionVO != null){
				if(userId.equals(sessionVO.getUsrId()) && !sessionId.equals(sh_session.getId())){
					sh_session.invalidate();
					ret = true;
					System.out.println("이전 세션 강제 종료함");
					
					
				}
			}
		}
		
		return ret;
	}
	
	
	
	@SuppressWarnings("rawtypes")
	public boolean checkDupSession(String sessionId) {
		boolean ret = false;
		
		Enumeration eNum = sessionMonitor.elements();
		
		while(eNum.hasMoreElements()){
			HttpSession sh_session = null;
			
			try{
				
				sh_session = (HttpSession) eNum.nextElement();
			}catch(Exception e){
				continue;
			}
			
			
			LoginVO sessionVO = (LoginVO) sh_session.getAttribute("loginVO");
			if(sessionVO != null){
				if(sessionId.equals(sh_session.getId())){
					ret = true;
				}
			}
		}
		
		return ret;
	}

	@SuppressWarnings("unchecked")
	public void sessionCreated(HttpSessionEvent se) {
		HttpSession session = se.getSession();
		synchronized(sessionMonitor) {
			sessionMonitor.put(session.getId(), session);
			System.out.println(session.getId() + " : 세션 저장");
		}
	}

	public void sessionDestroyed(HttpSessionEvent se) {
		HttpSession session = se.getSession();
		synchronized( sessionMonitor ) {
			sessionMonitor.remove(session.getId());
			System.out.println(session.getId() + " : 세션 제거");
		}
	}
}
