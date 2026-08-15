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

    <style>
    .edit-btn,
.delete-btn {
    display: inline-block;
    padding: 8px 14px;
    margin: 2px;
    border-radius: 5px;
    text-decoration: none;
    font-size: 14px;
    font-weight: bold;
}

.edit-btn {
    background-color: #333;
    color: white;
}

.edit-btn:hover {
    background-color: #555;
}

.delete-btn {
    background-color: #c0392b;
    color: white;
}

.delete-btn:hover {
    background-color: #922b21;
}
    .message {
    width: 80%;
    margin: 15px auto;
    padding: 12px;
    text-align: center;
    background-color: #d4edda;
    color: #155724;
    border: 1px solid #c3e6cb;
    border-radius: 6px;
    font-weight: bold;
}
    .search-form {
    width: 80%;
    margin: 20px auto;
    display: flex;
    justify-content: center;
    gap: 10px;
}

.search-form input {
    width: 300px;
    padding: 12px;
    border: 1px solid #ccc;
    border-radius: 6px;
    font-size: 15px;
    outline: none;
}

.search-form input:focus {
    border-color: #333;
}

.search-form button {
    padding: 12px 22px;
    border: none;
    border-radius: 6px;
    background-color: #333;
    color: white;
    font-size: 15px;
    cursor: pointer;
}

.search-form button:hover {
    background-color: #555;
}
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            padding: 30px;
        }

        h1 {
            text-align: center;
        }

        table {
            width: 80%;
            margin: 30px auto;
            border-collapse: collapse;
            background-color: white;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 12px;
            text-align: center;
        }

        th {
            background-color: #333;
            color: white;
        }
        .back-home {
    text-align: center;
    margin-top: 25px;
}

.back-home a {
    display: inline-block;
    padding: 10px 20px;
    background-color: #333;
    color: white;
    text-decoration: none;
    border-radius: 6px;
    font-weight: bold;
}

.back-home a:hover {
    background-color: #555;
}

        .no-data {
            text-align: center;
            margin-top: 30px;
            color: red;
        }
    </style>
</head>

<body>

<h1>Student List</h1>
<form action="StudentServlet" method="get" class="search-form">

    <input type="hidden" name="action" value="search">

    <input type="text"
           name="search"
           placeholder="Search by ID or Name"
           required>

    <button type="submit">Search</button>

</form>
<%
    ArrayList<Student> studentList =
        (ArrayList<Student>) request.getAttribute("studentList");

    if (studentList != null && !studentList.isEmpty()) {
%>

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
    	Edit
		</a>

		<a class="delete-btn"
   		href="StudentServlet?action=delete&id=<%= s.getStudentId() %>"
   		onclick="return confirm('Are you sure you want to delete this student?');">
   		 Delete
		</a>
    </td>
    
    </tr>

<%
        }
%>

</table>
<div class="back-home">
<a href="HomeServlet">  <--Back to Home </a>
</div>


<%
    }
    else {
%>
<div class="no-data">
    <h3>No students found.</h3>
</div>

<%
    }
%>

</body>
</html>