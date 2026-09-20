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
<script src="https://kit.fontawesome.com/946df3c2e5.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="viewAttendance.css">
</head>

<body>

<h1><i class="fa-solid fa-clipboard-list"></i> Attendance Records</h1>

<div class="search-container">

    <form action="AttendanceServlet" method="get" class="search-form">
        <input type="hidden" name="action" value="search">
        <input type="number" name="studentId" placeholder="Search by Student Id" required>
        <button type="submit"><i class="fa-solid fa-magnifying-glass"></i> Search</button>
    </form>

    <form action="AttendanceServlet" method="get" class="search-form">
        <input type="hidden" name="action" value="searchByDate">
        <input type="date" name="date" required>
        <button type="submit"><i class="fa-solid fa-calendar-days"></i> Search By Date</button>
    </form>

    <form action="AttendanceServlet" method="get" class="search-form">
        <input type="hidden" name="action" value="searchStatus">
        <select name="status" required>
            <option value="">Search Status</option>
            <option value="Present">Present</option>
            <option value="Absent">Absent</option>
        </select>
        <button type="submit"><i class="fa-solid fa-filter"></i> Filter Status</button>
    </form>

</div>

<%
ArrayList<Attendance> attendanceList =
    (ArrayList<Attendance>) request.getAttribute("attendanceList");

if (attendanceList != null && !attendanceList.isEmpty()) {
%>

<div class="table-wrapper">
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
    boolean isPresent = "Present".equalsIgnoreCase(a.getStatus());
    String statusClass = isPresent ? "status-present" : "status-absent";
    String statusIcon = isPresent ? "fa-solid fa-circle-check" : "fa-solid fa-circle-xmark";
%>

    <tr>
        <td><%= a.getAttendanceId() %></td>
        <td><%= a.getStudentId() %></td>
        <td><%= a.getStudentName() %></td>
        <td><%= a.getDate() %></td>
        <td>
            <span class="status-badge <%= statusClass %>">
                <i class="<%= statusIcon %>"></i> <%= a.getStatus() %>
            </span>
        </td>
        <td>
            <a class="edit-btn"
               href="AttendanceServlet?action=edit&id=<%= a.getAttendanceId() %>">
                <i class="fa-solid fa-pen"></i> Edit
            </a>

            <a class="delete-btn"
               href="AttendanceServlet?action=delete&id=<%= a.getAttendanceId() %>"
               onclick="return confirm('Are you sure you want to delete this attendance record?');">
                <i class="fa-solid fa-trash"></i> Delete
            </a>
        </td>
    </tr>

<%
}
%>

</table>
</div>

<%
} else {
%>

<div class="no-data">
    <h3><i class="fa-solid fa-circle-exclamation"></i> No attendance records found.</h3>
</div>

<%
}
%>

<div class="back-home">
<a href="HomeServlet"><i class="fa-solid fa-house"></i> Back to Home</a>
</div>

</body>
</html>