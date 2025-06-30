package controllers;

import conexion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Register_order {
        public static boolean registrarMenu(String nombreMenu, String descripcionMenu, String precioMenu,
            String fotoMenu) {
            Connection con = null;
            PreparedStatement preparestat = null;
            boolean registrado = false;
        
        try {
            con = Conexion.conectar();
            String sql = "INSERT INTO menus (menu_nombre, menu_descripcion, menu_precio, menu_foto) VALUES (?, ?, ?, ?)";
            preparestat = con.prepareStatement(sql);
            preparestat.setString(1, nombreMenu);
            preparestat.setString(2, descripcionMenu);
            preparestat.setString(3, precioMenu);
            preparestat.setString(4, fotoMenu);
            
            int resultado = preparestat.executeUpdate();
            registrado = (resultado > 0);
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (preparestat != null) preparestat.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return registrado;
    }
}
