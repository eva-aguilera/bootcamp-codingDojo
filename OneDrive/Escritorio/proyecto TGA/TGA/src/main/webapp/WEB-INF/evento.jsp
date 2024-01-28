
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
		<a href="/logout">Cerrar Sesión</a>
    </header>
    <div class="capaDivisora">
 
    </div>
    <!--MAIN CONTENT-->

        <div class="Titulo">
                <div id="seccion1">
                <h1>Crea tu Evento</h1>
                </div>
        </div>
    <main>
            <aside>
                 <div class="aside1">
                       	<div class="row">
			<form:form action="/Crear/Evento" method="post"
				modelAttribute="evento" class="col-" enctype="multipart/form-data" >
				<form:input path="host" type="hidden" value="${usuario.id}" />

				<div class="mb-3">
					<form:label path="nombreEvento" for="exampleInputEmail1"
						class="form-label">
						Nombre: </form:label>
					<form:errors class="text-danger" path="nombreEvento" />
					<form:input path="nombreEvento" type="text" class="form-control"
						id="exampleInputEmail1" aria-describedby="emailHelp" />
				</div>
					<div class="mb-3">
					<form:label path="info" for="exampleInputEmail1"
						class="form-label">
						Información sobre el evento: </form:label>
					<form:errors class="text-danger" path="info" />
					<form:input path="info" type="text" class="form-control"
						id="exampleInputEmail1" aria-describedby="emailHelp" />
				</div>
				<div class="mb-3">
					<form:label path="fechaEvento" for="exampleInputEmail1"
						class="form-label">
						Date: </form:label>
					<form:errors class="text-danger" path="fechaEvento" />
					<form:input path="fechaEvento" type="date" class="form-control"
						id="exampleInputEmail1" aria-describedby="emailHelp" />
				</div>
				<div class=" row mb-3">
					<div class="col-8">
						<form:label path="locacion" for="exampleInputPassword1"
							class="form-label">
						Location: </form:label>
						<form:errors class="text-danger" path="locacion" />
						<form:input path="locacion" type="text" class="form-control"
							id="exampleInputEmail1" aria-describedby="emailHelp" />
					</div>
					<div class="col-4">
					<h6>Provincia:</h6>
						<form:select class="form-label" path="provincia">
							<c:forEach items="${provincias}" var="prov">
								<form:option label="${prov}" value="${prov}" />
							</c:forEach>
						</form:select>

					</div>
					
<div class="col-4 mt-3"><input type="file" class="form-control " name="postFile"></div>
				</div>
				<button type="submit" class="btn btn-dark">Crear Evento</button>
			</form:form>

		</div>
             
                <br>
                         
                
                 </div>
            </aside>
        
            <aside>
                <div class="aside2">
                    <h1>   Suba su Foto de Logo: </h1>
                    <div class="drop-area">
                        <h2>Arrastra y sube tu foto</h2>
                        <span></span>
                        <button>selecciona tu archivo</button>
                        <input type="file" name="" id="input-file" hidden multiple>
                    </div>
                    <div id="preview"></div>
                </div>
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