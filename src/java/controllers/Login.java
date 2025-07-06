package controllers;

import conexion.Conexion;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Login {
    public static boolean verificarCredenciales(String usuario, String contrasenia){
        Connection con = null;
        PreparedStatement preparestat = null;
        ResultSet resultado = null;
        boolean Validar = false;
        
        try {
            con = Conexion.conectar();
            String sql = "SELECT * FROM usuarios WHERE usuario_usuario = ? AND usuario_contrasenia = ?";
            preparestat = con.prepareStatement(sql);
            preparestat.setString(1, usuario);
            preparestat.setString(2, contrasenia);
            resultado = preparestat.executeQuery();
            
            Validar = resultado.next();
            
        } catch (SQLException e) {
            e.printStackTrace();
        } finally{
            try {
                if (resultado != null) resultado.close();
                if (preparestat != null) preparestat.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return Validar;
    }
    
}
