<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List" %>
<%@page import="models.Carrito" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <%@include file="componentes/head.jsp"%>
    <style>
        .dynamic-fields { display: none; }
    </style>
    <link rel="stylesheet" href="css/metodos_pago.css"/>
</head>
<body>
    <%@include file="componentes/nav.jsp"%>
    <section class="product spad mt-4 mb-5">
        <div class="container mt-5">
            <div class="row justify-content-center p-3">
                <!-- Formulario de Pago a la izquierda -->
                <div class="col-lg-6 col-md-10 col-sm-12 mt-5">
                    <form action="detalle_pedido.jsp" id="paymentForm" class="form-control bg-dark text-white p-3" onsubmit="return validateForm()">
                        <h2 class="font text-center text-warning">Agregar Método de Pago</h2>
                        <div class="mb-3">
                            <label for="correo" class="form-label">Correo Electrónico</label>
                            <input type="email" class="form-control" id="correo" required>
                        </div>
                        <div class="mb-3">
                            <label for="telefono" class="form-label">Número de Teléfono</label>
                            <input type="text" class="form-control" id="telefono" required>
                        </div>
                        <div class="mb-3">
                            <label for="direccion" class="form-label">Dirección</label>
                            <input type="text" class="form-control" id="direccion" required>
                        </div>
                        <div class="mb-3">
                            <label for="tipoPago" class="form-label">Tipo de Pago</label>
                            <select class="form-select btn btn-outline-warning bg-dark text-warning" id="tipoPago" required onchange="showFields()">
                                <option value="" disabled selected>Selecciona un tipo de pago:</option>
                                <option value="tarjeta">Tarjeta de Crédito/Débito</option>
                                <option value="yape">Yape</option>
                                <option value="plin">Plin</option>
                            </select>
                        </div>

                        <div id="tarjetaFields" class="dynamic-fields">
                            <div class="mb-3">
                                <label for="nombreTitular" class="form-label">Nombre del Titular</label>
                                <input type="text" class="form-control" id="nombreTitular">
                            </div>
                            <div class="mb-3">
                                <label for="numeroTarjeta" class="form-label">Número de Tarjeta</label>
                                <input type="text" class="form-control" id="numeroTarjeta">
                            </div>
                            <div class="mb-3">
                                <label for="cvv" class="form-label">CVV</label>
                                <input type="text" class="form-control" id="cvv" placeholder="123">
                            </div>
                            <div class="mb-3">
                                <label for="fechaVencimiento" class="form-label">Fecha de Vencimiento</label>
                                <input type="date" class="form-control" id="fechaVencimiento">
                            </div>
                        </div>

                        <div id="yapeFields" class="dynamic-fields">
                            <p>Escanea el siguiente código QR para realizar el pago:</p>
                            <img src="img/MetodosPago/QR-Yape.webp" width="500" alt="QR Yape">
                        </div>

                        <div id="plinFields" class="dynamic-fields justify-content-center">
                            <p>Escanea el siguiente código QR para realizar el pago:</p>
                            <img src="img/MetodosPago/QR-Plin.webp" width="500" alt="QR Plin">
                        </div>
                        <div class="dropdown-divider bg-white"></div>
                        <div class="text-center my-3">
                            <button type="submit" class="btn btn-outline-warning">Proceder con el pago</button>
                        </div>
                    </form>
                </div>

                <!-- Listado del Carrito a la derecha -->
    <div class="col-lg-6 col-md-10 col-sm-12">
        <div class="container mt-5">
            <h3 class="my-3 text-dark">Lista del Pedido</h3>
            <table class="table text-dark">
               <thead>
                   <tr>
                       <th>Nº</th>
                       <th>Plato</th>
                       <th>Precio</th>
                       <th>Cantidad</th>
                       <th>Sub Total</th>
                   </tr>
               </thead>
               <tbody>
                   <c:if test="${not empty cart.items}">
                       <c:set var="counter" value="1"/>
                       <c:set var="totalPedido" value="0"/> <!-- Inicializa totalPedido -->
                       <c:forEach var="item" items="${cart.items}">
                           <tr>
                               <td>${counter}</td>
                               <td>
                                   <img src="img/Productos/${item.foto}" class="product-image"> 
                                   ${item.nombre}
                               </td>
                               <td>S/ ${item.precio}</td>
                               <td>${item.cantidad}</td> 
                               <td>
                                   <c:set var="subtotal" value="${item.precio * item.cantidad}"/>
                                   S/ ${subtotal}
                                   <c:set var="totalPedido" value="${totalPedido + subtotal}"/> <!-- Actualiza totalPedido -->
                               </td>
                           </tr>
                           <c:set var="counter" value="${counter + 1}"/>
                       </c:forEach>

                       <!-- Muestra el total absoluto -->
                       <tr>
                           <td colspan="4" class="text-right"><strong>Total:</strong></td>
                           <td>
                               S/<fmt:formatNumber currencySymbol="" value="${totalPedido}" type="currency" maxFractionDigits="2" minFractionDigits="2"/>
                           </td>
                       </tr>

                       <!-- Total de productos -->
                       <c:set var="totalProductos" value="0"/>
                       <c:forEach var="item" items="${cart.items}">
                           <c:set var="totalProductos" value="${totalProductos + item.cantidad}"/>
                       </c:forEach>
                       <div class="text-white mt-3">
                           <strong>Total de productos en el carrito: ${totalProductos}</strong>
                       </div>
                   </c:if>
                   <c:if test="${empty cart.items}">
                       <tr>
                           <td colspan="5" class="text-center">No hay artículos en el carrito.</td>
                       </tr>
                   </c:if>
               </tbody>
           </table>
        </div>
    </div>
            </div>
        </div>
    </section>
    <%@include file="componentes/footer.jsp"%>
</body>
<%@include file="componentes/script.jsp"%>
<%@include file="componentes/scriptMetodosPago.jsp"%>
</html>