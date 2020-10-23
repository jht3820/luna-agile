package egovframework.com.cmm.service;



public class Globals {
	
    public static final String OS_TYPE = EgovProperties.getProperty("Globals.OsType");
    
    public static final String DB_TYPE = EgovProperties.getProperty("Globals.DbType");
    
    public static final String MAIN_PAGE = EgovProperties.getProperty("Globals.MainPage");
    
    public static final String SHELL_FILE_PATH = EgovProperties.getPathProperty("Globals.ShellFilePath");
    
    public static final String CONF_PATH = EgovProperties.getPathProperty("Globals.ConfPath");
    
    public static final String SERVER_CONF_PATH = EgovProperties.getPathProperty("Globals.ServerConfPath");
    
    public static final String CLIENT_CONF_PATH = EgovProperties.getPathProperty("Globals.ClientConfPath");
    
    public static final String FILE_FORMAT_PATH = EgovProperties.getPathProperty("Globals.FileFormatPath");

    
	public static final String ORIGIN_FILE_NM = "originalFileName";
	
	public static final String FILE_EXT = "fileExtension";
	
	public static final String FILE_SIZE = "fileSize";
	
	public static final String UPLOAD_FILE_NM = "uploadFileName";
	
	public static final String FILE_PATH = "filePath";

	
	public static final String MAIL_REQUEST_PATH = EgovProperties.getPathProperty("Globals.MailRequestPath");
	
	public static final String MAIL_RESPONSE_PATH = EgovProperties.getPathProperty("Globals.MailRResponsePath");

	
	public static final String LOCAL_IP = EgovProperties.getProperty("Globals.LocalIp");



}
