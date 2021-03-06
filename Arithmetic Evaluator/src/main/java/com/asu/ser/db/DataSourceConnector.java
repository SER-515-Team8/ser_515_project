package com.asu.ser.db;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.Properties;

/**
 * @author akhilesh
 * @author Ashwin
 * @author Srinivasan
 */

public class DataSourceConnector {

	private static String DB_PROPERTY_FILE = "database.properties";
	private static String KEY_DRIVER_CLASS_NAME = "datasource.driver.class.name";
	private static String KEY_URL = "datasource.url";
	private static String KEY_DB_NAME = "datasource.database.name";
	private static String KEY_USERNAME = "datasource.username";
	private static String KEY_PASSWORD = "datasource.password";
	
	private static Connection con = null;

	/**
	 * Function reads configurations from database.properties and creates a connection to a database.
	 * This is a singleton class and has only 1 object of Connection
	 * @throws Exception
	 */
	public static void createConnection() throws Exception {
		if(con != null) {
			con.close();
		}
		
		//File propertyFile = Util.getFileFromResources(DB_PROPERTY_FILE);
		
		//Uncomment below  two lines to test using java directly.
		String currentDirectory = System.getProperty("user.dir");
		File propertyFile = new File(currentDirectory + "/src/main/resources/" + DB_PROPERTY_FILE);

		try (InputStream input = new FileInputStream(propertyFile)) {
			Properties prop = new Properties();
			prop.load(input);
			String driverClassName = (String) prop.get(KEY_DRIVER_CLASS_NAME);
			String url = (String) prop.get(KEY_URL);
			String dbName = (String) prop.get(KEY_DB_NAME);
			String username = (String) prop.get(KEY_USERNAME);
			String password = (String) prop.get(KEY_PASSWORD);
			url = url + "/" + dbName+"?autoReconnect=true";
			Class.forName(driverClassName);
			con = DriverManager.getConnection(url, username, password);
		}

	}

	/**
	 * Function to get database connection
	 * @return
	 * @throws Exception
	 */
	public static Connection getConnection() throws Exception {
		if(con == null) {
			createConnection();
		}
		return con;
	}
}
