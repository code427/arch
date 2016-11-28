<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<link href="https://fonts.googleapis.com/css?family=Open+Sans"
	rel="stylesheet">
<link href="./css/header.css" rel="stylesheet" >




<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Context</title>

<link href="./css/table.css" rel="stylesheet" >


</head>
<body>

	<jsp:include page="rootheader.jsp" />



		<div  id="filter">
	<form style="float:left" id="searchFields" action="/arch/Controller" method="get">
	 <input type="hidden" name="action" value="search" /> 
		<input type="text" name="ctid" placeholder="Site Id" value="<%=request.getAttribute("ctid")==null?"":request.getAttribute("ctid") %>">
		<input type="text" name="name" placeholder="Site Name" value="<%=request.getAttribute("stname")==null?"":request.getAttribute("stname") %>">  
		<input type="submit" value="Search" />	
				
		</form>


		<form  style="float:right;margin-top:1vw" action="/arch/Controller?action=newsite" method="post" >
		<input type="submit" value="New Site" />
			</form>
		</div>

		<table >
			<thead>
				<tr>
					<th>Site ID</th>
					<th>Site Name</th>
					<th>Longitude</th>
					<th>Latitude</th>
				</tr>
			</thead>
			<tbody>
		
			
			<sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/arch" user="root" password="1@9)" />

<sql:query dataSource ="${ds}" sql="select * from arch.context" var="results" />

	
			<c:forEach var="Context" items="${results.rows}" >
	<tr>
	<td><a style=" text-decoration: none;" href="/arch/contextDetail.jsp?contextid=${Context.id}" >${Context.id}</a></td>
	
	<td>${Context.name}</td>
	
					<td>123.12</td>
					<td>112.42</td>
	
	
	</tr>

			</c:forEach>
					
				
			</tbody>
			
		</table>

		<div id="pageNav" style="text-align: center;"></div>
</body>
<script src="./js/page.js"></script>
</html>