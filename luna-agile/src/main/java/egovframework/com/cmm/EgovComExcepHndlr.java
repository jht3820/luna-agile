package egovframework.com.cmm;

import egovframework.rte.fdl.cmmn.exception.handler.ExceptionHandler;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


public class EgovComExcepHndlr implements ExceptionHandler {

	private static final Logger LOGGER = LoggerFactory.getLogger(EgovComExcepHndlr.class);

    
    
    public void occur(Exception ex, String packageName) {
    	//log.debug(" EgovServiceExceptionHandler run...............");
    	
    	
		
    	LOGGER.error(packageName, ex);
	}
}
