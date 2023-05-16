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
    <!--<link rel="stylesheet" href="<c:url value='/resources/css/bootstrap.min.css' />"  />-->
</head>

<body>
    <div class="container">
        <h1>Crypto Wallet</h1>

        <div class="logout">
            <button class="logout-btn">Cerrar sesion</button>
        </div>

        <div class="wallets">
            <h2>Mis wallets</h2>
            <ul class="button-list">
                <c:forEach var="wallet" items="${wallets}">
                    <p> 
                        <a class="btn btn-primary btn-link" href="/proyecto-final-web/wallet/${wallet.id}">Moneda: ${wallet.moneda} | Balance: ${wallet.balance} -> Ver detalles</a>
                    </p>
			    </c:forEach>
            </ul>
        </div>

        <div class="actions">
            <h2>Acciones</h2>
            <form:form class="row g-3" method="post" action="${id}">
                
                <button type="submit" class="btn btn-primary" value="Añadir wallet">Añadir wallet</button>
        
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
    document.querySelector('.logout-btn').addEventListener('click', function() {
        window.location.href = '/proyecto-final-web/login';
    });
</script>
<script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>

</html>