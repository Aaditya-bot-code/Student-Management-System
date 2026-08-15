package controller;

import jakarta.servlet.ServletException;

import dao.AttendanceDAO;
import model.Attendance;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import dao.StudentDAO;
 import model.Student;


/**
 * Servlet implementation class AttendanceServlet
 */
@WebServlet("/AttendanceServlet")
public class AttendanceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AttendanceServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action=request.getParameter("action");
	    AttendanceDAO attendanceDAO=new AttendanceDAO();
		if("view".equals(action))
		{
			ArrayList<Attendance> attendanceList=attendanceDAO.getAllAttendance();
			request.setAttribute("attendanceList",attendanceList);
			request.getRequestDispatcher("viewAttendance.jsp").forward(request, response);
			
		}
		else if("delete".equals(action))
		{
			int attendanceId=Integer.parseInt(request.getParameter("id"));
			System.out.println(attendanceId);
			boolean result=attendanceDAO.deleteAttendance(attendanceId);
			System.out.println(result);
			response.sendRedirect("AttendanceServlet?action=view");
		}
		else if("edit".equals(action))
		{
			int attendanceId=Integer.parseInt(request.getParameter("id"));
			Attendance attendance=attendanceDAO.getAttendanceById(attendanceId);
			request.setAttribute("attendance", attendance);
			StudentDAO studentDAO=new StudentDAO();
			ArrayList<Student> studentList=studentDAO.getAllStudents();
			request.setAttribute("studentList", studentList);
			request.getRequestDispatcher("editAttendance.jsp").forward(request, response);
		}
		else
		{
		StudentDAO dao=new StudentDAO();
		ArrayList<Student> studentList=dao.getAllStudents();
		request.setAttribute("studentList", studentList);
		request.getRequestDispatcher("attendance.jsp").forward(request, response);
		}
		response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action=request.getParameter("action");
		AttendanceDAO attendanceDAO =new AttendanceDAO();
		if("update".equals(action))
		{
			int attendanceId=Integer.parseInt(request.getParameter("attendanceId"));
			int studentId=Integer.parseInt(request.getParameter("studentId"));
			String date=request.getParameter("date");
			String status=request.getParameter("status");
			Attendance attendance=new Attendance();
			attendance.setAttendanceId(attendanceId);
			attendance.setStudentId(studentId);
			attendance.setDate(date);
			attendance.setStatus(status);
			boolean result=attendanceDAO.updateAttendance(attendance);
			if(result)
			{
				response.sendRedirect("AttendanceServlet?action=view");
			}
			else
			{
				response.sendRedirect("AttendanceServlet?action=view");
				
			}
		}
		else
		{
		int studentId=Integer.parseInt(request.getParameter("studentId"));
		String date=request.getParameter("date");
		String status=request.getParameter("status");
		Attendance attendance=new Attendance();
		attendance.setStudentId(studentId);
		attendance.setDate(date);
		attendance.setStatus(status);
		AttendanceDAO dao=new AttendanceDAO();
		boolean result=dao.addAttendance(attendance);
		if(result)
		{
			response.sendRedirect("attendance.jsp");
		}
		else
		{
			response.sendRedirect("attendance.jsp");
		}
		}
	}

}
