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
				<li class="nav-item active"><a class="nav-link" href="/">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="/products">Products</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="#">About</a></li>
			</ul>
			<ul class="navbar-nav ml-auto">
				<c:if test="${user == null}">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
						role="button" aria-haspopup="true" aria-expanded="false">Login
							or Register Here</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="/login">Login</a> <a
								class="dropdown-item" href="/register">Register</a>
						</div></li>
				</c:if>
				<c:if test="${user != null}">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" data-toggle="dropdown" href="#"
						role="button" aria-haspopup="true" aria-expanded="false">Hello
							${user.userName}</a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="/profile">Profile</a>
							<c:if test="${user.admin == true}">
								<a class="dropdown-item" href="/admin">Admin</a>
							</c:if>
							<div class="dropdown-divider"></div>
							<a class="dropdown-item" href="/logout">Logout</a>
						</div></li>
				</c:if>
				<form class="form-inline my-2 my-lg-0" method="get" action="/search">
					<input class="form-control mr-sm-2" type="text"
						placeholder="Search" name="term">
					<button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
				</form>
			</ul>
		</div>
	</nav>

	<!-- Carousel -->
	<div id="carouselExampleCaptions" class="carousel slide mx-auto my-3"
		data-ride="carousel" style="max-width:85%">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleCaptions" data-slide-to="0"
				class="active"></li>
			<li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
			<li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="1.jpg" class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h4 class="font-weight-bold" style="text-shadow: 2px 2px 5px black">Violin Is Cool</h4>
					<p class="font-weight-bold" style="text-shadow: 2px 2px 5px black">Wow, violin is so cool.</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="2.jpg" class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h4 class="font-weight-bold" style="text-shadow: 2px 2px 5px black">Learn To Play Music</h4>
					<p class="font-weight-bold" style="text-shadow: 2px 2px 5px black">Isn't it amazing?</p>
				</div>
			</div>
			<div class="carousel-item">
				<img src="3.jpg" class="d-block w-100" alt="...">
				<div class="carousel-caption d-none d-md-block">
					<h4 class="font-weight-bold" style="text-shadow: 2px 2px 5px black">This Could Be You</h4>
					<p class="font-weight-bold" style="text-shadow: 2px 2px 5px black">Come on, take your level to the next.</p>
				</div>
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleCaptions"
			role="button" data-slide="prev"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next" href="#carouselExampleCaptions"
			role="button" data-slide="next"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>

	<!-- Cards -->
	<div class="container py-5" id="favorites">
		<div class="row">
			<div class="col-sm">
				<div class="card border-primary mb-3 h-100"
					style="max-width: 20rem;">
					<div class="card-body">
						<img class="d-block w-100" src="1.jpg" alt="First slide">
						<h4 class="card-title py-3">Violin Lessons</h4>
						<p class="card-text">We offer violin lessons, you will be amazing!</p>
					</div>
				</div>
			</div>
			<div class="col-sm">
				<div class="card border-primary mb-3 h-100"
					style="max-width: 20rem;">
					<div class="card-body">
						<img class="d-block w-100" src="2.jpg" alt="First slide">
						<h4 class="card-title py-3">Stickers</h4>
						<p class="card-text">Cover your piano with stickers!  It will be really cool, we promise.</p>
					</div>
				</div>
			</div>
			<div class="col-sm">
				<div class="card border-primary mb-3 h-100"
					style="max-width: 20rem;">
					<div class="card-body">
						<img class="d-block w-100" src="3.jpg" alt="First slide">
						<h4 class="card-title py-3">Video Services</h4>
						<p class="card-text">We can help you make a really cool music video to become a famous person!</p>
					</div>
				</div>
			</div>
		</div>
	</div>

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