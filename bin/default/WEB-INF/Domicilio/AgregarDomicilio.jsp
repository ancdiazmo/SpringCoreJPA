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
		<h3>Agregar domicilio</h3>
		
		<form action="${pageContext.request.contextPath}/Domiciliomvc/agregar" method="post">
			Ingrese la calle: <input type="text" name="calle"> <br>
			Ingrese el numero de calle: <input type="text" name="nroCalle"> <br>
			Ingrese el pais: <input type="text" name="pais"> <br>
			<input type="submit" name="guardar" value="Guardar"> <br>
		</form>
		<jsp:include page="/WEB-INF/Generales/Footer.jsp"></jsp:include>
	</body>
</html>