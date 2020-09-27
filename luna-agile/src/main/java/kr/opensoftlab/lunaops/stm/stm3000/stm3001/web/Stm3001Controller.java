package kr.opensoftlab.lunaops.stm.stm3000.stm3001.web;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;
import egovframework.rte.fdl.idgnr.EgovIdGnrService;
import kr.opensoftlab.lunaops.com.fms.web.service.FileMngService;
import kr.opensoftlab.lunaops.com.vo.LoginVO;
import kr.opensoftlab.lunaops.stm.stm3000.stm3001.service.Stm3001Service;
import kr.opensoftlab.sdf.util.RequestConvertor;



@Controller
public class Stm3001Controller {

	
	private static final Logger Log = Logger.getLogger(Stm3001Controller.class);
	
    
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	
    @Resource(name = "stm3001Service")
    private Stm3001Service stm3001Service;
    
	@Value("${Globals.fileStorePath}")
	private String tempPath;
	
	@Resource(name = "egovFileIdGnrService")
	private EgovIdGnrService idgenService;
	
	
   	@Resource(name="fileMngService")
   	private FileMngService fileMngService;
   	
	
	
	@RequestMapping(value = "/stm/stm3000/stm3001/saveStm3001UsrOptInfo.do", produces="text/plain;charset=UTF-8")
	public ModelAndView saveStm3001UsrOptInfo (HttpServletRequest request, ModelMap model) throws Exception   {
		try{
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
			
			HttpSession ss = request.getSession();
    		LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
    		
    		
    		paramMap.put("usrId", loginVO.getUsrId());
    		
    		
    		int usrOptInfoCnt = stm3001Service.selectStm3001UsrOptCnt(paramMap);
    		
    		if(usrOptInfoCnt > 0) {
    			
    			stm3001Service.updateStm3001UsrOptInfo(paramMap);
    		}else {
    			
    			stm3001Service.insertStm3001UsrOptInfo(paramMap);
    		}
			
			model.addAttribute("errorYn", "N");
    		model.addAttribute("message", egovMessageSource.getMessage("success.common.save"));
    		return new ModelAndView("jsonView");
		}catch(Exception e){
			Log.error("saveStm3001UsrOptInfo()", e);
    		model.addAttribute("errorYn", "Y");
    		model.addAttribute("message", egovMessageSource.getMessage("fail.common.save"));
    		return new ModelAndView("jsonView");
		}
	}
	
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	@RequestMapping(value = "/stm/stm3000/stm3001/selectStm3001UsrOptList.do", produces="text/plain;charset=UTF-8")
	public ModelAndView selectStm3001UsrOptList (HttpServletRequest request, ModelMap model) throws Exception   {
		try{
			
			
			Map<String, String> paramMap = RequestConvertor.requestParamToMap(request, true);
			System.out.println(paramMap.get("pagination[page]"));
			
			HttpSession ss = request.getSession();
			LoginVO loginVO = (LoginVO) ss.getAttribute("loginVO");
			
			
			paramMap.put("usrId", loginVO.getUsrId());
			
			List<Map> usrOptList =  stm3001Service.selectStm3001UsrOptList(paramMap);
			
			model.addAttribute("list", usrOptList);
			model.addAttribute("errorYn", "N");
			model.addAttribute("message", egovMessageSource.getMessage("success.common.select"));
			return new ModelAndView("jsonView");
		}catch(Exception e){
			Log.error("selectStm3001UsrOptList()", e);
			model.addAttribute("errorYn", "Y");
			model.addAttribute("message", egovMessageSource.getMessage("fail.common.select"));
			return new ModelAndView("jsonView");
		}
	}
}
