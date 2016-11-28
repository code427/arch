<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<%@ page import="java.util.HashMap"%>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">


<title>Insert title here</title>
<%HashMap<String,String> pgMap=(HashMap<String,String>) request.getAttribute("oneMap"); %>
<link href="./css/header.css" rel="stylesheet" >
</head>
<body>
<jsp:include page="rootheader.jsp" />

<form action="NewSiteDb.jsp" method="post"">
<table>
<% for(String k:pgMap.keySet()){ %>
<tr><td><%=k+":" %></td
	><td><input type="text" name="<%=k%>"></td></tr>

<%} %>
</table>
<input type="submit" value = "Submit">
</form>

</body>
</html>