<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
</head>
	<body>
		<jsp:include page="/WEB-INF/Generales/Header.jsp"/>
		<a href="${pageContext.request.contextPath}/index">Volver</a>
		<h3>Manejador de asignaciones</h3>
		
		<a href="${pageContext.request.contextPath}/Asignacion/agregar">Agregar asignacion</a>
		<table border="1" class="table table-striped">
			<thead class="thead-dark"> 
				<tr>
					<th>ID</th>
					<th>Turno</th>
					<th>Nombre alumno</th>
					<th>Domicilio alumno</th>
					<th>telefono alumno</th>
					<th>email alumno</th>
					<th>Nombre Curso</th>
					<th>Precio curso</th>
				</tr>
			</thead>
			<c:forEach var = "asignacion" items = "${asignaciones}">
				<tr>
					<td>${asignacion.id}</td>
					<td>${asignacion.turno}</td>
					<td>${asignacion.alumno.nombre}</td>
					<td>${asignacion.alumno.domicilio.calle} - ${asignacion.alumno.domicilio.nroCalle} - ${asignacion.alumno.domicilio.pais}</td>
					<td>${asignacion.alumno.contacto.telefono}</td>
					<td>${asignacion.alumno.contacto.email}</td>
					<td>${asignacion.curso.nombre}</td>
					<td>${asignacion.curso.precio}</td>
					<td> <a href="${pageContext.request.contextPath}/Asignacion/agregar/${asignacion.id}">Editar</a>
				</tr>
			</c:forEach>
		</table>
		<jsp:include page="/WEB-INF/Generales/Footer.jsp"></jsp:include>
	</body>
</html>