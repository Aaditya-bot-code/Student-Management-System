<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% if(session.getAttribute("admin")==null)
    	{
    	response.sendRedirect("Login.jsp");
    	return;
    	}
    	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Marks</title>
<script src="https://kit.fontawesome.com/946df3c2e5.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="addMarks.css">
</head>
<body>

<div class="form-wrapper">

    <h1><i class="fa-solid fa-square-plus"></i> Add Marks</h1>
    <p class="subtitle">Enter Marks Details</p>

    <form action="MarksServlet" method="post">
        <input type="hidden" name="action" value="add">

        <label><i class="fa-solid fa-id-card"></i> Student ID</label>
        <input type="number" name="studentId" placeholder="Enter Student ID" required>

        <label><i class="fa-solid fa-book"></i> Subject</label>
        <input type="text" name="subject" placeholder="Enter Subject" required>

        <label><i class="fa-solid fa-star"></i> Marks</label>
        <input type="number" name="marks" placeholder="Enter Marks" min="0" max="100" required>

        <button type="submit"><i class="fa-solid fa-square-plus"></i> Add Marks</button>
    </form>

    <div class="back-home">
        <a href="HomeServlet"><i class="fa-solid fa-house"></i> Back to Home</a>
    </div>

</div>

</body>
</html>