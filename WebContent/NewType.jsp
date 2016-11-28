<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="./css/header.css" rel="stylesheet" >
</head>
<body>
<jsp:include page="rootheader.jsp" />

<form action="NewTypeDb.jsp" method="post"">
<table>
<tr>
	<td>Name: </td>
	<td><input type="text" name="name"></td>
</tr>

</table>
<input type="submit" value = "Submit">
</form>
</body>
</html>