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
<script src="https://kit.fontawesome.com/946df3c2e5.js" crossorigin="anonymous"></script>
</head>
<body>
<div class="home-box">

<h1>Welcome to Student Management System</h1>
<h2>Welcome <%= session.getAttribute("admin") %></h2>
<div class="student-count">
    <h3>
        <i class="fa-solid fa-users"></i>
        Total Students
    </h3>

    <p><%= request.getAttribute("studentCount") %></p>
</div>

<div class="department-count">
    <h3>
        <i class="fa-solid fa-building-columns"></i>
        Total Departments
    </h3>

    <p><%= request.getAttribute("departmentCount") %></p>
</div>

<a class="home-btn" href="StudentServlet?action=add">
    <i class="fa-solid fa-user-plus"></i>
    Add Student
</a>

<a class="home-btn" href="ViewStudentsServlet?action=view">
    <i class="fa-solid fa-users"></i>
    View Students
</a>

<a class="home-btn" href="AttendanceServlet">
    <i class="fa-solid fa-calendar-check"></i>
    Mark Attendance
</a>

<a class="home-btn" href="AttendanceServlet?action=view">
    <i class="fa-solid fa-calendar-days"></i>
    View Attendance
</a>

<a class="home-btn" href="addMarks.jsp">
    <i class="fa-solid fa-file-circle-plus"></i>
    Add Marks
</a>

<a class="home-btn" href="MarksServlet?action=view">
    <i class="fa-solid fa-file-lines"></i>
    View Marks
</a>

<a class="logout-btn" href="LogoutServlet">
    <i class="fa-solid fa-right-from-bracket"></i>
    Logout
</a></div>

</body>
</html>