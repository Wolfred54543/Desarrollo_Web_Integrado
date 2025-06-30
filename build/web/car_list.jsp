<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="conexion.Conexion"%>
<%@page import="java.io.*, controllers.Car_list" %>
<%@page import="java.util.List"%>
<%@page import="java.io.*, controllers.CarItem"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carrito</title>
        <%@include file="componentes/head.jsp"%>
        <link rel="stylesheet" href="css/car_list.css"/>
    </head>
    <body class="bg-dark">
         <%-- Nav Start --%>
            <%@include file="componentes/nav.jsp"%>
        <%-- Nav End --%>
        <div class="container mt-5">
            <h2 class="mb-4 text-white">Carrito</h2>
            <h3 class="my-3 text-white">Lista del Pedido</h3>
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
                        Connection conn = null;
                        PreparedStatement pstmt = null;
                        ResultSet rs = null;
                        int i=1;
                        try {
                            conn = Conexion.conectar();
                            String sql = "SELECT carrito_id, carrito_nombre, carrito_precio, carrito_foto FROM menu_carrito";
                            pstmt = conn.prepareStatement(sql);
                            rs = pstmt.executeQuery();

                            if (!rs.isBeforeFirst()) {
                                out.println("<tr><td colspan='4' class='text-center'>No hay productos en el carrito.</td></tr>");
                            } else {
                                while (rs.next()) {
                                    int id = rs.getInt("carrito_id");
                                    String nombre = rs.getString("carrito_nombre");
                                    String precio = rs.getString("carrito_precio");
                                    String foto = rs.getString("carrito_foto");
                    %>
                    <tr>
                        <td><%= i++ %></td>
                        <td>
                            <img src="img/Home/<%= foto %>" class="product-image"> 
                            <%= nombre %>
                        </td>
                        <td>S/ <%= precio %></td>
                        <td>
                            <form method="POST" action="eliminar_carrito.jsp">
                                <input type="hidden" name="pedido_id" value="<%=id %>">
                                <button type="submit" class="btn btn-danger btn-user btn-block m-1"> 
                                    <i class="bi bi-trash3"></i>
                                </button>
                            </form>                                         
                        </td>  
                    </tr>
                    <%
                                }
                            } 
                        } catch (SQLException e) {
                            e.printStackTrace();
                            out.println("Error al recuperar los productos del carrito.");
                        } finally {
                            if (rs != null) try { rs.close(); } catch (SQLException e) {}
                            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
                            if (conn != null) try { conn.close(); } catch (SQLException e) {}
                        }
                    %>
                </tbody>
            </table>
        </div>
            <hr>
            <form action="procesar_pedido.jsp" method="POST" class="form text-center">
                <button type="submit" class="btn btn-outline-warning">Procesar Pedido</button>
            </form>
        <%-- Footer Start --%>
            <%@include file="componentes/footer.jsp"%>
        <%-- Footer End --%>
    </body>
        <%-- Script Start --%>
            <%@include file="componentes/script.jsp"%>
        <%-- Script End --%>
</html>