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
		<h3>Agregar contacto</h3>
		<form action="${pageContext.request.contextPath}/Contactomvc/agregar" method="post">
			Ingrese el telefono: <input type="text" name="telefono"> <br>
			Ingrese el email: <input type="text" name="email"> <br>
			<input type="submit" name="guardar" value="Guardar">
		</form>
		<jsp:include page="/WEB-INF/Generales/Footer.jsp"></jsp:include>
	</body>
</html>

