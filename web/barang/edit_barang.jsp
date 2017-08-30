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
        <title>Latihan Java Web </title>
    </head>
    <body>
        <center><h1>Edit User </h1></center>
        <form action="../BarangController?data=barang&proses=update-barang" method="post" enctype="multipart/form-data">
            <table style="margin:20px auto;">
            <%
                String id_barang = request.getParameter("id");
                BarangModel bm = new BarangModel();
                bm.setId_barang(Integer.parseInt(id_barang));
                List<BarangModel> data = new ArrayList<BarangModel>();
                data = bm.cariID(); 
                if (data.size() > 0) {
                    
                    
 
            %>
		<tr>
                    <td>nama</td>
                    <td><input type="text" name="nama" value="<%=data.get(0).getNama_barang()%>"></td>
		</tr>
		<tr>
                    <td>harga</td>
                    <td><input type="text" name="harga" value="<%= data.get(0).getHarga_barang()%>"></td>
		</tr>
                <tr>
                    <td>qty</td>
                    <td><input type="text" name="qty" value="<%= data.get(0).getQty_barang() %>"></td>
		</tr>
                <tr>
                    <td>satuan</td>
                    <td><input type="text" name="satuan" value="<%= data.get(0).getSatuan_barang() %>"></td>
		</tr>
                <tr>
                    <td>Gambar</td>
                    <td><input type="file" name="gambar" value="<%= data.get(0).getGambar_barang() %>"></td>
		</tr>
                <tr>
                    <td>Status</td>
                    <td><input type="text" name="status" value="<%= data.get(0).getStatus() %>"></td>
                    <input type="hidden" name="id_barang" value="<%= data.get(0).getId_barang() %>">
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