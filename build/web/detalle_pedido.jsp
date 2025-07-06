<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="componentes/head.jsp"%>
    <link rel="stylesheet" href="css/car_list.css"/>
</head>
<body class="">
    <%@include file="componentes/nav.jsp"%>
    <section class="product spad mt-4 mb-5">
        <div class="container mt-5">
  
            <form action="GenerarPDFController" method="post">
                <h2 class="font text-center text-warning">Detalle del Pedido</h2>
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Plato</th>
                                <th>Precio</th>
                                <th>Cantidad</th>
                                <th>Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:if test="${not empty cart.items}">
                                <c:set var="totalPedido" value="0"/>
                                <c:forEach var="item" items="${cart.items}">
                                    <tr>
                                        <td>
                                            <img src="img/Productos/${item.foto}" class="product-image"> 
                                            ${item.nombre}
                                        </td>
                                        <td>S/ ${item.precio}</td>
                                        <td>${item.cantidad}</td>
                                        <td>
                                            <c:set var="subtotal" value="${item.precio * item.cantidad}"/>
                                            S/ ${subtotal}
                                            <c:set var="totalPedido" value="${totalPedido + subtotal}"/>
                                        </td>
                                    </tr>
                                </c:forEach>
                                <tr>
                                    <td colspan="3" class="text-right"><strong>Total:</strong></td>
                                    <td><strong>S/ ${totalPedido}</strong></td>
                                </tr>
                            </c:if>
                            <c:if test="${empty cart.items}">
                                <tr>
                                    <td colspan="4" class="text-center">No hay artículos en el carrito.</td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                <div class="text-center">
                    <button type="submit" class="btn btn-outline-warning">Descargar PDF</button>
                </div>
            </form>
        </div>
    </section>
    <%@include file="componentes/footer.jsp"%>
</body>
<%@include file="componentes/script.jsp"%>
</html>