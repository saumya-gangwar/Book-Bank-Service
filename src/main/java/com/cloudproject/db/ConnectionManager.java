package com.cloudproject.db;

import java.sql.Connection;
import java.sql.DriverManager;

import com.cloudproject.constants.Configuration;

public class ConnectionManager {
	
	public  static final String CREDENTIALS_STRING = "jdbc:mysql://google/"+Configuration.getDatabaseName()+"?cloudSqlInstance="+Configuration.getInstanceConnectionName()+"&socketFactory=com.google.cloud.sql.mysql.SocketFactory&user="+Configuration.getMySQLUserName()+"&password="+Configuration.getMySQLUserPassword();
	static Connection connection = null;
	
	public static Connection getConnection() {
		try {
			Class.forName(Configuration.getDriverName());
			connection = DriverManager.getConnection(CREDENTIALS_STRING);
		} catch(Exception e) {
			e.printStackTrace();
		}
		return connection;
	}	
}
