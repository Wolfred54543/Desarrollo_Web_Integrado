package utils;

import java.sql.Connection;
import java.sql.SQLException;

public class Probar_Conexion {
    public static void main(String[] args) {
        try {
            // Usar el Singleton para obtener la conexión
            Connection con = DatabaseConnection.getInstancia().getConexion();

            if (con != null && !con.isClosed()) {
                System.out.println("Conexión exitosa (usando Singleton)");
                con.close(); // Esto cierra la conexión, pero puedes reabrirla luego si es necesario
            } else {
                System.out.println("No se pudo establecer la conexión.");
            }
        } catch (SQLException e) {
            System.err.println("Error de conexión: " + e.getMessage());
            e.printStackTrace();
        }
    }
}