package dao;

import models.Carrito;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import utils.DatabaseConnection;

public class CarritoDAO {
    private Connection connection;

    public CarritoDAO() {
        try {
            this.connection = DatabaseConnection.getInstancia().getConexion();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void addItem(Carrito item) throws SQLException {
        // Verificar si el producto ya está en el carrito
        String checkSql = "SELECT cantidad FROM Carrito WHERE producto_id = ?";
        try (PreparedStatement checkStmt = connection.prepareStatement(checkSql)) {
            checkStmt.setInt(1, item.getIdProducto());
            ResultSet rs = checkStmt.executeQuery();
            if (rs.next()) {
                // Actualizar cantidad si el producto ya existe
                int existingQuantity = rs.getInt("cantidad");
                int newQuantity = existingQuantity + item.getCantidad();
                String updateSql = "UPDATE Carrito SET cantidad = ? WHERE producto_id = ?";
                try (PreparedStatement updateStmt = connection.prepareStatement(updateSql)) {
                    updateStmt.setInt(1, newQuantity);
                    updateStmt.setInt(2, item.getIdProducto());
                    updateStmt.executeUpdate();
                }
            } else {
                // Insertar nuevo producto en el carrito
                String insertSql = "INSERT INTO Carrito (producto_id, id_restaurante, nombre, precio, foto, cantidad) VALUES (?, ?, ?, ?, ?, ?)";
                try (PreparedStatement insertStmt = connection.prepareStatement(insertSql)) {
                    insertStmt.setInt(1, item.getIdProducto());
                    insertStmt.setInt(2, item.getIdRestaurante());
                    insertStmt.setString(3, item.getNombre());
                    insertStmt.setDouble(4, item.getPrecio());
                    insertStmt.setString(5, item.getFoto());
                    insertStmt.setInt(6, item.getCantidad());
                    insertStmt.executeUpdate();
                }
            }
        }
    }

    public List<Carrito> getItems() throws SQLException {
        List<Carrito> items = new ArrayList<>();
        String sql = "SELECT * FROM Carrito";
        try (PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Carrito item = new Carrito();
                item.setIdProducto(rs.getInt("producto_id")); // Cambiado a idProducto
                item.setIdRestaurante(rs.getInt("id_restaurante")); // Añadido idRestaurante
                item.setNombre(rs.getString("nombre"));
                item.setPrecio(rs.getDouble("precio"));
                item.setFoto(rs.getString("foto"));
                item.setCantidad(rs.getInt("cantidad"));
                items.add(item);
            }
        }catch(SQLException e){
             e.printStackTrace();
        }
        return items;
    }

    public double getTotal() throws SQLException {
        double total = 0;
        String sql = "SELECT SUM(precio * cantidad) as total FROM Carrito";
        try (PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                total = rs.getDouble("total");
            }
        }
        return total;
    }

    public void removeItemById(int id) throws SQLException {
        String sql = "DELETE FROM Carrito WHERE producto_id = ?";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, id);
            stmt.executeUpdate();
        }
    }

    public void clearCart() throws SQLException {
        String sql = "DELETE FROM Carrito";
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.executeUpdate();
        }
    }
        public List<Carrito> getItemsByUserId(int userId) throws SQLException {
        List<Carrito> items = new ArrayList<>();
        String sql = "SELECT * FROM Carrito WHERE user_id = ?"; // Suponiendo que tienes un campo user_id
        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Carrito item = new Carrito();
                item.setIdProducto(rs.getInt("producto_id"));
                item.setIdRestaurante(rs.getInt("id_restaurante"));
                item.setNombre(rs.getString("nombre"));
                item.setPrecio(rs.getDouble("precio"));
                item.setFoto(rs.getString("foto"));
                item.setCantidad(rs.getInt("cantidad"));
                items.add(item);
            }
        }
        return items;
    }
}