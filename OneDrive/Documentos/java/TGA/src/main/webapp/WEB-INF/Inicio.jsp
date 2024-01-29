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
<title>Home</title>

<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
    <script src="https://kit.fontawesome.com/0d4176334d.js" crossorigin="anonymous"></script>
<script src="/js/homa.js"></script>
<link rel="stylesheet" href="/css/stylo.css">
<link rel="icon" href="/img/LOGO_PROYECTO_2.0.png" type="image/png">
</head>
<body >

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

	<!--Main-->
    <div class="carrusel-container">
        <div class="carrusel">
            <div class="slide">
                <img src="/img/portada1.jpg" alt="Imagen 1">
                <div class="caption"></div>
            </div>
            <div class="slide">
                <img src="/img/portada2.jpg" alt="Imagen 2">
                <div class="caption"></div>
            </div>
            <div class="slide">
                <img src="/img/portada3.jpg" alt="Imagen 3">
                <div class="caption"></div>
            </div>
        </div>
    </div>
    <div class="Container">
        <section class="Main-legs">
            <h2>Nuestro Objetivo</h2>
            <div class="cont-info">
                <p>
                    Target Green Alliance es un proyecto 
                    que trata de apoyar los ODS y que se 
                    cumpla la agenda 2030, como sabemos 
                    esto no es facil, habra deficultades 
                    y tambien obstaculos que no permitan 
                    que fluya de la manera correcta
                </p>
                <img src="/img/LOGO_PROYECTO_2.0.png">
            </div>
            <p>
                Las Alianzas y los lideres haran la mision de buscar,
                 encontrar y avisar o hacer algo al respecto a los 
                 obtaculos y posibles antagonistas para la agenda 2030.
                  Los heroes son personas comprometidas  que apoyan y 
                  finanzan muchas veces para que los objetivos se cunplan,
                  personas comprometidas con la tierra y un pensamiento verde. 
            </p>
            <div id="polo">
                <p>TGA…nuestra meta es cumplir con un
                    liderazgo verde</p>

            </div>
        </section>



            <section class="Main-torso">
                <h3>Tematicas de alianza</h3>
                <div class="tematica">
                    <div class="grid-container">
                        <div class="grid-item">
                            <article>
                                <div class="overlayy">
                                    <p class="centered-text">Industriales</p>
                                </div>
                                <img  src="/img/industria.jpg" alt="hola">
                                <img src="/img/hombreindustrial.png" alt="hola">
                            </article>                        
                        </div>  
                    

                        <div class="grid-item">
                            <article class="igual">
                                <div class="overlayy">
                                    <p class="centered-text">Igualdad de genero</p>
                                </div>
                                <img  src="/img/igualdadGenero.jpg" alt="hola">
                                <img  src="/img/igualdadgenereke.png" alt="hola">
                            </article>   
                        </div>
                        <div class="grid-item">
                            <article>
                                <div class="overlayy">
                                    <p class="centered-text">Cuidado del planeta</p>
                                </div>
                                <img  src="/img/basura.jpg" alt="hola">
                                <img src="/img/mujerbasura.png" alt="hola">
                            </article>
                        </div>
                        <div class="grid-item">
                            <article>
                                <div class="overlayy">
                                    <p class="centered-text">Empresarial</p>
                                </div>
                                <img  src="/img/empresarial.jpg" alt="hola">
                                <img src="/img/hombre-empresa.png" alt="hola">
                            </article>
                        </div>
                        <div class="grid-item">
                            <article>
                                <div class="overlayy">
                                    <p class="centered-text">Igualdad Social</p>
                                </div>
                                <img  src="/img/fondosocial.jpg" alt="hola">
                                <img src="/img/1705047709462.png" alt="hola">
                            </article>
                        </div>
                        <div class="grid-item">
                            <article>
                                <div class="overlayy">
                                    <p class="centered-text">Ideas Verdes</p>
                                </div>
                                <img  src="/img/fondoee.jpg" alt="hola">
                                <img src="/img/loquita.png" alt="hola">
                            </article>
                        </div>
                      </div>
                </div>
            </section>

            <section class="Main-neck"> 
                <div class="descripcion">
                    <div id="heroes">
                        <h3>Alianzas y Heroes</h3>
                        <p>Los Heroes son usuarios que siguen a los
                            Lideres mediante alianzas para poder avanzar
                            en los planes de desarrollo sostenible ODS</p>
                            <h4>si quieres apoyar y ayudar buscar tu alianza <a href="/alianza">aqui</a> </h4>
                    </div>
                    <div id="lideres">
                        <h3>Alianzas y Lideres</h3>
                        <p>Los lideres son usuarios que crean  alianzas en donde ayudan a que los obtaculos no interfieran 
                            en los planes de desarrollo sostenible ODS
                            </p>
                            <h4>si quieres crear una alianza y  ser lider <a href="#">aqui</a></h4>
                    </div>
                </div>
            </section>

            <section class="clases ODS">
                <div class="cont-odss">

                </div>

            </section>

            <section class="Main-footer">
                <div class="box-ods">   
                    <p>Los Objetivos de Desarrollo Sostenible 
                        u Objetivos Globales son 17 objetivos
                         globales interconectados diseñados
                          para ser un «plan para lograr un futuro
                           mejor y más sostenible para todos».
                           ​Los ODS fueron establecidos en 2015 
                           por la Asamblea General de las Naciones
                            Unidas y se pretende alcanzarlos para 2030..
                            <span>si quiere saber mas <a href="#">aqui</a></span>
                        </p>
                        <img src="/img/ods.png">

                </div>
            </section>
    </div>
    <section class="Main-head">

        <div class="donadores-cont">
            <h2>Donadores Destacados!</h2>

            <div id="img-donate">
                <div class="image-container" id="image1" onmouseover="showOverlay('image1')" onmouseout="hideOverlay('image1')">
                    <img class="fotoD" src="/img/disney logo.png" alt="Descripción de la imagen 1">
                    <div class="overlay">
                        <p>1.12$</p>
                    </div>
                </div>
            
                <div class="image-container" id="image2" onmouseover="showOverlay('image2')" onmouseout="hideOverlay('image2')">
                    <img class="fotoD" src="/img/wwfLogo.png" alt="Descripción de la imagen 2">
                    <div class="overlay">
                        <p>2.43$</p>
                    </div>
                </div>
            
                <div class="image-container" id="image3" onmouseover="showOverlay('image3')" onmouseout="hideOverlay('image3')">
                    <img class="fotoD" src="/img/apple.png" alt="Descripción de la imagen 3">
                    <div class="overlay">
                        <p>1.234$</p>
                    </div>
                </div>

            </div>
        </div>
    </section>
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