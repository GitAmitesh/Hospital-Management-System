package dao;
import pojo.doctors;
import connection.commonConnection;
import java.sql.*;
public class doctordao {
	public void save(doctors doctor) {
		Connection con = commonConnection.getConnection();
		PreparedStatement stmt;
		try {
			stmt = con.prepareStatement("insert into doctor values(?,?,?,?,?,?,?,?,?);");
			stmt.setString(1, doctor.getUsername());
			stmt.setString(2, doctor.getName());
			stmt.setString(3, doctor.getEmail());
			stmt.setLong(4, doctor.getPhone());
			stmt.setString(5, doctor.getAddress());
			stmt.setString(6, doctor.getDob());
			stmt.setString(7, doctor.getGender());
			stmt.setString(8, doctor.getBloodGroup());
			stmt.setString(9, doctor.getSpecialisation());
			
			int i = stmt.executeUpdate();
			System.out.println(i+" no. of rows inserted.");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
}
