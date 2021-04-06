package kr.opensoftlab.lunaops.adm.adm5000.adm5000.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ibm.icu.text.SimpleDateFormat;

import egovframework.com.cmm.service.EgovProperties;
import egovframework.com.utl.fcc.service.EgovDateUtil;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import kr.opensoftlab.lunaops.adm.adm5000.adm5000.service.Adm5000Service;
import kr.opensoftlab.lunaops.stm.stm4000.stm4000.service.impl.Stm4000DAO;



@Service("adm5000Service")
public class Adm5000ServiceImpl extends EgovAbstractServiceImpl implements Adm5000Service {

	
    @Resource(name="adm5000DAO")
    private Adm5000DAO adm5000DAO;

	
    @Resource(name="stm4000DAO")
    private Stm4000DAO stm4000DAO;

   	
	
   	
	
	
	@SuppressWarnings({ "rawtypes" })
	public List selectAdm5000HoliList(Map paramMap) throws Exception{
		return adm5000DAO.selectAdm5000HoliList(paramMap);
	}
	
	
	@SuppressWarnings({ "rawtypes" })
	public Map selectAdm5000HoliInfo(Map paramMap) throws Exception{
		return adm5000DAO.selectAdm5000HoliInfo(paramMap);
	}
	
    
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void insertAdm5000HoliList(Map paramMap) throws Exception{
		
		adm5000DAO.deleteAdm5000LicGrpHoliList(paramMap);
		
		
		paramMap.put("mstCd", "CMM00002");
		paramMap.put("firstIndex", "0");
		paramMap.put("lastIndex", "100000");
		
		
		List<Map> commonHolidayList = stm4000DAO.selectStm4000CommonCodeDetailList(paramMap);
		
		
		
		String holidayYearRangeStr = EgovProperties.getProperty("Globals.holiday.yearRange");
		int holidayYearRange = Integer.parseInt(holidayYearRangeStr);
		
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy", Locale.KOREA);
		String currentYearStr = sdf.format(new Date());
		int currentYear = Integer.parseInt(currentYearStr);
		
		
		int beforeRangeYear = currentYear-holidayYearRange;
		int afterRangeYear = currentYear+holidayYearRange;
		
		SimpleDateFormat fm = new SimpleDateFormat("yyyyMMdd", Locale.KOREA);
		
		Map newMap = new HashMap<>();
		
		
		for(int i=beforeRangeYear;i<=afterRangeYear;i++) {
			for(Map commonHolidayInfo : commonHolidayList) {
				newMap = new HashMap<>();
				
				newMap.put("licGrpId", paramMap.get("licGrpId"));
				newMap.put("regUsrId", paramMap.get("regUsrId"));
				newMap.put("regUsrIp", paramMap.get("regUsrIp"));
				newMap.put("modifyUsrId", paramMap.get("modifyUsrId"));
				newMap.put("modifyUsrIp", paramMap.get("modifyUsrIp"));
				
				
				newMap.put("holiInsertType", "01");
				newMap.put("holiBgColor", "#fd397a");
				newMap.put("holiColor", "#fff");
				newMap.put("holiStartTime", "00:00");
				newMap.put("holiEndTime", "00:00");
				newMap.put("holiAllDayCd", "01");
				
				
				String subCd = (String) commonHolidayInfo.get("subCd");
				String subCdNm = (String) commonHolidayInfo.get("subCdNm");
				String subCdRef1 = (String) commonHolidayInfo.get("subCdRef1");
				String subCdRef2 = (String) commonHolidayInfo.get("subCdRef2");
				
				
				Date dateStr = fm.parse(i+subCdRef1);
				String holiDate = fm.format(dateStr);
				
				
				if("+".equals(subCdRef2)) {
					newMap.put("holiStartDate", holiDate);
					newMap.put("holiEndDate", holiDate);
					
					newMap.put("holiCd", subCd);
					newMap.put("holiNm", subCdNm);
					newMap.put("holiDesc", subCdNm);
					
					
					adm5000DAO.insertAdm5000HoliInfo(newMap);
				}
				
				else if("-".equals(subCdRef2)) {
					int isLeap = 0;
					
					
					boolean isLeapYr = EgovDateUtil.isLeapYear(Integer.parseInt(holiDate));
					
					
					if( isLeapYr ){
						
						if("02".equals(subCdRef1.substring(0, 2))){
							isLeap = 1;	
						}else{
							isLeap = 0;
						}
					
					}else{
						isLeap = 0;
					}
					
					String solarDt = EgovDateUtil.toSolar(holiDate, isLeap);
					String holiStartDate = solarDt;
					String holiEndDate = solarDt;
					
					
					if("03".equals(subCd) || "05".equals(subCd)){
						String befHoliDate = EgovDateUtil.addDay(solarDt, -1);		
						holiStartDate = befHoliDate;
						
						String aftHoliDate = EgovDateUtil.addDay(solarDt, 2);		
						holiEndDate = aftHoliDate;
					}
					
					newMap.put("holiStartDate", holiStartDate);
					newMap.put("holiEndDate", holiEndDate);
					newMap.put("holiCd", subCd);
					newMap.put("holiDesc", subCdNm);
					newMap.put("holiNm", subCdNm);
					
					
					adm5000DAO.insertAdm5000HoliInfo(newMap);
					
				}
				else {
					continue;
				}
				
			}
		}
	}
}