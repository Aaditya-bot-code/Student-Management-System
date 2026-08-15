<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="model.Attendance" %>
    <%@ page import="model.Student" %>
    <% if(session.getAttribute("admin")==null)
    	{
    	response.sendRedirect("Login.jsp");
    	return;
    	}
    Attendance attendance=(Attendance) request.getAttribute("attendance");
    ArrayList<Student> studentList=(ArrayList<Student>)request.getAttribute("studentList");
    	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Attendance</title>
</head>
<body>
<h1>Edit Attendance</h1>
<form action="AttendanceServlet" method="post">
<input type="hidden" name="action" value="update">

    <input type="hidden"
           name="attendanceId"
           value="<%= attendance.getAttendanceId() %>">

    <label>Student:</label>

    <select name="studentId" required>

        <%
        for (Student s : studentList) {
        %>

        <option value="<%= s.getStudentId() %>"
            <%
            if (s.getStudentId() == attendance.getStudentId()) {
            %>
                selected
            <%
            }
            %>>
            <%= s.getName() %>
        </option>

        <%
        }
        %>

    </select>

    <br><br>

    <label>Date:</label>

    <input type="date"
           name="date"
           value="<%= attendance.getDate() %>"
           required>

    <br><br>

    <label>Status:</label>

    <select name="status" required>

        <option value="Present"
            <%= "Present".equals(attendance.getStatus()) ? "selected" : "" %>>
            Present
        </option>

        <option value="Absent"
            <%= "Absent".equals(attendance.getStatus()) ? "selected" : "" %>>
            Absent
        </option>

    </select>

    <br><br>

    <button type="submit">Update Attendance</button>

</form>

<br>

<a href="AttendanceServlet?action=view">
    Back to Attendance
</a>


</body>
</html>