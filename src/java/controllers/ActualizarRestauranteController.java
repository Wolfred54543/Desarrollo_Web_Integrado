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
import java.util.List;
import models.Restaurante;

@WebServlet(name = "ActualizarRestauranteController", urlPatterns = {"/ActualizarRestauranteController"})
public class ActualizarRestauranteController extends HttpServlet {

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
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        String direccion = request.getParameter("direccion");
        String telefono = request.getParameter("telefono");
        String foto = request.getParameter("foto");
        
        
        double latitud = Double.parseDouble(request.getParameter("latitud"));
        double longitud = Double.parseDouble(request.getParameter("longitud"));
        
        Restaurante restaurante = new Restaurante(id, nombre, direccion, telefono, foto);
        restaurante.setLatitud(latitud);
        restaurante.setLongitud(longitud);

        try {
            RestauranteDAO dao = new RestauranteDAO(); // Usa la conexión Singleton internamente
            dao.actualizarRestaurante(restaurante);

            List<Restaurante> listaRestaurantes = dao.obtenerRestaurantes();
            request.getSession().setAttribute("listaRestaurantes", listaRestaurantes);

            response.sendRedirect("ListarRestaurantController");
     
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
