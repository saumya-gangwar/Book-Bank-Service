package com.cloudproject.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.cloudproject.beans.UserBean;

public class LoginValidateDb {

	static Connection connection = null;	
	public static boolean validate(UserBean user) {
		try {
			connection = ConnectionManager.getConnection();
			String sql = "select * from user_details where user_id = ? and user_password = ?";
			PreparedStatement preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, user.getUserId());
			preparedStatement.setString(2, user.getPassword());
			ResultSet res = preparedStatement.executeQuery();
			return res.next();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
	
}
