<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                    <%-- Producto 1 --%>
                    <div class="col-lg-3 col-md-6 col-sm-6 mb-4">
                        <form action="añadirAlCarrito.jsp" method="post">
                            <div class="card">
                                <img src="img/Home/container_menu_food_1.jpg" class="card-img-top">
                                <div class="card-body text-center">
                                    <h6 class="card-title"><a href="#">Rocoto Relleno</a></h6>
                                    <div>S/12.00</div>
                                    <input type="hidden" name="carrito_nombre" value="Rocoto Relleno">
                                    <input type="hidden" name="carrito_precio" value="12.00">
                                    <input type="hidden" name="carrito_foto" value="img/Home/container_menu_food_1.jpg">
                                    <button type="submit" class="btn btn-outline-secondary">Añadir al Carrito</button>
                                </div>
                            </div>
                        </form>
                    </div>

                    <%-- Producto 2 --%>
                    <div class="col-lg-3 col-md-6 col-sm-6 mb-4">
                        <form action="añadirAlCarrito.jsp" method="post">
                            <div class="card">
                                <img src="img/Home/container_menu_food_1.jpg" class="card-img-top">
                                <div class="card-body text-center">
                                    <h6 class="card-title"><a href="#">Pastel de Papa</a></h6>
                                    <div>S/18.00</div>
                                    <input type="hidden" name="carrito_nombre" value="Rocoto Relleno">
                                    <input type="hidden" name="carrito_precio" value="12.00">
                                    <input type="hidden" name="carrito_foto" value="img/Home/container_menu_food_1.jpg">
                                    <button type="submit" class="btn btn-outline-secondary">Añadir al Carrito</button>
                                </div>
                            </div>
                        </form>
                    </div>

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
