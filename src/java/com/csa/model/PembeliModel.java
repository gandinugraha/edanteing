
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


public class PembeliModel extends HttpServlet {

   private int id_pembeli;
   private String nama_pembeli;
   private String email_pembeli;
   private String alamat_pembeli;
   private String username_p;
   private String password_p;
   
   Koneksi db = null;
    
    public PembeliModel()
    {
        db = new Koneksi();
    }

    public int getId_pembeli() {
        return id_pembeli;
    }

    public void setId_pembeli(int id_pembeli) {
        this.id_pembeli = id_pembeli;
    }

    public String getNama_pembeli() {
        return nama_pembeli;
    }

    public void setNama_pembeli(String nama_pembeli) {
        this.nama_pembeli = nama_pembeli;
    }

    public String getEmail_pembeli() {
        return email_pembeli;
    }

    public void setEmail_pembeli(String email_pembeli) {
        this.email_pembeli = email_pembeli;
    }

    public String getAlamat_pembeli() {
        return alamat_pembeli;
    }

    public void setAlamat_pembeli(String alamat_pembeli) {
        this.alamat_pembeli = alamat_pembeli;
    }

    public String getUsername_p() {
        return username_p;
    }

    public void setUsername_p(String username_p) {
        this.username_p = username_p;
    }

    public String getPassword_p() {
        return password_p;
    }

    public void setPassword_p(String password_p) {
        this.password_p = password_p;
    }
   
     public List view()
    {
        List<PembeliModel> data = new ArrayList<PembeliModel>();
        ResultSet rs = null; 
        try {
            String sql = "select * from tb_pembeli";
            rs = db.readData(sql);
            while (rs.next()) {
                PembeliModel pm = new PembeliModel();
                    pm.setId_pembeli(rs.getInt("id_pembeli"));
                    pm.setNama_pembeli(rs.getString("nama_pembeli"));
                    pm.setEmail_pembeli(rs.getString("email_pembeli"));
                    pm.setAlamat_pembeli(rs.getString("alamat_pembeli"));
                    pm.setUsername_p(rs.getString("username_p"));
                    pm.setPassword_p(rs.getString("password_p"));
                    data.add(pm);
            }
            db.disconnect(rs);
        } catch (Exception e) {
        }
        return data;
    }
     
      public void hapus(){
        String sql="DELETE FROM tb_pembeli WHERE id_pembeli='"+id_pembeli+"'";
        db.addData(sql);
        System.out.println("");
    }
      
       public void add()
    {
        String sql="insert into tb_pembeli values(null,'"+nama_pembeli+"','"+email_pembeli+"','"+alamat_pembeli+"','"+username_p+"','"+password_p+"')";
        db.addData(sql);
    }
   

}
