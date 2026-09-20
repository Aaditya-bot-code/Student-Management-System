<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="model.Marks" %>
    <% if(session.getAttribute("admin")==null)
    	{
    		response.sendRedirect("Login.jsp");
    		return;
    	}
    	%>
   <% ArrayList<Marks> marksList=(ArrayList<Marks>)request.getAttribute("marksList"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Marks</title>
<script src="https://kit.fontawesome.com/946df3c2e5.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="viewMarks.css">
</head>
<body>

<h1><i class="fa-solid fa-graduation-cap"></i> Marks Record</h1>

<% if(marksList!=null && !marksList.isEmpty()){%>

<div class="table-wrapper">
<table>
	<tr>
	<th>Marks ID</th>
	<th>Student ID</th>
	<th>Student Name</th>
	<th>Subject</th>
	<th>Marks</th>
	<th>Action</th>
	</tr>
	<% for(Marks m:marksList){ %>
	<tr>
	<td><%= m.getMarksId() %></td>
	<td><%= m.getStudentId() %></td>
	<td><%= m.getStudentName() %></td>
	<td><%= m.getSubject() %></td>
	<td><span class="marks-badge"><%= m.getMarks() %></span></td>
	<td>
	<a class="edit-btn" href="MarksServlet?action=edit&id=<%= m.getMarksId() %>">
	<i class="fa-solid fa-pen"></i> Edit
	</a>
	<a class="delete-btn"
               href="MarksServlet?action=delete&marksId=<%= m.getMarksId() %>"
               onclick="return confirm('Are you sure you want to delete this marks record?');">
                <i class="fa-solid fa-trash"></i>  Delete
            </a>
        
	</td>
	</tr>
	<% } %>
</table>
</div>

<% }else{ %>

<div class="no-data">
    <h3><i class="fa-solid fa-circle-exclamation"></i> No Record Found</h3>
</div>

<% } %>

<div class="action-links">
<a class="back-btn" href="HomeServlet"><i class="fa-solid fa-house"></i> Back To Home</a>
</div>

</body>
</html>