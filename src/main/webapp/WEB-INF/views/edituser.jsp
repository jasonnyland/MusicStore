<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.2/flatly/bootstrap.min.css"
integrity="sha384-qF/QmIAj5ZaYFAeQcrQ6bfVMAh4zZlrGwTPY7T/M+iTTLJqJBJjwwnsE5Y0mV7QK" crossorigin="anonymous">
	<title>Music Store</title>
</head>

<body>

	<div class="container">
		<div class="row">
			<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
				<div class="card card-signin my-5">
					<div class="card-body">
						<h5 class="card-title text-center my-3">Profile</h5>
						<form:form class="form-signin" modelAttribute="form">
							<div class="form-label-group my-1">
								<form:label path="userEmail">Email address</form:label>
								<form:input path="userEmail" type="email" class="form-control" value="${form.userEmail}" />
							</div>
							<div class="form-label-group my-1">
								<form:label path="userPass" for="inputPassword">Password</form:label>
								<form:input path="userPass" type="password" class="form-control" value="${form.userPass}" />
							</div>
							<hr class="my-4">
							<div class="form-label-group my-1">
								<form:label path="userName">Full Name</form:label>
								<form:input path="userName" type="text" class="form-control" value="${form.userName}" />
							</div>
							<div class="form-label-group my-1">
								<form:label path="userPhone">Phone Number</form:label>
								<form:input path="userPhone" type="text" class="form-control" value="${form.userPhone}" />
							</div>
							<div class="form-label-group my-1">
								<form:label path="userStreet1">Street Address</form:label>
								<form:input path="userStreet1" type="text" class="form-control" value="${form.userStreet1}" />
							</div>
							<div class="form-label-group my-1">
								<form:label path="userStreet2">Address Line 2 (Apt #, Unit #, etc)</form:label>
								<form:input path="userStreet2" type="text" class="form-control" value="${form.userStreet2}" />
							</div>
							<div class="form-label-group my-1">
								<form:label path="userCity">City</form:label>
								<form:input path="userCity" type="text" class="form-control" value="${form.userCity}" />
							</div>
							<div class="form-label-group my-1">
								<form:label path="userState">State</form:label>
								<form:input path="userState" type="text" class="form-control" value="${form.userState}" />
							</div>
							<div class="form-label-group my-1">
								<form:label path="userCountry">Country</form:label>
								<form:input path="userCountry" type="text" class="form-control" value="${form.userCountry}" />
							</div>
							
							<button class="btn btn-lg btn-primary btn-block mt-5" type="submit">Save Changes</button>
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- Bootstrap Addons -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous">
	</script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous">
	</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js"
		integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous">
	</script>
</body>

</html>