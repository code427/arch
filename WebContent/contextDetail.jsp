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
<link href="./css/table.css" rel="stylesheet" >

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/arch" user="root" password="1@9)" />
<sql:query dataSource ="${ds}" sql="select count(*) as 'total'from formcontexttype where contextid= ${param[\"contextid\"]}" var="total" />
<sql:query dataSource ="${ds}" sql="select count(*) as 'total'from formcontexttype where contextid= ${param[\"contextid\"]}" var="totalType" />


<jsp:include page="rootheader.jsp" />
	
<button type="button" onclick="report()">Report</button>
<div style="float:right">
<button type="button" onclick="showType()">Type/Form</button>
</div>
<div id = "tableDiv">
<table  id="formTable">	
<thead> <tr><th>Form Id</th>
			<th>Form Name</th>
				<th>Total</th>
					<th>Percentage</th></thead>
<tbody id="formTbody">
<sql:query dataSource ="${ds}" sql="select contextid,formid,count(formid) as 'total', form.name from formcontexttype left join arch.form on form.id = formcontexttype.formid where contextid = ${param[\"contextid\"]} group by contextid,formid 
					order by contextid" var="results" />

	
			<c:forEach var="ContextForm" items="${results.rows}" >
	<tr>
	<td>${ContextForm.formid}</td>
	<td><a href="javascript:showSth('${ContextForm.formid}')"  >${ContextForm.name}</a></td>
	
	<td>${ContextForm.total}</td>
	
				
	<td><fmt:formatNumber value="${ContextForm.total/total.rows[0].total*100}" maxFractionDigits="2"/></td>
	
	</tr>

			</c:forEach>
		</tbody>
					
		</table>	
		
		<table  id="typeTable">	
<thead> <tr><th>Type Id</th>
			<th>Type Name</th>
				<th>Total</th>
					<th>Percentage</th></thead>
<tbody id="typeTbody">
<sql:query dataSource ="${ds}" sql="select contextid,typeid,count(typeid) as 'totalType', type.name from formcontexttype left join arch.type on type.id = formcontexttype.typeid where contextid = ${param[\"contextid\"]} group by contextid,typeid 
					order by contextid" var="results2" />

	
			<c:forEach var="ContextType" items="${results2.rows}" >
	<tr>
	<td>${ContextType.typeid}</td>
	<td><a style=" text-decoration: none;"  >${ContextType.name}</a></td>
	
	<td>${ContextType.total}</td>
	
				
	<td><fmt:formatNumber value="${ContextType.totalType/totalType.rows[0].total*100}" maxFractionDigits="2"/></td>
	
	</tr>

			</c:forEach>
		</tbody>
					
		</table>	
						<div id="pageNav" style="text-align: center;"></div>	
		
		</div>
		<div id="chartDiv">
		<div style="float:left;" id="formChart">
		Form
		</div>
		<div style="float:right;" id="typeChart">
		Type
		</div>
		</div>
		
	
</body>
<script src="./js/report.js"></script>
<script src="./js/page.js"></script>


</html>