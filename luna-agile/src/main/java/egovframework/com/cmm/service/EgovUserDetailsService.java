package egovframework.com.cmm.service;

import java.util.List;

public interface EgovUserDetailsService {

	
	public Object getAuthenticatedUser();

	
	public List<String> getAuthorities();
	
	
	public Boolean isAuthenticated(); 

}
