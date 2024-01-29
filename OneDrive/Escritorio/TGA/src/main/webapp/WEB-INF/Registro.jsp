<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- LIBRERIA JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- LIBRERIA PARA FORMULARIOS - DATA BINDING -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ page isErrorPage="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registro</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/0d4176334d.js"
	crossorigin="anonymous"></script>
<link rel="icon" href="/img/LOGO_PROYECTO_2.0.png" type="image/png">

</head>
<body class="foto">

<header class="header">
		<div class="logo">
			<img src="/img/logo.png" alt="TGA Logo">
		</div>
		<nav>
			<ul class="nav-links">
					<li><a href="/">Inicio</a></li>
				<li><a href="/alianza">Alianzas</a></li>
				<li><a href="/crearalianza">Crear</a></li>
				<li><a href="/donar">Donar</a></li>
				<li> <a href="/eventos">Eventos</a> </li>
			</ul>
		</nav>
		<div class="container-search1">
			<div class="container-search2">
				<input type="text" placeholder="buscar...">
				<button>
					<i class="fa-solid fa-magnifying-glass"></i>
				</button>
			</div>
		</div>
			<c:choose>		
<c:when test="${usuarioActivo == null}">
		<div id="btn-sesion">
	
			<a href="/register" class="rgs">Registrarse</a> 
			<a href="login" class="rgs">Iniciar Sesión</a>
		
		</div>
			</c:when>
		<c:otherwise>
		<a href="/perfil" class="btn"><i class="fa-regular fa-user"></i></a>
		<p class="text-light mt-3 me-3"><c:out value="${usuario.userName}"/></p>
		<a href="/logout">Cerrar Sesión</a>
		</c:otherwise>
		</c:choose>	
</header>

		    <main>
           <article class="Sesion1">
            	<form:form action="/register" method="post"
					modelAttribute="registro" >
                             
                        <h1 class="h1-main">Registrarse</h1>
               

                    <div class="label-main">
                    
                        <form:label path="userName" for="exampleInputEmail1" class="nombre">
                            Nombre: 
                        
                        </form:label>
                            <form:errors class="text-danger" path="userName" />
                            <form:input path="userName" type="text" class="input-nombre" id="exampleInputEmail1" aria-describedby="emailHelp"/>
                            
                        <form:label path="edad" for="edad" class="apellido">
                        
                            Edad:
                        </form:label>
                        <form:errors class="text-danger" path="edad" />
                        <form:input path="edad" type="text" class="input-nombre" id="exampleInputEmail1" aria-describedby="emailHelp"/>
                        
						<form:label path="region" for="exampleInputEmail1"
							class="form-label">
						Región: </form:label>
						<form:errors class="text-danger" path="region" />
						<form:input path="region" type="text" class="form-control"
							id="exampleInputEmail1" aria-describedby="emailHelp" />
				
					
					<p>Provincia:</p>
					<form:select class="form-label" path="provincia">
						<c:forEach items="${provincias}" var="prov">
							<form:option label="${prov}" value="${prov}" />
						</c:forEach>
					</form:select>

				
                        
                        <form:label path="email" for="exampleInputEmail1" class="email">
    
                            Correo:

                        </form:label>
                        <form:errors class="text-danger" path="email" />
						<form:input path="email" type="email" class="input-email"
							id="exampleInputEmail1" aria-describedby="emailHelp" />

                        <form:label path="password" for="exampleInputPassword1" class="password">
                            Contraseña:
                       
                        </form:label>
                        <form:errors class="text-danger" path="password" />
						<form:input path="password" type="password" class="input-password" id="exampleInputEmail1" aria-describedby="emailHelp" />

                        <form:label path="passwordConfirmation" for="exampleInputPassword1" class="password-confirmacion">
                            Confirmacion Contraseña:
                        </form:label>
                        <form:errors class="text-danger" path="passwordConfirmation" />
						<form:input path="passwordConfirmation" type="password" class="input-password-confirmacion" id="exampleInputEmail1" aria-describedby="emailHelp" />

        				<div class="label-button">
                            <button  type="submit" class="button-form">Crear</button>
                            <button  type="submit" class="button-form" > <a class="a-button" href="/login">Ya tienes Cuenta?</a></button>
                        </div>
           
                           
                    
                        <div>
                            <p class="text-success">
                                <c:out  value="${gracias}"></c:out>
                            </p>
                        </div>
                    </div>
                  
                   
                   </form:form>
          
           </article>

    </main>
	

	

<footer>
	<div class="logos">
			<a class="icons" href="#"><i class="fa-brands fa-facebook"></i></a> 
			<a class="icons" href="#"><i class="fa-brands fa-twitter"></i></a> 
			<a class="icons" href="#"><i class="fa-brands fa-youtube"></i></a> 
			<a class="icons" href="#"><i class="fa-brands fa-instagram"></i></a>
		</div>
		<div id="link-footer">
			<ul>
				<li><a href="#">Aviso de privacidad</a></li>
				<li><a href="#">Politicas y normas</a></li>
				<li><a href="#">Consultas</a></li>
				<li><a href="#">terminos y Condiciones</a></li>
				<li><a href="#">Pagos y Donaciones</a></li>
			</ul>
		</div>
	</footer>


</body>
</html>