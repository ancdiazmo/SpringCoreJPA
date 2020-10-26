<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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