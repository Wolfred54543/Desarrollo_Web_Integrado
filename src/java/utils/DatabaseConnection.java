package utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    
    private static DatabaseConnection instanciaUnica;
    private Connection conexion;
    
    // Constantes de conexión
    private static final String URL = "jdbc:mysql://localhost:3306/db_restaurant?useSSL=false";
    private static final String USER = "root";
    private static final String PASSWORD = ""; 

    // Constructor privado (solo se llama una vez)
    private DatabaseConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            this.conexion = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            throw new SQLException("No se pudo encontrar el driver JDBC.", e);
        }
    }

    // Método público para obtener la única instancia
    public static DatabaseConnection getInstancia() throws SQLException {
        if (instanciaUnica == null || instanciaUnica.getConexion().isClosed()) {
            instanciaUnica = new DatabaseConnection();
        }
        return instanciaUnica;
    }

    // Método para obtener la conexión
    public Connection getConexion() {
        return conexion;
    }
    // ¿Debes cerrar la conexión? 
    // No. En un Singleton, la conexión se reutiliza y no debe cerrarse después de cada operación.
    // Cerrar una conexión compartida rompería futuras llamadas. Solo ciérrala si estás seguro de que la app completa termina.
}