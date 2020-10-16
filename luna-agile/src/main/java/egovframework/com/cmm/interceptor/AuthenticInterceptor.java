package egovframework.com.cmm.interceptor;

import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.util.EgovUserDetailsHelper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class AuthenticInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {

		boolean isPermittedURL = false;

		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();

		if(loginVO != null){
			return true;
		} else if(!isPermittedURL){
				ModelAndView modelAndView = new ModelAndView("redirect:/uat/uia/egovLoginUsr.do");
				throw new ModelAndViewDefiningException(modelAndView);
			}else{
				return true;
			}
	}

}
