<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h3>Manejador de domicilios</h3>
<a href="${pageContext.request.contextPath}/Domiciliomvc/agregar">Agregar domicilio</a>
<table border="1" class="table table-striped">
	<thead class="thead-dark"> 
		<tr>
			<th id = "ID">ID</th>
			<th id = "Calle">Calle</th>
			<th id = "Nro Calle">Nro Calle</th>
			<th id = "Pais">Pais</th>
		</tr>
	</thead>
	<c:forEach var = "domicilio" items = "${domicilios}">
		<tr>
			<td> <a href="${pageContext.request.contextPath}/Domiciliomvc/agregar/${domicilio.id}">${domicilio.id}</a></td>
			<td>${domicilio.calle}</td>
			<td>${domicilio.nroCalle}</td>
			<td>${domicilio.pais}</td>
		</tr>
	</c:forEach>
</table>