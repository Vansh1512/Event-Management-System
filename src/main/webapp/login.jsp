<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Event Management System</title>
    <link rel="stylesheet" href="styles.css">
</head>

<body>
<header>
    Event Management System
</header>

<div class="card-center">
    <h2>Login</h2>

    <form action="LoginServlet" method="post">
        <label>Email</label>
        <input type="email" name="email" required>

        <label>Password</label>
        <input type="password" name="password" required>

        <input type="submit" value="Login">
    </form>

    <div class="link">
        <p>Don't have an account?
            <a href="register.jsp">Register here</a>
        </p>
    </div>
</div>

</body>
</html>