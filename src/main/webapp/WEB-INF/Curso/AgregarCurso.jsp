<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
</head>
	<body>
		<jsp:include page="/WEB-INF/Generales/Header.jsp"/>
		<h3>Agregar curso</h3>
		<form action="${pageContext.request.contextPath}/Cursomvc/agregar" method="post">
			Ingrese nombre: <input type="text" name="nombre"> <br>
			Ingrese precio:	<input type="number" name="precio"> <br>
			<input type="submit" name="guardar" value="Guardar">
		</form>
		<jsp:include page="/WEB-INF/Generales/Footer.jsp"></jsp:include>
	</body>
</html>