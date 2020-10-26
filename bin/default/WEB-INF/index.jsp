<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v4.1.1">
    <title>SpringCoreJPA</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/dashboard/">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
	<link href="${pageContext.request.contextPath}/css/dashboard.css" rel="stylesheet">
	
    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    
  </head>
  <body>
    <nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
	  <a class="navbar-brand col-md-3 col-lg-2 mr-0 px-3" href="${pageContext.request.contextPath}/index">Spring Core JPA</a>
	    
	  <ul class="navbar-nav px-3">
	    <li class="nav-item text-nowrap">
	      <a class="nav-link" href="#">Salir</a>
	    </li>
	  </ul>
	</nav>

	<div class="container-fluid">
	  <div class="row">
	    <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
	      <div class="sidebar-sticky pt-3">
	        <ul class="nav flex-column">
	          
	          <li class="nav-item">
		          <c:if test="${vista == 'Alumno'}">
		          	<a class="nav-link active" href="${pageContext.request.contextPath}/Alumno">
		          </c:if>
		          
		          <c:if test="${vista != 'Alumno'}">
		          	<a class="nav-link" href="${pageContext.request.contextPath}/Alumno">
		          </c:if>       
		              
				  <span data-feather="users"></span>
	           	  Alumnos	
	           	  <span class="sr-only">(current)</span>
        		  </a>
	          </li>
	          
	          <li class="nav-item">
	          	<c:if test="${vista == 'Asignacion'}">
	          		<a class="nav-link active" href="${pageContext.request.contextPath}/Asignacion">
	          	</c:if>
	          	
	          	<c:if test="${vista != 'Asignacion'}">
	          		<a class="nav-link" href="${pageContext.request.contextPath}/Asignacion">
	          	</c:if>
	            
	            <span data-feather="layers"></span>
	            Asignaciones
	            </a>
	          </li>
	          
	          <li class="nav-item">
	          	<c:if test="${vista == 'Contacto'}">
	          		<a class="nav-link active" href="${pageContext.request.contextPath}/Contactomvc">
	          	</c:if>
	          	
	          	<c:if test="${vista != 'Contacto'}">
	          		<a class="nav-link" href="${pageContext.request.contextPath}/Contactomvc">
	          	</c:if>
	          	
	            <span data-feather="mail"></span>
	            Contacto <span class="sr-only">(current)</span>
	            </a>
	          </li>
	          
	          <li class="nav-item">
	          	<c:if test="${vista == 'Curso'}">
	          		<a class="nav-link active" href="${pageContext.request.contextPath}/Cursomvc">
	          	</c:if>
	          	
	          	<c:if test="${vista != 'Curso'}">
	          		<a class="nav-link" href="${pageContext.request.contextPath}/Cursomvc">
	          	</c:if>
	            <span data-feather="book-open"></span>
	            Curso <span class="sr-only">(current)</span>
	            </a>
	          </li>
	          
	          <li class="nav-item">
		          <c:if test="${vista == 'Domicilio'}">
		          	<a class="nav-link active" href="${pageContext.request.contextPath}/Domiciliomvc">
		          </c:if>
		          
		          <c:if test="${vista != 'Domicilio'}">
		          	<a class="nav-link" href="${pageContext.request.contextPath}/Domiciliomvc">
		          </c:if>
	            
	              <span data-feather="home"></span>
	              Domicilio <span class="sr-only">(current)</span>
	              </a>
	          </li>	   
	        </ul>
	      </div>
	    </nav>
	
	    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
	      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap 
	      align-items-center pt-3 pb-2 mb-3 border-bottom">
	        <h1 class="h2">Gestion de tablas</h1>
	        <div class="btn-toolbar mb-2 mb-md-0">
	          <div class="btn-group mr-2">
	            <button type="button" class="btn btn-sm btn-outline-secondary">Exportar excel</button>
	          </div>
	        </div>
	      </div>
	      
	      <div class="table-responsive">
	      	<c:if test="${vista == 'Alumno'}">
	      		<jsp:include page="/WEB-INF/Alumno/ManejoAlumnos.jsp"/>
	      	</c:if>
	      	<c:if test="${vista == 'Asignacion'}">
	      		<jsp:include page="/WEB-INF/Asignaciones/ManejadorAsignaciones.jsp"/>
	      	</c:if>
	      	<c:if test="${vista == 'Contacto'}">
	      		<jsp:include page="/WEB-INF/Contacto/ManejoContactos.jsp"/>
	      	</c:if>
	      	<c:if test="${vista == 'Curso'}">
	      		<jsp:include page="/WEB-INF/Curso/ManejoCursos.jsp"/>
	      	</c:if>
	      	<c:if test="${vista == 'Domicilio'}">
	      		<jsp:include page="/WEB-INF/Domicilio/ManejaDomicilio.jsp"/>
	      	</c:if>
	      </div>
	    </main>
	  </div>
	</div>
	
	
	
	  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
      <script>window.jQuery || document.write('<script src="../assets/js/vendor/jquery.slim.min.js"><\/script>')</script>
      <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.9.0/feather.min.js"></script>
      <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
      <script src="${pageContext.request.contextPath}/js/dashboard.js"></script></body>
</html>
