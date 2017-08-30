

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
                    response.sendRedirect("AdminController?proses=logout");
                }else{
                    String limitB = Integer.toString(limitKurang);
                    session.setAttribute("timer", limitB);
                }
%>
<html>
    <head>
         <%
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); //http 1,0
            response.setHeader("pragma", "no-cache"); //http 1.0
            response.setHeader("Expires", "0"); //Proxies
        %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin page</title>
    </head>
    <body>
        <form action="../AdminController?data=admin&proses=input-admin" method="POST">
            nama : <input type="text" name="nama"><br>
            username : <input type="text" name="username"><br>
            password : <input type="text" name="password"><br>
            email: <input type="text" name="email"><br>
            <input type='submit' value='input'><br>
        </form> 
    </body>
</html>
<% } %>