package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import connection.commonConnection;
import pojo.patients;

public class patientdao {
	public void save(patients patient) {
		Connection con = commonConnection.getConnection();
		PreparedStatement stmt;
		try {
			stmt = con.prepareStatement("insert into patient values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);");
			stmt.setString(1, patient.getUsername());
			stmt.setString(2, patient.getName());
			stmt.setString(3, patient.getEmail());
			stmt.setLong(4, patient.getPhone());
			stmt.setString(5, patient.getAddress());
			stmt.setString(6, patient.getCity());
			stmt.setString(7, patient.getFatherName());
			stmt.setString(8, patient.getBloodGroup());
			stmt.setString(9, patient.getGender());
			stmt.setInt(10, patient.getAge());
			stmt.setString(11, patient.getDob());
			stmt.setString(12, patient.getDisease());
			stmt.setString(13, null);
			stmt.setString(14, null);
			stmt.setString(15, null);
			int i = stmt.executeUpdate();
			System.out.println(i+" no. of rows inserted.");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
}
