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
<title>Add Student</title>
<link rel="stylesheet" href="addStudent.css">
</head>
<body>
<div class="addstudent-box">
<h1>Add Student</h1>
<h2>Enter Details</h2>
<form action="StudentServlet" method="post">
<label for="name">Name</label>
<input name="name"pattern="[A-Za-z ]+" placeholder="Enter Student name" required>
<label for="email">Email</label>
<input  type="email" name="email" placeholder="Enter Student Email" required>
<label for="phone">Phone</label>
<input type="tel" name="phone" pattern="[0-9]{10}" maxlength="10" placeholder="Enter Student Phone no." required>
<label for="department">Department</label>
<input name="department" placeholder="Enter Department" required>
<label for="semester">Semester</label>
<input  type="number" name="semester" min="1" max="8"placeholder="Enter Semester" required>
<button type="submit">Add</button>
</form>
</div>

</body>
</html>