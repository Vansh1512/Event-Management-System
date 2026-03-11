package com.event.servlet;

import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import com.event.util.DBconnection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class AdminLoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {

            String sql = "SELECT * FROM admin WHERE username=? AND password=?";
            try (var con = DBconnection.getConnection();
                 PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setString(1, username);
                ps.setString(2, password);

                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        HttpSession session = request.getSession();
                        // ensure this session is treated as admin only
                        session.removeAttribute("user");
                        session.setAttribute("admin", username);
                        response.sendRedirect("adminDashboard.jsp");
                    } else {
                        response.getWriter().println("Invalid Admin Login");
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}