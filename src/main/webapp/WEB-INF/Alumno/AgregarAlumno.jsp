<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
</head>
	<body>
		<jsp:include page="/WEB-INF/Generales/Header.jsp"/> <br><br><br>
		<div class="container text-center">
		<h1>Ingresar Alumno</h1>
			<form action="${pageContext.request.contextPath}/Alumno/agregar" method="post">
				<div class="row">
					<div class="col-md-12">
						<div class="form-group">
							<input type="text" class="form-control" id="nombre" name="nombre" placeholder="Nombre del alumno" 
							required data-error="Entra el nombre del alumno">
							
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
							required data-error="Entra el nombre del alumno">
							
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
							  <option disabled selected>Ingresa el domicilio del usuario</option>
							  <c:forEach var = "domicilio" items="${domicilios}">
							  	<option value= "${domicilio.id}">
							  	calle-${domicilio.calle}--${domicilio.nroCalle}--${domicilio.pais}</option>
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
							  <option disabled selected>Ingresa el contacto del usuario</option>
							  <c:forEach var = "contacto" items="${contactos}">
							  	<option value= "${contacto.id}">
							  	${contacto.telefono}-${contacto.email}</option>
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