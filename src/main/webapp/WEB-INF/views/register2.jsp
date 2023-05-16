<%@page contentType="text/html" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
			<html>

			<head>
				<title>Registro</title>
				<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
				<link rel="stylesheet" href="<c:url value='/resources/css/login.css' />" />
			</head>

			<body>
				<div class="container mx-auto">
					<div class="row justify-content-center">
						<div class="col-md-8">
							<h1>Registro</h1>
							<!-- Formulario -->
							<form:form class="needs-validation" method="post" action="registrarse">
								<form:hidden path="idusuario" />
								<!-- Nombre -->
								<div class="form-group">
									<label for="nombre">Nombre</label>
									<form:input path="nombre" type="text" class="form-control" placeholder="Introduce tu nombre" pattern="[A-Za-z]*$" required="true" />
									<div class="invalid-feedback">
										Campo obligatorio.
									</div>
								</div>
								<!-- Usuario -->
								<div class="form-group">
									<label for="nombreusuario">Usuario</label>
									<form:input path="nombreusuario" type="text" class="form-control"
										placeholder="Introduce tu usuario" pattern="(?i)&[A-Z0-9_.-]*$" minlength="3"
										maxlength="20" required="true" />
									<div class="invalid-feedback">
										Campo obligatorio.
									</div>
								</div>
								<!-- Password -->
								<div class="form-group">
									<label for="password_2">Password</label>
									<form:input path="password_2" type="password" class="form-control"
										placeholder="Introduce tu contraseña" required="true"  />
									<div class="invalid-feedback">
										Campo obligatorio.
									</div>
								</div>
								<!-- E-mail -->
								<div class="form-group">
									<label for="email">E-mail</label>
									<form:input path="email" type="email" class="form-control"
										placeholder="Introduce tu email" required="true"  />
									<div class="invalid-feedback">
										Campo obligatorio.
									</div>
								</div>
								<!-- DNI -->
								<div class="form-group">
									<label for="dni">DNI</label>
									<form:input path="dni" type="text" class="form-control"
										placeholder="Introduce tu DNI" required="true"  />
									<div class="invalid-feedback">
										Campo obligatorio.
									</div>
								</div>
								<!-- Términos y Condiciones -->
								<div class="form-check">
									<input class="form-check-input" type="checkbox" id="acepto" required="true" >
									<label class="form-check-label" for="acepto">Acepto los términos y
										condiciones</label>
									<div class="invalid-feedback">
										Debes aceptar los términos y condiciones para hacer uso de la plataforma
									</div>
								</div>
								<!-- Login -->
								<div class="form-group">
									<a href="/proyecto-final-web/login">¿Ya estás registrado?</a>
								</div>
								<!-- Boton Registrarse -->
								<div class="text-center mt-4">
									<button type="submit" class="btn btn-primary mx-auto w-50">Registrarse</button>
								</div>
							</form:form>
						</div>
					</div>
				</div>
				<!-- Script -->
				<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
				<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
				<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
				<script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>
				<script>

					(() => {
						'use strict'

						const forms = document.querySelectorAll('.needs-validation')

						Array.from(forms).forEach(form => {
							form.addEventListener('submit', event => {
								if (!form.checkValidity()) {
									event.preventDefault()
									event.stopPropagation()
								}

								form.classList.add('was-validated')
							}, false)
						})
					})()
				</script>

			</body>

			</html>