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

@WebServlet(name = "ListarRestaurantController", urlPatterns = {"/ListarRestaurantController"})
public class ListarRestaurantController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 String destino = request.getParameter("destino"); // Obtener el destino

    try {
        RestauranteDAO dao = new RestauranteDAO();
        List<Restaurante> restaurantes = dao.obtenerRestaurantes();
        request.setAttribute("restaurantes", restaurantes);
        
        // Redirigir según el destino
        if ("restaurantes".equals(destino)) {
            request.getRequestDispatcher("restaurantes.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("Adm_Lista_Restaurantes.jsp").forward(request, response);
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
