<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h3>Manejo de contactos</h3>
<a href="${pageContext.request.contextPath}/Contactomvc/agregar">Agregar contacto</a>
<table border="1" class="table table-striped">
	<thead class="thead-dark"> 
		<tr>
			<th id = "ID">ID</th>
			<th id = "Email">Email</th>
			<th id = "Telefono">Telefono</th>
		</tr>
	</thead>
	<c:forEach var="contacto" items="${contactos}">
		<tr>
			<td>
				<a href="${pageContext.request.contextPath}/Contactomvc/agregar/${contacto.id}">${contacto.id}</a>	
			</td>
			<td>
				${contacto.email}
			</td>
			<td>
				${contacto.telefono}
			</td>
		</tr>
	</c:forEach>
</table>