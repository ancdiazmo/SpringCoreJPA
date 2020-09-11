<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
</head>
	<body>
		<jsp:include page="/WEB-INF/Generales/Header.jsp"/>
		<h3>Modificar contacto</h3>
		<form action="${pageContext.request.contextPath}/Contactomvc/agregar" method="post">
			
			<input type="hidden" name="id" value="${contacto.id}">
			Ingrese el telefono: <input type="text" name="telefono" value="${contacto.telefono}"> <br>
			Ingrese el email: <input type="text" name="email" value="${contacto.email}"> <br>
			<input type="submit" value="Guardar" name="guardar">
			<input type="submit" value="Borrar" name="borrar">
		</form>
		<jsp:include page="/WEB-INF/Generales/Footer.jsp"></jsp:include>
	</body>
</html>