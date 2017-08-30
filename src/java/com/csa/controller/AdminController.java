/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.csa.controller;

import com.csa.model.AdminModel;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author DiTz
 */
public class AdminController extends HttpServlet {

     protected void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException
    {
        
        String proses=request.getParameter("proses");
        String action=request.getParameter("action");
        if (proses.equals("input-admin")){
            response.sendRedirect("admin/add_admin.jsp");
            return;
        }else if(proses.equals("edit-admin")){
            response.sendRedirect("admin/edit_admin.jsp?id="+request.getParameter("id"));
            return;
        }else if (proses.equals("logout")){
            HttpSession session = request.getSession();
            session.removeAttribute("username_a");
            session.invalidate();
            response.sendRedirect("login.jsp");
        }else if(proses.equals("hapus-admin")){
            AdminModel am=new AdminModel();
            am.setId_admincsa(Integer.parseInt(request.getParameter("id")));
            am.hapus();
            response.sendRedirect("admin/view_admin.jsp");
        }  
    }
    
      protected void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException
    {
        String data = request.getParameter("data");
        String proses = request.getParameter("proses");
        
        if (data != null){
           if(data.equals("admin")){
                AdminModel am=new AdminModel();
                    am.setNama_admincsa(request.getParameter("nama"));
                    am.setUsername_a(request.getParameter("username"));
                    am.setPassword_a(request.getParameter("password"));
                    am.setEmail_a(request.getParameter("email"));
                 if (proses.equals("input-admin")){
                      am.add();
                 }  else if (proses.equals("update-admin")){
                     am.setId_admincsa(Integer.parseInt(request.getParameter("id_admincsa")));
                    am.update();
                }
                 response.sendRedirect("admin/view_admin.jsp");
            }
        }
    }
      
      


}
