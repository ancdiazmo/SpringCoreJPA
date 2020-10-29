<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	
	<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/validator.js"></script>
</head>
	<body>
		<jsp:include page="/WEB-INF/Generales/Header.jsp"/> <br><br><br>
		<div class="container text-center">
		<h1>Agregar asignacion</h1>
			<form data-toggle="validator" action="${pageContext.request.contextPath}/Asignacion/agregar" method="post">
				<div class="row">					
					<div class="col-md-12">
						<div class="form-group">
							<select class="custom-select d-block form-control" required data-error="El turno es obligatorio" id="turno" name="turno">
							  <option value="" disabled selected>Tipo de turno</option>
							  <option value= "DIURNO">DIURNO</option>
							  <option value= "NOCTURNO">NOCTURNO</option>
							  <option value= "DOMINICAL">DOMINICAL</option>
							</select>
							<div class="help-block with-errors text-danger"></div>
						</div>                                 
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<select class="custom-select d-block form-control" required data-error="El alumno es obligatorio" name="alumno.id">
							  <option value = "" disabled selected>Ingresa el alumno correspondiente</option>
							  <c:forEach var = "alumno" items="${alumnos}">
							  	<option value = "${alumno.id}">${alumno.nombre} ${alumno.apellido} -- ${alumno.contacto.email}</option>
							  </c:forEach>
							</select>
							<div class="help-block with-errors text-danger"></div>
						</div> 
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<select class="custom-select d-block form-control" required data-error="El curso es obligatorio" name="curso.id">
							  <option value = "" disabled selected>Ingresa el curso correspondiente</option>
							  <c:forEach var = "curso" items="${cursos}">
							  	<option value = "${curso.id}">${curso.nombre}</option>
							  </c:forEach>
							</select>
							<div class="help-block with-errors text-danger"></div>
						</div> 
					</div>
					
					<div class="col-md-3"></div>
					<div class="col-md-3">
						<div class="submit-button text-center">
							<button class="btn btn-success" id="guardar" name="guardar" value="guardar" type="submit">
								Guardar
							</button>
						</div>
					</div>
					<div class="col-md-3">
						<div class="submit-button text-center">
							<a href="${pageContext.request.contextPath}/Asignacion" class="btn btn-danger" id="cancelar" name="cancelar">
								Cancelar
							</a>
						</div>
					</div>
					<div class="col-md-3"></div>
				</div>            
			</form>
		</div>
		
		<!-- <form action="${pageContext.request.contextPath}/Asignacion/agregar" method="post">
			
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
		</form> -->
		<jsp:include page="/WEB-INF/Generales/Footer.jsp"></jsp:include>
	</body>
</html>