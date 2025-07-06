<%@ page import="java.sql.*" %>
<%@ page import="conexion.Conexion" %>
<%
    String carritoNombre = request.getParameter("carrito_nombre");
    String carritoPrecio = request.getParameter("carrito_precio");
    String carritoFoto = request.getParameter("carrito_foto");

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        // Usar la clase de conexión para obtener la conexión
        conn = Conexion.conectar();

        // Consulta SQL para insertar en la tabla menu_carrito
        String sql = "INSERT INTO menu_carrito (carrito_nombre, carrito_precio, carrito_foto) VALUES (?, ?, ?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, carritoNombre);
        pstmt.setString(2, carritoPrecio);
        pstmt.setString(3, carritoFoto);

        // Ejecutar la consulta
        pstmt.executeUpdate();
        out.println("Producto añadido al carrito exitosamente.");
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("Error al añadir producto al carrito: " + e.getMessage());
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
        if (conn != null) try { conn.close(); } catch (SQLException e) {}
    }
%>