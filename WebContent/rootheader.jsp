
<img src="img/main_banner.png"  style= "margin-bottom: 1vw; " width="100%"  border="0">

<link href="./css/loggedin.css" rel="stylesheet" >
<%@ page import="object.User"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashMap"%>


<%
	User userinfo = (User) session.getAttribute("user");
%>

<p style="font-size:1.2vw; margin:0px;float:left;">Username: <%=userinfo.getUsername() + "  "%>User ID: <%=userinfo.getId() %>
</p>

<div style="float: right; margin-bottom: 0.5vw;">
	<form action="/arch/Controller?action=logout" method="post">
		<input style="font-size:1vw;" type="submit" value="Log Out" />
	</form>
</div>
<ul class="menu" >
	<li ><a href="/arch/Controller?action=site" >Site</a>	

</li>
	<li><a
		href="/arch/Controller?action=type">Type</a></li>
	
	<li ><a  href="/arch/Controller?action=form">Form</a>
			</li>

	<% if (userinfo.getLevel().equals("0")){ %>
	<li ><a  href="/arch/Controller?action=user">User</a>
		</li>

	<% } %>

</ul>

