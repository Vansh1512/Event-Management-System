<%-- 
    Document   : addEvent
    Created on : Mar 7, 2026, 3:36:22 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>

<%
if (session.getAttribute("admin") == null) {
    response.sendRedirect("adminLogin.jsp");
    return;
}
%>
<html>
<head>
<title>Add Event</title>
<link rel="stylesheet" href="styles.css">
</head>

<body>
<header>
    Event Management System
</header>

<nav>
    <a href="adminDashboard.jsp">Admin Dashboard</a>
    <a href="events.jsp">Events</a>
    <a href="logout">Logout</a>
</nav>

<div class="card-center">
    <h2>Add Event</h2>

    <form action="AddEventServlet" method="post">
        <label>Event Name</label>
        <input type="text" name="event_name" required>

        <label>Date</label>
        <input type="date" name="event_date" required>

        <label>Venue</label>
        <input type="text" name="venue" required>

        <input type="submit" value="Add Event">
    </form>
</div>

</body>
</html>