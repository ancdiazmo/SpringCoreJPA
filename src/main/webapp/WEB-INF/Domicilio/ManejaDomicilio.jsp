<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h3>Manejador de domicilios</h3>
<a href="${pageContext.request.contextPath}/Domiciliomvc/agregar">Agregar domicilio</a>
<table border="1" class="table table-striped" id="tablaDomicilio">
	<thead class="thead-dark"> 
		<tr>
			<th id = "ID">ID</th>
			<th id = "Calle">Calle</th>
			<th id = "Nro Calle">Nro Calle</th>
			<th id = "Pais">Pais</th>
			<th id = "Editar">Editar</th>
		</tr>
	</thead>
	<c:forEach var = "domicilio" items = "${domicilios}">
		<tr>
			<td>${domicilio.id}</td>
			<td>${domicilio.calle}</td>
			<td>${domicilio.nroCalle}</td>
			<td>${domicilio.pais}</td>
			<td><a href="${pageContext.request.contextPath}/Domiciliomvc/agregar/${domicilio.id}">Editar</a></td>
		</tr>
	</c:forEach>
</table>

<script>
	$('#tablaDomicilio').DataTable();
</script>