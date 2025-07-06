package dao;

import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import models.Restaurante;
import utils.DatabaseConnection;

public class RestauranteDAO {
    private Connection connection;

    // Constructor que usa Singleton
    public RestauranteDAO() {
        try {
            this.connection = DatabaseConnection.getInstancia().getConexion();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public RestauranteDAO(Connection connection) {
        this.connection = connection;
    }

    public void crearRestaurante(Restaurante restaurante) throws SQLException {
        String sql = "INSERT INTO Restaurantes (nombre, direccion, telefono, foto, latitud, longitud) VALUES (?, ?, ?, ?, ?, ?)";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, restaurante.getNombre());
            statement.setString(2, restaurante.getDireccion());
            statement.setString(3, restaurante.getTelefono());
            statement.setString(4, restaurante.getFoto());
            statement.setDouble(5, restaurante.getLatitud());  
            statement.setDouble(6, restaurante.getLongitud()); 
            statement.executeUpdate();
        }
    }

    public List<Restaurante> obtenerRestaurantes() throws SQLException {
        List<Restaurante> restaurantes = new ArrayList<>();
        String sql = "SELECT * FROM Restaurantes";

        try (PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                int id = resultSet.getInt("restaurante_id");
                String nombre = resultSet.getString("nombre");
                String direccion = resultSet.getString("direccion");
                String telefono = resultSet.getString("telefono");
                String foto = resultSet.getString("foto");
                double latitud = resultSet.getDouble("latitud");      
                double longitud = resultSet.getDouble("longitud");   
                Restaurante restaurante = new Restaurante(id, nombre, direccion, telefono, foto, latitud, longitud);
                restaurantes.add(restaurante);
            }
        }
        return restaurantes;
    }

    public Restaurante obtenerRestaurantePorId(int id) throws SQLException {
        String sql = "SELECT * FROM Restaurantes WHERE restaurante_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return new Restaurante(
                        resultSet.getInt("restaurante_id"),
                        resultSet.getString("nombre"),
                        resultSet.getString("direccion"),
                        resultSet.getString("telefono"),
                        resultSet.getString("foto"),
                        resultSet.getDouble("latitud"),      
                        resultSet.getDouble("longitud")    
                    );
                }
            }
        }
        return null;
    }

    public void eliminarRestaurante(int id) throws SQLException {
        String sql = "DELETE FROM Restaurantes WHERE restaurante_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        }
    }

    public void actualizarRestaurante(Restaurante restaurante) throws SQLException {
        String sql = "UPDATE Restaurantes SET nombre = ?, direccion = ?, telefono = ?, foto = ?, latitud = ?, longitud = ? WHERE restaurante_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, restaurante.getNombre());
            statement.setString(2, restaurante.getDireccion());
            statement.setString(3, restaurante.getTelefono());
            statement.setString(4, restaurante.getFoto());
            statement.setDouble(5, restaurante.getLatitud());   
            statement.setDouble(6, restaurante.getLongitud());  
            statement.setInt(7, restaurante.getId());
            statement.executeUpdate();
        }
    }

    public boolean productosAlmacenados(int id) throws SQLException {
        String sql = "SELECT COUNT(*) FROM Productos WHERE restaurante_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getInt(1) > 0;
            }
        }
        return false;
    }
        public Restaurante obtenerPorId(int id) throws SQLException {
        String sql = "SELECT * FROM Restaurantes WHERE restaurante_id = ?";
        try (Connection conn = DatabaseConnection.getInstancia().getConexion();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                Restaurante restaurante = new Restaurante();
                restaurante.setId(rs.getInt("restaurante_id"));
                restaurante.setNombre(rs.getString("nombre"));
                restaurante.setLatitud(rs.getDouble("latitud"));
                restaurante.setLongitud(rs.getDouble("longitud"));
             
                return restaurante;
            }
        }
        return null;
    }

}