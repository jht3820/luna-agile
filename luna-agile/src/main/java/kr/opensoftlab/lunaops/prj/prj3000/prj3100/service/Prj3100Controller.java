package kr.opensoftlab.lunaops.prj.prj3000.prj3100.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Prj3100Controller {

	private final Logger Log = Logger.getLogger(this.getClass());


	@RequestMapping(value="/prj/prj3000/prj3100/selectPrj3100View.do")
	public String selectPrj3100View(HttpServletRequest request, HttpServletResponse response, ModelMap model ) throws Exception {
			return "/prj/prj3000/prj3100/prj3100";
	}
}

