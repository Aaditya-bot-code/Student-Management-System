<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.Student" %>
<%if(session.getAttribute("admin")==null)
	{
		response.sendRedirect("Login.jsp");
		return;
	}
	%>

<%
Student student = (Student) request.getAttribute("student");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Student</title>
<link rel="stylesheet" href="editStudent.css">
</head>
<body>
<div class="edit-box">
<h1>Edit Student</h1>
<form action="StudentServlet?action=update" method="post">
<input type="hidden" name="studentId" value="<%= student.getStudentId() %>">
<label>Name</label>
<input type="text" name="name" value="<%= student.getName() %>"required>
<label>Email</label>
<input type="email" name="email" value="<%= student.getEmail() %>">
<label>Phone</label>
<input type="tel" name="phone" value="<%= student.getPhone() %>">
<label>Department</label>
<input type="text" name="department" value="<%= student.getDepartment() %>">
<label>Semester</label>
<input type="number" name="semester" value="<%= student.getSemester() %>">
<button type="submit">Update Student</button>
</form>
</div>
</body>
</html>