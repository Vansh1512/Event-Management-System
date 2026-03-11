<%@page import="java.sql.*"%>
<%@page import="com.event.util.DBconnection"%>
<%@page session="true"%>

<%
if (session.getAttribute("user") == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>

<html>
<head>
<title>My Events</title>
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

<h2>My Registered Events</h2>

<table>

<tr>
<th>Event Name</th>
<th>Date</th>
<th>Venue</th>
</tr>

<%

HttpSession session1 = request.getSession();
String email = (String) session1.getAttribute("user");

try{

Connection con = DBconnection.getConnection();

String sql = "SELECT e.event_name,e.event_date,e.venue FROM events e "
           + "JOIN registrations r ON e.event_id=r.event_id "
           + "WHERE r.user_email=?";

PreparedStatement ps = con.prepareStatement(sql);

ps.setString(1,email);

ResultSet rs = ps.executeQuery();

while(rs.next()){
%>

<tr>
<td><%=rs.getString("event_name")%></td>
<td><%=rs.getString("event_date")%></td>
<td><%=rs.getString("venue")%></td>
</tr>

<%
}

}catch(Exception e){
e.printStackTrace();
}

%>

</table>

<br><br>

<a class="btn-secondary" href="dashboard.jsp">Back to Dashboard</a>

</div>

</body>
</html>