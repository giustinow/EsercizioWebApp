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
<div class="form-group">
<h1 style="text-align: center">Benvenuto!</h1>
</div>
<div class="form-group">
<form action="home" method="post" class="col-lg-6 offset-lg-3 ">
 <div class="row justify-content-center">
<input type="text" class="form-control col-lg-3"  name="nome" required="required" placeholder="Nome">
<input type="text" class="form-control col-lg-3"  name="cognome" required="required" placeholder="Cognome">
<input type="number" pattern=".{10}" class="form-control col-lg-3"  name="numero" required="required" placeholder="Numero Di Telefono">
<button type="submit" class="btn btn-danger btn-md">Aggiungi</button>
</div>
</form>
</div>
<% if(messaggio !=null){ %>
<h4 style="text-align: center; color:red"><%=messaggio %></h4>
<%}%>
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