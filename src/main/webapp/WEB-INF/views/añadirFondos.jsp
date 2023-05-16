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
    <div class="container">
        <div class="logout">
            <button class="back-btn">Volver</button>
            <button class="logout-btn">Cerrar sesion</button>
        </div>

        <div class="form-container">
            <h2>Añadir fondos</h2>
            <form class="needs-validation" novalidate>

                <div class="form-group">
                    <label for="input1">Address</label>
                    <input type="text" id="input1" value="834294823498" readonly>
                </div>

                <div class="form-group">
                    <label for="cantidadActual">Moneda (Cantidad actual)</label>
                    <input type="text" id="cantidadActual" value="BTC - 5.4" readonly>
                </div>

                <div class="form-group">
                    <label for="cantidad">Cantidad</label>
                    <input type="text" id="cantidad" placeholder="Cantidad a añadir" required>
                    <div class="invalid-feedback">
                        Valores incorrectos
                    </div>
                </div>

                <div class="form-group">
                    <label for="cardNumber">Número de Tarjeta</label>
                    <input type="text" id="cardNumber" placeholder="Número de Tarjeta" minlength="16" maxlength="16"
                        required>
                    <div class="invalid-feedback">
                        Valores incorrectos
                    </div>
                </div>

                <div class="form-group">
                    <label for="ccv">CCV</label>
                    <input type="text" id="ccv" placeholder="CCV" pattern="[0-9]{3}" maxlength="3" required>
                    <div class="invalid-feedback">
                        Valores incorrectos
                    </div>
                </div>

                <div class="form-group">
                    <label for="expiryDate">Fecha de Vencimiento</label>
                    <input type="text" id="expiryDate" placeholder="mm/YY" pattern="(0[1-9]|1[0-2])\/[0-9]{2}"
                        maxlength="5" title="Formato de fecha inválido. Utilice el formato mm/YY" required>
                    <div class="invalid-feedback">
                        Valores incorrectos
                    </div>
                </div>

                <button class="btn-submit" type="submit">Añadir fondos</button>

            </form>

        </div>
    </div>
</body>

<script>
    document.querySelector('.logout-btn').addEventListener('click', function () {
        window.location.href = 'login.html';
    });
    document.querySelector('.back-btn').addEventListener('click', function () {
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