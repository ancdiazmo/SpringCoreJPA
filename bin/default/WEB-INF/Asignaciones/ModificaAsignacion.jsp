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
		<h1>Modificar Asignacion</h1>
			<form action="${pageContext.request.contextPath}/Asignacion/agregar" method="post">
				<input type="hidden" name="id" value="${asignacion.id}">
				<div class="row">
					<div class="col-md-12">
						<div class="form-group">
							<select class="custom-select d-block form-control"
							required data-error="Ingresa el tipo de turno" id="turno" name="turno">
							  <option value="DIURNO" selected>${asignacion.turno}</option>
							  <option value= "DIURNO">DIURNO</option>
							  <option value= "NOCTURNO">NOCTURNO</option>
							  <option value= "DOMINICAL">DOMINICAL</option>
							</select>
							
							<c:if test="${validaciones.turno == 'fail'}">
								<div class="text-danger">
	                               El turno es obligatorio
	                            </div>
	                        </c:if>
						</div>                                 
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<select class="custom-select d-block form-control"
							required data-error="Ingresa el alumno correspondiete" name="alumno.id">
							  <option value="${asignacion.alumno.id}" selected>${asignacion.alumno.nombre} ${asignacion.alumno.apellido} -- ${asignacion.alumno.contacto.email}</option>
							  <c:forEach var = "alumno" items="${alumnos}">
							  	<option value= "${alumno.id}">
							  	${alumno.nombre} ${alumno.apellido} -- ${alumno.contacto.email}</option>
							  </c:forEach>
							</select>
							<c:if test="${validaciones.alumno == 'fail'}">
								<div class="text-danger">
	                                El alumno es obligatorio
	                            </div>
	                        </c:if>
						</div> 
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<select class="custom-select d-block form-control"
							required data-error="Ingresa el curso" name="curso.id">
							  <option value="${asignacion.curso.id}" selected>${asignacion.curso.nombre}</option>
							  <c:forEach var = "curso" items="${cursos}">
							  	<option value= "${curso.id}">
							  	${curso.nombre}</option>
							  </c:forEach>
							</select>
							<c:if test="${validaciones.curso == 'fail'}">
								<div class="text-danger">
	                                El curso es obligatorio
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
							<a href="${pageContext.request.contextPath}/Asignacion" class="btn btn-danger" id="cancelar" name="cancelar">
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