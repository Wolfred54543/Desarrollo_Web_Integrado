<%
    String rol = (String) session.getAttribute("rol");
    if (rol == null || !rol.equals("cliente")) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%-- Head Start --%>
            <%@include file="componentes/head.jsp"%>
            <link rel="stylesheet" href="css/home.css"/>
        <%-- Head End --%>
    </head>
    <body class="bg-dark">
            <%-- Nav Start --%>
            <%@include file="componentes/nav.jsp"%>
            <%-- Nav End --%>

        <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel">
            <div class="carousel-inner">
              <div class="carousel-item active">
                <img src="img/Home/banner_home.webp" class="d-block w-100" alt="...">
              </div>
            </div>
        </div>
        <br>

<div id="productCarousel" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-inner">
        <div class="carousel-item active p-5">
            <div class="container container-bg text-center text-warning font fs-2">
                <h1 class="mt-3">Menu del Dia</h1>
                <p>Contamos con las mejores ofertas para ti tu familia</p>
                <div class="row justify-content-center">
                    <div class="col-6 col-md-4 mb-4">
                        <div class="card h-100 text-center">
                            <img src="img/Home/container_menu_food_1.jpg" class="card-img-top">
                            <div class="card-body">
                                <h2 class="card-title"><a href="#">Rocoto Relleno</a></h2>
                                <p class="card-text">S/11.00</p>
                                <a href="#" class="btn btn-outline-warning">Añadir al Carrito</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 col-md-4 mb-4">
                        <div class="card h-100 text-center">
                            <img src="img/Home/container_menu_food_3.jpg" class="card-img-top">
                            <div class="card-body">
                                <h2 class="card-title"><a href="#">Rocoto Relleno</a></h2>
                                <p class="card-text">S/15.00</p>
                                <a href="#" class="btn btn-outline-warning">Añadir al Carrito</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="carousel-item p-5">
            <div class="container container-bg text-center text-warning font fs-2">
                <h1 class="mt-3">Menu del Dia</h1>
                <p>Contamos con las mejores ofertas para ti tu familia</p>
                <div class="row justify-content-center">
                    <div class="col-6 col-md-4 mb-4">
                        <div class="card h-100 text-center">
                            <img src="img/Home/container_menu_food_1.jpg" class="card-img-top">
                            <div class="card-body">
                                <h2 class="card-title"><a href="#">Rocoto Relleno</a></h2>
                                <p class="card-text">S/11.00</p>
                                <a href="#" class="btn btn-outline-warning">Añadir al Carrito</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-6 col-md-4 mb-4">
                        <div class="card h-100 text-center">
                            <img src="img/Home/container_menu_food_3.jpg" class="card-img-top">
                            <div class="card-body">
                                <h2 class="card-title"><a href="#">Rocoto Relleno</a></h2>
                                <p class="card-text">S/15.00</p>
                                <a href="#" class="btn btn-outline-warning">Añadir al Carrito</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#productCarousel" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#productCarousel" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>



<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
            <%-- Footer Start --%>
                <%@include file="componentes/footer.jsp"%>
            <%-- Footer End --%>
    </body>
        <%-- Script Start --%>
            <%@include file="componentes/script.jsp"%>
        <%-- Script End --%>
</html>
