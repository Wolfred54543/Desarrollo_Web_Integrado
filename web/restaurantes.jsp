<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <%@include file="componentes/head.jsp"%>
        <link rel="stylesheet" href="css/home.css"/>
    </head>
    <body>
        <%-- Nav Start --%>
            <%@include file="componentes/nav.jsp"%>
        <%-- Nav End --%>
       <section class="product spad mt-4">
        <%-- Linea para manejar url de redirecciones: <a href="ListarRestaurantController?destino=restaurantes">Ver Restaurantes</a> --%>
        
            <div class="container">
                <div class="row">
                    <c:forEach var="restaurante" items="${restaurantes}">
                                <div class="col-lg-3 col-md-6 col-sm-6 mb-4">
                                    <form>
                                        <div class="card shadow-sm">
                                            <img src="img/Restaurantes/${restaurante.foto}" style="
                                                    min-height: 150px;
                                                    max-height: 185px;
                                                    margin-right: 10px;">          
                                            <div class="card-body text-center">
                                                <h6 class="card-title"><a href="ListarProductoPorRestauranteController?id=${restaurante.id}" class="font fs-2">${restaurante.nombre}</a></h6>
                                                <div class="dropdown-divider"></div>
                                                <div class="font">Ubicacion: <br> ${restaurante.direccion}</div>
                                                <div class="font text-warning fs-4">Telefono: <br> ${restaurante.telefono}</div>
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
