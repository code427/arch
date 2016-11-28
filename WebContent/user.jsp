<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Management</title>

<link href="./css/header.css" rel="stylesheet" >
<link href="./css/table.css" rel="stylesheet" >
 <script src="./js/page.js"></script> 
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
</head>
<body>
<jsp:include page="rootheader.jsp" />
<p/>


<button type="button"  style="font-size:1vw;" id="createUserA" onclick="location.href = '/arch/createuser.jsp';" >Create New User</button>

<table border=1 >

<thead>
<tr>
<th>User ID</th>
<th>User Name</th>
<th>School</th>
<th>Telephone</th>
<th>Email</th>
<th>Level</th>
<th>Action</th>
</tr>
</thead>

<tbody>
<sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/arch" user="root" password="1@9)" />

<sql:query dataSource ="${ds}" sql="select * from arch.user" var="results" />
<c:forEach var="user" items="${results.rows}" >
	<tr>
	<td><a style=" text-decoration: none;" href="/arch/updateUser.jsp?userid=${user.id}" > ${user.id}</a></td>
	
	<td>${user.name}</td>
	<td>${user.school}</td>
	<td>${user.telephone}</td>
	<td>${user.email}</td>
	<td>${user.level}</td>
	<td><button type="submit" style="font-size:1vw;" onclick="return validate(this,${user.id}) ">Delete</button></td>
	
	</tr>

		</c:forEach>	
</tbody>


</table>
	<div id="pageNav" style=" text-align: center;"></div>
</body>
	
<script>
function validate(form,id) {
	
	    if (confirm("Are you sure you want to delete this user?") == true) {
	    	window.location.replace('/arch/deleteUser.jsp?userid='+id) }
}
</script>
</html>