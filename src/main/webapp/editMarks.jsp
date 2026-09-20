<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="model.Marks" %>

<%
if(session.getAttribute("admin") == null)
{
    response.sendRedirect("Login.jsp");
    return;
}

Marks mark = (Marks) request.getAttribute("mark");
%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Edit Marks</title>

<link rel="stylesheet" href="editMarks.css">
<script src="https://kit.fontawesome.com/946df3c2e5.js" crossorigin="anonymous"></script>

</head>

<body>

<div class="editmarks-box">

    <h1>
        <i class="fa-solid fa-pen-to-square"></i>
        Edit Marks
    </h1>

    <h2>Update Student Marks</h2>

    <form action="MarksServlet" method="post">

        <input type="hidden" name="action" value="update">

        <input type="hidden"
               name="marksId"
               value="<%= mark.getMarksId() %>">

        <label>
            <i class="fa-solid fa-user"></i>
            Student ID
        </label>

        <input type="number"
               name="studentId"
               value="<%= mark.getStudentId() %>"
               required>

        <label>
            <i class="fa-solid fa-book"></i>
            Subject
        </label>

        <input type="text"
               name="subject"
               value="<%= mark.getSubject() %>"
               required>

        <label>
            <i class="fa-solid fa-chart-column"></i>
            Marks
        </label>

        <input type="number"
               name="marks"
               min="0"
               max="100"
               value="<%= mark.getMarks() %>"
               required>

        <button type="submit" class="update-btn">
            <i class="fa-solid fa-floppy-disk"></i>
            Update Marks
        </button>

    </form>

   <a href="MarksServlet?action=view" class="back-btn">
    <i class="fa-solid fa-arrow-left"></i>
    Back to Marks
</a>
</div>

</body>
</html>