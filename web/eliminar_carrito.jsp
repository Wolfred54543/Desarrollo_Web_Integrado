<%@page import="java.sql.*"%>
<%@page import="conexion.Conexion"%>
<%
    String platoId = request.getParameter("platos_id"); 
    Connection con = null;
    PreparedStatement pstmt = null;

    try {
        con = Conexion.conectar();
        
        
        String sql = "DELETE FROM carrito_menu WHERE menu_id = ?"; 
        pstmt = con.prepareStatement(sql);
        pstmt.setInt(1, Integer.parseInt(platoId));
        
        pstmt.executeUpdate();
        
        response.sendRedirect("car_list.jsp");
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