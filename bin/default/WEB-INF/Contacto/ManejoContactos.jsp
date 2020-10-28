<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h3>Manejo de contactos</h3>
<a href="${pageContext.request.contextPath}/Contactomvc/agregar">Agregar contacto</a>
<table border="1" class="table table-striped" id="tablaContactos">
	<thead class="thead-dark"> 
		<tr>
			<th id = "ID">ID</th>
			<th id = "Email">Email</th>
			<th id = "Telefono">Telefono</th>
			<th id = "Editar">Editar</th>
		</tr>
	</thead>
	<c:forEach var="contacto" items="${contactos}">
		<tr>
			<td>
				${contacto.id}	
			</td>
			<td>
				${contacto.email}
			</td>
			<td>
				${contacto.telefono}
			</td>
			<td>
				<a href="${pageContext.request.contextPath}/Contactomvc/agregar/${contacto.id}">Editar</a>
			</td>
		</tr>
	</c:forEach>
</table>

<script>
	$('#tablaContactos').DataTable();
</script>