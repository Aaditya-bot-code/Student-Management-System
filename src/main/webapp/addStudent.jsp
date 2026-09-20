<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
if(session.getAttribute("admin") == null)
{
    response.sendRedirect("Login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Student</title>

<link rel="stylesheet" href="addStudent.css">
<script src="https://kit.fontawesome.com/946df3c2e5.js" crossorigin ="anonymous"></script>

</head>

<body>

<div class="addstudent-box">

    <h1>
        <i class="fa-solid fa-user-plus"></i>
        Add Student
    </h1>

    <h2>Enter Student Details</h2>

    <form action="StudentServlet" method="post">

        <label for="name">
            <i class="fa-solid fa-user"></i>
            Name
        </label>

        <input
            name="name"
            pattern="[A-Za-z ]+"
            placeholder="Enter Student Name"
            required>

        <label for="email">
            <i class="fa-solid fa-envelope"></i>
            Email
        </label>

        <input
            type="email"
            name="email"
            placeholder="Enter Student Email"
            required>

        <label for="phone">
            <i class="fa-solid fa-phone"></i>
            Phone
        </label>

        <input
            type="tel"
            name="phone"
            pattern="[0-9]{10}"
            maxlength="10"
            placeholder="Enter Student Phone No."
            required>

        <label for="department">
            <i class="fa-solid fa-building"></i>
            Department
        </label>

        <input
            name="department"
            placeholder="Enter Department"
            required>

        <label for="semester">
            <i class="fa-solid fa-graduation-cap"></i>
            Semester
        </label>

        <input
            type="number"
            name="semester"
            min="1"
            max="8"
            placeholder="Enter Semester"
            required>

        <button type="submit" class="submit-btn">
            <i class="fa-solid fa-user-plus"></i>
            Add Student
        </button>

    </form>

    <a href="HomeServlet" class="back-btn">
        <i class="fa-solid fa-house"></i>
        Back to Home
    </a>

</div>

</body>
</html>