

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.appointmentdao;
import pojo.appointments;

/**
 * Servlet implementation class addAppointment
 */
@WebServlet("/addAppointment")
public class addAppointment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addAppointment() {
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
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String puname = request.getParameter("puname");
		String duname = request.getParameter("doctor");
		String date = request.getParameter("date");
		String time = request.getParameter("time");
		String status = request.getParameter("status");
		
		appointments appointment = new appointments(puname,duname,date,time,status);
		appointmentdao save = new appointmentdao();
		save.save(appointment);
		System.out.println("Successfully saved appointment");
		response.sendRedirect("index.html");
	}

}
