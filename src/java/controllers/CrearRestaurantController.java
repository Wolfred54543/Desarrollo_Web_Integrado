package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.RestauranteDAO;
import utils.DatabaseConnection;
import java.sql.*;
import models.Restaurante;

@WebServlet(name = "CrearRestaurantController", urlPatterns = {"/CrearRestaurantController"})
public class CrearRestaurantController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String nombre = request.getParameter("nombre");
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");
        String foto = request.getParameter("foto");
        
        // Obtener las coordenadas
        double latitud = Double.parseDouble(request.getParameter("latitud"));
        double longitud = Double.parseDouble(request.getParameter("longitud"));
        
        // Crear el objeto Restaurante con las coordenadas
        Restaurante restaurante = new Restaurante(0, nombre, direccion, telefono, foto, latitud, longitud);

        try {
            RestauranteDAO dao = new RestauranteDAO(); // DAO obtiene conexión por sí solo (Singleton)
            dao.crearRestaurante(restaurante);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al crear el restaurante.");
            return;
        }

        response.sendRedirect("ListarRestaurantController"); 
    
    }
    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
