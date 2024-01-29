<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Libreria JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Libreria PARA FORMULARIOS - DATA BINDING -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ page isErrorPage="true"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login y Registro</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css" />
</head>
<body>

	<div class="container">
		<div class="row pt-5">

			<div class="col-6">
			<h2 class="mt-2 mb-5">Registrarte</h2>
				<form:form action="/register" method="post"
					modelAttribute="registro">
					<div class="mb-3">
						<form:label path="userName" for="exampleInputEmail1"
							class="form-label">
						Nombre: </form:label>
						<form:errors class="text-danger" path="userName" />
						<form:input path="userName" type="text" class="form-control"
							id="exampleInputEmail1" aria-describedby="emailHelp" />
					</div>
					<div class="mb-3">
						<form:label path="email" for="exampleInputEmail1"
							class="form-label">
						Email: </form:label>
						<form:errors class="text-danger" path="email" />
						<form:input path="email" type="email" class="form-control"
							id="exampleInputEmail1" aria-describedby="emailHelp" />
					</div>
					<div class="mb-3">
						<form:label path="password" for="exampleInputPassword1"
							class="form-label">
						Contraseña: </form:label>
						<form:errors class="text-danger" path="password" />
						<form:input path="password" type="password" class="form-control"
							id="exampleInputEmail1" aria-describedby="emailHelp" />
					</div>
					<div class="mb-3">
						<form:label path="passwordConfirmation"
							for="exampleInputPassword1" class="form-label">
						Confirmacion: </form:label>
						<form:errors class="text-danger" path="passwordConfirmation" />
						<form:input path="passwordConfirmation" type="password"
							class="form-control" id="exampleInputEmail1"
							aria-describedby="emailHelp" />
					</div>
					<button type="submit" class="btn btn-primary">Registrarte</button>
<br>

					<div>
						<p class="text-success">
							<c:out  value="${gracias}"></c:out>
						</p>
					</div>

				</form:form>

			</div>
			<div class="col-6">
			<h2 class="mt-2 mb-5">Iniciar Sesion</h2>
				<form:form action="/login" method="post" modelAttribute="login">
					<div class="mb-3">
						<form:label path="email" for="exampleInputEmail1"
							class="form-label">
						Email: </form:label>
						<form:errors class="text-danger" path="email" />
						<form:input path="email" type="email" class="form-control"
							id="exampleInputEmail1" aria-describedby="emailHelp" />
					</div>
					<div class="mb-3">
						<form:label path="password" for="exampleInputPassword1"
							class="form-label">
						Contraseña: </form:label>
						<form:errors class="text-danger" path="password" />
						<form:input path="password" type="password" class="form-control"
							id="exampleInputEmail1" aria-describedby="emailHelp" />
					</div>
					<button type="submit" class="btn btn-primary">Iniciar Sesion</button>
				</form:form>
			</div>

		</div>


	</div>


</body>
</html>