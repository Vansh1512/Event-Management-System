package com.event.servlet;

import com.event.util.DBconnection;
import java.io.IOException;
import java.sql.PreparedStatement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/RegisterEventServlet")

public class RegisterEventServlet extends HttpServlet {

protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

HttpSession session = request.getSession(false);
if (session == null || session.getAttribute("user") == null) {
    response.sendRedirect("login.jsp");
    return;
}

int eventId = Integer.parseInt(request.getParameter("id"));

String email = (String) session.getAttribute("user");

try{

String sql = "INSERT INTO registrations(user_email,event_id) VALUES(?,?)";
try (var con = DBconnection.getConnection();
     PreparedStatement ps = con.prepareStatement(sql)) {
    ps.setString(1,email);
    ps.setInt(2,eventId);
    ps.executeUpdate();
}

response.sendRedirect("events.jsp");

}catch(Exception e){
e.printStackTrace();
}

}
}