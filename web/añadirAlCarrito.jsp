<%@ page import="java.sql.*" %>
<%@ page import="conexion.Conexion" %>
<%
    String carritoNombre = request.getParameter("carrito_nombre");
    String carritoPrecio = request.getParameter("carrito_precio");
    String carritoFoto = request.getParameter("carrito_foto");

    Connection conn = null;
    PreparedStatement pstmt = null;
    boolean exito = false;

    try {
        conn = Conexion.conectar();
        String sql = "INSERT INTO menu_carrito (carrito_nombre, carrito_precio, carrito_foto) VALUES (?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, carritoNombre);
        pstmt.setString(2, carritoPrecio);
        pstmt.setString(3, carritoFoto);

        pstmt.executeUpdate();
        exito = true;
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
        if (conn != null) try { conn.close(); } catch (SQLException e) {}
    }
%>

<script>
    <%
        if (exito) {
    %>
        alert("Producto añadido al carrito exitosamente.");
        setTimeout(function() {
            window.location.href = "menu.jsp";
        }, 1000);
    <%
        } else {
    %>
        alert("Error al añadir el producto al carrito.");
    <%
        }
    %>
</script>