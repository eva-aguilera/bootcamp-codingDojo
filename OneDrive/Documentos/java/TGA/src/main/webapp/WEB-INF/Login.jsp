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
<title>Login</title>
    <link rel="stylesheet" href="/css/Style-Login.css">
   
  	<link rel="icon" href="/CSS/img/LOGO_PROYECTO_2.0.png" type="image/png">
    <script src="https://kit.fontawesome.com/0d4176334d.js" crossorigin="anonymous"></script>
</head>
<body class="foto2">
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
            
            
                <article class="InicioSesion">
                    <div class="div-h1-main">
                        <h1 class="-h1-inicioSesion">
                            Iniciar Session
                        </h1>
                    </div>
                    <form:form action="/login" method="post" modelAttribute="login">
           <div class="label-main">
           		
                    <form:label path="email" for="exampleInputEmail1" class="email"> 
                        Correo:
                	</form:label>
                	<form:errors class="text-danger" path="email"/>
                	 <form:input path="email" type="email" class="input-email" id="exampleInputEmail1" aria-describedby="emailHelp" />
                	 
                <form:label path="password" for="exampleInputPassword1" class="password">
                    Contraseña:
                </form:label>
                <form:errors class="text-danger" path="password" />
                <form:input path="password" type="password" class="input-password" id="exampleInputEmail1" aria-describedby="emailHelp"/>
                
                   <div class="Input">
                   <button type="submit"  class="IniciarSession-button">Inicar Sesion</button>
                           
                   			<button class="IniciarSession-button" > <a class="a-button" href="/register">Registrarse</a></button>
                   
                   </div>
                           
                </div>
                
					<div>
						<p class="text-success">
							<c:out  value="${gracias}"></c:out>
						</p>
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