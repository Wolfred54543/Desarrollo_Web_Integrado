package controllers;

import conexion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Register {
    public static boolean registrarUsuario(String nombre, String apellido, String usuario,
            String contrasenia, String email, String telefono) {
            Connection con = null;
            PreparedStatement preparestat = null;
            boolean registrado = false;
        
        try {
            con = Conexion.conectar();
            String sql = "INSERT INTO usuarios (usuario_nombre, usuario_apellido, usuario_usuario, usuario_contrasenia, usuario_email, usuario_telefono) VALUES (?, ?, ?, ?, ?, ?)";
            preparestat = con.prepareStatement(sql);
            preparestat.setString(1, nombre);
            preparestat.setString(2, apellido);
            preparestat.setString(3, usuario);
            preparestat.setString(4, contrasenia);
            preparestat.setString(5, email);
            preparestat.setString(6, telefono);
            
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