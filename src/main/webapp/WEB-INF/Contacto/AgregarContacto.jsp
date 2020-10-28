<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="es">
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
</head>
	<body>
		<jsp:include page="/WEB-INF/Generales/Header.jsp"/> <br><br><br>
		<div class="container text-center">
			<h1>Agregar Contacto</h1>
			<form action="${pageContext.request.contextPath}/Contactomvc/agregar" method="post">
				<div class="row">
					<div class="col-md-12">
						<div class="form-group">
							<input type="text" class="form-control" id="email" name="email" placeholder="Email" 
							required data-error="Ingresa el email">
							
							<c:if test="${validaciones.email == 'fail'}">
								<div class="text-danger">
	                                El email es obligatorio
	                            </div>
	                        </c:if>
						</div>                                 
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<input type="text" class="form-control" id="telefono" name="telefono" placeholder="Telefono" 
							required data-error="Ingresa el telefono">
							
							<c:if test="${validaciones.telefono == 'fail'}">
								<div class="text-danger">
	                                La telefono es obligatorio
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
							<a href="${pageContext.request.contextPath}/Contactomvc" class="btn btn-danger" id="cancelar" name="cancelar">
								Cancelar
							</a>
						</div>
					</div>
				  <div class="col-md-3"></div>
				</div>            
			</form>
		</div>
		
		
		
		
		
		
		<!-- <form action="${pageContext.request.contextPath}/Contactomvc/agregar" method="post">
			Ingrese el telefono: <input type="text" name="telefono"> <br>
			Ingrese el email: <input type="text" name="email"> <br>
			<input type="submit" name="guardar" value="Guardar">
		</form> -->
		<jsp:include page="/WEB-INF/Generales/Footer.jsp"></jsp:include>
	</body>
</html>

