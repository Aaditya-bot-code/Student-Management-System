<%@ page import="java.util.ArrayList" %>
<%@ page import="model.Student" %>
<%if(session.getAttribute("admin")==null)
{
	response.sendRedirect("Login.jsp");
	return;
}
%>
<%
String message = (String) session.getAttribute("message");

if (message != null) {
%>

<div class="message">
    <i class="fa-solid fa-circle-check"></i>
    <%= message %>
</div>
<%
    session.removeAttribute("message");
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Students</title>
    <link rel="stylesheet" href="viewStudents.css">
    <script src="https://kit.fontawesome.com/946df3c2e5.js" crossorigin="anonymous"></script>

</head>

<body>

<h1><i class="fa-solid fa-users"></i> Student List</h1>
<form action="StudentServlet" method="get" class="search-form">

    <input type="hidden" name="action" value="search">

    <input type="text"
           name="search"
           placeholder="Search by ID or Name"
           required>

    <button type="submit"><i class="fa-solid fa-magnifying-glass"></i> Search</button>

</form>
<%
    ArrayList<Student> studentList =
        (ArrayList<Student>) request.getAttribute("studentList");

    if (studentList != null && !studentList.isEmpty()) {
%>

<div class="table-wrapper">
<table>

    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Department</th>
        <th>Semester</th>
        <th>Action</th>
    </tr>

<%
        for (Student s : studentList) {
%>

    <tr>
        <td><%= s.getStudentId() %></td>
        <td><%= s.getName() %></td>
        <td><%= s.getEmail() %></td>
        <td><%= s.getPhone() %></td>
        <td><%= s.getDepartment() %></td>
        <td><%= s.getSemester() %></td>
        <td>
        <a class="edit-btn"
   		href="StudentServlet?action=edit&id=<%= s.getStudentId() %>">
    	<i class="fa-solid fa-pen"></i> Edit
		</a>

		<a class="delete-btn"
   		href="StudentServlet?action=delete&id=<%= s.getStudentId() %>"
   		onclick="return confirm('Are you sure you want to delete this student?');">
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
    }
    else {
%>
<div class="no-data">
    <h3><i class="fa-solid fa-circle-exclamation"></i> No students found.</h3>
</div>

<%
    }
%>

<div class="back-home">
<a href="HomeServlet"><i class="fa-solid fa-house"></i> Back to Home</a>
</div>

</body>
</html>