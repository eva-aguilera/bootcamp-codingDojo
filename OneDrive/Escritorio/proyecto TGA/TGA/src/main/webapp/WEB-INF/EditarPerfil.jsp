<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- LIBRERIA JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- LIBRERIA PARA FORMULARIOS - DATA BINDING -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TargetGreenAlliance/Perfil</title>
<!--Fuente Google Form: UnifrakturCook-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=UnifrakturCook:wght@700&display=swap"
	rel="stylesheet">
<!--Fuente Google Form: Cairo Play-->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Cairo+Play:wght@700&display=swap"
	rel="stylesheet">
	<link rel="icon" href="/img/LOGO_PROYECTO_2.0.png" type="image/png">

<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/style_perfil.css" />



</head>
<body>
	<header>
		<h1>TargetGreenAlliance</h1>
		<nav>
			<ul>
				<li><a href="/">| Inicio |</a></li>
				<li><a href="/Editar/Perfil">| Editar Perfil |</a></li>
				<li><a href="#">| Donaciones |</a></li>
			</ul>
		</nav>
	</header>

	  <section>
        <h2>Perfil</h2>
            <aside>
                <div class="Bloque_General">
                    <container class="Menu_Superior">
                    <img class= "avatar" src="./img/avatarmarge.jpg">
                        <div class="info">
                        <h3 class = "nombre"> <c:out value="${usuario.userName}"/> </h3>
                        <p class = "fecha"><fmt:formatDate value="${usuario.createdAt}"
											pattern="MMMM dd, yyyy" var="fechaFormateada" /> <c:out
											value="${fechaFormateada}"></c:out></p>
                        </div>
                    </container>
                    
                    <container class="info_usuario">
                    	<form:form action="/Editar/Perfil" method="post"
			modelAttribute="nuevoperfil" class="col-">
			
			<form:input path="id" type="hidden" value="${usuario.id}" />
                    
                        <p>Edad:
                        <form:label path="edad"></form:label>
						<form:errors class="text-danger" path="edad" />
						<form:input path="edad" type="text"/>
						</p>
                        
                        <p>Region:
                        <form:label path="region"></form:label>
						<form:errors class="text-danger" path="region" />
						<form:input path="region" type="text"/>
                         </p>
                        <p>Provincia: 
                        <form:label path="provincia"></form:label>
						<form:errors class="text-danger" path="provincia" />
						<form:input path="provincia" type="text"/>
                        </p>
                        <p>Correo: <c:out value="${usuario.email}"/></p>
                        <p>Asignado a: <c:out value="${usuario.lider}"/></p>
                       	<button type="submit" class="btn btn-primary">Editar</button>
                      </form:form> 
                    </container>
                   
                </div>
            </aside>
        </section>

	<footer>
		<p>Pie de página ©2024</p>
	</footer>
</body>
</html>