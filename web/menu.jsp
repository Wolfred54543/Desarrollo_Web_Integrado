<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <%@include file="componentes/head.jsp"%>
    </head>
    <body>
        <%-- Nav Start --%>
            <%@include file="componentes/nav.jsp"%>
        <%-- Nav End --%>
       <section class="product spad mt-4">
            <div class="container">
                <div class="row">
                <c:forEach var="menu" items="${menus}">
                            <div class="col-lg-3 col-md-6 col-sm-6 mb-4">
                                <form action="CarritoController" method="post">
                                    <div class="card">
                                        <img src="img/Home/${menu.foto}" alt="${menu.nombre}" class="product-image"> 
                                        <div class="card-body text-center">
                                            <h6 class="card-title"><a href="#">${menu.nombre}</a></h6>
                                            <div>Precio: S/${menu.precio}</div>
                                            <div>Cantidad:</div>
                                            <input style="max-width: 80px; border: 1px solid black; margin-bottom: 5px; border-radius: 10px; margin-right: 4px" type="number" name="carrito_cantidad" value="1" min="1" required>
                                            <br>
                                                <input type="hidden" name="carrito_nombre" value="${menu.nombre}">
                                                <input type="hidden" name="carrito_precio" value="${menu.precio}">
                                                <input type="hidden" name="carrito_foto" value="${menu.foto}">
                                                <input type="hidden" name="carrito_id" value="${menu.id}">
                                            <button type="submit" class="btn btn-outline-secondary">Añadir al Carrito</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                </c:forEach>
                    </div>
                </div>
        </section>
        <%-- Footer Start --%>
            <%@include file="componentes/footer.jsp"%>
        <%-- Footer End --%>
    </body>
        <%-- Script Start --%>
            <%@include file="componentes/script.jsp"%>
        <%-- Script End --%>
</html>
