package kr.opensoftlab.lunaops.cmm.cmm9000.cmm9100.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.opensoftlab.lunaops.cmm.cmm9000.cmm9100.service.Cmm9100Service;
import kr.opensoftlab.sdf.util.RequestConvertor;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import egovframework.com.cmm.EgovMessageSource;



@Controller
public class Cmm9100Controller {

	
	@Resource(name = "cmm9100Service")
	private Cmm9100Service cmm9100Service;

	
	@Resource(name = "egovMessageSource")
	EgovMessageSource egovMessageSource;
	
	
	@SuppressWarnings({ "rawtypes", "unchecked", "finally" })
	@RequestMapping(method = RequestMethod.POST, value = "/cmm/cmm9000/cmm9100/selectCmm9100MultiCommonCodeList.do")
	public ModelAndView selectCmm9100MultiCommonCodeList(
			HttpServletRequest request, HttpServletResponse response,
			ModelMap modelMap) throws Exception {
		
		String code = "";
		String text = "";

		String mstCdStr = (String) request.getParameter("mstCdStr");
		StringTokenizer st = new StringTokenizer(mstCdStr, "|");

		Map rtnMap = new HashMap();

		try {
			
			Map<String, String> param = RequestConvertor.requestParamToMap(
					request, true);
			param.put("mstCds", param.get("mstCds").replaceAll("&apos;", "'"));

			List<Map> commonCodeList = cmm9100Service.selectCmm9100MultiCommonCodeList(param); 
			
			while (st.hasMoreElements()) {

				
				String mstCd = st.nextElement().toString();
				code = "";
				text = "";

				for (Map comboMap : commonCodeList) {
					if (mstCd.equals(comboMap.get("mstCd"))) {
						code += comboMap.get("subCd") + "|";
						text += comboMap.get("subCdNm") + "|";
						
					}
				}
				
				if (code.length() > 0) {
					code = code.substring(0, code.length() - 1);
					text = text.substring(0, text.length() - 1);
				}
				
				rtnMap.put("mstCd" + mstCd + "code", code);
				rtnMap.put("mstCd" + mstCd + "text", text);
				
			}

			rtnMap.put("commonCodeList", commonCodeList);
			rtnMap.put("ERROR_CODE", "1");
			rtnMap.put("ERROR_MSG", egovMessageSource.getMessage("cmm9100.success.cmmCom.select"));

			

		} catch (Exception ex) {
			ex.printStackTrace();
			rtnMap = new HashMap();
			rtnMap.put("ERROR_CODE", "-1");
			rtnMap.put("ERROR_MSG", egovMessageSource.getMessage("cmm9100.fail.cmmCom.select"));

		} finally {
			return new ModelAndView("jsonView", rtnMap);
		}
	}
}
