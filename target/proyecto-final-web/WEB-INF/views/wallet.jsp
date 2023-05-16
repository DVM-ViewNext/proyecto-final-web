<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crypto Wallet</title>
    <link rel="stylesheet" href="<c:url value='/resources/css/menu.css' />" />
</head>

<body>
    <div class="container">
        <h1>Wallet</h1>

        <div class="logout">
            <button class="back-btn">Volver</button>
            <button class="logout-btn">Cerrar sesion</button>
        </div>

        <div class="wallets">
            <h2>Address</h2>
            <ul>
                <li class="list-group-item">${wallet.address}</li>
                <button class="btn btn-primary mt-3" onclick="copyElement(this)">Copiar</button>
            </ul>
        </div>

        <div class="wallets">
            <h2>Moneda</h2>
            <ul>
                <li>${wallet.moneda} - ${wallet.balance}</li>
            </ul>
        </div>

        <div class="actions">
            <h2>Acciones</h2>
            <form:form class="row g-3" method="post" action="${wallet.id}">
                <button type="submit" class="btn btn-primary" value="Borrar wallet">Borrar wallet</button>
            </form:form>
            <form:form class="row g-3" method="post" action="${wallet}">
                <button type="submit" class="btn btn-primary" value="Añadir fondos">Añadir fondos</button>
            </form:form>
            <form:form class="row g-3" method="post" action="/proyecto-final-web/transaccion/">
                <button type="submit" class="btn btn-primary" value="Hacer transferencia">Hacer transferencia</button>
            </form:form>
        </div>

        <div class="transactions">
            <h2>Últimas 5 transacciones</h2>
            <ul>
                <li>Transaction 1</li>
                <li>Transaction 2</li>
                <li>Transaction 3</li>
                <li>Transaction 4</li>
                <li>Transaction 5</li>
            </ul>
        </div>
    </div>
</body>

<script>
    function copyElement(button) {
        var element = document.querySelector('.list-group-item');
        var copyText = element.innerText;

        // Crea un campo de texto temporal para copiar el contenido
        var tempInput = document.createElement('input');
        tempInput.value = copyText;
        document.body.appendChild(tempInput);

        // Selecciona el texto dentro del campo de texto temporal
        tempInput.select();
        tempInput.setSelectionRange(0, 99999); /* Para dispositivos móviles */

        // Copia el texto al portapapeles
        document.execCommand('copy');

        // Remueve el campo de texto temporal
        document.body.removeChild(tempInput);

        // Agrega la clase 'active' al botón para mantener el color
        button.classList.add('active');
        button.disabled = true;
        button.innerText = 'Copiado';

        // Restablece el estado del botón después de 3 segundos
        setTimeout(function() {
            button.innerText = 'Copiar';
            button.classList.remove('active');
            button.disabled = false;
        }, 500);
    }
</script>

<script>
    document.querySelector('.logout-btn').addEventListener('click', function() {
        window.location.href = '/proyecto-final-web/login';
    });
    document.querySelector('.back-btn').addEventListener('click', function() {
        window.location.href = '/proyecto-final-web/wallets/${wallet.idUsuario}';
    });
</script>

</html>