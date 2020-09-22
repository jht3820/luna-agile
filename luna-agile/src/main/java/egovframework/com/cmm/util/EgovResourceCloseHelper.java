package egovframework.com.cmm.util;

import java.io.Closeable;
import java.net.ServerSocket;
import java.net.Socket;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Wrapper;


public class EgovResourceCloseHelper {
	
	public static void close(Closeable  ... resources) {
		for (Closeable resource : resources) {
			if (resource != null) {
				try {
					resource.close();
				} catch (Exception ignore) {
					EgovBasicLogger.ignore("Occurred Exception to close resource is ingored!!");
				}
			}
		}
	}
	
	
	public static void closeDBObjects(Wrapper ... objects) {
		for (Object object : objects) {
			if (object != null) {
				if (object instanceof ResultSet) {
					try {
						((ResultSet)object).close();
					} catch (Exception ignore) {
						EgovBasicLogger.ignore("Occurred Exception to close resource is ingored!!");
					}
				} else if (object instanceof Statement) {
					try {
						((Statement)object).close();
					} catch (Exception ignore) {
						EgovBasicLogger.ignore("Occurred Exception to close resource is ingored!!");
					}
				} else if (object instanceof Connection) {
					try {
						((Connection)object).close();
					} catch (Exception ignore) {
						EgovBasicLogger.ignore("Occurred Exception to close resource is ingored!!");
					}
				} else {
					throw new IllegalArgumentException("Wrapper type is not found : " + object.toString());
				}
			}
		}
	}
	
	
	public static void closeSocketObjects(Socket socket, ServerSocket server) {
		if (socket != null) {
			try {
				socket.shutdownOutput();
			} catch (Exception ignore) {
				EgovBasicLogger.ignore("Occurred Exception to shutdown ouput is ignored!!");
			}
			
			try {
				socket.close();
			} catch (Exception ignore) {
				EgovBasicLogger.ignore("Occurred Exception to close resource is ignored!!");
			}
		}
		
		if (server != null) {
			try {
				server.close();
			} catch (Exception ignore) {
				EgovBasicLogger.ignore("Occurred Exception to close resource is ignored!!");
			}
		}
	}
	
	
	public static void closeSockets(Socket ... sockets) {
		for (Socket socket : sockets) {
			if (socket != null) {
				try {
					socket.shutdownOutput();
				} catch (Exception ignore) {
					EgovBasicLogger.ignore("Occurred Exception to shutdown ouput is ignored!!");
				}
				
				try {
					socket.close();
				} catch (Exception ignore) {
					EgovBasicLogger.ignore("Occurred Exception to close resource is ignored!!");
				}
			}
		}
	}
}