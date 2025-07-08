<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.Producto" %>
<%@ page import="dao.ProductoDAO" %>
<%@ page import="utils.DatabaseConnection" %>
<%@ page import="java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    String idParam = request.getParameter("id");
    List<Producto> productos = new ArrayList<>();

    if (idParam != null && !idParam.isEmpty()) {
    
                int restauranteId = Integer.parseInt(idParam);
                ProductoDAO productoDao = new ProductoDAO();
                productos = productoDao.obtenerProductosPorRestaurante(restauranteId);
                
    }
%>

<!DOCTYPE html>
<html>
<head>
    <%@include file="componentes/head.jsp"%>
</head>
<body>
    <%@include file="componentes/nav.jsp"%>
    <section class="product spad mt-4">
        <h1 class="text-center mb-5 font text-warning">Seleccion de Productos</h1>
        <div class="container">
            <div class="row">
    <c:forEach var="producto" items="${productos}">
        <div class="col-lg-3 col-md-6 col-sm-6 mb-4">
            <form action="CarritoController" method="post" class="form-text">
                <div class="card shadow-sm">
                    <img src="img/Productos/${producto.foto}" alt="${producto.nombre}" style="min-height: 150px; max-height: 185px; margin-right: 10px;">
                    <div class="card-body text-center">
                        <h6 class="card-title"><a href="#">${producto.nombre}</a></h6>
                        <div class="dropdown-divider"></div>
                        <div class="text-black-50">${producto.descripcion}</div>
                        <div class="dropdown-divider"></div>
                        <div>Precio: <b>S/${producto.precio}</b></div>
                        <div>Cantidad:</div>
                        <input type="number" class="my-2" name="carrito_cantidad" value="1" min="1" required style="max-width: 50px;"><br>
                        <input type="hidden" name="carrito_nombre" value="${producto.nombre}">
                        <input type="hidden" name="carrito_precio" value="${producto.precio}">
                        <input type="hidden" name="carrito_foto" value="${producto.foto}">
                        <input type="hidden" name="carrito_id" value="${producto.productoId}">
                        <input type="hidden" name="carrito_restaurante_id" value="${producto.restauranteId}">
                        <button type="submit" class="btn btn-outline-warning">Añadir al Carrito</button>
                    </div>
                </div>
            </form>
        </div>
    </c:forEach>
            </div>
            <h2 class="text-center mt-5">Ubicación del Restaurante:</h2>
            <div id="map" style="height: 400px;" class="mb-5"></div>

        </div>
    </section>
    <%@include file="componentes/footer.jsp"%>
</body>
<script>
    var lat = ${restaurante.latitud};
    var lng = ${restaurante.longitud};

    var map = L.map('map').setView([lat, lng], 15);

    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        maxZoom: 19,
        attribution: '© OpenStreetMap'
    }).addTo(map);

    var marker = L.marker([lat, lng]).addTo(map)
        .bindPopup("Ubicación del Restaurante").openPopup();
</script>

<%@include file="componentes/script.jsp"%>
</html>