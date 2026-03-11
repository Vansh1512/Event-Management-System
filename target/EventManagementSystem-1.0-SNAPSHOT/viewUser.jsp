<%@page import="java.sql.*"%>
<%@page import="com.event.util.DBconnection"%>
<%@page session="true"%>

<%
if (session.getAttribute("admin") == null) {
    response.sendRedirect("adminLogin.jsp");
    return;
}
%>

<html>
<head>
<title>View Users</title>
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

<div class="container">

<h2>Registered Users</h2>

<table>

<tr>
<th>ID</th>
<th>Name</th>
<th>Email</th>
</tr>

<%

try{

Connection con=DBconnection.getConnection();

Statement st=con.createStatement();

ResultSet rs=st.executeQuery("SELECT * FROM users");

while(rs.next()){
%>

<tr>
<td><%=rs.getInt("id")%></td>
<td><%=rs.getString("name")%></td>
<td><%=rs.getString("email")%></td>
</tr>

<%
}

}catch(Exception e){
e.printStackTrace();
}

%>

</table>

</div>

</body>
</html>