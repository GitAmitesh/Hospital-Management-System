package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import connection.commonConnection;
import pojo.appointments;

public class appointmentdao {
	public void save(appointments appointment) {
		Connection con = commonConnection.getConnection();
		PreparedStatement stmt;
		try {
			stmt = con.prepareStatement("insert into appointments (puname,duname,appointmentdate,appointmenttime,appointmentstatus) values(?,?,?,?,?);");
			stmt.setString(1, appointment.getPuname());
			stmt.setString(2, appointment.getDuname());
			stmt.setString(3, appointment.getDate());
			stmt.setString(4, appointment.getTime());
			stmt.setString(5, appointment.getStatus());
			int i = stmt.executeUpdate();
			System.out.println(i+" no. of rows inserted.");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
}
