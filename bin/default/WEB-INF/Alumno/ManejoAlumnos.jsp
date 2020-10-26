<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h3>Alumnos</h3>
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