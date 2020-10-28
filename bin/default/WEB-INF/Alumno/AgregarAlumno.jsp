<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
		<h3>Agregar alumno</h3>
			
			<form action="${pageContext.request.contextPath}/Alumno/agregar" method="post">
				<h3>informacion de alumno</h3>
				Ingresa nombre: <input type="text" name="nombre"> <br>
				Ingresa apellido: <input type="text" name="apellido"><br>
				
				<h3>informacion de contacto</h3>
				Ingresa telefono: <input type="text" name="contacto.telefono"><br>
				Ingresa email: <input type="text" name="contacto.email"><br>
				
				<h3>informacion de domicilio</h3>
				Ingresa calle: <input type="text" name="domicilio.calle"><br>
				Ingresa nroCalle: <input type="text" name="domicilio.nroCalle"><br>
				Ingresa pais: <input type="text" name="domicilio.pais"><br>
			
				<input type="submit" name="guardar" value="Guardar">
			</form>
			<jsp:include page="/WEB-INF/Generales/Footer.jsp"></jsp:include>
	</body>
</html>