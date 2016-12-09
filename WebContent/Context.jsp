<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
		<form style="float:left;" action="/arch/Controller?action=site" method="get" >
		<input type="hidden" name="action" value="site">
		<input type="text" name="contextid"  id="ctid" placeholder="Site Id" value="<%=request.getAttribute("contextid")==null?"":request.getAttribute("contextid") %>">
		<input type="text" name="contextname" id="ctname" placeholder="Site Name" value="<%=request.getAttribute("contextname")==null?"":request.getAttribute("contextname") %>">  
				<input type="submit" value="search" />
		
		</form>


		<form  style="float:right;margin-top:ivw;" action="/arch/Controller?action=newsite" method="post" >
		<input type="submit" value="New Site" />
			</form>
		</div>

		<table >
			<thead>
				<tr>
					<th>Site ID</th>
					<th>Site Name</th>
					<th>Prof</th>
					<th>Peso</th>
				</tr>
			</thead>
			<tbody>
		
			
			<sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/arch" user="root" password="1@9)" />

<%if(request.getParameter("contextid")==null||request.getParameter("contextid").equals("")){System.out.println("hello");%><sql:query dataSource ="${ds}" sql="select * from arch.context" var="results" />
<%}else {%><sql:query dataSource ="${ds}" sql="select * from arch.context where id like '%${param.contextid}%' and name like '%${param.contextname}%'" var="results" /> <%} %>

	
			<c:forEach var="Context" items="${results.rows}" >
	<tr>
	<td>${Context.id}</td>
	
	<td><a style=" text-decoration: none;" href="/arch/contextDetail.jsp?contextid=${Context.id}" >${Context.name}</a></td>
	
					<td>${Context.prof}</td>
					<td><fmt:formatNumber value="${Context.peso}" maxFractionDigits="0"/></td>
	
	
	</tr>

			</c:forEach>
					
				
			</tbody>
			
		</table>

		<div id="pageNav" style="text-align: center;"></div>
</body>
<script src="./js/report.js"></script>
<script src="./js/page.js"></script>

</html>