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

@WebServlet(name = "EditarRestauranteController", urlPatterns = {"/EditarRestauranteController"})
public class EditarRestauranteController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));

        try {
            RestauranteDAO dao = new RestauranteDAO(); // DAO usa Singleton internamente
            Restaurante restaurante = dao.obtenerRestaurantePorId(id); 
            request.setAttribute("restaurante", restaurante);
            request.getRequestDispatcher("Adm_Editar_Restaurante.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al cargar restaurante.");
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
