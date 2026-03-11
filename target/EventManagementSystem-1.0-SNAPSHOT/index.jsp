<%-- 
    Document   : index
    Created on : Mar 7, 2026, 11:45:22 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Event Management System</title>
    <link rel="stylesheet" href="styles.css">
</head>

<body>

<header>
    <h1>Event Management System</h1>
</header>

<nav>
    <a href="index.jsp">Home</a>
    <a href="login.jsp">Login</a>
    <a href="register.jsp">Register</a>
    <a href="adminLogin.jsp">Admin</a>
</nav>

<div class="container" style="text-align:center;">
    <h2>Welcome to Event Management System</h2>
    <p>This system allows users to view events and register for them online.</p>
    <a class="btn-secondary" href="login.jsp">Login</a>
    <a class="btn-secondary" href="register.jsp" style="margin-left:10px;">Register</a>
    <br><br>
    <a class="btn-secondary" href="adminLogin.jsp" style="background:#e67e22;margin-left:0;">Admin Login</a>
</div>

</body>
</html>
