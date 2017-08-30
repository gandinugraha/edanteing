<%@page import="com.csa.model.PembeliModel"%>
<%@page import="com.csa.model.AdminModel"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.csa.model.BarangModel"%>
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
            <th width ="200px">username</th>
            <th width ="200px">email_</th>
            <th width ="200px">alamat</th>
 
	</tr>
        <%    
            PembeliModel pm = new PembeliModel();
            List<PembeliModel> data = new ArrayList<PembeliModel>();
            data = pm.view();
            for (int i = 0; i < data.size(); i++) {
        %>
        <tr>
            <td><%= i %></td>
            <td><%= data.get(i).getId_pembeli() %></td>
            <td><%= data.get(i).getNama_pembeli() %></td>
            <td><%= data.get(i).getUsername_p()%></td>
            <td><%= data.get(i).getEmail_pembeli()%></td>
            <td><%= data.get(i).getAlamat_pembeli()%></td>
             <td>
                <a href="../PembeliController?proses=hapus-pembeli&id=<%=data.get(i).getId_pembeli() %>">Hapus</a>
            </td>
        </tr>
        <% } %>
    </table>
    </body>
</html>
<% } %>