<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>Sign up</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link rel="icon" type="image/png" href="<c:url value='/resources/img/icons/favicon.ico' /> "/>
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/vendor/bootstrap/css/bootstrap.min.css' /> ">
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/fonts/font-awesome-4.7.0/css/font-awesome.min.css' /> ">
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/fonts/iconic/css/material-design-iconic-font.min.css' /> ">
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/vendor/animate/animate.css' /> ">
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/vendor/css-hamburgers/hamburgers.min.css' /> ">
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/vendor/animsition/css/animsition.min.css' /> ">
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/vendor/select2/select2.min.css' /> ">
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/vendor/daterangepicker/daterangepicker.css' /> ">
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/util.css' /> ">
	<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/main.css' /> ">
	
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<form:form class="login100-form validate-form" method="post" action="signup">
					<span class="login100-form-title p-b-26">
						DaWallet
					</span>

					<form:hidden path="id" />
					
					<div class="wrap-input100" data-validate = "Enter name">
						<form:input class="input100" path="nombre" type="text" />
						<span class="focus-input100" data-placeholder="Name"></span>
					</div>
					
					<div class="wrap-input100 validate-input" data-validate = "Enter user">
						<form:input class="input100" path="usuario" type="text" />
						<span class="focus-input100" data-placeholder="User"></span>
					</div>
					
					<div class="wrap-input100 validate-input" data-validate="Enter password">
						<span class="btn-show-pass">
							<i class="zmdi zmdi-eye"></i>
						</span>
						<form:input class="input100" path="password" type="password" />
						<span class="focus-input100" data-placeholder="Password"></span>
					</div>
					
					<div class="wrap-input100 validate-input" data-validate = "Valid email is: a@b.c">
						<form:input class="input100" path="email" type="text" />
						<span class="focus-input100" data-placeholder="E-mail"></span>
					</div>
					
					<div class="wrap-input100 validate-input" data-validate = "Enter DNI">
						<form:input class="input100" path="dni" type="text" />
						<span class="focus-input100" data-placeholder="DNI"></span>
					</div>

					<div class="container-login100-form-btn">
						<div class="wrap-login100-form-btn">
							<div class="login100-form-bgbtn"></div>
							<button class="login100-form-btn" type="submit">
								Sign up
							</button>
						</div>
					</div>

					<div class="text-center p-t-115">
						<span class="txt1">
							You have an account?
						</span>

						<a class="txt2" href="/proyecto-final-web/login">
							Log in
						</a>
					</div>
				</form:form>
			</div>
		</div>
	</div>
	

	<div id="dropDownSelect1"></div>
	
	<script src="<c:url value='/resources/vendor/jquery/jquery-3.2.1.min.js' /> "></script>
	<script src="<c:url value='/resources/vendor/animsition/js/animsition.min.js' /> "></script>
	<script src="<c:url value='/resources/vendor/bootstrap/js/popper.js' /> "></script>
	<script src="<c:url value='/resources/vendor/bootstrap/js/bootstrap.min.js' /> "></script>
	<script src="<c:url value='/resources/vendor/select2/select2.min.js' /> "></script>
	<script src="<c:url value='/resources/vendor/daterangepicker/moment.min.js' /> "></script>
	<script src="<c:url value='/resources/vendor/daterangepicker/daterangepicker.js' /> "></script>
	<script src="<c:url value='/resources/vendor/countdowntime/countdowntime.js' /> "></script>
	<script src="<c:url value='/resources/js/main.js' /> "></script>

</body>
</html>