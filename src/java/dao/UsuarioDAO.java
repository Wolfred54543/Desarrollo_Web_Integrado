package dao;

import models.AdmUsuario;
import models.Usuario;
import utils.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class UsuarioDAO {
    
    private Connection connection;
    
    public UsuarioDAO() {
        try {
            this.connection = DatabaseConnection.getInstancia().getConexion();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public UsuarioDAO(Connection connection) {
        this.connection = connection;
    }
    
    public void registrarUsuario(Usuario usuario) {
        String query = "INSERT INTO usuarios (nombre, apellido, email, contrasenia, telefono) VALUES (?, ?, ?, ?, ?)";

        try (Connection connection = DatabaseConnection.getInstancia().getConexion();
             PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, usuario.getNombre());
            statement.setString(2, usuario.getApellido());
            statement.setString(3, usuario.getEmail());
            statement.setString(4, usuario.getContrasenia());
            statement.setString(5, usuario.getTelefono());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
     public String validarUsuario(String email, String contrasenia) {
        String sql = "SELECT rol FROM usuarios WHERE email = ? AND contrasenia = ?";
        
        try (Connection conn = DatabaseConnection.getInstancia().getConexion();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            stmt.setString(2, contrasenia);
            
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
            return rs.getString("rol");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    public List<AdmUsuario> obtenerUsuarios() throws SQLException {
        List<AdmUsuario> usuarios = new ArrayList<>();
        String sql = "SELECT id, nombre, apellido, email, telefono, rol FROM Usuarios WHERE rol='cliente'";

        try (PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String nombre = resultSet.getString("nombre");
                String apellido = resultSet.getString("apellido");
                String email = resultSet.getString("email");
                String telefono = resultSet.getString("telefono");
                String rol = resultSet.getString("rol");
                AdmUsuario usuariolist = new AdmUsuario(id, nombre,apellido,email,telefono, rol);
                usuarios.add(usuariolist);
            }
        }
        return usuarios;
    }
        // Método para listar usuarios por rol (BRIDGE)
    public List<AdmUsuario> listarUsuariosPorRol(String rol) throws SQLException {
        List<AdmUsuario> usuarios = new ArrayList<>();
        String sql = "SELECT id, nombre, apellido, email, telefono, rol FROM usuarios";
        if (rol != null) {
            sql += " WHERE rol = ?";
        }

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            if (rol != null) {
                statement.setString(1, rol);
            }
            try (ResultSet resultSet = statement.executeQuery()) {
                while (resultSet.next()) {
                    int id = resultSet.getInt("id");
                    String nombre = resultSet.getString("nombre");
                    String apellido = resultSet.getString("apellido");
                    String email = resultSet.getString("email");
                    String telefono = resultSet.getString("telefono");
                    String rolUsuario = resultSet.getString("rol");
                    AdmUsuario usuariolist = new AdmUsuario(id, nombre, apellido, email, telefono, rolUsuario);
                    usuarios.add(usuariolist);
                }
            }
        }
        return usuarios;
    }
        public AdmUsuario obtenerUsuarioPorId(int id) throws SQLException {
        String sql = "SELECT * FROM usuarios WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return new AdmUsuario(
                        resultSet.getInt("id"),
                        resultSet.getString("nombre"),
                        resultSet.getString("apellido"),
                        resultSet.getString("email"),
                        resultSet.getString("telefono"),
                        resultSet.getString("rol")
                    );
                }
            }
        }
        return null;
    }

    public void eliminarUsuario(int id) throws SQLException {
        String sql = "DELETE FROM usuarios WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        }
    }

    public void actualizarUsuario(AdmUsuario usuario) throws SQLException {
        String sql = "UPDATE usuarios SET nombre = ?, apellido = ?, email = ?, telefono = ? WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, usuario.getNombre());
            statement.setString(2, usuario.getApellido());
            statement.setString(3, usuario.getEmail());
            statement.setString(4, usuario.getTelefono());
            statement.setInt(5, usuario.getId());
            statement.executeUpdate();
        }
    }
}