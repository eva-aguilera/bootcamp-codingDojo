
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
<meta charset="ISO-8859-1">
<title>Crear un Evento</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/estilo.css" />
<script src="https://kit.fontawesome.com/0d4176334d.js" crossorigin="anonymous"></script>
<script src="/js/vida.js"></script>
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
        <a href="/perfil" class="btn"><i class="fa-regular fa-user"></i></a>
        <p class="text-light"><c:out value="${usuario.userName}"/></p>
		<a href="/logout" class="btn-cr"><i class="fa-solid fa-user"></i></a>
    </header>
    <div class="capaDivisora">
 
    </div>
    <!--MAIN CONTENT-->

        <div class="Titulo">
                <div id="seccion1">
                <h1>Crea tu Alianza</h1>
                </div>
        </div>
    <main>
            <aside>
                 <div class="aside1">
                        <form:form action="/crearalianza" method="post"
				modelAttribute="nuevoevento" class="col-" enctype="multipart/form-data" >
				<form:input path="host" type="hidden" value="${usuario.id}" />
				
				<p> <c:out value="${error}"></c:out> </p>
				
                     <h4> Nombre  </h4>
                
                     <div  class="nombre">
                        <form:label  path="nombre" for="nombre" ></form:label>
                        <form:errors class="text-danger" path="nombre" />
                        <form:input path="nombre" type="text" placeholder="nombre de la alianza..." id="nombre"/>
                     </div>

                          <h4> proposito  </h4>
                     <div class="nombre">
                             <form:label path="proposito" for="proposito" ></form:label>
                             <form:errors class="text-danger" path="proposito" />
                             <form:input path="proposito" type="text" placeholder="cual sera el proposito" id="proposito"/>
                     </div>

                   	 <h4> Descripcion  </h4>
  					<div class="nombre">
                             <form:label path="descripcion" for="proposito" ></form:label>
                             <form:errors class="text-danger" path="descripcion" />
                             <form:input path="descripcion" type="text" placeholder="cual sera el proposito" id="proposito"/>
                     </div>
                      <h4> Su eleccion sera:  </h4>
                     <div>
                      <label for="public" ></label>
                     <select class="selecionar" name="" id="public">
                        <option value="">publico</option>
                        <option value="">Privado(por invitacion)</option>
                    </select>
                     </div>

                 
<br>
 <label>
                        <input type="checkbox">
                     </label>
                     <h3> acepta lo terminos de servicio?</h3>
             <div class="aside2">
                    <h1>   Suba su Foto de Logo: </h1>
                    <div class="drop-area">
                        <h2>Arrastra y sube tu foto</h2>
                        <span></span>
                        <button>selecciona tu archivo
                        <input type="file" class="form-control " name="postFile">
                        </button>
                       
                    </div>
                    <div id="preview"></div>
                </div>
<br>
                     <input class="enviar" type="submit">
                </form:form>
                <br>
                             <button class="btn btn-dark"><a class="text-light text-decoration-none" href="/Crear/Evento">Crea un evento</a></button>   
                
                 </div>
            </aside>
        
            <aside>
             
            </aside>
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