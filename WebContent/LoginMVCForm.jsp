<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
<script language="JavaScript" type="text/javascript">
window.history.forward(1);
</script>
<%
	//clear cache
   response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0"); 
   response.addHeader("Pragma", "no-cache"); 
   response.addDateHeader ("Expires", 0);
   %>
<SCRIPT type="text/javascript">
    window.history.forward();
    function noBack() { window.history.forward(); }
</SCRIPT>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
<link href="./css/login.css" rel="stylesheet" >



</head>
<body  onload="noBack();" >

<img src="img/main_banner.png"  style= "margin-bottom: 1vw; " width="100%"  border="0">

<div style="text-align: center;">
</div>
<div class="login-page">


  <div class="form">
<p style="color: red;"><% if( request.getAttribute("dbmessage")!=null)out.print(request.getAttribute("dbmessage")); %></p>  
<form action="/arch/Controller?action=dologin" method="post" >


Username: <br><input type="text" name="username" value=""/>
<br>
Password: <br><input type="password" name="password" value="" />
<p/>
<input type="submit" value="Login" />

</form>
</div>
</div>


</body>
</html>