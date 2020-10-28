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
		<h1>Agregar Domicilio</h1>
			<form action="${pageContext.request.contextPath}/Domiciliomvc/agregar" method="post">
				<div class="row">
					<div class="col-md-12">
						<div class="form-group">
							<input type="text" class="form-control" id="calle" name="calle" placeholder="Calle" 
							required data-error="Ingresa la calle">
							
							<c:if test="${validaciones.calle == 'fail'}">
								<div class="text-danger">
	                                La calle es obligatoria
	                            </div>
	                        </c:if>
						</div>                                 
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<input type="text" class="form-control" id="nroCalle" name="nroCalle" placeholder="Numero de la calle" 
							required data-error="Entra el numero de la calle">
							
							<c:if test="${validaciones.calle == 'fail'}">
								<div class="text-danger">
	                                La especie es obligatoria
	                            </div>
	                        </c:if>
						</div>                                 
					</div>
					<div class="col-md-12">
						<div class="form-group">
							<input type="text" class="form-control" id="pais" name="pais" placeholder="Ingresa el pais" 
							required data-error="Ingresa el pais correspondiente">
							
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
		<jsp:include page="/WEB-INF/Generales/Footer.jsp"></jsp:include>
	</body>
</html>