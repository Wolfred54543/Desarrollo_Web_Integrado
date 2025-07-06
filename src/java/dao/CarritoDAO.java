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

    public void addItem(Carrito item) throws SQLException {
        try (Connection connection = DatabaseConnection.getInstancia().getConexion()) {
            // Verificar si el producto ya está en el carrito
            String checkSql = "SELECT cantidad FROM Carrito WHERE producto_id = ?";
            try (PreparedStatement checkStmt = connection.prepareStatement(checkSql)) {
                checkStmt.setInt(1, item.getProductoId());
                ResultSet rs = checkStmt.executeQuery();
                if (rs.next()) {
                    // Actualizar cantidad si el producto ya existe
                    int existingQuantity = rs.getInt("cantidad");
                    int newQuantity = existingQuantity + item.getCantidad();
                    String updateSql = "UPDATE Carrito SET cantidad = ? WHERE producto_id = ?";
                    try (PreparedStatement updateStmt = connection.prepareStatement(updateSql)) {
                        updateStmt.setInt(1, newQuantity);
                        updateStmt.setInt(2, item.getProductoId());
                        updateStmt.executeUpdate();
                    }
                } else {
                    // Insertar nuevo producto en el carrito
                    String insertSql = "INSERT INTO Carrito (producto_id, restaurante_id, nombre, precio, foto, cantidad) VALUES (?, ?, ?, ?, ?, ?)";
                    try (PreparedStatement insertStmt = connection.prepareStatement(insertSql)) {
                        insertStmt.setInt(1, item.getProductoId());
                        insertStmt.setInt(2, item.getRestauranteId());
                        insertStmt.setString(3, item.getNombre());
                        insertStmt.setDouble(4, item.getPrecio());
                        insertStmt.setString(5, item.getFoto());
                        insertStmt.setInt(6, item.getCantidad());
                        insertStmt.executeUpdate();
                    }
                }
            }
        }
    }

    public List<Carrito> getItems() throws SQLException {
        List<Carrito> items = new ArrayList<>();
        String sql = "SELECT * FROM Carrito";
        try (Connection connection = DatabaseConnection.getInstancia().getConexion();
             PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                Carrito item = new Carrito();
                item.setProductoId(rs.getInt("producto_id"));
                item.setRestauranteId(rs.getInt("restaurante_id"));
                item.setNombre(rs.getString("nombre"));
                item.setPrecio(rs.getDouble("precio"));
                item.setFoto(rs.getString("foto"));
                item.setCantidad(rs.getInt("cantidad"));
                items.add(item);
            }
        }
        return items;
    }

    public double getTotal() throws SQLException {
        double total = 0;
        String sql = "SELECT SUM(precio * cantidad) as total FROM Carrito";
        try (Connection connection = DatabaseConnection.getInstancia().getConexion();
             PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            if (rs.next()) {
                total = rs.getDouble("total");
            }
        }
        return total;
    }

    public void removeItemById(int id) throws SQLException {
        String sql = "SELECT cantidad FROM Carrito WHERE producto_id = ?";
        try (Connection connection = DatabaseConnection.getInstancia().getConexion();
             PreparedStatement checkStmt = connection.prepareStatement(sql)) {
            checkStmt.setInt(1, id);
            ResultSet rs = checkStmt.executeQuery();
            if (rs.next()) {
                int existingQuantity = rs.getInt("cantidad");
                if (existingQuantity > 1) {
                    // Reducir la cantidad en uno
                    String updateSql = "UPDATE Carrito SET cantidad = ? WHERE producto_id = ?";
                    try (PreparedStatement updateStmt = connection.prepareStatement(updateSql)) {
                        updateStmt.setInt(1, existingQuantity - 1);
                        updateStmt.setInt(2, id);
                        updateStmt.executeUpdate();
                    }
                } else {
                    // Eliminar el producto si la cantidad es 1 o menos
                    String deleteSql = "DELETE FROM Carrito WHERE producto_id = ?";
                    try (PreparedStatement deleteStmt = connection.prepareStatement(deleteSql)) {
                        deleteStmt.setInt(1, id);
                        deleteStmt.executeUpdate();
                    }
                }
            }
        }
    }

    public void clearCart() throws SQLException {
        String sql = "DELETE FROM Carrito";
        try (Connection connection = DatabaseConnection.getInstancia().getConexion();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.executeUpdate();
        }
    }

    public List<Carrito> getItemsByUserId(int userId) throws SQLException {
        List<Carrito> items = new ArrayList<>();
        String sql = "SELECT * FROM Carrito WHERE user_id = ?";
        try (Connection connection = DatabaseConnection.getInstancia().getConexion();
             PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, userId);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Carrito item = new Carrito();
                item.setProductoId(rs.getInt("producto_id"));
                item.setRestauranteId(rs.getInt("restaurante_id"));
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