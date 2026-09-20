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
<link rel="stylesheet" href="editAttendance.css">
<script src="https://kit.fontawesome.com/946df3c2e5.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="editAttendance.css">
</head>
<body>

<div class="form-wrapper">

    <h1><i class="fa-solid fa-calendar-check"></i> Edit Attendance</h1>
    <p class="subtitle">Update Attendance Record</p>

    <form action="AttendanceServlet" method="post">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="attendanceId" value="<%= attendance.getAttendanceId() %>">

        <label><i class="fa-solid fa-user"></i> Student</label>
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

        <label><i class="fa-solid fa-calendar-days"></i> Date</label>
        <input type="date" name="date" value="<%= attendance.getDate() %>" required>

        <label><i class="fa-solid fa-clipboard-check"></i> Status</label>
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

        <button type="submit"><i class="fa-solid fa-floppy-disk"></i> Update Attendance</button>
    </form>

    <div class="back-home">
        <a href="AttendanceServlet?action=view"><i class="fa-solid fa-arrow-left"></i> Back to Attendance</a>
    </div>

</div>

</body>
</html>