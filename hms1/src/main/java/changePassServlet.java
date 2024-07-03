

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import connection.commonConnection;

/**
 * Servlet implementation class changePassServlet
 */
@WebServlet("/changePassServlet")
public class changePassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con=commonConnection.getConnection();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public changePassServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		try {
			Statement stmt = con.createStatement();
			String uname=request.getParameter("username");
			String oldpass=request.getParameter("oldPassword");
			String newpass = request.getParameter("newPassword");
			if(oldpass.equals(newpass)) {
				response.sendRedirect("changePassword.jsp?error=Old password and new password cannot be same.");
				return;
			}
			String query="select * from users where username='"+uname+"';";
			ResultSet rs= stmt.executeQuery(query);
			if(rs.next()) {
				String oldPassword = rs.getString(2);
				if(!oldPassword.equals(oldpass)) {
					response.sendRedirect("changePassword.jsp?error=Wrong old password.");
					return;
				}
				int i = stmt.executeUpdate("update users set password = '"+newpass+"' where username = '"+uname+"';");
				response.sendRedirect("login.jsp");
			}
			else {
				response.sendRedirect("changePassword.jsp?error=Wrong username.");
				return;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
