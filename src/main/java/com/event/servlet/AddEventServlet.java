package com.event.servlet;

import com.event.util.DBconnection;
import java.io.IOException;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

public class AddEventServlet extends HttpServlet {

protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

HttpSession session = request.getSession(false);
if (session == null || session.getAttribute("admin") == null) {
    response.sendRedirect("adminLogin.jsp");
    return;
}

String name = request.getParameter("event_name");
String date = request.getParameter("event_date");
String venue = request.getParameter("venue");

try{

String sql = "INSERT INTO events(event_name,event_date,venue) VALUES(?,?,?)";
try (var con = DBconnection.getConnection();
     PreparedStatement ps = con.prepareStatement(sql)) {
    ps.setString(1,name);
    ps.setString(2,date);
    ps.setString(3,venue);
    ps.executeUpdate();
}

response.sendRedirect("events.jsp");

}catch(Exception e){
e.printStackTrace();
}

}
}