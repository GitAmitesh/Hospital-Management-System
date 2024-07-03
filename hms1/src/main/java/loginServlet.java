

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
 * Servlet implementation class loginServlet
 */
@WebServlet("/loginServlet")
public class loginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con=commonConnection.getConnection();
	private String validate(String uname,String pass) {
		try {
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select username,password from users where username='"+uname+"' and password='"+pass+"';");

			if(rs.next()==true) {
//				System.out.println(rs);
				return rs.getString(1);
			}
		
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
 
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginServlet() {
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
		String pass=request.getParameter("password");
		String username = validate(uname,pass);
//		System.out.println("is"+username);
		if(username!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("username", username);
			String query="select usertype from users where username='"+username+"'";
			ResultSet rs1= stmt.executeQuery(query);
			rs1.next();
			String usertype=rs1.getString(1);
			session.setAttribute("usertype", usertype);
			if(usertype.equals("doctor")) {
				response.sendRedirect("dashboardDoctor.jsp");
			}else if(usertype.equals("patient")){
				response.sendRedirect("dashboardPatient.jsp");
			}else if(usertype.equals("receptionist")) {
				response.sendRedirect("dashboardReceptionist.jsp");
			}else if(usertype.equals("admin")) {
				session.setAttribute("name", "admin");
				response.sendRedirect("dashboardAdmin.jsp");
			}else {
				response.sendRedirect("index.html");
			}
		}else {
			response.sendRedirect("login.jsp?error=true");
		}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}

}
