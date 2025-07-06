<%@page import="java.sql.*"%>
<%@page import="conexion.Conexion"%>
<%
    String pedidoId = request.getParameter("pedido_id"); 
    Connection con = null;
    PreparedStatement pstmt = null;

    try {
        con = Conexion.conectar();

        if (pedidoId != null) {
            String sql = "DELETE FROM menu_carrito WHERE carrito_id = ?"; 
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, Integer.parseInt(pedidoId)); 
            
            pstmt.executeUpdate();
            
            response.sendRedirect("car_list.jsp"); 
        } else {
            out.println("ID de pedido no proporcionado.");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        try {
            if (pstmt != null) pstmt.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>