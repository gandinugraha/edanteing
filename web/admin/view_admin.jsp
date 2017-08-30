<%@page import="com.csa.model.AdminModel"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
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
        <title>Latihan Java </title>
    </head>
    <body>
     
    <center><h1>CSA </h1></center>
  <table  border="1">
	<tr>
            <th>no</th>
            <th >id</th>
            <th width ="200px">nama</th>
            <th width ="200px">username_a</th>
            <th width ="200px">password_a</th>
            <th width ="200px">email_a</th>
            <th width ="200px">status_login</th>
 
	</tr>
        <%    
            AdminModel am = new AdminModel();
            List<AdminModel> data = new ArrayList<AdminModel>();
            data = am.view();
            for (int i = 0; i < data.size(); i++) {
        %>
        <tr>
            <td><%= i %></td>
            <td><%= data.get(i).getId_admincsa() %></td>
            <td><%= data.get(i).getNama_admincsa() %></td>
            <td><%= data.get(i).getUsername_a() %></td>
            <td><%= data.get(i).getPassword_a()%></td>
            <td><%= data.get(i).getEmail_a() %></td>
            <td><%= data.get(i).getStatus_login() %></td>
             <td>
                <a href="../AdminController?proses=edit-admin&id=<%=data.get(i).getId_admincsa()%>">Edit</a>
                <a href="../AdminController?proses=hapus-admin&id=<%=data.get(i).getId_admincsa()%>">Hapus</a>
            </td>
        </tr>
        <% } %>
    </table>
    
    <a class="tambah" href="../AdminController?proses=input-admin">Tambah</a>
    <a class="logout" href="../AdminController?proses=logout">logout</a>

    </body>
</html>
<% } %>