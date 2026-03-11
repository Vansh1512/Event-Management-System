<%-- 
    Document   : register
    Created on : Mar 7, 2026, 12:00:29 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Registration</title>
    <link rel="stylesheet" href="styles.css">
</head>

<body>
<header>
    Event Management System
</header>

<div class="card-center">
    <h2>User Registration</h2>

    <form action="RegisterServlet" method="post">
        <label>Name</label>
        <input type="text" name="name" required>

        <label>Email</label>
        <input type="email" name="email" required>

        <label>Password</label>
        <input type="password" name="password" required>

        <input type="submit" value="Register">
    </form>

    <div class="link">
        <p>Already have an account?
            <a href="login.jsp">Login here</a>
        </p>
    </div>
</div>

</body>
</html>
