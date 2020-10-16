package egovframework.com.cmm.interceptor;
 
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
 

public class IpObtainInterceptor extends HandlerInterceptorAdapter {
 
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
 
		String clientIp = request.getRemoteAddr();
 
		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
 
		if (loginVO != null) {
			loginVO.setIp(clientIp);
		}
 
		return true;
	}
}
