package kr.opensoftlab.lunaops.adm.adm5000.adm5000.service;

import java.util.List;
import java.util.Map;



public interface Adm5000Service {
	
	@SuppressWarnings({ "rawtypes" })
	public List selectAdm5000HoliList(Map paramMap) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes" })
	public Map selectAdm5000HoliInfo(Map paramMap) throws Exception;
	
	
	@SuppressWarnings({ "rawtypes" })
	public void insertAdm5000HoliList(Map paramMap) throws Exception;
}
