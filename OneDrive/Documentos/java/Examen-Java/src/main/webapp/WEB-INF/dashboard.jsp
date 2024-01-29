<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Libreria JSTL -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Libreria PARA FORMULARIOS - DATA BINDING -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<%@ page isErrorPage="true" %>

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
<div class="row">

<div class="col-4">
<h1> Bienvenidos,<c:out value="${usuario.userName }"></c:out>!</h1>
</div>

<div class="col-4 mx-5 pt-3">
<a href="/logout">Cerrar Sesión</a>
</div>

</div>

<h4 class=" pt-3">Tv Shows</h4>

<table class="table table-success table-striped">
			<thead>
				<tr>
					<th>Show</th>
					<th>Network</th>
					<th>Avg Rating</th>
				
				</tr>
			</thead>
			<tbody>
		<tbody>
    <c:forEach items="${shows}" var="show">
        <tr>
            <td><a href="/shows/${show.id}">${show.titulo}</a></td>
            <td>${show.red}</td>
       
               <td>${show.calcularAvg()}</td>
        
        </tr>
    </c:forEach>
</tbody>
			</tbody>

		</table>

<button  type="button" class="btn btn-success"> <a href="/shows/new" class="text-light text-decoration-none">Add a Show</a> </button>




</div>




</body>
</html>