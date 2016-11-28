<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost/arch" user="root" password="1@9)" />
<sql:update dataSource="${ds}" var = "count" >
 insert into arch.user (name,password )values ('1234','312');
</sql:update>
<sql:query dataSource ="${ds}" sql="select * from arch.user" var="results" />

<c:forEach var="image" items="${results.rows}" >
<p>${image.id} ${image.name}</p>
</c:forEach>
</body>
</html>