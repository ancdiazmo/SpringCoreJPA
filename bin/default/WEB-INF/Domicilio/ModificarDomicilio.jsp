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
		<h1>Modificar domicilio</h1>
			<form action="${pageContext.request.contextPath}/Domiciliomvc/agregar" method="post">
				<input type="hidden" name="id" value="${domicilio.id}">
				<div class="row">
					<div class="col-md-12">
						<div class="form-group">
							<input type="text" class="form-control" id="calle" name="calle" placeholder="Calle" 
							required data-error="Ingresa la calle" value="${domicilio.calle}">
							
							<c:if test="${validaciones.calle == 'fail'}">
								<div class="text-danger">
	                                La calle es obligatoria
	                            </div>
	                        </c:if>
						</div>                                 
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<input type="text" class="form-control" id="nroCalle" name="nroCalle" placeholder="Numero de calle" 
							required data-error="Ingresa el numero de la calle" value="${domicilio.nroCalle}">
							
							<c:if test="${validaciones.nroCalle == 'fail'}">
								<div class="text-danger">
	                                La calle es obligatoria
	                            </div>
	                        </c:if>
						</div>                                 
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<input type="text" class="form-control" id="pais" name="pais" placeholder="Ingresa el pais" 
							required data-error="Ingresa el pais" value="${domicilio.pais}">
							
							<c:if test="${validaciones.pais == 'fail'}">
								<div class="text-danger">
	                                El pais es obligatorio
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
							<a href="${pageContext.request.contextPath}/Domiciliomvc" class="btn btn-danger" id="cancelar" name="cancelar">
								Cancelar
							</a>
						</div>
					</div>
					<div class="col-md-3"></div>
				</div>            
			</form>
		
		
		</div>
		<!-- <form action="${pageContext.request.contextPath}/Domiciliomvc/agregar" method="post">
			
			<input type="hidden" name="id" value="${domicilio.id}">
			
			Ingrese calle: <input type="text" name="calle" value="${domicilio.calle}"> <br>
			Ingrese Nro de calle: <input type="text" name="nroCalle" value="${domicilio.nroCalle}"> <br>
			Ingrese pais: <input type="text" name="pais" value="${domicilio.pais}"> <br>
			
			<input type="submit" name="guardar" value="Guardar">
			<input type="submit" name="borrar" value="Borrar">
		
		</form> -->
		<jsp:include page="/WEB-INF/Generales/Footer.jsp"></jsp:include>
	</body>
</html>