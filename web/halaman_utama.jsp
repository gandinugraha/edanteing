<%-- 
    Document   : halamanUtama
    Created on : Aug 11, 2017, 9:41:43 AM
    Author     : DiTz
--%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<% 
            if (session.getAttribute("username_a")==null)
            {
                response.sendRedirect("login.jsp");
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
                    response.sendRedirect("AdminController?proses=logout");
                }else{
                    String limitB = Integer.toString(limitKurang);
                    session.setAttribute("timer", limitB);
                }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
        <a href="barang/view_barang.jsp">Barang</a><br>
        <a href="admin/view_admin.jsp">Admin</a><br>
        <a href="pembeli/view_pembeli.jsp">Pembeli</a><br>
        <a href="AdminController?proses=logout">Logout</a>
    </body>
</html>
<% } %>