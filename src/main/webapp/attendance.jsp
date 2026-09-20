<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Student" %>
<%
if(session.getAttribute("admin")==null)
{
	response.sendRedirect("Login.jsp");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mark Attendance</title>
<link rel="stylesheet" href="attendance.css">
<script src="https://kit.fontawesome.com/946df3c2e5.js" crossorigin="anonymous"></script>
</head>
<body>
<div class="attendance-box">
<form action="AttendanceServlet" method="post">
<label for="studentId">Select Student</label>

<select name="studentId" required>

    <option value="">Select Student</option>

    <%
    ArrayList<Student> studentList =
        (ArrayList<Student>) request.getAttribute("studentList");

    if (studentList != null) {
        for (Student s : studentList) {
    %>

        <option value="<%= s.getStudentId() %>">
            <%= s.getStudentId() %> - <%= s.getName() %>
        </option>

    <%
        }
    }
    %>

</select>
<label for="date"> Date</label>
<input type="date" name="date" required>
<label for="status">Status</label>
<select name="status" required>
<option value="">Select Status</option>
<option value="Present">Present</option>
<option value="Absent">Absent</option>

</select>
<button type="submit" class="submit-btn"><i class="fa-solid fa-calendar-check"></i> Mark Attendance</button>
</form>
<button type="button" class="back-btn" onclick="window.location.href='HomeServlet'"><i class="fa-solid fa-house"></i> Back to Home</button>
</div>
</body>
</html>