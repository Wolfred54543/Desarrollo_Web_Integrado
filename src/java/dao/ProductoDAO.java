package dao;

import models.Producto;
import utils.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductoDAO {
    private Connection connection;

    //SINGLETON NO OLVIDAR
    public ProductoDAO() {
        try {
            this.connection = DatabaseConnection.getInstancia().getConexion();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void agregarProducto(Producto producto) throws SQLException {
        String sql = "INSERT INTO Productos (nombre, precio, descripcion, foto, restaurante_id) VALUES (?, ?, ?, ?, ?)";
        
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, producto.getNombre());
            statement.setDouble(2, producto.getPrecio());
            statement.setString(3, producto.getDescripcion());
            statement.setString(4, producto.getFoto());
            statement.setInt(5, producto.getRestauranteId());
            statement.executeUpdate();
        }
    }

    public List<Producto> obtenerProductos() throws SQLException {
        List<Producto> productos = new ArrayList<>();
        String sql = "SELECT * FROM Productos";

        try (PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                int id = resultSet.getInt("producto_id");
                String nombre = resultSet.getString("nombre");
                double precio = resultSet.getDouble("precio");
                String descripcion = resultSet.getString("descripcion");
                String foto = resultSet.getString("foto");
                int restauranteId = resultSet.getInt("restaurante_id");
                Producto producto = new Producto(id, nombre, precio, descripcion, foto, restauranteId);
                productos.add(producto);
            }
        }
        return productos;
    }

    public Producto obtenerProductoPorId(int id) throws SQLException {
        String sql = "SELECT * FROM Productos WHERE producto_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return new Producto(
                        resultSet.getInt("producto_id"),
                        resultSet.getString("nombre"),
                        resultSet.getDouble("precio"), 
                        resultSet.getString("descripcion"),
                        resultSet.getString("foto"),
                        resultSet.getInt("restaurante_id")
                    );
                }
            }
        }
        return null;
    }

    public void eliminarProducto(int id) throws SQLException {
        String sql = "DELETE FROM Productos WHERE producto_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        }
    }

    public void actualizarProducto(Producto producto) throws SQLException {
        String sql = "UPDATE Productos SET nombre = ?, precio = ?, descripcion = ?, foto = ?, restaurante_id = ? WHERE producto_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, producto.getNombre());
            statement.setDouble(2, producto.getPrecio());
            statement.setString(3, producto.getDescripcion());
            statement.setString(4, producto.getFoto());
            statement.setInt(5, producto.getRestauranteId());
            statement.setInt(6, producto.getProductoId());
            statement.executeUpdate();
        }
    }
    public List<Producto> obtenerProductosPorRestaurante(int restauranteId) throws SQLException {
        List<Producto> productos = new ArrayList<>();
        String sql = "SELECT * FROM Productos WHERE restaurante_id = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, restauranteId);
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    int id = resultSet.getInt("producto_id");
                    String nombre = resultSet.getString("nombre");
                    double precio = resultSet.getDouble("precio");
                    String descripcion = resultSet.getString("descripcion");
                    String foto = resultSet.getString("foto");
                    Producto producto = new Producto(id, nombre, precio, descripcion, foto, restauranteId);
                    productos.add(producto);
                }
            }
        }
        return productos;
    }
}