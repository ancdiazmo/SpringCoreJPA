<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
</head>
	<body>
		<jsp:include page="/WEB-INF/Generales/Header.jsp"/>
		<a href="${pageContext.request.contextPath}/index">Volver</a>
		<h3>Manejo cursos</h3>
		
		<a href="${pageContext.request.contextPath}/Cursomvc/agregar">Agrega curso</a>
		<table border="1" class="table table-striped">
			<thead class="thead-dark"> 
				<tr>
					<th id = "ID">ID</th>
					<th id = "Nombre">Nombre</th>
					<th id = "Precio">Precio</th>
				</tr>
			</thead>
			<c:forEach var="curso" items="${cursos}">
				<tr>
					<td>
					 	<a href="${pageContext.request.contextPath}/Cursomvc/agregar/${curso.id}">${curso.id}</a> 
					</td>
					<td>
						${curso.nombre} 
					</td>
					<td>
						${curso.precio} 
					</td>
				</tr>
			</c:forEach>
		</table>
		<jsp:include page="/WEB-INF/Generales/Footer.jsp"></jsp:include>
	</body>
</html>