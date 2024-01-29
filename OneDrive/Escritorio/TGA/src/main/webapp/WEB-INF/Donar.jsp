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
<title>Donar</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css" />
<link rel="stylesheet" href="/css/pago.css" />
<script src="https://kit.fontawesome.com/0d4176334d.js" crossorigin="anonymous"></script>
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
	<br>
<br>
<br>
<div class="contenedor">

		<!-- Tarjeta -->
		<section class="tarjeta" id="tarjeta">
			<div class="delantera">
				<div class="logo-marca" id="logo-marca">
					<!-- <img src="img/logos/visa.png" alt=""> -->
				</div>
				<img src="/img/chip-tarjeta.png" class="chip" alt="">
				<div class="datos">
					<div class="grupo" id="numero">
						<p class="label">Número Tarjeta</p>
						<p class="numero">#### #### #### ####</p>
					</div>
					<div class="flexbox">
						<div class="grupo" id="nombre">
							<p class="label">Nombre Tarjeta</p>
							<p class="nombre">Jhon Doe</p>
						</div>

						<div class="grupo" id="expiracion">
							<p class="label">Expiracion</p>
							<p class="expiracion"><span class="mes">MM</span> / <span class="year">AA</span></p>
						</div>
					</div>
				</div>
			</div>

			<div class="trasera">
				<div class="barra-magnetica"></div>
				<div class="datos">
					<div class="grupo" id="firma">
						<p class="label">Firma</p>
						<div class="firma"><p></p></div>
					</div>
					<div class="grupo" id="ccv">
						<p class="label">CCV</p>
						<p class="ccv"></p>
					</div>
				</div>
				<p class="leyenda">Lorem ipsum dolor sit amet consectetur adipisicing elit. Accusamus exercitationem, voluptates illo.</p>
				<a href="#" class="link-banco">www.tubanco.com</a>
			</div>
		</section>

		<!-- Contenedor Boton Abrir Formulario -->
		<div class="contenedor-btn">
			<button class="btn-abrir-formulario" id="btn-abrir-formulario">
				<i class="fas fa-plus"></i>
			</button>
		</div>

		<!-- Formulario -->
		<form action="" id="formulario-tarjeta" class="formulario-tarjeta">
			<div class="grupo">
				<label for="inputNumero">Número Tarjeta</label>
				<input type="text" id="inputNumero" maxlength="19" autocomplete="off">
			</div>
			<div class="grupo">
				<label for="inputNombre">Nombre</label>
				<input type="text" id="inputNombre" maxlength="19" autocomplete="off">
			</div>
			<div class="flexbox">
				<div class="grupo expira">
					<label for="selectMes">Expiracion</label>
					<div class="flexbox">
						<div class="grupo-select">
							<select name="mes" id="selectMes">
								<option disabled selected>Mes</option>
							</select>
							<i class="fas fa-angle-down"></i>
						</div>
						<div class="grupo-select">
							<select name="year" id="selectYear">
								<option disabled selected>Año</option>
							</select>
							<i class="fas fa-angle-down"></i>
						</div>
					</div>
				</div>

				<div class="grupo ccv">
					<label for="inputCCV">CCV</label>
					<input type="text" id="inputCCV" maxlength="3">
				</div>
			</div>
			<button type="submit" class="btn-enviar">Enviar</button>
		</form>
	</div>

	<script src="https://kit.fontawesome.com/2c36e9b7b1.js" crossorigin="anonymous"></script>
	<script src="/js/main.js"></script>


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