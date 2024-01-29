<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <!-- Libreria JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Libreria PARA FORMULARIOS - DATA BINDING -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Detalles</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css" />
</head>
<body>
<div class="container pt-4">

		<h2>Create a new show</h2>
		<br>
		<form:form action="/shows/${id}/edit" method="put"
			modelAttribute="editarshow" >
			<form:input path="host" type="hidden" value="${usuario.id}" />

			
			<div class="mb-3">
				<form:label  path="titulo" for="exampleFormControlInput1" class="form-label">Title</form:label>
				<form:errors class="text-danger" path="titulo" />
				<form:input path="titulo" type="text" class="form-control" id="exampleFormControlInput1"/>
			</div>
			
			<div class="mb-3">
				<form:label  path="red" for="exampleFormControlInput1" class="form-label">Network</form:label>
				<form:errors class="text-danger" path="red" />
				<form:input path="red" type="text" class="form-control" id="exampleFormControlInput1"/>
			</div>
			
		
			
		<button type="submit" class="btn btn-primary">Update</button>
		
		<br>
		<br>
			
		</form:form>
<a class="btn btn-danger" href="/shows/${id}/delete" class=" text-decoration-none">Delete</a>
	</div>
</body>
</html>