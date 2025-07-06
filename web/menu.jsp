<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="conexion.Conexion"%>
<%@page import="java.io.*, controllers.List_order" %>
<%@page import="java.util.List"%>
<%@page import="java.io.*, controllers.MenuItem"%>

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
                <%
                    List_order listOrder = new List_order();
                    List<MenuItem> menuItems = listOrder.obtenerMenuItems();
                    for (MenuItem item : menuItems) {
                %>
                            <div class="col-lg-3 col-md-6 col-sm-6 mb-4">
                                <form action="añadirAlCarrito.jsp" method="post">
                                    <div class="card">
                                        <img src="img/Home/<%= item.getFoto() %>" class="product-image"> 
                                        <div class="card-body text-center">
                                            <h6 class="card-title"><a href="#"><%= item.getNombre() %></a></h6>
                                            <div>Precio: S/<%= item.getPrecio() %></div>
                                            <input type="hidden" name="carrito_nombre" value="<%= item.getNombre() %>">
                                            <input type="hidden" name="carrito_precio" value="<%= item.getPrecio() %>">
                                            <input type="hidden" name="carrito_foto" value="<%= item.getFoto() %>">
                                            <button type="submit" class="btn btn-outline-secondary">Añadir al Carrito</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                    <%
                        }
                    %>
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
