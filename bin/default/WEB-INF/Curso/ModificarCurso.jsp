<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
</head>
	<body>
		<jsp:include page="/WEB-INF/Generales/Header.jsp"/>
		<h3>Modificar curso</h3>
		<form action="${pageContext.request.contextPath}/Cursomvc/agregar" method="post">
			<input type="hidden" name="id" value="${curso.id}">
			Ingrese un nombre: <input type="text" name="nombre" value="${curso.nombre}"> <br>
			Ingrese un precio: <input type="number" name="precio" value="${curso.precio}"> <br>
			<input type="submit" name="guardar" value="Guardar">
			<input type="submit" name="borrar" value="Borrar">
		</form>
		<jsp:include page="/WEB-INF/Generales/Footer.jsp"></jsp:include>
	</body>
</html>