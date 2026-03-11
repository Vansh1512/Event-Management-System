package com.event.servlet;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;
import com.event.util.DBconnection;
import java.sql.PreparedStatement;

@WebServlet("/DeleteEventServlet")
public class DeleteEventServlet extends HttpServlet {

protected void doGet(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {

HttpSession session = request.getSession(false);
if (session == null || session.getAttribute("admin") == null) {
    response.sendRedirect("adminLogin.jsp");
    return;
}

int id=Integer.parseInt(request.getParameter("id"));

try{

try (var con = DBconnection.getConnection();
     PreparedStatement ps=con.prepareStatement("DELETE FROM events WHERE event_id=?")) {
    ps.setInt(1,id);
    ps.executeUpdate();
}

response.sendRedirect("events.jsp");

}catch(Exception e){
e.printStackTrace();
}

}
}