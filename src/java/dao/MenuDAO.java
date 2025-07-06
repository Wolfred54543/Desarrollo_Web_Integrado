package dao;

import java.sql.*;
import utils.DatabaseConnection;
import java.util.ArrayList;
import java.util.List;
import models.Menu;
public class MenuDAO {
    
    private Connection connection;
    //SINGLETON NO OLVIDAR
    public MenuDAO() {
        try {
            this.connection = DatabaseConnection.getInstancia().getConexion();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public List<Menu> obtenerMenus() {
        List<Menu> menus = new ArrayList<>();
        String sql = "SELECT menu_id, menu_nombre, menu_categoria, menu_precio, menu_foto FROM menus";

        try (PreparedStatement stmt = connection.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
             
            while (rs.next()) {
                Menu menu = new Menu();
                menu.setId(rs.getInt("menu_id"));
                menu.setNombre(rs.getString("menu_nombre"));
                menu.setCategoria(rs.getString("menu_categoria"));
                menu.setPrecio(rs.getDouble("menu_precio"));
                menu.setFoto(rs.getString("menu_foto"));
                menus.add(menu);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return menus;
    }
    
    public boolean insertarMenu(Menu menu) {
        String sql = "INSERT INTO menus (menu_nombre, menu_categoria, menu_precio, menu_foto) VALUES (?, ?, ?, ?)";
        boolean resultado = false;

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {

            stmt.setString(1, menu.getNombre());
            stmt.setString(2, menu.getCategoria());
            stmt.setDouble(3, menu.getPrecio());
            stmt.setString(4, menu.getFoto());

            int filasAfectadas = stmt.executeUpdate();
            if (filasAfectadas > 0) {
                resultado = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultado;
    }
}