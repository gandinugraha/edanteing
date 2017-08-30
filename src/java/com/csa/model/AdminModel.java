/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.csa.model;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DiTz
 */
public class AdminModel extends HttpServlet {

   private int id_admincsa;
   private String nama_admincsa;
   private String username_a;
   private String password_a;
   private String email_a;
   private String status_login;
   
   
   Koneksi db = null;
    
    public AdminModel()
    {
        db = new Koneksi();
    }
   
   

    public int getId_admincsa() {
        return id_admincsa;
    }

    public void setId_admincsa(int id_admincsa) {
        this.id_admincsa = id_admincsa;
    }

    public String getNama_admincsa() {
        return nama_admincsa;
    }

    public void setNama_admincsa(String nama_admincsa) {
        this.nama_admincsa = nama_admincsa;
    }

    public String getUsername_a() {
        return username_a;
    }

    public void setUsername_a(String username_a) {
        this.username_a = username_a;
    }

    public String getPassword_a() {
        return password_a;
    }

    public void setPassword_a(String password_a) {
        this.password_a = password_a;
    }

    public String getEmail_a() {
        return email_a;
    }

    public void setEmail_a(String email_a) {
        this.email_a = email_a;
    }

    public String getStatus_login() {
        return status_login;
    }

    public void setStatus_login(String status_login) {
        this.status_login = status_login;
    }
    
     public List view()
    {
        List<AdminModel> data = new ArrayList<AdminModel>();
        ResultSet rs = null; 
        try {
            String sql = "select * from tb_admincsa982017";
            rs = db.readData(sql);
            while (rs.next()) {
                AdminModel am = new AdminModel();
                    am.setId_admincsa(rs.getInt("id_admincsa"));
                    am.setNama_admincsa(rs.getString("nama_admincsa"));
                    am.setUsername_a(rs.getString("username_a"));
                    am.setPassword_a(rs.getString("password_a"));
                    am.setEmail_a(rs.getString("email_a"));
                    am.setStatus_login(rs.getString("status_login"));
                data.add(am);
            }
            db.disconnect(rs);
        } catch (Exception e) {
        }
        return data;
    }
     
     public void add()
    {
        String sql="insert into tb_admincsa982017 values(null,'"+nama_admincsa+"','"+username_a+"','"+password_a+"','"+email_a+"','logout')";
        db.addData(sql);
    }

        public void update(){
        String sql="UPDATE tb_admincsa982017 SET nama_admincsa='"+nama_admincsa+"',username_a='"+username_a+"' ,password_a='"+password_a+"' ,email_a='"+email_a+"' WHERE id_admincsa='"+id_admincsa+"'";
        db.addData(sql);
        System.out.println(sql);
    }

    public List cariID() {
        List<AdminModel> data = new ArrayList<AdminModel>();
        ResultSet rs = null;
        try {
            String sql = "SELECT * FROM tb_admincsa982017 WHERE id_admincsa='"+id_admincsa+"'";
            rs = db.readData(sql);
            while (rs.next()) {
                AdminModel am = new AdminModel();
                  am.setId_admincsa(rs.getInt("id_admincsa"));
                  am.setNama_admincsa(rs.getString("nama_admincsa"));
                  am.setUsername_a(rs.getString("username_a"));
                  am.setPassword_a(rs.getString("password_a"));
                  am.setEmail_a(rs.getString("email_a"));
                  am.setStatus_login(rs.getString("status_login"));
                  data.add(am);
            }
            db.disconnect(rs);
        } catch (Exception ex) {
            System.out.println("Terjadi Kesalah Saat menampilkan Cari ID" + ex);
        }
        return data;
 
    }
    
     public void hapus(){
        String sql="DELETE FROM tb_admincsa982017 WHERE id_admincsa='"+id_admincsa+"'";
        db.addData(sql);
        System.out.println("");
    }
   
}
