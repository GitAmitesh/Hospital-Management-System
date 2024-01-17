package helper;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import connection.commonConnection;
public class usernameCheck {
	static public boolean check(String username) {
		try {
			Connection con=commonConnection.getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select username from users;");
			while(rs.next()){
				if(rs.getString(1).equals(username)) {
					 return true;
				}
				else {
					continue;
				}
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
