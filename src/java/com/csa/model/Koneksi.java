
package com.csa.model;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author DiTz
 */
public class Koneksi extends HttpServlet {

   private Connection conn;
    private Statement st;
    
    public void connect()
    {
        try {
            String db = "jdbc:mysql://localhost:3306/db_csa982017";
            String user = "root";
            String pass = "";
            Class.forName("com.mysql.jdbc.Driver");
            conn = (Connection) DriverManager.getConnection(db, user, pass);
            st = (Statement) conn.createStatement();
            
        } catch (Exception e) {
        } 
    }
    
    public void disconnect(ResultSet rs)
    {
        try {
            if (rs != null) {
                rs.close();
            }
            st.close();
            conn.close();
        } catch (Exception x) {
        }
    }
   
    public ResultSet readData(String sql)
    {
        ResultSet rs=null;
        try {
            connect();
            rs = st.executeQuery(sql);
        } catch (Exception e) {
        }  
        return rs;
    }
    
    public void addData(String sql)
    {
        try {
            connect();
            st.executeUpdate(sql);
        } catch (Exception e) {
        }  
    }

}
