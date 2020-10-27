package egovframework.com.cmm.taglibs;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import egovframework.com.cmm.util.EgovDoubleSubmitHelper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspTagException;
import javax.servlet.jsp.tagext.TagSupport;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class DoubleSubmitTag extends TagSupport {
	private static final Logger LOGGER = LoggerFactory.getLogger(DoubleSubmitTag.class);

	
	private static final long serialVersionUID = 5242217605452312594L;
	
	private String tokenKey = EgovDoubleSubmitHelper.DEFAULT_TOKEN_KEY;

	public String getTokenKey() {
		return tokenKey;
	}

	public void setTokenKey(String tokenKey) {
		this.tokenKey = tokenKey;
	}

	@SuppressWarnings("unchecked")
	public int doStartTag()	throws JspException {
		StringBuilder buffer = new StringBuilder();
		
		HttpServletRequest request = (HttpServletRequest)pageContext.getRequest();
		HttpSession session = request.getSession();
		
		Map<String, String> map = null;
		
		if (session.getAttribute(EgovDoubleSubmitHelper.SESSION_TOKEN_KEY) == null) {
			map = new HashMap<String, String>();
			
			session.setAttribute(EgovDoubleSubmitHelper.SESSION_TOKEN_KEY, map);
		} else {
			map = (Map<String, String>) session.getAttribute(EgovDoubleSubmitHelper.SESSION_TOKEN_KEY);
		}
				
		// First call (check session)
		if (map.get(tokenKey) == null) {
			
			map.put(tokenKey, EgovDoubleSubmitHelper.getNewUUID());

			LOGGER.debug("[Double Submit] session token created({}) : {}", tokenKey, map.get(tokenKey)); 
		}
		
		buffer.append("<input type='hidden' name='").append(EgovDoubleSubmitHelper.PARAMETER_NAME).append("' value='").append(map.get(tokenKey)).append("'/>");
		
		try {
			pageContext.getOut().print(buffer.toString());
		} catch (IOException e) {
			throw new JspTagException("Error:  IOException while writing to the user");
		}
		
        return SKIP_BODY;
	}
	
}
