<%@page import="com.csa.model.Cart"%>
<%@page import="java.util.HashMap"%>
<!DOCTYPE html>
<%
  Cart shoppingCart;
        shoppingCart = (Cart) session.getAttribute("cart");
        if(shoppingCart == null){
          shoppingCart = new Cart();
          session.setAttribute("cart", shoppingCart);
        }
        session.setAttribute("cart", shoppingCart);
        HashMap<Integer, Integer> items = shoppingCart.getCartItems();
        %>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Sembako Online</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
<!--Less styles -->
   <!-- Other Less css file //different less files has different color scheam
	<link rel="stylesheet/less" type="text/css" href="themes/less/simplex.less">
	<link rel="stylesheet/less" type="text/css" href="themes/less/classified.less">
	<link rel="stylesheet/less" type="text/css" href="themes/less/amelia.less">  MOVE DOWN TO activate
	-->
	<!--<link rel="stylesheet/less" type="text/css" href="themes/less/bootshop.less">
	<script src="themes/js/less.js" type="text/javascript"></script> -->
	
<!-- Bootstrap style --> 
    <link id="callCss" rel="stylesheet" href="themes/bootshop/bootstrap.min.css" media="screen"/>
    <link href="themes/css/base.css" rel="stylesheet" media="screen"/>
<!-- Bootstrap style responsive -->	
	<link href="themes/css/bootstrap-responsive.min.css" rel="stylesheet"/>
	<link href="themes/css/font-awesome.css" rel="stylesheet" type="text/css">
<!-- Google-code-prettify -->	
	<link href="themes/js/google-code-prettify/prettify.css" rel="stylesheet"/>
<!-- fav and touch icons -->
    <link rel="shortcut icon" href="themes/images/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="themes/images/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="themes/images/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="themes/images/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="themes/images/ico/apple-touch-icon-57-precomposed.png">
	<style type="text/css" id="enject"></style>
  </head>
<body>
<div id="header">
    <div class="container"> 
    <div id="welcomeLine" class="row">
        <div class="span6"><%    if (session.getAttribute("username_p")!=null){ out.print("Welcome! "); out.print(session.getAttribute("username_p")); } %><strong> </strong></div>
        <div class="span6">
            <div class="pull-right">
            <%
                if (session.getAttribute("username_p")!=null){ %>
                    <a href="index.jsp?page=product_summary"><span class="btn btn-mini btn-primary"><i class="icon-shopping-cart icon-white"></i> [ <%= items.size() %> ] Itemes in your cart </span> </a> 
            <% } %>               
            </div>
        </div>
    </div>
<!-- Navbar ================================================== -->
    <div id="logoArea" class="navbar">
        <a id="smallScreen" data-target="#topMenu" data-toggle="collapse" class="btn btn-navbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
        </a>
        <div class="navbar-inner">
        <a class="brand" href="index.jsp?page=home">SEMBAKO ONLINE</a>
        <ul id="topMenu" class="nav pull-right">
            <li class=""><a href="index.jsp?page=special_offer">Specials Offer</a></li>
            <li class=""><a href="index.jsp?page=contact">Contact</a></li>
            <li class="">
         <% if (session.getAttribute("username_p")==null){ %>
            <a href="#login" role="button" data-toggle="modal" style="padding-right:0"><span class="btn btn-large btn-success">Login</span></a>
            <div id="login" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="login" aria-hidden="false" >
                <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal" aria-hidden="true">�</button>
                      <h3>Login Block</h3>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal loginFrm" method="post" action="LoginPembeli">
                        <div class="control-group">								
                            <input type="text" name="user" placeholder="username">
                        </div>
                        <div class="control-group">
                            <input type="password" name="pass" placeholder="Password">
                        </div>
                        <div class="control-group">
                            <label class="checkbox">
                                <input type="checkbox"> Remember me
                            </label>
                        </div>
                        <input type="submit" class="btn btn-success" value="Sign in">
			<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
                    </form>		
                </div>
            </div>
                </li> <% }else{%>   
                        <a href="PembeliController?proses=logout" role="button"  style="padding-right:0"><span class="btn btn-large btn-success"><% out.print("Logout"); %></span></a>
                <% } %>
    </ul>
  </div>
</div>
</div>
</div>
<!-- Header End====================================================================== -->
<%
 if(request.getParameter("page").equals("register"))
 {   
   String p = request.getParameter("page");
   p=p+".jsp";  
%>
  <jsp:include page="<%=p %>" />    
<%   
 } else if(request.getParameter("page").equals("special_offer"))
 {   
   String p = request.getParameter("page");
   p=p+".jsp";  
%>
  <jsp:include page="<%=p %>" />   
<% 
 }else if(request.getParameter("page").equals("contact"))
 {   
   String p = request.getParameter("page");
   p=p+".jsp";  
%>
  <jsp:include page="<%=p %>" />   
<% 
 } else if(request.getParameter("page").equals("home"))
 {   
   String p = request.getParameter("page");
   p=p+".jsp";  
%>
  <jsp:include page="<%=p %>" />   
<% 
 }else if(request.getParameter("page").equals("product_details"))
 {   
   String p = request.getParameter("page");
   p=p+".jsp";  
%>
  <jsp:include page="<%=p %>" />   
<% 
 } else if(request.getParameter("page").equals("product_summary"))
 {   
   String p = request.getParameter("page");
   p=p+".jsp";  
%>
  <jsp:include page="<%=p %>" />   
<% 
 } 
%>






<!-- Footer ================================================================== -->
	<div  id="footerSection">
	<div class="container">
		<div class="row">
			<div class="span3">
				<h5>ACCOUNT</h5>
				<a href="login.jsp">YOUR ACCOUNT</a>
				<a href="login.jsp">PERSONAL INFORMATION</a> 
				<a href="login.jsp">ADDRESSES</a> 
				<a href="login.jsp">DISCOUNT</a>  
				<a href="login.jsp">ORDER HISTORY</a>
			 </div>
			<div class="span3">
				<h5>INFORMATION</h5>
				<a href="index.jsp?page=contact">CONTACT</a>  
				<a href="index.jsp?page=register">REGISTRATION</a>  
				<a href="legal_notice.jsp">LEGAL NOTICE</a>  
				<a href="tac.jsp">TERMS AND CONDITIONS</a> 
				<a href="faq.jsp">FAQ</a>
			 </div>
			<div class="span3">
				<h5>OUR OFFERS</h5>
				<a href="#">NEW PRODUCTS</a> 
				<a href="#">TOP SELLERS</a>  
                                <a href="index.jsp?page=special_offer">SPECIAL OFFERS</a>  
				<a href="#">MANUFACTURERS</a> 
				<a href="#">SUPPLIERS</a> 
			 </div>
			<div id="socialMedia" class="span3 pull-right">
				<h5>SOCIAL MEDIA </h5>
				<a href="#"><img width="60" height="60" src="themes/images/facebook.png" title="facebook" alt="facebook"/></a>
				<a href="#"><img width="60" height="60" src="themes/images/twitter.png" title="twitter" alt="twitter"/></a>
				<a href="#"><img width="60" height="60" src="themes/images/youtube.png" title="youtube" alt="youtube"/></a>
			 </div> 
		 </div>
		<p class="pull-right">&copy; Bootshop</p>
	</div><!-- Container End -->
	</div>
<!-- Placed at the end of the document so the pages load faster ============================================= -->
	<script src="themes/js/jquery.js" type="text/javascript"></script>
	<script src="themes/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="themes/js/google-code-prettify/prettify.js"></script>
	
	<script src="themes/js/bootshop.js"></script>
    <script src="themes/js/jquery.lightbox-0.5.js"></script>
	
	<!-- Themes switcher section ============================================================================================= -->
<div id="secectionBox">
<link rel="stylesheet" href="themes/switch/themeswitch.css" type="text/css" media="screen" />
<script src="themes/switch/theamswitcher.js" type="text/javascript" charset="utf-8"></script>
	<div id="themeContainer">
	<div id="hideme" class="themeTitle">Style Selector</div>
	<div class="themeName">Oregional Skin</div>
	<div class="images style">
	<a href="themes/css/#" name="bootshop"><img src="themes/switch/images/clr/bootshop.png" alt="bootstrap business templates" class="active"></a>
	<a href="themes/css/#" name="businessltd"><img src="themes/switch/images/clr/businessltd.png" alt="bootstrap business templates" class="active"></a>
	</div>
	<div class="themeName">Bootswatch Skins (11)</div>
	<div class="images style">
		<a href="themes/css/#" name="amelia" title="Amelia"><img src="themes/switch/images/clr/amelia.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="spruce" title="Spruce"><img src="themes/switch/images/clr/spruce.png" alt="bootstrap business templates" ></a>
		<a href="themes/css/#" name="superhero" title="Superhero"><img src="themes/switch/images/clr/superhero.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="cyborg"><img src="themes/switch/images/clr/cyborg.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="cerulean"><img src="themes/switch/images/clr/cerulean.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="journal"><img src="themes/switch/images/clr/journal.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="readable"><img src="themes/switch/images/clr/readable.png" alt="bootstrap business templates"></a>	
		<a href="themes/css/#" name="simplex"><img src="themes/switch/images/clr/simplex.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="slate"><img src="themes/switch/images/clr/slate.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="spacelab"><img src="themes/switch/images/clr/spacelab.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="united"><img src="themes/switch/images/clr/united.png" alt="bootstrap business templates"></a>
		<p style="margin:0;line-height:normal;margin-left:-10px;display:none;"><small>These are just examples and you can build your own color scheme in the backend.</small></p>
	</div>
	<div class="themeName">Background Patterns </div>
	<div class="images patterns">
		<a href="themes/css/#" name="pattern1"><img src="themes/switch/images/pattern/pattern1.png" alt="bootstrap business templates" class="active"></a>
		<a href="themes/css/#" name="pattern2"><img src="themes/switch/images/pattern/pattern2.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern3"><img src="themes/switch/images/pattern/pattern3.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern4"><img src="themes/switch/images/pattern/pattern4.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern5"><img src="themes/switch/images/pattern/pattern5.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern6"><img src="themes/switch/images/pattern/pattern6.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern7"><img src="themes/switch/images/pattern/pattern7.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern8"><img src="themes/switch/images/pattern/pattern8.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern9"><img src="themes/switch/images/pattern/pattern9.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern10"><img src="themes/switch/images/pattern/pattern10.png" alt="bootstrap business templates"></a>
		
		<a href="themes/css/#" name="pattern11"><img src="themes/switch/images/pattern/pattern11.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern12"><img src="themes/switch/images/pattern/pattern12.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern13"><img src="themes/switch/images/pattern/pattern13.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern14"><img src="themes/switch/images/pattern/pattern14.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern15"><img src="themes/switch/images/pattern/pattern15.png" alt="bootstrap business templates"></a>
		
		<a href="themes/css/#" name="pattern16"><img src="themes/switch/images/pattern/pattern16.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern17"><img src="themes/switch/images/pattern/pattern17.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern18"><img src="themes/switch/images/pattern/pattern18.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern19"><img src="themes/switch/images/pattern/pattern19.png" alt="bootstrap business templates"></a>
		<a href="themes/css/#" name="pattern20"><img src="themes/switch/images/pattern/pattern20.png" alt="bootstrap business templates"></a>
		 
	</div>
	</div>
</div>

</body>
</html>