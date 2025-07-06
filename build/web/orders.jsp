<%@page import="java.sql.*"%>
<%@page import="conexion.Conexion"%>
<%@page import="java.io.*, controllers.List_order" %>
<%@page import="java.util.List"%>
<%@page import="java.io.*, controllers.MenuItem"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="componentes/head.jsp"%>
        <link rel="stylesheet" href="css/orders.css"/>
    </head>
    <body class="bg-dark text-white">
        <%-- Nav Start --%>
            <%@include file="componentes/nav.jsp"%>
        <%-- Nav End --%>
        <div class="container mt-5">
            <h2 class="mb-4">Menu</h2>
            <form action="order_add.jsp">
                <button class="btn btn-outline-warning my-3">Añadir un nuevo plato</button>        
            </form>
            <h3 class="my-3">Lista de Platos</h3>
        <table class="table text-white">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Plato</th>
                    <th>Precio</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <%
                    List_order listOrder = new List_order();
                    List<MenuItem> menuItems = listOrder.obtenerMenuItems();
                    int i=1;
                    for (MenuItem item : menuItems) {
                %>
                <tr>
                    <td><%=i++%></td>
                    <td>
                        <img src="img/Home/<%= item.getFoto() %>" class="product-image"> 
                        <%= item.getNombre() %>
                    </td>
                    <td><%= item.getPrecio() %></td>
                    
                    <td>
                        <form method="POST" action="eliminar.jsp">
                           <input type="hidden" name="plato_id" value="<%= item.getId() %>">
                           <button type="submit" class="btn btn-danger btn-user btn-block m-1"> 
                               <i class="bi bi-trash3"></i>
                           </button>
                       </form>
                        <form method="GET" action="editar.jsp">
                            <input type="hidden" name="menu_nombre" value="<%= item.getNombre() %>">
                            <button type="submit" class="btn btn-primary btn-user btn-block m-1"> 
                                <i class="bi bi-pencil-square"></i>
                            </button>
                        </form>                                          
                    </td>  
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
        </div>
            <hr>
        <%-- Footer Start --%>
            <%@include file="componentes/footer.jsp"%>
        <%-- Footer End --%>
    </body>
        <%-- Script Start --%>
            <%@include file="componentes/script.jsp"%>
        <%-- Script End --%>
</html>
