package egovframework.com.cmm.util;

import java.util.logging.Level;
import java.util.logging.Logger;


public class EgovBasicLogger {
	private static final Level IGNORE_INFO_LEVEL = Level.OFF;
	private static final Level DEBUG_INFO_LEVEL = Level.FINEST;
	private static final Level INFO_INFO_LEVEL = Level.INFO;
	
	private static final Logger ignoreLogger = Logger.getLogger("ignore");
	private static final Logger debugLogger = Logger.getLogger("debug");
	private static final Logger infoLogger = Logger.getLogger("info");
	
	
	public static void ignore(String message, Exception exception) {
		if (exception == null) {
			ignoreLogger.log(IGNORE_INFO_LEVEL, message);
		} else {
			ignoreLogger.log(IGNORE_INFO_LEVEL, message, exception);
		}
	}
	
	
	public static void ignore(String message) {
		ignore(message, null);
	}
	
	
	public static void debug(String message, Exception exception) {
		if (exception == null) {
			debugLogger.log(DEBUG_INFO_LEVEL, message);
		} else {
			debugLogger.log(DEBUG_INFO_LEVEL, message, exception);
		}
	}
	
	
	public static void debug(String message) {
		debug(message, null);
	}
	
	
	public static void info(String message) {
		infoLogger.log(INFO_INFO_LEVEL, message);
	}
}
