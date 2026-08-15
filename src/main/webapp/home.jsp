<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%if(session.getAttribute("admin")==null) 
    {
    	response.sendRedirect("Login.jsp");
    	return;
    }
    %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link rel="stylesheet" href="home.css">
</head>
<body>
<div class="home-box">

<h1>Welcome to Student Management System</h1>
<h2>Welcome, <%= session.getAttribute("admin") %></h2>
<div class="student-count">
    <h3>Total Students</h3>
    <p><%= request.getAttribute("studentCount") %></p>
</div>
<div class="department-count">
    <h3>Total Departments</h3>
    <p><%= request.getAttribute("departmentCount") %></p>
</div>

<a  class="home-btn" href="StudentServlet?action=add">Add Student</a>

<a  class="home-btn" href="ViewStudentsServlet?action=view">View Students</a>

<a class="home-btn" href="AttendanceServlet">Mark Attendance</a>

<a class="home-btn" href="AttendanceServlet?action=view">View Attendance</a>

<a  class="logout-btn" href="LogoutServlet">Logout</a>
</div>

</body>
</html>