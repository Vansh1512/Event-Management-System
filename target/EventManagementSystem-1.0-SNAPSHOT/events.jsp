<%@page import="java.sql.*"%>
<%@page import="com.event.util.DBconnection"%>
<%@page session="true"%>

<%
if (session.getAttribute("user") == null && session.getAttribute("admin") == null) {
    response.sendRedirect("login.jsp");
    return;
}
boolean isAdmin = session.getAttribute("admin") != null;
%>

<html>
<head>
    <title>Events</title>
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

<h2>Available Events</h2>

<table>
<tr>
    <th>ID</th>
    <th>Event Name</th>
    <th>Date</th>
    <th>Venue</th>
    <th colspan="2">Actions</th>
</tr>

<%
try {
    Connection con = DBconnection.getConnection();
    String sql = "SELECT * FROM events";
    PreparedStatement ps = con.prepareStatement(sql);
    ResultSet rs = ps.executeQuery();

    while (rs.next()) {
%>
<tr>
    <td><%=rs.getInt("event_id")%></td>
    <td><%=rs.getString("event_name")%></td>
    <td><%=rs.getString("event_date")%></td>
    <td><%=rs.getString("venue")%></td>
    <td class="actions">
        <%
        if (!isAdmin) {
        %>
            <a href="RegisterEventServlet?id=<%=rs.getInt("event_id")%>">Register</a>
        <%
        } else {
        %>
            &mdash;
        <%
        }
        %>
    </td>
    <td class="actions">
        <%
        if (isAdmin) {
        %>
            <a href="DeleteEventServlet?id=<%=rs.getInt("event_id")%>">Delete</a>
        <%
        } else {
        %>
            &mdash;
        <%
        }
        %>
    </td>
</tr>
<%
    }
    rs.close();
    ps.close();
    con.close();
} catch (Exception e) {
    e.printStackTrace();
}
%>

</table>
</div>

</body>
</html>