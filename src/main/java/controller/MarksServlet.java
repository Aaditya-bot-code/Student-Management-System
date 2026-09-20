package controller;

import java.io.IOException;


import dao.MarksDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;

import model.Marks;

@WebServlet("/MarksServlet")
public class MarksServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("add".equals(action)) {

            int studentId =
                    Integer.parseInt(request.getParameter("studentId"));

            String subject =
                    request.getParameter("subject");

            int marks =
                    Integer.parseInt(request.getParameter("marks"));

            Marks mark = new Marks();

            mark.setStudentId(studentId);
            mark.setSubject(subject);
            mark.setMarks(marks);

            MarksDAO dao = new MarksDAO();

            boolean result = dao.addMarks(mark);

            if (result) {
                response.sendRedirect("MarksServlet?action=view");
            } else {
                response.sendRedirect("addMarks.jsp");
            }
        }
        else if("update".equals(action))
        {
        	Marks mark=new Marks();
        	int marksId=Integer.parseInt(request.getParameter("marksId"));
        	int studentId=Integer.parseInt(request.getParameter("studentId"));
        	int marks=Integer.parseInt(request.getParameter("marks"));
        	String subject=request.getParameter("subject");
        	mark.setStudentId(studentId);
        	mark.setMarksId(marksId);
        	mark.setSubject(subject);
        	mark.setMarks(marks);
        	MarksDAO dao=new MarksDAO();
        	boolean result=dao.updateMarks(mark);
        	if(result)
        	{
        		response.sendRedirect("MarksServlet?action=view");
        	}
        	else {
        		response.sendRedirect("MarksServlet?action=edit&id="+marksId);
        	}

        	

        }
               	
        	
        }


protected void doGet(HttpServletRequest request,
        HttpServletResponse response)
        throws ServletException, IOException {

    String action = request.getParameter("action");

    MarksDAO dao = new MarksDAO();

    if ("view".equals(action)) {

        ArrayList<Marks> marksList =
                dao.getAllMarks();

        request.setAttribute("marksList", marksList);

        request.getRequestDispatcher("viewMarks.jsp")
               .forward(request, response);
    }
    else if("edit".equals(action))
    {
    	int marksId=Integer.parseInt(request.getParameter("id"));
    	Marks mark=dao.getMarksById(marksId);
    	request.setAttribute("mark", mark);
    	request.getRequestDispatcher("editMarks.jsp").forward(request, response);
    	System.out.println(marksId);
    	System.out.println(mark);
    }
    else if ("delete".equals(action)) {

        int marksId = Integer.parseInt(request.getParameter("marksId"));

         dao.deleteMarks(marksId);

        response.sendRedirect("MarksServlet?action=view");
    }
}
}
