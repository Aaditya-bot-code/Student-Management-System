<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Management System</title>
<link rel="stylesheet" href="Login.css">
</head>
<body>
 <div class="login-box">
 <h1>Student Management System</h1>
<h2> Admin Login</h2>
 <form action="LoginServlet" method="post">

 <label for="username">Username</label>
 <input type="text" name="username" placeholder="Enter your username" required>

 <label for="password">Password</label>
 <input type="password" name="password" placeholder="Enter your password" required>

 <button type="submit" value="login">Login</button>

 </form>

 </div>


</body>
</html>