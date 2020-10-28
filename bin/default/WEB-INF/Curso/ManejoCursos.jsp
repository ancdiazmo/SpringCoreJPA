<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h3>Manejo cursos</h3>

<a href="${pageContext.request.contextPath}/Cursomvc/agregar">Agrega curso</a>
<table border="1" class="table table-striped" id="tablaCursos">
	<thead class="thead-dark"> 
		<tr>
			<th id = "ID">ID</th>
			<th id = "Nombre">Nombre</th>
			<th id = "Precio">Precio</th>
			<th id = "Editar">Editar</th>
		</tr>
	</thead>
	<c:forEach var="curso" items="${cursos}">
		<tr>
			<td>
			 	${curso.id}
			</td>
			<td>
				${curso.nombre} 
			</td>
			<td>
				${curso.precio} 
			</td>
			<td>
				<a href="${pageContext.request.contextPath}/Cursomvc/agregar/${curso.id}">Editar</a> 
			</td>
		</tr>
	</c:forEach>
</table>

<script>
	$('#tablaCursos').DataTable();
</script>