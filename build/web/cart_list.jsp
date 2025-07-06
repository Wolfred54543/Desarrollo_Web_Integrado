<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carrito</title>
        <%@include file="componentes/head.jsp"%>
        <link rel="stylesheet" href="css/car_list.css"/>
    </head>
    <body class="bg-dark">
        <%-- Nav Start --%>
            <%@include file="componentes/nav.jsp"%>
        <%-- Nav End --%>
        <div class="container mt-5">
            <h2 class="mb-4 text-white">Carrito</h2>
            <h3 class="my-3 text-white">Lista del Pedido</h3>
            <table class="table text-white">
                <thead>
                    <tr>
                        <th>Nº</th>
                        <th>Plato</th>
                        <th>Precio</th>
                        <th>Cantidad</th> <!-- Nueva columna para cantidad -->
                        <th>Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    <c:if test="${not empty cart.items}">
                        <c:set var="counter" value="1"/>
                        <c:forEach var="item" items="${cart.items}">
                            <tr>
                                <td>${counter}</td>
                                <td>
                                    <img src="img/Productos/${item.foto}" class="product-image"> 
                                    ${item.nombre}
                                </td>
                                <td>S/ ${item.precio}</td>
                                <td>${item.cantidad}</td> <!-- Mostrar cantidad -->
                                <td>
                                    <form method="POST" action="EliminarCarritoController">
                                        <input type="hidden" name="pedido_id" value="${item.id}">
                                        <button type="submit" class="btn btn-danger btn-user btn-block m-1"> 
                                            <i class="bi bi-trash3"></i>
                                        </button>
                                    </form>                                         
                                </td>  
                            </tr>
                            <c:set var="counter" value="${counter + 1}"/>
                        </c:forEach>
                    </c:if>
                    <c:if test="${empty cart.items}">
                        <tr>
                            <td colspan="5" class="text-center">No hay artículos en el carrito.</td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
        </div>
        <hr>
        <form action="procesar_pedido.jsp" method="POST" class="form text-center">
            <button type="submit" class="btn btn-outline-warning">Procesar Pedido</button>
        </form>
        <%-- Footer Start --%>
            <%@include file="componentes/footer.jsp"%>
        <%-- Footer End --%>
    </body>
    <%-- Script Start --%>
        <%@include file="componentes/script.jsp"%>
    <%-- Script End --%>
</html>