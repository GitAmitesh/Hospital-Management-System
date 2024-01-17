package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import connection.commonConnection;
import pojo.receptionists;

public class receptionistdao {
	public void save(receptionists receptionist) {
		Connection con = commonConnection.getConnection();
		PreparedStatement stmt;
		try {
			stmt = con.prepareStatement("insert into receptionist values(?,?,?,?,?,?,?,?,?,?,?,?);");
			stmt.setString(1, receptionist.getUsername());
			stmt.setString(2, receptionist.getName());
			stmt.setString(3, receptionist.getEmail());
			stmt.setLong(4, receptionist.getPhone());
			stmt.setString(5, receptionist.getFatherName());
			stmt.setString(6, receptionist.getCity());
			stmt.setString(7, receptionist.getAddress());
			stmt.setString(8, receptionist.getBloodGroup());
			stmt.setString(9, receptionist.getGender());
			stmt.setInt(10, receptionist.getAge());
			stmt.setString(11, receptionist.getDob());
			stmt.setString(12, receptionist.getQualification());
			
			int i = stmt.executeUpdate();
			System.out.println(i+" no. of rows inserted.");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
}
