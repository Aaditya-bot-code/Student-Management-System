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
<script src="https://kit.fontawesome.com/946df3c2e5.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="editStudent.css">
</head>
<body>

<div class="form-wrapper">

    <h1><i class="fa-solid fa-user-pen"></i> Edit Student</h1>
    <p class="subtitle">Update Student Details</p>

    <form action="StudentServlet?action=update" method="post">
        <input type="hidden" name="studentId" value="<%= student.getStudentId() %>">

        <label><i class="fa-solid fa-user"></i> Name</label>
        <input type="text" name="name" value="<%= student.getName() %>" required>

        <label><i class="fa-solid fa-envelope"></i> Email</label>
        <input type="email" name="email" value="<%= student.getEmail() %>">

        <label><i class="fa-solid fa-phone"></i> Phone</label>
        <input type="tel" name="phone" value="<%= student.getPhone() %>">

        <label><i class="fa-solid fa-building"></i> Department</label>
        <input type="text" name="department" value="<%= student.getDepartment() %>">

        <label><i class="fa-solid fa-graduation-cap"></i> Semester</label>
        <input type="number" name="semester" value="<%= student.getSemester() %>">

        <button type="submit"><i class="fa-solid fa-floppy-disk"></i> Update Student</button>
    </form>

    <div class="back-home">
        <a href="HomeServlet"><i class="fa-solid fa-house"></i> Back to Home</a>
    </div>

</div>

</body>
</html>