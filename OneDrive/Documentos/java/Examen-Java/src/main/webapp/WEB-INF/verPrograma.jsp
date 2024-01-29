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
<title>Shows</title>
<!-- for Bootstrap CSS -->
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css" />
<!-- YOUR own local CSS -->
<link rel="stylesheet" href="/css/main.css" />
</head>
<body>

<div class="card  p-5">
<a class="text-end" href="/shows">Volver al panel</a>
 <div class="card-body">
   <h2><c:out value="${show.titulo }"></c:out></h2>
    <p class="card-text fs-5">Network: <c:out value="${show.red }"></c:out></p>
   
  </div></div>
  <br>
  <div class="container">
  <h2>Users who rated this show</h2>
  <table class="table table-success table-striped">
			<thead>
				<tr>
					<th>Name</th>
					<th>Rating</th>
					
				
				</tr>
			</thead>
			<tbody>
		<tbody>
    <c:forEach items="${programaAscendente}" var="show">
        <tr>
            <td> ${show.host.userName} </td>
            <td>${show.rating} </td>
        
        </tr>
    </c:forEach>
</tbody>
			</tbody>

		</table>
		   <button type="button" class="btn btn-success"><a href="/shows/${id}/edit" class="text-light text-decoration-none ">Edit</a></button> 
		<br>
		<br>
		 <div class="mb-3">
    <form action="/shows/${id}" method="post">
        <label class="form-label" for="rating">Leave a Rating:</label>
        <select class="form-control" id="rating" name="rating">
        <option value ="1">1</option>
         <option value ="2">2</option>
          <option value ="3">3</option>
           <option value ="4">4</option>
            <option value ="5">5</option>
        </select>
        <p> <c:out value="${error}"></c:out> </p>
       
        <input class="btn btn-primary" type="submit" value="Rate!">
    </form>
    </div>
			</div>
  

  
  
  
  
  

	
</body>
</html>