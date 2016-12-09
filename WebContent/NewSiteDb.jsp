<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



 <%System.out.print("here"); %>
   
        <sql:setDataSource var="ds" 
        driver="com.mysql.jdbc.Driver" 
        url="jdbc:mysql://localhost/arch" 
        user="root" password="1@9)" />
        
        <sql:update dataSource="${ds}" var = "count" >
        
        insert into arch.context (unidad,capa,nivel,prof,`div`,cuad,rasgo,`name`,bolsasdemanta,paleobot,fito,soilxrf,peso,notes,chapo,obsidian_xrf,obsidian_laicpms,caladbc,`phase`,unit10) 
        values  (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);

 		
		<sql:param value="${param.Unidad}" />
		<sql:param value="${param.Capa}" />
		<sql:param value="${param.Nivel}" />
		<sql:param value="${param.Prof}" />
		<sql:param value="${param.Div}" />
		<sql:param value="${param.Cuad}" />
		<sql:param value="${param.Rasgo}" />
		<sql:param value="${param.Name}" />
		<sql:param value="${param.BolsasDeManta}" />
		<sql:param value="${param.PaleoBot}" />
		<sql:param value="${param.Fito}" />
		<sql:param value="${param.SoilXRF}" />
		<sql:param value="${param.Peso}" />
		<sql:param value="${param.notes}" />
		<sql:param value="${param.Chapo}" />
		<sql:param value="${param.Obsidian_XRF}" />
		<sql:param value="${param.Obsidian_LAICPMS}" />
		<sql:param value="${param.CalADBC}" />
		<sql:param value="${param.Phase}" />
		<sql:param value="${param.Unit10}" />
		</sql:update>

            <c:redirect url="/Controller?action=site" >
                <c:param name="susMsg" value="Congratulations ! Data inserted
            successfully." />
            </c:redirect>

</body>
</html>