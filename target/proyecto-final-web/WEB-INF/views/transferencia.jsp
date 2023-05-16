<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario de Pago</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="<c:url value='/resources/css/addFondos.css' />" />
</head>

<body>
    <div class="logout">
        <button class="back-btn">Volver</button>
        <button class="logout-btn">Cerrar sesion</button>
    </div>

    <div class="form-container">
        <h2>Añadir fondos</h2>
        <form class="needs-validation" novalidate>

            <div class="form-group">
                <label for="address">Address</label>
                <input type="text" id="address" placeholder="Address a la que enviar" required>
                <div class="invalid-feedback">
                    Valores incorrectos
                </div>
            </div>
    
            <div class="form-group">
                <label for="cantidad">Cantidad</label>
                <input type="text" id="cantidad" placeholder="Cantidad"required>
                <div class="invalid-feedback">
                    Valores incorrectos
                </div>
            </div>
    
            <button class="btn-submit" type="submit">Enviar</button>

            </form>
        
    </div>
</body>

<script>
    document.querySelector('.logout-btn').addEventListener('click', function() {
        window.location.href = 'login.html';
    });
    document.querySelector('.back-btn').addEventListener('click', function() {
        window.location.href = 'wallet.html';
    });
</script>

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

<script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>

</html>