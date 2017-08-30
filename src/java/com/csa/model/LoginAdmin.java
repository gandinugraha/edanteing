/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.csa.model;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DiTz
 */
public class LoginAdmin extends HttpServlet {

   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        
        PrintWriter out = response.getWriter();
        String user =  request.getParameter("user");
        String pass = request.getParameter("pass");
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/db_csa982017", "root", "");
            PreparedStatement pst = conn.prepareStatement("Select * from tb_admincsa982017 where username_a=? and password_a=?");
            pst.setString(1, user);
            pst.setString(2, pass);
            ResultSet rs = pst.executeQuery();
            DateFormat df = new SimpleDateFormat("HHmm");
              Date today = Calendar.getInstance().getTime();        
              String reportDate = df.format(today);
            if (rs.next()) {        
               HttpSession session = request.getSession();
               session.setAttribute("username_a", user);
               session.setAttribute("timer", reportDate);
               response.sendRedirect("halaman_utama.jsp");
            }
            else {
                response.sendRedirect("login.jsp");
            }
        } 
        catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }


}
