<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- LIBRERIA JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- LIBRERIA PARA FORMULARIOS - DATA BINDING -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ page isErrorPage="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Perfil Alianza</title>
<link rel="icon" href="/img/LOGO_PROYECTO_2.0.png" type="image/png">
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/estilito.css" />
 <script src="/js/script.js"></script>
<script src="https://kit.fontawesome.com/0d4176334d.js" crossorigin="anonymous"></script>
</head>
<body>

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
		<a href="/logout" class="btn-cr"><i class="fa-solid fa-user"></i></a>
		</c:otherwise>
		</c:choose>	
		


		
	</header>
	<div class="capaDivisora"></div>

   <main>
 
        <div class="Container">

            <div class="container-head">
                <div id="img-titulo">
                
            
                <img src="<c:out value="${alianza.imgRoute}" />">
                
            
               
                   <h2> <c:out value="${alianza.nombre}"/> </h2>
                </div>   
                <div id="logos">
                   <h6>Lider : <c:out value="${usuario.userName}"></c:out> </h6>
               
                  <span class="iconos" ><i class="fa-brands fa-instagram"></i></span>  
               <span class="iconos" ><i class="fa-brands fa-facebook"></i></span>     
                <span class="iconos" ><i class="fa-brands fa-youtube"></i></span>    
            
                </div>
                <div class="lider-icons">
 
                    <button><a href="/donar">Donar</a></button> <button><a href="#">Reportar</a></button>  <button class="btn btn-primary"><a href="/alianza/${alianza.id}/unirse">Unirse</a></button>
                </div>
            </div>
            
            <section class="container-desc">
                <h2>Descripcion:</h2>
                <div class="descripcion">
                    
                    <p>
                        <c:out value="${alianza.descripcion}"/>
                    </p>
                    
                    <div id="cont-info">
                     <div id="info">
                        <h2 id="mononoke">tipo:  <span>publico</span> <span>1.24k</span><i class="fa-regular fa-user"></i></h2>
                    </div>
      <div id="like">
    <c:choose>
        <c:when test="${alianza.participantes.contains(usuario)}">
             <button class="btts"><i class="fa-solid fa-thumbs-down"></i>
                <a href="/likes/${alianza.id}/notlike"></a>
            </button>
            <button class="btt"><i class="fa-solid fa-thumbs-up"></i>
                <a href="/likes/${alianza.id}/like"></a>
            </button>
        </c:when>
        <c:otherwise>
       
        </c:otherwise>
    </c:choose>
</div>
      
                    </div>
                </div>
            </section>

            <container class="caja-comentario">
                <div class="comment-box">
                    <div class="comments" id="comments">
                      <!-- Aquí se mostrarán los comentarios -->
                    </div>
                    <div class="input-box">
                      <img src="/img/usuario.png" alt="Mi Foto de Perfil" class="user-avatar">
                      <div class="input-container">
                        <input type="text" id="commentInput" placeholder="Escribe tu comentario aquí">
                        <button onclick="addComment()">Enviar</button>
                      </div>
                    </div>
                  </div>

            </container>

        </div>


     </main>
	    <!--Footer-->
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