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
				<li class="nav-item"><a class="nav-link" href="/products">Products</a>
				</li>
				<li class="nav-item active"><a class="nav-link" href="/cart">Cart</a>
				</li>
			</ul>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="/login">Login</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="/register">Register</a>
				</li>
			</ul>
		</div>
	</nav>

	<!-- Product Table Header -->
	<div class="px-1 py-3">
		<h4>Checkout</h4>
		<p>Please confirm your order to purchase:</p>
	</div>

	<!-- Product Table -->


	<div class="card mx-3 px-3 my-3 py-3">
		<div class="row">
			<div class="col">
				<h5>Ship To:</h5>
				${user.userName} <br /> ${user.userStreet1} <br />
				${user.userStreet2} <br /> ${user.userCity}, ${user.userState} <br />
				${user.userCountry}
			</div>
			<div class="col">
				<h5>Bill To:</h5>
				${user.userName} <br /> ${user.userStreet1} <br />
				${user.userStreet2} <br /> ${user.userCity}, ${user.userState} <br />
				${user.userCountry}
			</div>
		</div>
		<div class="row">
			<div class="container my-3 px-0 border">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Name</th>
							<th scope="col">Description</th>
							<th scope="col">Price</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${cart}" var="prod">
							<tr>
								<td>${prod.id}</td>
								<td>${prod.prodName}</td>
								<td>${prod.prodDesc}</td>
								<td><fmt:setLocale value="en_US" /> <fmt:formatNumber
										value="${prod.prodPrice}" type="currency" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="container text-right">
					<p class="mx-3">

						<span> Total: <fmt:setLocale value="en_US" /> <fmt:formatNumber
								value="${total}" type="currency" />
						</span>
					</p>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col">
			<a href="/cart"><button type="button"
						class="btn btn-danger">Back To Cart</button></a>
			</div>
			<div class="col">
				<a href="/confirm"><button type="button"
						class="btn btn-success float-right">
						Confirm Order
						<fmt:setLocale value="en_US" />
						<fmt:formatNumber value="${total}" type="currency" />
					</button></a>
			</div>
		</div>
	</div>

	<!-- Action Buttons -->



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