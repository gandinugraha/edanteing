<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.csa.model.BarangModel"%>
<!DOCTYPE html>


<div id="carouselBlk">
	<div id="myCarousel" class="carousel slide">
		<div class="carousel-inner">
		  <div class="item active">
		  <div class="container">
			<a href=""><img style="width:100%" src="themes/images/carousel/1.png" alt="special offers"/></a>
			<div class="carousel-caption">
				  <h4>Second Thumbnail label</h4>
				  <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                        </div>
		  </div>
		  </div>
		  <div class="item">
		  <div class="container">
			<a href=""><img style="width:100%" src="themes/images/carousel/2.png" alt=""/></a>
				<div class="carousel-caption">
				  <h4>Second Thumbnail label</h4>
				  <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
				</div>
		  </div>
		  </div>
		  <div class="item">
		  <div class="container">
			<a href=""><img src="themes/images/carousel/3.png" alt=""/></a>
			<div class="carousel-caption">
				  <h4>Second Thumbnail label</h4>
				  <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
				</div>
			
		  </div>
		  </div>
		   <div class="item">
		   <div class="container">
			<a href=""><img src="themes/images/carousel/4.png" alt=""/></a>
			<div class="carousel-caption">
				  <h4>Second Thumbnail label</h4>
				  <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
				</div>
		   
		  </div>
		  </div>
		   <div class="item">
		   <div class="container">
			<a href=""><img src="themes/images/carousel/5.png" alt=""/></a>
			<div class="carousel-caption">
				  <h4>Second Thumbnail label</h4>
				  <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
			</div>
		  </div>
		  </div>
		   <div class="item">
		   <div class="container">
			<a href=""><img src="themes/images/carousel/6.png" alt=""/></a>
			<div class="carousel-caption">
				  <h4>Second Thumbnail label</h4>
				  <p>Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget metus. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
				</div>
		  </div>
		  </div>
		</div>
		<a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
		<a class="right carousel-control" href="#myCarousel" data-slide="next">&rsaquo;</a>
	  </div> 
</div>
<div id="mainBody">
	<div class="container">
	<div class="row">
           <%@include file="sidebar.jsp" %>
		<div class="span9">		
			<div class="well well-small">
			<h4>Featured Products <small class="pull-right">200+ featured products</small></h4>
			<div class="row-fluid">
			<div id="featured" class="carousel slide">
			<div class="carousel-inner">
			  <div class="item active">
			  <ul class="thumbnails">
                              <%    
                                BarangModel cm = new BarangModel();
                                List<BarangModel> data2 = new ArrayList<BarangModel>();
                                data2 = cm.view();
                                for (int i = 0; i < 4; i++) {
                                    
                            %>
				<li class="span3">
				  <div class="thumbnail">
				  <i class="tag"></i>
                                  <a href="index.jsp?page=product_details&id=<%= data2.get(i).getId_barang() %>"><img src="images/barang/<%=  data2.get(i).getGambar_barang() %>" alt="" style="height:200px"></a>
					<div class="caption">
					  <h5><%= data2.get(i).getNama_barang() %></h5>
					  <h4><a class="btn" href="product_details.jsp">VIEW</a> <span class="pull-right">Rp<%= data2.get(i).getHarga_barang() %></span></h4>
					</div>
				  </div>
				</li>
                            <% } %>
				
			  </ul>
			  </div>
			   <div class="item">
			  <ul class="thumbnails">
				<li class="span3">
				  <div class="thumbnail">
				  <i class="tag"></i>
					<a href="product_details.jsp"><img src="themes/images/products/5.jpg" alt=""></a>
					<div class="caption">
					  <h5>Product name</h5>
					  <h4><a class="btn" href="product_details.jsp">VIEW</a> <span class="pull-right">$222.00</span></h4>
					</div>
				  </div>
				</li>
				<li class="span3">
				  <div class="thumbnail">
				  <i class="tag"></i>
					<a href="product_details.jsp"><img src="themes/images/products/6.jpg" alt=""></a>
					<div class="caption">
					  <h5>Product name</h5>
					  <h4><a class="btn" href="product_details.jsp">VIEW</a> <span class="pull-right">$222.00</span></h4>
					</div>
				  </div>
				</li>
				<li class="span3">
				  <div class="thumbnail">
					<a href="product_details.jsp"><img src="themes/images/products/7.jpg" alt=""></a>
					<div class="caption">
					  <h5>Product name</h5>
					   <h4><a class="btn" href="product_details.jsp">VIEW</a> <span class="pull-right">$222.00</span></h4>
					</div>
				  </div>
				</li>
				<li class="span3">
				  <div class="thumbnail">
					<a href="product_details.jsp"><img src="themes/images/products/8.jpg" alt=""></a>
					<div class="caption">
					  <h5>Product name</h5>
					   <h4><a class="btn" href="product_details.jsp">VIEW</a> <span class="pull-right">$222.00</span></h4>
					</div>
				  </div>
				</li>
			  </ul>
			  </div>
			   <div class="item">
			  <ul class="thumbnails">
				<li class="span3">
				  <div class="thumbnail">
					<a href="product_details.jsp"><img src="themes/images/products/9.jpg" alt=""></a>
					<div class="caption">
					  <h5>Product name</h5>
					  <h4><a class="btn" href="product_details.jsp">VIEW</a> <span class="pull-right">$222.00</span></h4>
					</div>
				  </div>
				</li>
				<li class="span3">
				  <div class="thumbnail">
					<a href="product_details.jsp"><img src="themes/images/products/10.jpg" alt=""></a>
					<div class="caption">
					  <h5>Product name</h5>
					  <h4><a class="btn" href="product_details.jsp">VIEW</a> <span class="pull-right">$222.00</span></h4>
					</div>
				  </div>
				</li>
				<li class="span3">
				  <div class="thumbnail">
					<a href="product_details.jsp"><img src="themes/images/products/11.jpg" alt=""></a>
					<div class="caption">
					  <h5>Product name</h5>
					   <h4><a class="btn" href="product_details.jsp">VIEW</a> <span class="pull-right">$222.00</span></h4>
					</div>
				  </div>
				</li>
				<li class="span3">
				  <div class="thumbnail">
					<a href="product_details.jsp"><img src="themes/images/products/1.jpg" alt=""></a>
					<div class="caption">
					  <h5>Product name</h5>
					   <h4><a class="btn" href="product_details.jsp">VIEW</a> <span class="pull-right">$222.00</span></h4>
					</div>
				  </div>
				</li>
			  </ul>
			  </div>
			   <div class="item">
			  <ul class="thumbnails">
				<li class="span3">
				  <div class="thumbnail">
					<a href="product_details.jsp"><img src="themes/images/products/2.jpg" alt=""></a>
					<div class="caption">
					  <h5>Product name</h5>
					  <h4><a class="btn" href="product_details.jsp">VIEW</a> <span class="pull-right">$222.00</span></h4>
					</div>
				  </div>
				</li>
				<li class="span3">
				  <div class="thumbnail">
					<a href="product_details.jsp"><img src="themes/images/products/3.jpg" alt=""></a>
					<div class="caption">
					  <h5>Product name</h5>
					  <h4><a class="btn" href="product_details.jsp">VIEW</a> <span class="pull-right">$222.00</span></h4>
					</div>
				  </div>
				</li>
				<li class="span3">
				  <div class="thumbnail">
					<a href="product_details.jsp"><img src="themes/images/products/4.jpg" alt=""></a>
					<div class="caption">
					  <h5>Product name</h5>
					   <h4><a class="btn" href="product_details.jsp">VIEW</a> <span class="pull-right">$222.00</span></h4>
					</div>
				  </div>
				</li>
				<li class="span3">
				  <div class="thumbnail">
					<a href="product_details.jsp"><img src="themes/images/products/5.jpg" alt=""></a>
					<div class="caption">
					  <h5>Product name</h5>
					   <h4><a class="btn" href="product_details.jsp">VIEW</a> <span class="pull-right">$222.00</span></h4>
					</div>
				  </div>
				</li>
			  </ul>
			  </div>
			  </div>
			  <a class="left carousel-control" href="#featured" data-slide="prev">?</a>
			  <a class="right carousel-control" href="#featured" data-slide="next">?</a>
			  </div>
			  </div>
		</div>
		<h4>Lastest Products </h4>
			<ul class="thumbnails">
                            <%    
                                BarangModel bm = new BarangModel();
                                List<BarangModel> data = new ArrayList<BarangModel>();
                                data = bm.view();
                                for (int i = 0; i < data.size(); i++) {
                                    
                            %>
                           
                                <li class="span3">
                                    <% if (session.getAttribute("username_p")!=null){  %> 
                                    <form action="AddtoCart" method="GET">
                                  <div class="thumbnail">
                                      <a  href="index.jsp?page=product_details&id=<%= data.get(i).getId_barang() %>"><img src="images/barang/<%= data.get(i).getGambar_barang() %>" style="width:200px;height:200px" alt=""/></a>
                                        <div class="caption">
                                            <h5><%= data.get(i).getNama_barang() %></h5>                                       
                                            <h4 style="text-align:center"><a class="btn" href="index.jsp?page=product_details&id=<%= data.get(i).getId_barang() %>"> <i class="icon-zoom-in"></i></a> 
                                                <input type="hidden" name="id" value="<%= data.get(i).getId_barang() %>"><input type="hidden" name="qty" value="1">
                                                <input type="submit" value="Add to" class="btn">
                                            <a class="btn btn-primary" href="#">Rp.<%= data.get(i).getHarga_barang() %></a></h4>
                                        </div>
                                  </div>
                                </form>
                              <% } else {%>
                                    <div class="thumbnail">
                                      <a  href="index.jsp?page=product_details&id=<%= data.get(i).getId_barang() %>"><img src="images/barang/<%= data.get(i).getGambar_barang() %>" style="width:200px;height:200px" alt=""/></a>
                                        <div class="caption">
                                            <h5><%= data.get(i).getNama_barang() %></h5>                                       
                                            <h4 style="text-align:center"><a class="btn" href="index.jsp?page=product_details&id=<%= data.get(i).getId_barang() %>"> <i class="icon-zoom-in"></i></a> 
                                                <input type="hidden" name="id" value="<%= data.get(i).getId_barang() %>"><input type="hidden" name="qty" value="1">
                                                <a href="index.jsp?page=register"><button class="btn">Add to</button> </a>
                                            <a class="btn btn-primary" href="#">Rp.<%= data.get(i).getHarga_barang() %></a></h4>
                                        </div>
                                  </div>
                                
                              <% } %>
                                </li>	
                            
                            <% } %>
                        </ul>	
                <hr>
                    <h4>Top Seller </h4>
			 <ul class="thumbnails">
				<li class="span3">
				  <div class="thumbnail">
					<a  href="product_details.jsp"><img src="themes/images/products/6.jpg" alt=""/></a>
					<div class="caption">
					  <h5>Product name</h5>
					  <p> 
						Lorem Ipsum is simply dummy text. 
					  </p>
					 
					  <h4 style="text-align:center"><a class="btn" href="product_details.jsp"> <i class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to <i class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#">$222.00</a></h4>
					</div>
				  </div>
				</li>
			  </ul>
                <hr>
                    <h4>Top Rated </h4>
			 <ul class="thumbnails">
				<li class="span3">
				  <div class="thumbnail">
					<a  href="product_details.jsp"><img src="themes/images/products/6.jpg" alt=""/></a>
					<div class="caption">
					  <h5>Product name</h5>
					  <p> 
						Lorem Ipsum is simply dummy text. 
					  </p>
					 
					  <h4 style="text-align:center"><a class="btn" href="product_details.jsp"> <i class="icon-zoom-in"></i></a> <a class="btn" href="#">Add to <i class="icon-shopping-cart"></i></a> <a class="btn btn-primary" href="#">$222.00</a></h4>
					</div>
				  </div>
				</li>
			  </ul>
		</div>
		</div>
	</div>
</div>

	