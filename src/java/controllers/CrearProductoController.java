package controllers;

import dao.MenuDAO;
import dao.ProductoDAO;
import dao.RestauranteDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import models.Menu;
import models.Restaurante;
import utils.DatabaseConnection;
import java.sql.*;
import models.Producto;

@WebServlet(name = "CrearProductoController", urlPatterns = {"/CrearProductoController"})
public class CrearProductoController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        List<Restaurante> restaurantes = new ArrayList<>();
//        try (Connection connection = DatabaseConnection.getConnection()) {
//            RestauranteDAO restauranteDAO = new RestauranteDAO(connection);
//            restaurantes = restauranteDAO.obtenerRestaurantes(); // Obtener la lista de restaurantes
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//
//        request.setAttribute("restaurantes", restaurantes); // Pasar la lista al JSP
//        request.getRequestDispatcher("/WEB-INF/views/Adm_Crear_Producto.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String nombre = request.getParameter("nombre");
        double precio = Double.parseDouble(request.getParameter("precio"));
        String descripcion = request.getParameter("descripcion");
        String foto = request.getParameter("foto");
        int restauranteId = Integer.parseInt(request.getParameter("restauranteId"));

        Producto producto = new Producto(0, nombre, precio, descripcion, foto, restauranteId);

        try {
            ProductoDAO dao = new ProductoDAO(); // Usa Singleton internamente
            dao.agregarProducto(producto);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        response.sendRedirect("ListarProductoController?tipo=admin");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
