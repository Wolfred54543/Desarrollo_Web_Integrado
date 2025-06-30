package controllers;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import conexion.Conexion;

public class Car_list {
    public List<MenuItem> obtenerMenuItems() {
        List<MenuItem> menu = new ArrayList<>();
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            con = Conexion.conectar();
            stmt = con.createStatement();
            String sql = "SELECT carrito_id, carrito_nombre, carrito_precio, carrito_foto FROM menu_carrito";
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt("carrito_id");
                String nombre = rs.getString("carrito_nombre");
                String precio = rs.getString("carrito_precio");
                String foto = rs.getString("carrito_foto");
                menu.add(new MenuItem(id, nombre, precio, foto));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return menu;
    }
}