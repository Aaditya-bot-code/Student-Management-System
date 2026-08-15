package controller;

import jakarta.servlet.ServletException;




import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Student;
import java.util.ArrayList;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import dao.StudentDAO;

/**
 * Servlet implementation class StudentServlet
 */
@WebServlet("/StudentServlet")
public class StudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
           String action = request.getParameter("action");

		    if ("add".equals(action)) {
		        request.getRequestDispatcher("addStudent.jsp").forward(request, response);
		    }
		    else if("edit".equals(action))
		    {
		    	int id=Integer.parseInt(request.getParameter("id"));
		    	StudentDAO dao=new StudentDAO();
		    	Student student=dao.getStudentById(id);
		    	request.setAttribute("student",student);
		    	request.getRequestDispatcher("editStudent.jsp").forward(request, response);
		    }
		    else if("delete".equals(action))
		    {
		    	int id=Integer.parseInt(request.getParameter("id"));
		    	StudentDAO dao=new StudentDAO();
		    	boolean status=dao.deleteStudent(id);
		    	if(status)
		    	{
		    		HttpSession session=request.getSession();
		    		session.setAttribute("message", "Student Deleted Successfully !");
		    		response.sendRedirect(("ViewStudentsServlet?action=view"));
		    	}
		    	else
		    	{
		    		response.sendRedirect(("ViewStudentsServlet?action=view"));
			    	
		    	}
		    }
		    else if("search".equals(action))
		    {
		    	String search=request.getParameter("search");
		    	StudentDAO dao=new StudentDAO();
		    	ArrayList<Student> studentList=dao.searchStudents(search);
		    	request.setAttribute("studentList", studentList);
		    	request.getRequestDispatcher("viewStudents.jsp").forward(request, response);
			    
		    }
}
		
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    String action = request.getParameter("action");

		if("update".equals(action))
	    {
			//Update Student//
	    	int studentId=Integer.parseInt(request.getParameter("studentId"));
	    	String name=request.getParameter("name");
	    	if(!name.matches("[A-Za-z ]+")) 
    		{
    			response.sendRedirect("editStudent.jsp");
    			return;	
    		}
    		
	    	String email=request.getParameter("email");
	    	if(!email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$"))
	    	{
	    		response.sendRedirect("editStudent.jsp");
	    		return;
	    	}
	    	String phone=request.getParameter("phone");
	    	if(!phone.matches("\\d{10}")) 
	    	{
	    		response.sendRedirect("editStudent.jsp");
	    		return;
	    	}
	    	String department=request.getParameter("department");
	    	int semester=Integer.parseInt(request.getParameter("semester"));
	    	
	    	Student student=new Student();
	    	
	    	student.setStudentId(studentId);
	    	student.setName(name);
	    	student.setEmail(email);
	    	student.setPhone(phone);
	    	student.setDepartment(department);
	    	student.setSemester(semester);
	    	
	    	StudentDAO dao=new StudentDAO();
	    	
	    	boolean status=dao.updateStudent(student);
	    	if(status)
	    	{
	    		HttpSession session=request.getSession();
	    		session.setAttribute("message","Student Updated Successfully !" );
	    		response.sendRedirect("ViewStudentsServlet?action=view");
	    	}
	    	else
	    	{
	    		response.sendRedirect("editStudent.jsp");
	    	}
	    }
		else if("delete".equals(action))
		{
			//Delete student//
			
		}
	    	else
	    	{
	    		//Add Student//
	    		String name=request.getParameter("name");
	    		if(!name.matches("[A-Za-z ]+")) 
	    		{
	    			response.sendRedirect("addStudent.jsp");
	    			return;	
	    		}
	    		String email=request.getParameter("email");
	    		if(!email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$"))
		    	{
		    		response.sendRedirect("addStudent.jsp");
		    		return;
		    	}
	    		String phone=request.getParameter("phone");
	    		if(!phone.matches("\\d{10}")) 
	    		{
		    		response.sendRedirect("addStudent.jsp");
		    		return;
		    	}
	    		String department=request.getParameter("department");
	    		int semester=Integer.parseInt(request.getParameter("semester"));
	    		Student student =new Student();
	    		student.setName(name);
	    		student.setEmail(email);
	    		student.setPhone(phone);
	    		student.setDepartment(department);
	    		student.setSemester(semester);
	    		StudentDAO dao = new StudentDAO();

	    		boolean status = dao.addStudent(student);

	    		if (status) {
	    			HttpSession session=request.getSession();
	    			session.setAttribute("message","Student Added Successfully !");
	    			response.sendRedirect("ViewStudentsServlet?action=view");
	    		} else {
	    		    response.sendRedirect("addStudent.jsp");
	    		}

	    	}
	    }
}
	    

