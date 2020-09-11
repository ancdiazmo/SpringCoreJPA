<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bottstrap.js"></script>
</head>
	<body>
		<jsp:include page="/WEB-INF/Generales/Header.jsp"/>
		<h3>Agregar asignacion</h3>
		<form action="${pageContext.request.contextPath}/Asignacion/agregar" method="post">
			
			<h3>Informacion de asignacion</h3>
			Ingrese el turno: <input type="text" name="turno"> <br>
			
			<h3>Informacion de curso</h3>
			Ingrese nombre: <input type="text" name="curso.nombre"> <br>
			Ingrese precio: <input type="number" name="curso.precio"> <br>
			
			<h3>Informacion de Alumno</h3>
			Ingrese el nombre: <input type="text" name="alumno.nombre"> <br>
			Ingrese el apellido: <input type="text" name="alumno.apellido"> <br>
			
			<h3>Informacion de contacto</h3>
			Ingrese el telefono: <input type="text" name="alumno.contacto.telefono"> <br>
			Ingrese el email: <input type="text" name="alumno.contacto.email"> <br>
			
			<h3>Informacion de domicilio</h3>
			Ingrese la calle: <input type="text" name="alumno.domicilio.calle"> <br>
			Ingrese el nroCalle: <input type="text" name="alumno.domicilio.nroCalle"> <br>
			Ingrese el pais: <input type="text" name="alumno.domicilio.pais"> <br>
			
			<input type="submit" name="guardar" value="Guardar">
		</form>
		<jsp:include page="/WEB-INF/Generales/Footer.jsp"></jsp:include>
	</body>
</html>