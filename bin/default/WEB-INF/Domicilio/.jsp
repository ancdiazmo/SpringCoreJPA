<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<h1>Modificar domicilio</h1>
	
	<form action="${pageContext.request.contextPath}/Domiciliomvc/agregar" method="post"> 
		
		Ingrese calle: <input type="text" name="calle" value="${domicilio.calle}"> <br>
		Ingrese el Nro de calle: <input type="text" name="nroCalle" value="${domicilio.nroCalle}"> <br>
		Ingrese el pais: <input type="text" name="pais" value="${domicilio.pais}"> <br>
		
		<input type="submit" name="guardar" value="Guardar">
		<input type="submit" name="borrar" value="Borrar">
	</form>
</body>
</html>