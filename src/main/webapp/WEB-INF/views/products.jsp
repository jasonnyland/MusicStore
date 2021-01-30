<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/flatly/bootstrap.min.css"
	integrity="sha384-qF/QmIAj5ZaYFAeQcrQ6bfVMAh4zZlrGwTPY7T/M+iTTLJqJBJjwwnsE5Y0mV7QK"
	crossorigin="anonymous">
<title>Music Store</title>
</head>

<body>

	<!-- Menu Bar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<a class="navbar-brand" href="/">Music Store</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarColor01" aria-controls="navbarColor01"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarColor01">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="/">Home <span
						class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="/products">Products</a></li>
				<li class="nav-item"><a class="nav-link" href="/cart">Cart</a>
				</li>
			</ul>

			<ul class="navbar-nav ml-auto">
				
				<c:if test="${user == null}">
					<li class="nav-item"><a class="nav-link" href="/login">Login</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="/register">Register</a>
					</li>
				</c:if>
				<c:if test="${user != null}">
					<li class="nav-item"><a class="nav-link" href="/profile">Hello
							${user.userName}</a></li>
					<li class="nav-item"><a class="nav-link" href="/logout">Logout</a>
					</li>
				</c:if>
				<form class="form-inline my-2 my-lg-0" method="get" action="/search">
					<input class="form-control mr-sm-2" type="text"
						placeholder="Search" name="term">
					<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
				</form>
			</ul>
		</div>
	</nav>

	<!-- Product Table Header -->
	<div class="px-1 py-3">
		<h5>All Products</h5>
		<p>Check out all our awesome products available now!</p>
	</div>

	<!-- Product Table -->
	<table class="table table-hover">
		<thead>
			<tr>
				<th style="width: 200px">ID</th>
				<th>Name</th>
				<th>Description</th>
				<th>Category</th>
				<th>Price</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${products}" var="prod">
				<tr>
					<td><a href="/details/${prod.id}"><img
							src="/product${prod.id}.jpg" class="img-fluid"
							style="max-height: 100px"></a></td>
					<td><a href="/details/${prod.id}">${prod.prodName}</a></td>
					<td>${prod.prodDesc}</td>
					<td>${prod.prodCat}</td>
					<td><fmt:setLocale value="en_US" /> <fmt:formatNumber
							value="${prod.prodPrice}" type="currency" /></td>
					<td><a href="/addcart/${prod.id}"><button type="button"
								class="btn btn-info btn-sm">Add to Cart</button></a></td>
				</tr>
			</c:forEach>
		</tbody>

	</table>

	<!-- Footer -->
	<footer class="footer navbar-default" role="contentinfo">
		<div class="container">
			<p class="text-center">Copyright 2021 The Internet</p>
		</div>
	</footer>


	<!-- Bootstrap Addons -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous">
    </script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous">
    </script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"
		integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF"
		crossorigin="anonymous">
    </script>
</body>

</html>