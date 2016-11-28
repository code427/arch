<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="https://fonts.googleapis.com/css?family=Open+Sans"
	rel="stylesheet">
<link href="./css/header.css" rel="stylesheet" >

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Form</title>

<link href="./css/table.css" rel="stylesheet" >

<script src="./js/page.js"></script>
</head>
<body>

	<jsp:include page="rootheader.jsp" />

		<div  id="filter">
	<form id="searchFields" action="/arch/Controller" method="get">
	 <input type="hidden" name="action" value="search" /> 
		<input type="text" name="ctid" placeholder="Site Id" value="<%=request.getAttribute("ctid")==null?"":request.getAttribute("ctid") %>">
		<input type="text" name="name" placeholder="Site Name" value="<%=request.getAttribute("stname")==null?"":request.getAttribute("stname") %>">  
		<input type="submit" value="Search" />	
		</form>
		</div>

		<table >
			<thead>
				<tr>
					<th>Form ID</th>
					<th>Form Name</th>
				</tr>
			</thead>
			
<sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/arch" user="root" password="1@9)" />

<sql:query dataSource ="${ds}" sql="select * from arch.form" var="results" />

			
		<tbody>
			<c:forEach var="form" items="${results.rows}" >
	<tr>
	<td>${form.id}</td>
	
	<td>${form.name}</td>
	</tr>

			</c:forEach>				
				</tbody>
			


		</table>

		<div id="pageNav" style="text-align: center;"></div>
</body>

</html>