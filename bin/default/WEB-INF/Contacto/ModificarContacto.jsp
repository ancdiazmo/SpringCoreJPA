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
		<h1>Modificar Contacto</h1>
		<form data-toggle="validator" action="${pageContext.request.contextPath}/Contactomvc/agregar" method="post">
			<input type="hidden" name="id" value="${contacto.id}">
				<div class="row">
					<div class="col-md-12">
						<div class="form-group">
							<input type="email" class="form-control" id="email" name="email" placeholder="email" required data-error="El email es obligatorio y debe tener el formato correcto" value="${contacto.email}">
							<div class="help-block with-errors text-danger"></div>
						</div>                                 
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<input type="text" class="form-control" id="telefono" name="telefono" placeholder="Telefono" required data-error="La telefono es obligatorio" value="${contacto.telefono}">
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
							<a href="${pageContext.request.contextPath}/Contactomvc" class="btn btn-danger" id="cancelar" name="cancelar">
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