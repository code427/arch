<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="./css/header.css" rel="stylesheet" >
<link href="./css/table.css" rel="stylesheet" >

<title>Insert title here</title>
</head>
<body>
<sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/arch" user="root" password="1@9)" />

<sql:query dataSource ="${ds}" sql="select count(*) as 'total' from formcontexttype where formid= ${param[\"formid\"]}" var="total" />

<h1><%=request.getParameter("formname") %></h1>


<table  id="formContextTable">	
<thead> <tr><th>Context Id</th>
			<th>Context Name</th>
				<th>Total</th>
					<th>Percentage</th></thead>
<tbody id="formContextTbody">
<sql:query dataSource ="${ds}" sql="select contextid,formid,count(formid) as 'total', context.name as 'contextname' from formcontexttype left join arch.context on context.id = formcontexttype.contextid where formid = ${param[\"formid\"]} group by contextid 
		order by contextid" var="results" />

	
			<c:forEach var="ContextForm" items="${results.rows}" >
	<tr>
	<td>${ContextForm.contextid}</td>
	<td>${ContextForm.name}</td>
	
	<td>${ContextForm.total}</td>
	
				
	<td><fmt:formatNumber value="${ContextForm.total/total.rows[0].total*100}" maxFractionDigits="2"/></td>
	
	</tr>

			</c:forEach>
		</tbody>
					
		</table>	

	<div id="chartDiv">
		<div style="float:left;" id="formContextChart">
		Context
		</div>
		</div>
</body>
<script src="./js/page.js"></script>
</html>