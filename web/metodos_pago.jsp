<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.Producto" %>
<%@ page import="dao.ProductoDAO" %>
<%@ page import="utils.DatabaseConnection" %>
<%@ page import="java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
    <%@include file="componentes/head.jsp"%>
    <style>
        .dynamic-fields { display: none; }
    </style>
</head>
<body>
    <%@include file="componentes/nav.jsp"%>
    <section class="product spad mt-4 mb-5">
        <div class="container mt-5">
            <div class="row justify-content-center p-3">
                <div class="col-lg-6 col-md-10 col-sm-12">
                    <form action="detalle_pedido.jsp" id="paymentForm" class="form-control bg-dark text-white p-3" onsubmit="return validateForm()">
                        <h2 class="font text-center text-warning">Agregar Método de Pago</h2>
                        <div class="mb-3">
                            <label for="nombreMetodo" class="form-label">Correo Electronico</label>
                            <input type="email" class="form-control" id="nombreMetodo" required>
                        </div>
                        <div class="mb-3">
                            <label for="nombreMetodo" class="form-label">Numero de Telefono</label>
                            <input type="text" class="form-control" id="nombreMetodo" required>
                        </div>
                        <div class="mb-3">
                            <label for="nombreMetodo" class="form-label">Direccion</label>
                            <input type="text" class="form-control" id="nombreMetodo" required>
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
                                <label for="numeroTarjeta" class="form-label">Nombre del Titular</label>
                                <input type="text" class="form-control" id="numeroTarjeta">
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
                            <p>Escanea el siguiente codigo QR para realizar el pago:</p>
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
            </div>
        </div>
    </section>
    <%@include file="componentes/footer.jsp"%>
</body>
<%@include file="componentes/script.jsp"%>
<%@include file="componentes/scriptMetodosPago.jsp"%>
</html>