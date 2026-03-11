<%-- 
    Document   : dashboard.jsp
    Created on : Mar 7, 2026, 3:24:10 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>

<%
if (session.getAttribute("user") == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>
<!DOCTYPE html>
<html>
<head>
    <title>User Dashboard</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>

<header>
    Event Management System
</header>

<nav>
    <a href="dashboard.jsp">Dashboard</a>
    <a href="events.jsp">Events</a>
    <a href="myEvent.jsp">My Events</a>
    <a href="logout">Logout</a>
</nav>

<div class="container">
    <h2>Welcome to Event Management System</h2>
    <p>Use the navigation above to view available events, manage your registrations, or logout.</p>
</div>

</body>
</html>
