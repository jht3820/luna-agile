package egovframework.com.cmm.web;



import java.lang.reflect.Method;
import java.util.Map;
import java.util.TreeMap;

import egovframework.com.cmm.IncludedCompInfoVO;
import egovframework.com.cmm.LoginVO;
import egovframework.com.cmm.annotation.IncludedInfo;
import egovframework.com.cmm.util.EgovUserDetailsHelper;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.BeansException;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class EgovComIndexController implements ApplicationContextAware, InitializingBean {

	private ApplicationContext applicationContext;

	private static final Logger LOGGER = LoggerFactory.getLogger(EgovComIndexController.class);

	private Map<Integer, IncludedCompInfoVO> map;

	public void afterPropertiesSet() throws Exception {}

	public void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
		this.applicationContext = applicationContext;
		
		LOGGER.info("EgovComIndexController setApplicationContext method has called!");
	}

	@RequestMapping("/index.do")
	public String index(ModelMap model) {
		return "/index";
	}

	@RequestMapping("/EgovTop.do")
	public String top() {
		return "egovframework/com/cmm/EgovUnitTop";
	}

	@RequestMapping("/EgovBottom.do")
	public String bottom() {
		return "egovframework/com/cmm/EgovUnitBottom";
	}

	@RequestMapping("/EgovContent.do")
	public String setContent(ModelMap model) {

		LoginVO loginVO = (LoginVO) EgovUserDetailsHelper.getAuthenticatedUser();
		model.addAttribute("loginVO", loginVO);

		return "egovframework/com/cmm/EgovUnitContent";
	}

	@RequestMapping("/EgovLeft.do")
	public String setLeftMenu(ModelMap model) {

		
		if (map == null) {
			map = new TreeMap<Integer, IncludedCompInfoVO>();
			RequestMapping rmAnnotation;
			IncludedInfo annotation;
			IncludedCompInfoVO zooVO;

			
			try {
				Class<?> loginController = Class.forName("egovframework.com.uat.uia.web.EgovLoginController");
				Method[] methods = loginController.getMethods();
				for (int i = 0; i < methods.length; i++) {
					annotation = methods[i].getAnnotation(IncludedInfo.class);

					if (annotation != null) {
						LOGGER.debug("Found @IncludedInfo Method : {}", methods[i]);
						zooVO = new IncludedCompInfoVO();
						zooVO.setName(annotation.name());
						zooVO.setOrder(annotation.order());
						zooVO.setGid(annotation.gid());

						rmAnnotation = methods[i].getAnnotation(RequestMapping.class);
						if ("".equals(annotation.listUrl()) && rmAnnotation != null) {
							zooVO.setListUrl(rmAnnotation.value()[0]);
						} else {
							zooVO.setListUrl(annotation.listUrl());
						}
						map.put(zooVO.getOrder(), zooVO);
					}
				}
			} catch (ClassNotFoundException e) {
				LOGGER.error("No egovframework.com.uat.uia.web.EgovLoginController!!");
			}
			

			
			Map<String, Object> myZoos = applicationContext.getBeansWithAnnotation(Controller.class);
			LOGGER.debug("How many Controllers : ", myZoos.size());
			for (final Object myZoo : myZoos.values()) {
				Class<? extends Object> zooClass = myZoo.getClass();

				Method[] methods = zooClass.getMethods();
				LOGGER.debug("Controller Detected {}", zooClass);
				for (int i = 0; i < methods.length; i++) {
					annotation = methods[i].getAnnotation(IncludedInfo.class);

					if (annotation != null) {
						//LOG.debug("Found @IncludedInfo Method : " + methods[i] );
						zooVO = new IncludedCompInfoVO();
						zooVO.setName(annotation.name());
						zooVO.setOrder(annotation.order());
						zooVO.setGid(annotation.gid());
						
						rmAnnotation = methods[i].getAnnotation(RequestMapping.class);
						if ("".equals(annotation.listUrl())) {
							zooVO.setListUrl(rmAnnotation.value()[0]);
						} else {
							zooVO.setListUrl(annotation.listUrl());
						}

						map.put(zooVO.getOrder(), zooVO);
					}
				}
			}
		}

		model.addAttribute("resultList", map.values());
		
		LOGGER.debug("EgovComIndexController index is called ");

		return "egovframework/com/cmm/EgovUnitLeft";
	}
}
