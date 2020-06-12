<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">
	 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
</head>
<body>
<% String messaggio = (String) request.getAttribute("messaggio"); %>
<h1>Benvenuto!</h1>
<form action="home" method="post">
 <div class="form-group">
<input type="text" class="form-control col-lg-3"  name="nome" required="required" placeholder="Nome">
</div>
 <div class="form-group">
<input type="text" class="form-control col-lg-3"  name="cognome" required="required" placeholder="Cognome">
</div>
 <div class="form-group">
<input type="number" class="form-control col-lg-3"  name="numero" required="required" placeholder="Numero Di Telefono">
</div>
<button type="submit" class="btn btn-primary btn-md">Aggiungi</button>
</form>
<% if(messaggio != null){ %>
<%=messaggio %>
<%} %>
<br>
<table class="table table-striped">
		<thead>
			<tr>
				<th>Nome</th>
				<th>Cognome</th>
				<th>Numero</th>
			</tr>
		</thead>
		<c:forEach items="${listaPersone}" var="lista"> 
			<tbody>
				<tr>
					<td><c:out value="${lista.getNome()}" /></td> 
 					<td><c:out value="${lista.getCognome()}" /></td>
 					<td><c:out value="${lista.getNumero()}" /></td>
				</tr>
		</c:forEach> 
		</tbody>
	</table>
</body>
</html>