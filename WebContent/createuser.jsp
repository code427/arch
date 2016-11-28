<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="./css/header.css" rel="stylesheet" >
</head>

<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">

<link href="./css/login.css" rel="stylesheet" >

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Create User</title>
<script type="text/javascript">
function match() {
    var x, text;
   
    x = document.getElementsByName("password")[0].value;
    y = document.getElementsByName("verifypassword")[0].value;
    z = document.getElementsByName("username")[0].value;
    if(z==null||z==''){
    	alert("Please enter username");
    	return false;
    }
    else if(x==null||x==''){
    	alert("Please enter password");
    	return false;
    }
    else if (x==''||x!=y) {
       	alert("Password does not match");
    	return false;
    }     
}
</script>
</head>
<body>
<jsp:include page="rootheader.jsp" />

<div class="login-page">
  <div class="form">
  
<p style="color: red;"><%=request.getAttribute("message")==null?"":request.getAttribute("message") %></p>
<form action="/arch/Controller" onsubmit="return match()" method="post" >
<% if (request.getAttribute("userId")==null) { %>
<input type="hidden" name="action" value="docreateuser"/>
<%} else { %>
<input type="hidden" name="action" value="doupdateuser"/>
<%} %>
Username: <br><input type="text" name="username" <%if(request.getAttribute("userName")==null) { %> value="" <%} else { %> value="<%=request.getAttribute("userName") %>"  readonly<%} %>  maxlength="30"/>
<br>
Password: <br><input type="text" name="password" value="" />
<br>
Verify Password: <br><input type="text" name="verifypassword" value="" />
<br>
<input type="submit" value="Submit" />
</form>
</div>
</div>

</body>
</html>