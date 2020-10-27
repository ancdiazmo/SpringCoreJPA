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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard.css">
	
	<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery.dataTables.css">
	<script src="${pageContext.request.contextPath}/js/jquery.dataTables.js"></script>
	
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
	<jsp:include page="/WEB-INF/Generales/Header.jsp"></jsp:include>
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
	  </div>
	    <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
	      <br><br><br>
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
	<jsp:include page="/WEB-INF/Generales/Footer.jsp"></jsp:include>
	</body>
	
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script>window.jQuery || document.write('<script src="../assets/js/vendor/jquery.slim.min.js"><\/script>')</script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.9.0/feather.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.3/Chart.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/dashboard.js"></script>
</html>
