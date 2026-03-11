package com.event.servlet;

import com.event.util.DBconnection;
import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/LoginServlet")

public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try {

            String sql = "SELECT * FROM users WHERE email=? AND password=?";

            try (var con = DBconnection.getConnection();
                 PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setString(1, email);
                ps.setString(2, password);

                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        HttpSession session = request.getSession();
                        // ensure this session is treated as normal user only
                        session.removeAttribute("admin");
                        session.setAttribute("user", email);
                        response.sendRedirect("dashboard.jsp");
                    } else {
                        response.sendRedirect("login.jsp");
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}