

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import connection.commonConnection;

/**
 * Servlet implementation class checkAvailability
 */
@WebServlet("/checkAvailability")
public class checkAvailability extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con=commonConnection.getConnection();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public checkAvailability() {
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
			String uname=request.getParameter("puname");
//			System.out.println("outside check");
			if(uname!=null) {
//				System.out.println("inside check");
				HttpSession session = request.getSession();
				session.setAttribute("puname", uname);
				String query="select name from doctor where specialization = (select disease from patient where username='"+uname+"');";
				ResultSet rs= stmt.executeQuery(query);
				List<String> names = new ArrayList<>();
				while(rs.next()) {
					names.add(rs.getString(1));
				}
//				String usertype=rs1.getString(1);
				session.setAttribute("names", names);
				response.sendRedirect("addAppointment.jsp?check=true");
			}else {
				response.sendRedirect("addAppointment.jsp?check=true");
			}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
	}

}
