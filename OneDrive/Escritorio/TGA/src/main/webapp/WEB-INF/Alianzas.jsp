<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- LIBRERIA JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- LIBRERIA PARA FORMULARIOS - DATA BINDING -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!-- FORMATEO FECHAS (dates) -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<%@ page isErrorPage="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

 <title>Perfil Alianza</title>
    <link rel="stylesheet" href="/css/estilos.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css">
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="icon" href="/img/LOGO_PROYECTO_2.0.png" type="image/png">
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
    <div class="capaDivisora">
 
    </div>
    <!--Capa divisora-->

    <main>
        <div class="Container">
            
          <section class="busqueda">
            <h1> Busca tu Alianza</h1>
                <div class="container-busq">
                     <form:form action="/buscar" method="post" class="buscar">  
                         <input class="buscador" name="letras" type="text" placeholder="busca tu alianza...">
                        <button><i class="fa-solid fa-magnifying-glass"></i></button>
                         </form:form>
           
                </div>
            </section>
            <section class="text">
                <p>Elige y apoya a la Alianza que mas te represente o puedes crearla aqui: <a href="/crearalianza">Crear</a></p>
            </section>

<c:forEach items="${alianzas}" var="alianza">
            <section class="container-group">
  
                <div class="caja-alianza">
                    <img src="https://i.pinimg.com/564x/70/85/54/7085548f3d0372a08aea0291ddcee895.jpg">
                  
                    <div class="all">
                    <div class="up-part">
                        <h3><c:out value="${alianza.nombre}"></c:out> </h3>
                        <h2>Publico</h2>
                        <span>1.24k</span>
                        <i class="fa-solid fa-user-group"></i>
                    </div>
                    <div class="down-part">
                        <p><c:out value="${alianza.descripcion}"/> </p>
                           
                   
                          
                            
                            <br>
                  <c:choose>          
<c:when test="${alianza.participantes.contains(usuario)}">
  
</c:when>
<c:otherwise>

       <button class="btn btn-danger"> <a href="/Perfil/alianza/${alianza.id}">Alianzas</a></button>
</c:otherwise>
</c:choose>
                        
                    </div>
                </div>
                
                
                </div>
               
            </section>
  </c:forEach>






            <article class="seleccion">
                <span>pagina 1  </span>
                <span> <a href="#">1</a>..<a href="#">2</a>..<a href="#">3</a>..<a href="#">4</a>..<a href="#">5</a></span>
            </article>
            
        </div>
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