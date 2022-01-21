package com.cloudproject.db;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.cloudproject.beans.UserBean;


public class RegistrationDb {
	static Connection connection = null;	
	public static boolean regiser(UserBean user) {
		try {
			connection = ConnectionManager.getConnection();
			String sql = "INSERT INTO user_details (user_id, user_name, user_password)\n" + 
					"VALUES (?,?,?);";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, user.getUserId());
			preparedStatement.setString(2, user.getUsername());
			preparedStatement.setString(3, user.getPassword());
			int i = preparedStatement.executeUpdate();
			return i>0;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
