<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
</head>
	<body>
		<jsp:include page="/WEB-INF/Generales/Header.jsp"/>
		<a href="${pageContext.request.contextPath}/index">Volver</a>
		<h3>Manejador de alumnos</h3>
		<a href="${pageContext.request.contextPath}/Alumno/agregar">Agregar alumno</a>
		<table border = "1" class="table table-striped">
		<thead class="thead-dark">
			<tr>
				<th id = "ID">ID</th>
				<th id = "Nombre">Nombre</th>
				<th id = "Apellido">Apellido</th>
				<th id = "Domicilio">Domicilio</th>
				<th id = "Telefono">Telefono</th>
				<th id = "Email">Email</th>
				<th id = "Accion">Accion</th>
			</tr>
		</thead>
		<c:forEach var = "alumno" items="${alumnos}">
			<tr>
				<td>${alumno.id}</td>
				<td>${alumno.nombre}</td>
				<td>${alumno.apellido}</td>
				<td>calle ${alumno.domicilio.calle} ${alumno.domicilio.nroCalle} - ${alumno.domicilio.pais}</td>
				<td>${alumno.contacto.telefono}</td>
				<td>${alumno.contacto.email}</td>
				<td> <a href="${pageContext.request.contextPath}/Alumno/agregar/${alumno.id}">Editar</a> 
			</tr>
		</c:forEach>
		</table>
		<jsp:include page="/WEB-INF/Generales/Footer.jsp"></jsp:include>
	</body>
</html>