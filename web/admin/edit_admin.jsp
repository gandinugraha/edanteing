<%@page import="com.csa.model.AdminModel"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.DateFormat"%>

<%@page import="com.csa.model.BarangModel"%>
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
        <title>Latihan Java Web </title>
    </head>
    <body>
        <center><h1>Edit User </h1></center>
        <form action="../AdminController?data=admin&proses=update-admin" method="post">
            <table style="margin:20px auto;">
            <%
                String id_admin= request.getParameter("id");
                AdminModel am = new AdminModel();
                am.setId_admincsa(Integer.parseInt(id_admin));
                List<AdminModel> data = new ArrayList<AdminModel>();
                data = am.cariID(); 
                if (data.size() > 0) {
                    
                    
 
            %>
		<tr>
                    <td>nama</td>
                    <td><input type="text" name="nama" value="<%=data.get(0).getNama_admincsa()%>"></td>
		</tr>
		<tr>
                    <td>username</td>
                    <td><input type="text" name="username" value="<%= data.get(0).getUsername_a() %>"></td>
		</tr>
                <tr>
                    <td>password</td>
                    <td><input type="text" name="password" value="<%= data.get(0).getPassword_a() %>"></td>
		</tr>
                <tr>
                    <td>email</td>
                    <td><input type="text" name="email" value="<%= data.get(0).getEmail_a() %>"></td>
		</tr>
                 <input type="hidden" name="id_admincsa" value="<%= data.get(0).getId_admincsa() %>">
		</tr>
		<tr>
                    <td></td>
                    <td><input type="submit" value="Update"></td>
		</tr>
                  <%}%>
            </table>          
	</form>	
    </body>
</html>
<% } %>