package egovframework.com.cmm.util;

import java.util.List;

import egovframework.com.cmm.service.EgovUserDetailsService;



public class EgovUserDetailsHelper {

	static EgovUserDetailsService egovUserDetailsService;

	public EgovUserDetailsService getEgovUserDetailsService() {
		return egovUserDetailsService;
	}

	public void setEgovUserDetailsService(EgovUserDetailsService egovUserDetailsService) {
		EgovUserDetailsHelper.egovUserDetailsService = egovUserDetailsService;
	}

	
	public static Object getAuthenticatedUser() {
		return egovUserDetailsService.getAuthenticatedUser();
	}

	
	public static List<String> getAuthorities() {
		return egovUserDetailsService.getAuthorities();
	}

	
	public static Boolean isAuthenticated() {
		return egovUserDetailsService.isAuthenticated();
	}
}
