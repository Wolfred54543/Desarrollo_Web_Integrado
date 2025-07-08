<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <%@include file="componentes/head.jsp"%>
    <link rel="stylesheet" href="css/car_list.css"/>
    <style>
        .card-carrito {
            border: 1px solid #ccc;
            border-radius: 12px;
            padding: 15px;
            margin-bottom: 30px;
            background-color: #f9f9f9;
        }
        .card-carrito img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 8px;
        }
        .card-carrito .info {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
        }
        .card-carrito .info div {
            margin-left: 15px;
        }
        .subtotal {
            font-weight: bold;
            color: #444;
        }
        .resumen-total {
            font-size: 18px;
            font-weight: bold;
            margin-top: 20px;
            border-top: 2px solid #ddd;
            padding-top: 15px;
        }
        .mapa-restaurante {
            height: 200px;
            width: 100%;
            border-radius: 10px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<%@include file="componentes/nav.jsp"%>

<!-- Coordenadas del cliente (desde atributos enviados por el servlet) -->
<c:set var="clienteLatitud" value="${sessionScope.clienteLatitud}" />
<c:set var="clienteLongitud" value="${sessionScope.clienteLongitud}" />

<section class="product spad mt-4 mb-5">
    <div class="container mt-5">
        <h3 class="my-3 text-dark">Lista del Pedido</h3>

        <c:if test="${not empty cart.items}">
            <c:set var="totalPedido" value="0"/>
            <c:set var="totalProductos" value="0"/>

            <div class="row">
                <c:forEach var="item" items="${cart.items}" varStatus="status">
                    <div class="col-md-6">
                        <div class="card-carrito d-flex flex-column">
                            <div class="info d-flex">
                                <img src="img/Productos/${item.foto}" alt="Imagen del producto">
                                <div>
                                    <h5>${item.nombre}</h5>
                                    <p>Restaurante: <strong>${item.nombreRestaurante}</strong></p>
                                    <p>Precio unitario: S/ ${item.precio}</p>
                                    <p>Cantidad: ${item.cantidad}</p>

                                    <c:set var="subtotal" value="${item.precio * item.cantidad}"/>
                                    <p class="subtotal">Subtotal: S/ ${subtotal}</p>

                                    <c:set var="totalPedido" value="${totalPedido + subtotal}"/>
                                    <c:set var="totalProductos" value="${totalProductos + item.cantidad}"/>
                                </div>
                            </div>

                            <!-- Mapa único por producto -->
                            <div id="map-${status.index}" class="mapa-restaurante"></div>
                        </div>
                    </div>
                </c:forEach>
            </div>

            <!-- Totales -->
            <div class="resumen-total text-dark">
                Total de productos: ${totalProductos} <br/>
                Total del pedido: 
                S/<fmt:formatNumber currencySymbol="" value="${totalPedido}" type="currency" maxFractionDigits="2" minFractionDigits="2"/>
            </div>
        </c:if>

        <c:if test="${empty cart.items}">
            <div class="text-center mt-5 text-secondary">
                <h5>No hay artículos en el carrito.</h5>
            </div>
        </c:if>
    </div>
</section>

<%@include file="componentes/footer.jsp"%>

<script> 
    const clienteLat = "${clienteLatitud}";
    const clienteLng = "${clienteLongitud}";
    const lat = parseFloat(clienteLat);
    const lng = parseFloat(clienteLng);

    const ubicacionClienteDisponible = !isNaN(lat) && !isNaN(lng);

    <c:forEach var="item" items="${cart.items}" varStatus="status">
        const map${status.index} = L.map('map-${status.index}').setView([${item.latitud}, ${item.longitud}], 13);
        
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 18,
            attribution: '© OpenStreetMap'
        }).addTo(map${status.index});

        const restauranteLat${status.index} = ${item.latitud};
        const restauranteLng${status.index} = ${item.longitud};

        L.marker([restauranteLat${status.index}, restauranteLng${status.index}])
            .addTo(map${status.index})
            .bindPopup("<strong>${item.nombreRestaurante}</strong>")
            .openPopup();

        if (ubicacionClienteDisponible) {
            L.marker([lat, lng])
                .addTo(map${status.index})
                .bindPopup("Tu ubicación");

            const ruta${status.index} = L.polyline([
                [restauranteLat${status.index}, restauranteLng${status.index}],
                [lat, lng]
            ], { color: 'red' }).addTo(map${status.index});

            map${status.index}.fitBounds(ruta${status.index}.getBounds());
        }
    </c:forEach>
</script>

<%@include file="componentes/script.jsp"%>
</body>
</html>
