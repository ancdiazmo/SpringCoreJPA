<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
</head>
	<body>
		<jsp:include page="/WEB-INF/Generales/Header.jsp"/>
		<h3>Modifica asignacion</h3>
		
		<form action="${pageContext.request.contextPath}/Asignacion/agregar" method="post">
		
			<input type="hidden" name="id" value="${asignacion.id}">
			<input type="hidden" name="curso.id" value="${asignacion.curso.id}">
			<input type="hidden" name="alumno.id" value="${asignacion.alumno.id}">
			<input type="hidden" name="alumno.contacto.id" value="${asignacion.alumno.contacto.id}">
			<input type="hidden" name="alumno.domicilio.id" value="${asignacion.alumno.domicilio.id}">
		
			<h3>Informacion de asignacion</h3>
			Ingrese turno: <input type="text" name="turno" value="${asignacion.turno}">
			
			<h3>Informacion de curso</h3>
			Ingrese nombre: <input type="text" name="curso.nombre" value="${asignacion.curso.nombre}">
			Ingrese precio: <input type="text" name="curso.precio" value="${asignacion.curso.precio}">
			
			<h3>Informacion de alumno</h3>
			Ingrese nombre: <input type="text" name="alumno.nombre" value="${asignacion.alumno.nombre}">
			Ingrese apellido: <input type="text" name="alumno.apellido" value="${asignacion.alumno.apellido}">
			
			<h3>Informacion de contacto</h3>
			Ingrese telefono: <input type="text" name="alumno.contacto.telefono" value="${asignacion.alumno.contacto.telefono}">
			Ingrese email: <input type="text" name="alumno.contacto.email" value="${asignacion.alumno.contacto.email}">
			
			<h3>Informacion de domicilio</h3>
			Ingrese calle: <input type="text" name="alumno.domicilio.calle" value="${asignacion.alumno.domicilio.calle}"> <br>
			Ingrese nroCalle: <input type="text" name="alumno.domicilio.nroCalle" value="${asignacion.alumno.domicilio.nroCalle}"> <br>
			Ingrese pais: <input type="text" name="alumno.domicilio.pais" value="${asignacion.alumno.domicilio.pais}"> <br>
		
			<input type="submit" name="guardar" value="Guardar">
			<input type="submit" name="borrar" value="Borrar">
		</form>
		<jsp:include page="/WEB-INF/Generales/Footer.jsp"></jsp:include>
	</body>
</html>