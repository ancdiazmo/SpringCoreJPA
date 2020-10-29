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
		<h1>Modificar Alumno</h1>
			<form data-toggle="validator" action="${pageContext.request.contextPath}/Alumno/agregar" method="post">
				<input type="hidden" name="id" value="${alumno.id}">
				<div class="row">
					<div class="col-md-12">
						<div class="form-group">
							<input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre del alumno" 
							required data-error="El nombre es obligatorio" value="${alumno.nombre}">
							<div class="help-block with-errors text-danger"></div>
						</div>                                 
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<input type="text" class="form-control" id="apellido" name="apellido" placeholder="Apellido" 
							required data-error="La especie es obligatoria" value="${alumno.apellido}">
							<div class="help-block with-errors text-danger"></div>
						</div>                                 
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<select class="custom-select d-block form-control" required data-error="Ingresa el domicilio del usuario" name="domicilio.id">
							  <option selected value = "${alumno.domicilio.id}">calle-${{alumno.domicilio.calle}}--${{alumno.domicilio.nroCalle}}--${{alumno.domicilio.pais}}</option>
							  <c:forEach var = "domicilio" items="${domicilios}">
							  	<option value= "${domicilio.id}">calle-${{domicilio.calle}}--${{domicilio.nroCalle}}--${{domicilio.pais}}</option>
							  </c:forEach>
							</select>
							<div class="help-block with-errors text-danger"></div>
						</div> 
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<select class="custom-select d-block form-control" required data-error="Ingresa el contacto del usuario" name="contacto.id">
							  <option selected value = "${alumno.contacto.id}">${{alumno.contacto.telefono}}-${{alumno.contacto.email}}</option>
							  <c:forEach var = "contacto" items="${contactos}">
							  	<option value = "${contacto.id}">${{contacto.telefono}}-${{contacto.email}}</option>
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
							<a href="${pageContext.request.contextPath}/Alumno" class="btn btn-danger" id="cancelar" name="cancelar">
								Cancelar
							</a>
						</div>
					</div>
					<div class="col-md-3"></div>
				</div>            
			</form>
		</div>
		<jsp:include page="/WEB-INF/Generales/Footer.jsp"></jsp:include>
	</body>
</html>