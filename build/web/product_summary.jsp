
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.csa.model.BarangModel"%>
<%@page import="com.csa.model.Cart"%>
<%@page import="java.util.HashMap"%>
<div id="mainBody">
	<div class="container">
	<div class="row">
<!-- Sidebar ================================================== -->
	 <%@include file="sidebar.jsp" %>
<!-- Sidebar end=============================================== -->
	<div class="span9">
    <ul class="breadcrumb">
		<li><a href="index.html">Home</a> <span class="divider">/</span></li>
		<li class="active"> SHOPPING CART</li>
    </ul>
            	
	<h3>  SHOPPING CART [ <small><%= items.size() %> Item(s) </small>]<a href="index.jsp?page=home" class="btn btn-large pull-right"><i class="icon-arrow-left"></i> Continue Shopping </a></h3>	
	<hr class="soft"/>
		
	
	<table class="table table-bordered">
              <thead>
                <tr>
                  <th>Product</th>
                
                  <th>Quantity</th>
				  <th>Price</th>
                  <th>Status</th>
                  <th>Total</th>
                  <th>Remove</th>
            </tr>
              </thead>
              <tbody> 
                <%  
                int total=0;
            for(Integer key: items.keySet()){
                BarangModel bm = new BarangModel();
                bm.setId_barang(key);
                List<BarangModel> data = new ArrayList<BarangModel>();
                data = bm.cariID(); 
                if (data.size() > 0) {
            %>
                    <tr>
                        <td> <img width="60" src="images/barang/<%= data.get(0).getGambar_barang() %>" alt=""/></td>
                        <td> <%= 	items.get(key) %> </td>
                        <td>Rp. <%= data.get(0).getHarga_barang() %></td>
                        <td><%= data.get(0).getStatus() %></td>
                        <td>Rp.<%=  data.get(0).getHarga_barang()*items.get(key) %></td>
                        <td><a href="AddtoCart?proses=remove&id=<%= key %>"><button class="btn-danger">Remove</button></a></td>
                            
                    </tr>
                    <%    
                        total = data.get(0).getHarga_barang()*items.get(key) + total;
                         }   
                            } 
                    
                    %>
                    </tbody>
                    <tr>
                        <td >Total Pembelian </td>
                        <td colspan="5"><p align="right" style="margin-right: 87px">Rp.<%= total  %></p></td>
                    </tr>
                </table>
		
		
            
			
			
	<a href="products.html" class="btn btn-large"><i class="icon-arrow-left"></i> Continue Shopping </a>
	<a href="login.html" class="btn btn-large pull-right">Next <i class="icon-arrow-right"></i></a>
	
</div>
</div></div>
</div>
