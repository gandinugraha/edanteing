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
                    response.sendRedirect("../AdminController?proses=logout");
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
            <th width ="200px">harga</th>
            <th width ="200px">quantity</th>
            <th width ="200px">satuan</th>
            <th width ="200px">gambar</th>
            <th width ="200px">status</th>
            <th width ="200px">Aksi</th>
	</tr>
        <%    
            BarangModel bm = new BarangModel();
            List<BarangModel> data = new ArrayList<BarangModel>();
            data = bm.view();
            for (int i = 0; i < data.size(); i++) {
        %>
        <tr>
            <td><%= i %></td>
            <td><%= data.get(i).getId_barang() %></td>
            <td><%= data.get(i).getNama_barang() %></td>
            <td><%= data.get(i).getQty_barang() %></td>
            <td><%= data.get(i).getHarga_barang() %></td>
            <td><%= data.get(i).getSatuan_barang() %></td>
            <td><img src="../images/barang/<%= data.get(i).getGambar_barang() %>" style="width:150px;height:150px" ></td>
            <td><%= data.get(i).getStatus() %></td>
             <td>
                <a href="../BarangController?proses=edit-barang&id=<%=data.get(i).getId_barang()%>">Edit</a>
                <a href="../BarangController?proses=hapus-barang&id=<%=data.get(i).getId_barang()%>">Hapus</a>
            </td>
        </tr>
        <% } %>
    </table>
    
    <a class="tambah" href="../BarangController?proses=input-barang">Tambah</a>
    <a class="logout" href="../BarangController?proses=logout">logout</a>

    </body>
</html>
<% } %>