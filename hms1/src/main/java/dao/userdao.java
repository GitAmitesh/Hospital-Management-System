package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import connection.commonConnection;
import pojo.users;

public class userdao {
	public void save(users user) {
		Connection con = commonConnection.getConnection();
		PreparedStatement stmt;
		try {
			stmt = con.prepareStatement("insert into users values(?,?,?);");
			stmt.setString(1, user.getUsername());
			stmt.setString(2, user.getPassword());
			stmt.setString(3, user.getUserType());
			
			int i = stmt.executeUpdate();
			System.out.println(i+" no. of rows inserted.");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
}
