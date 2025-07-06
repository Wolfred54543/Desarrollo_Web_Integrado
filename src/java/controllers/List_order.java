package controllers;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import conexion.Conexion;

public class List_order {
    public List<MenuItem> obtenerMenuItems() {
        List<MenuItem> menu = new ArrayList<>();
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            con = Conexion.conectar();
            stmt = con.createStatement();
            String sql = "SELECT menu_id, menu_nombre, menu_precio, menu_foto FROM menus";
            rs = stmt.executeQuery(sql);

            while (rs.next()) {
                int id = rs.getInt("menu_id");
                String nombre = rs.getString("menu_nombre");
                String precio = rs.getString("menu_precio");
                String foto = rs.getString("menu_foto");
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