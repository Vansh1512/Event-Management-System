<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>

<%
if(session.getAttribute("admin")==null){
response.sendRedirect("adminLogin.jsp");
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard</title>
<link rel="stylesheet" href="styles.css">
</head>

<body>

<header>
    Event Management System - Admin
</header>

<nav>
    <a href="adminDashboard.jsp">Dashboard</a>
    <a href="addEvent.jsp">Add Event</a>
    <a href="events.jsp">View Events</a>
    <a href="viewUser.jsp">View Users</a>
    <a href="logout">Logout</a>
</nav>

<div class="container">
    <h2>Admin Dashboard</h2>
    <p>Welcome Admin: <strong><%=session.getAttribute("admin")%></strong></p>
    <p>Use the navigation above to manage events and users.</p>
    <p>
        <a class="btn-secondary" href="login.jsp">Go to User Login</a>
    </p>
</div>

</body>
</html>