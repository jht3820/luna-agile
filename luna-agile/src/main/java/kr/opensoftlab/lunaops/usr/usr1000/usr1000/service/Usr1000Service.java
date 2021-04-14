package kr.opensoftlab.lunaops.usr.usr1000.usr1000.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.opensoftlab.lunaops.com.vo.LoginVO;



public interface Usr1000Service {

	
	@SuppressWarnings("rawtypes")
	Map selectUsr1000UsrInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings("rawtypes")
	int selectUsr1000emailChRepAjax(Map paramMap) throws Exception;
	
	
	int updateUsr1000UsrInfo(Map<String, String> paramMap, MultipartHttpServletRequest mptRequest) throws Exception;
	
	
	Map<String, String> updateUsr1000PasswordChange(Map<String, String> paramMap) throws Exception;

	
	@SuppressWarnings("rawtypes")
	Map selectUsr1002(Map<String, String> paramMap) throws Exception;

	
	int updateUsr1002(Map<String, String> paramMap) throws Exception;

	
	LoginVO selectUsr1000LoginVO(Map<String, String> paramMap) throws Exception;

}
