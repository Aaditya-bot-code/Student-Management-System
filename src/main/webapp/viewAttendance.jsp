<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Attendance" %>

<%
if (session.getAttribute("admin") == null) {
    response.sendRedirect("Login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Attendance</title>
<link rel="stylesheet" href="viewAttendance.css">
</head>

<body>

<div class="attendance-container">

    <h1>Attendance Records</h1>

    <%
    ArrayList<Attendance> attendanceList =
        (ArrayList<Attendance>) request.getAttribute("attendanceList");

    if (attendanceList != null && !attendanceList.isEmpty()) {
    %>

    <table>

        <tr>
            <th>Attendance ID</th>
            <th>Student ID</th>
            <th>Student Name</th>
            <th>Date</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        <%
for (Attendance a : attendanceList) {
%>

<tr>
    <td><%= a.getAttendanceId() %></td>
    <td><%= a.getStudentId() %></td>
    <td><%= a.getStudentName() %></td>
    <td><%= a.getDate() %></td>
    <td><%= a.getStatus() %></td>

    <td>
    	<a href="AttendanceServlet?action=edit&id=<%= a.getAttendanceId() %>">
    	<button type="button">Edit</button>
    	</a>
        <a href="AttendanceServlet?action=delete&id=<%= a.getAttendanceId() %>"
           onclick="return confirm('Are you sure you want to delete this attendance record?');">
            <button type="button">Delete</button>
            </a>
        
    </td>
</tr>

<%
}
%>

    </table>

    <%
    } else {
    %>

    <p class="no-data">No attendance records found.</p>

    <%
    }
    %>

    <a class="back-btn" href="HomeServlet">Back to Home</a>

</div>

</body>
</html>