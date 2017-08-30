<%-- 
    Document   : add_barang
    Created on : Aug 10, 2017, 12:48:26 PM
    Author     : DiTz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<% 
            if (session.getAttribute("username_a")==null)
            {
                response.sendRedirect("../login.jsp");
            }else{
                String time=(String) session.getAttribute("timer");
                DateFormat df = new SimpleDateFormat("HHmm");
                Date today = Calendar.getInstance().getTime();        
                String reportDate = df.format(today);
                int limit = Integer.parseInt(time);
                int limitKurang = Integer.parseInt(reportDate);
                int limitBanding = limitKurang - limit;
                int j=10;
                if( j < limitBanding)
                {
                    response.sendRedirect("../AdminController?proses=logout");
                }else{
                    String limitB = Integer.toString(limitKurang);
                    session.setAttribute("timer", limitB);
                }
%>
<!DOCTYPE html>
<html>
    <head>
        <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //http 1,0
            response.setHeader("pragma", "no-cache"); //http 1.0
            response.setHeader("Expires", "0"); //Proxies
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="../BarangController?data=barang&proses=input-barang" method="POST" enctype="multipart/form-data">
            nama : <input type="text" name="nama"><br>
            harga : <input type="text" name="harga"><br>
            qty : <input type="text" name="qty"><br>
            satuan : <input type="text" name="satuan"><br>
            
            <input type="hidden" name="MAX_FILE_SIZE" value="500000" /><br>
            Gambar :<input name='gambar' type='file' /><br>
             status : 
            <select name="status" >
                <option value="sale">sale</option>
                <option value="biasa">biasa</option>
            </select><br>
            <input type='submit' value='input'><br>
        </form> 
    </body>
</html>
<% } %>