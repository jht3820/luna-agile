package egovframework.com.cmm.service.impl;

import java.util.ArrayList;
import java.util.List;

import egovframework.com.cmm.service.EgovUserDetailsService;

import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;

import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;



public class EgovUserDetailsSessionServiceImpl extends EgovAbstractServiceImpl implements EgovUserDetailsService {

	public Object getAuthenticatedUser() {
		if (RequestContextHolder.getRequestAttributes() == null) {
			return null;
		}

		return RequestContextHolder.getRequestAttributes().getAttribute("loginVO", RequestAttributes.SCOPE_SESSION);

	}

	public List<String> getAuthorities() {

		
		List<String> listAuth = new ArrayList<String>();

		return listAuth;
	}

	public Boolean isAuthenticated() {
		

		if (RequestContextHolder.getRequestAttributes() == null) {
			return false;
		} else {

			if (RequestContextHolder.getRequestAttributes().getAttribute("loginVO", RequestAttributes.SCOPE_SESSION) == null) {
				return false;
			} else {
				return true;
			}
		}

	}

}
