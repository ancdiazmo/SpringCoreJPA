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
		<a href="${pageContext.request.contextPath}/Alumno">Manejo de alumnos</a> <br> 
		<a href="${pageContext.request.contextPath}/Asignacion">Manejo de las asignaciones</a> <br>
		<a href="${pageContext.request.contextPath}/Contactomvc">Manejo de contactos</a> <br>
		<a href="${pageContext.request.contextPath}/Cursomvc">Manejo de cursos</a> <br>
		<a href="${pageContext.request.contextPath}/Domiciliomvc">Manejo de domicilios</a>
		<jsp:include page="/WEB-INF/Generales/Footer.jsp"></jsp:include>
	</body>
</html>