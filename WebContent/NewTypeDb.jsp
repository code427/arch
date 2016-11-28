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
 <c:if test="${empty param.name}">
            <c:redirect url="insert.jsp" >
                <c:param name="errMsg" value="Please Enter Product and Quantity" />
            </c:redirect>
 
        </c:if>
        <sql:setDataSource var="ds" 
        driver="com.mysql.jdbc.Driver" 
        url="jdbc:mysql://localhost/arch" 
        user="root" password="1@9)" />
        
        <sql:update dataSource="${ds}" var = "count" >
 		insert into arch.type (name)
 		values (?);	
		<sql:param value="${param.name}" />
	</sql:update>
        
        
 

 
            <c:redirect url="/Controller?action=type" >
            </c:redirect>
 
</body>
</html>