<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Insert title here</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
</head>
	<body>
		<jsp:include page="/WEB-INF/Generales/Header.jsp"/> <br><br><br>
		<div class="container text-center">
		<h1>Modificar Alumno</h1>
			<form action="${pageContext.request.contextPath}/Alumno/agregar" method="post">
				<input type="hidden" name="id" value="${alumno.id}">
				<div class="row">
					<div class="col-md-12">
						<div class="form-group">
							<input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre del alumno" 
							required data-error="Entra el nombre del alumno" value="${alumno.nombre}">
							
							<c:if test="${validaciones.nombre == 'fail'}">
								<div class="text-danger">
	                                El nombre es obligatorio
	                            </div>
	                        </c:if>
						</div>                                 
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<input type="text" class="form-control" id="apellido" name="apellido" placeholder="Apellido" 
							required data-error="Entra el nombre del alumno" value="${alumno.apellido}">
							
							<c:if test="${validaciones.apellido == 'fail'}">
								<div class="text-danger">
	                                La especie es obligatoria
	                            </div>
	                        </c:if>
						</div>                                 
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<select class="custom-select d-block form-control"
							required data-error="Ingresa el domicilio del usuario" name="domicilio.id">
							  <option value= "${alumno.domicilio.id}" selected>calle-${{alumno.domicilio.calle}}--${{alumno.domicilio.nroCalle}}--${{alumno.domicilio.pais}}</option>
							  <c:forEach var = "domicilio" items="${domicilios}">
							  	<option value= "${domicilio.id}">
							  	calle-${{domicilio.calle}}--${{domicilio.nroCalle}}--${{domicilio.pais}}</option>
							  </c:forEach>
							</select>
							<c:if test="${validaciones.domicilio == 'fail'}">
								<div class="text-danger">
	                                El usuario es obligatorio
	                            </div>
	                        </c:if>
						</div> 
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<select class="custom-select d-block form-control"
							required data-error="Ingresa el contacto del usuario" name="contacto.id">
							  <option value= "${alumno.contacto.id}" selected>${{alumno.contacto.telefono}}-${{alumno.contacto.email}}</option>
							  <c:forEach var = "contacto" items="${contactos}">
							  	<option value= "${contacto.id}">
							  	${{contacto.telefono}}-${{contacto.email}}</option>
							  </c:forEach>
							</select>
							<c:if test="${validaciones.contacto == 'fail'}">
								<div class="text-danger">
	                                El contacto es obligatorio
	                            </div>
	                        </c:if>
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
							<a href="${pageContext.request.contextPath}/Alumno" class="btn btn-danger" id="Cancelar" name="cancelar">
								Cancelar
							</a>
						</div>
					</div>
					<div class="col-md-3"></div>
				</div>            
			</form>
		</div>
		
		<!-- <form action="${pageContext.request.contextPath}/Alumno/agregar" method="post">
			<input type="hidden" name="id" value="${alumno.id}">
			<input type="hidden" name="contacto.id" value="${alumno.contacto.id}">
			<input type="hidden" name="domicilio.id" value="${alumno.domicilio.id}">
			
			<h3>Informacion de alumno</h3>
			Ingrese nombre: <input type="text" name="nombre" value="${alumno.nombre}"> <br>
			Ingrese apellido: <input type="text" name="apellido" value="${alumno.apellido}"> <br>
			
			<h3>Informacion de contacto</h3>
			Ingrese telefono: <input type="text" name="contacto.telefono" value="${alumno.contacto.telefono}"> <br>
			Ingrese email: <input type="text" name="contacto.email" value="${alumno.contacto.email}"> <br>
			
			<h3>Informacion de domicilio</h3>
			Ingrese calle: <input type="text" name="domicilio.calle" value="${alumno.domicilio.calle}"> <br>
			Ingrese nroCalle: <input type="text" name="domicilio.nroCalle" value="${alumno.domicilio.nroCalle}"> <br>
			Ingrse pais: <input type="text" name="domicilio.pais" value="${alumno.domicilio.pais}"> <br>
			
			<input type="submit" name="guardar" value="Guardar">
			<input type="submit" name="borrar" value="Borrar">
		</form> -->
		<jsp:include page="/WEB-INF/Generales/Footer.jsp"></jsp:include>
	</body>
</html>