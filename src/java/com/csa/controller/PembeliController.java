/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.csa.controller;

import com.csa.model.AdminModel;
import com.csa.model.PembeliModel;
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
public class PembeliController extends HttpServlet {
    
   protected void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException
    {
        String proses=request.getParameter("proses");
        String action=request.getParameter("action");
        if(proses.equals("hapus-pembeli")){
            PembeliModel pm=new PembeliModel();
            pm.setId_pembeli(Integer.parseInt(request.getParameter("id")));
            pm.hapus();
            response.sendRedirect("pembeli/view_pembeli.jsp");
        }  else if (proses.equals("logout")){
            HttpSession session = request.getSession();
            session.removeAttribute("username_p");
            session.invalidate();
            response.sendRedirect("index.jsp?page=home");
        }
    }
   
    protected void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException
    {
        String data = request.getParameter("data");
        String proses = request.getParameter("proses");
        
        if (data != null){
           if(data.equals("pembeli")){
                PembeliModel pm=new PembeliModel();
                    pm.setNama_pembeli(request.getParameter("nama"));
                    pm.setUsername_p(request.getParameter("username"));
                    pm.setPassword_p(request.getParameter("password"));
                    pm.setEmail_pembeli(request.getParameter("email"));
                    pm.setAlamat_pembeli(request.getParameter("alamat"));  
                 if (proses.equals("input-pembeli")){
                      pm.add();
                 }  
//                 else if (proses.equals("update-admin")){
//                    pm.setId_admincsa(Integer.parseInt(request.getParameter("id_admincsa")));
//                    pm.update();
//                }
                 response.sendRedirect("halaman_depan.jsp");
            }
        }
    }
    
      
      

}
