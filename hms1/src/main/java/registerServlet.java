

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import pojo.*;
import dao.*;
/**
 * Servlet implementation class registerServlet
 */
@WebServlet("/registerServlet")
public class registerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registerServlet() {
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
		//doGet(request, response);
		int k=0;

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String userType = request.getParameter("userType");
		String name=request.getParameter("name");
		String username=request.getParameter("username");
		String email=request.getParameter("email");
		long phone=Long.parseLong(request.getParameter("phone"));
		String address=request.getParameter("address");
		String dob=request.getParameter("dob");
		String gender=request.getParameter("gender");
		String bloodGroup=request.getParameter("bloodGroup");
		
		if(userType.equals("doctor")) {
			String specialisation=request.getParameter("specialisation");
			
			doctors doctor = new doctors(name, username, email, phone, address, dob, gender, bloodGroup, specialisation);
			
			doctordao save = new doctordao();
			save.save(doctor);
			System.out.println("Successfully saved doctor "+username);
			k=1;
		}
		else if(userType.equals("patient")) {
			String fatherName=request.getParameter("fatherName");
			String city=request.getParameter("city");
			int age=Integer.parseInt(request.getParameter("age"));
			String disease=request.getParameter("disease");
			
			patients patient = new patients(name, username, email, phone, fatherName, city, address, dob, age, gender, bloodGroup, disease);
			
			patientdao save = new patientdao();
			save.save(patient);
			System.out.println("Successfully saved patient "+username);
			k=1;
			
		}
		else if(userType.equals("receptionist")) {
			String fatherName=request.getParameter("fatherName");
			String city=request.getParameter("city");
			int age=Integer.parseInt(request.getParameter("age"));
			String qualification=request.getParameter("qualification");
			
			receptionists receptionist = new receptionists(name, username, email, phone, fatherName, city, address, dob, age, gender, bloodGroup, qualification);
			
			receptionistdao save = new receptionistdao();
			save.save(receptionist);
			System.out.println("Successfully saved receptionist "+username);
			k=1;
		}
		else {
			out.println("User Type could not be resolved....");
		}
		
		if(k==1) {
		String pass = request.getParameter("password");
		users user = new users(username,pass,userType);
		userdao saveUser = new userdao();
		saveUser.save(user);
		System.out.println("Successfully saved user\n");
		}
		
		if(userType.equals("doctor") || userType.equals("receptionist")) {
			response.sendRedirect("dashboardAdmin.jsp");
		}else {
			response.sendRedirect("dashboardPatient.jsp");
		}
		
	}

}
