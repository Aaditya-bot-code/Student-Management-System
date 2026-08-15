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
<button type="submit">Mark Attendance</button>
</form>
<a href="HomeServlet"><-- Back to home</a>
</div>

</body>
</html>