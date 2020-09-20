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
		<h3>Modificar domicilio</h3>
		
		<form action="${pageContext.request.contextPath}/Domiciliomvc/agregar" method="post">
			
			<input type="hidden" name="id" value="${domicilio.id}">
			
			Ingrese calle: <input type="text" name="calle" value="${domicilio.calle}"> <br>
			Ingrese Nro de calle: <input type="text" name="nroCalle" value="${domicilio.nroCalle}"> <br>
			Ingrese pais: <input type="text" name="pais" value="${domicilio.pais}"> <br>
			
			<input type="submit" name="guardar" value="Guardar">
			<input type="submit" name="borrar" value="Borrar">
		
		</form>
		<jsp:include page="/WEB-INF/Generales/Footer.jsp"></jsp:include>
	</body>
</html>