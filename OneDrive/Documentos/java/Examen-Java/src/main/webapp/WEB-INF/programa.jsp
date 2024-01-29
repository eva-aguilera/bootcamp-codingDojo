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
<title>Shows</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css" />
</head>
<body>
	<div class="container pt-4">

		<h2>Create a new show</h2>
		<br>
		<form:form action="/shows/new" method="post"
			modelAttribute="showsnew" class="col-">
			<form:input path="host" type="hidden" value="${usuario.id}" />

			
			<div class="mb-3">
				<form:label  path="titulo" for="exampleFormControlInput1" class="form-label">Title</form:label>
				<form:errors class="text-danger" path="titulo" />
				<form:input path="titulo" type="text" class="form-control" id="exampleFormControlInput1"/>
			</div>
			
			<div class="mb-3">
				<form:label  path="red" for="exampleFormControlInput1" class="form-label">Network</form:label>
				<form:errors class="text-danger" path="red" />
				<form:input path="red" type="text" class="form-control"  id="exampleFormControlInput1"/>
			</div>
		
		<button type="submit" class="btn btn-primary">Create</button>
		
		</form:form>

	</div>
</body>
</html>