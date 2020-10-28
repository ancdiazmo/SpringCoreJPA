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
		<h1>Modificar curso</h1>
			<form action="${pageContext.request.contextPath}/Cursomvc/agregar" method="post">
				<input type="hidden" name="id" value="${curso.id}">
				<div class="row">
					<div class="col-md-12">
						<div class="form-group">
							<input type="text" class="form-control" id="nombre" name="nombre" placeholder="Ingresa el nombre del curso" 
							required data-error="Ingresa el nombre del curso" value="${curso.nombre}">
							
							<c:if test="${validaciones.nombre == 'fail'}">
								<div class="text-danger">
	                                El nombre del curso es obligatorio
	                            </div>
	                        </c:if>
						</div>                                 
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<input type="text" class="form-control" id="precio" name="precio" placeholder="Ingresa el precio del curso" 
							required data-error="Ingresa el precio del curso" value="${curso.precio}">
							
							<c:if test="${validaciones.precio == 'fail'}">
								<div class="text-danger">
	                                El precio es obligatorio
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
							<a href="${pageContext.request.contextPath}/Cursomvc" class="btn btn-danger" id="cancelar" name="cancelar">
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