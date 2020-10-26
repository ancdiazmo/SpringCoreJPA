<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
</head>
	<body>
		<jsp:include page="/WEB-INF/Generales/Header.jsp"/>
		<h3>Modificar Alumno</h3>
		
		<form action="${pageContext.request.contextPath}/Alumno/agregar" method="post">
			<input type="hidden" name="id" value="${alumno.id}">
			<input type="hidden" name="contacto.id" value="${alumno.contacto.id}">
			<input type="hidden" name="domicilio.id" value="${alumno.domicilio.id}">
			
			<h3>Informacion de alumno</h3>
			Ingrese nombre: <input type="text" name="nombre" value="${alumno.nombre}"> <br>
			Ingrese apellido: <input type="text" name="apellido" value="${alumno.apellido}"> <br>
			
			<h3>Informacion de contacto</h3>
			Ingrese telefono: <input type="text" name="contacto.telefono" value="${alumno.contacto.telefono}"> <br>
			Ingrese email: <input type="text" name="contacto.email" value="${alumno.contacto.email}"> <br>
			
			<h3>Informacion de domicilio</h3>
			Ingrese calle: <input type="text" name="domicilio.calle" value="${alumno.domicilio.calle}"> <br>
			Ingrese nroCalle: <input type="text" name="domicilio.nroCalle" value="${alumno.domicilio.nroCalle}"> <br>
			Ingrse pais: <input type="text" name="domicilio.pais" value="${alumno.domicilio.pais}"> <br>
			
			<input type="submit" name="guardar" value="Guardar">
			<input type="submit" name="borrar" value="Borrar">
		</form>
		<jsp:include page="/WEB-INF/Generales/Footer.jsp"></jsp:include>
	</body>
</html>