<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="./css/header.css" rel="stylesheet" >
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
</head>
<body>
<jsp:include page="rootheader.jsp" />

<form action="updateUserDb.jsp?userid=${param['userid']}" method="post">
<table>
<sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/arch" user="root" password="1@9)" />
<sql:query dataSource ="${ds}" sql="select * from arch.user where id= ${param[\"userid\"]}" var="user" />

<tr><td><strong>${user.rows[0].name}</strong></td><td></td></tr>

<tr><td>ZIP: </td><td><input type="text" name ="zip" value="${user.rows[0].zip}"></td></tr>
<tr><td>Telephone: </td><td><input type="text" name ="telephone" value="${user.rows[0].telephone}"></td></tr>
<tr><td>Email: </td><td><input type="text" name ="email" value="${user.rows[0].email}"></td></tr>
<tr><td>School: </td><td><input type="text" name ="school" value="${user.rows[0].school }"></td></tr>
<tr><td>Address: </td><td><input type="text" name ="address" value="${user.rows[0].address }"></td></tr>
</table>
<input type="submit" value = "Submit">
</form>


</body>
</html>