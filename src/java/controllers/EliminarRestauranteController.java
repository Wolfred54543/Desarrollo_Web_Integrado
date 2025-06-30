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

@WebServlet(name = "EliminarRestauranteController", urlPatterns = {"/EliminarRestauranteController"})
public class EliminarRestauranteController extends HttpServlet {

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

            try{
                RestauranteDAO dao = new RestauranteDAO(); // DAO obtiene la conexión internamente (Singleton)

                // Verificar si el restaurante tiene productos
                if (dao.productosAlmacenados(id)) {
                    request.setAttribute("errorMessage", "No se puede eliminar el restaurante porque contiene productos.");
                    request.getRequestDispatcher("Adm_Lista_Restaurantes.jsp").forward(request, response); // Redirigir al controlador
                    return;
                }

                dao.eliminarRestaurante(id);
                response.sendRedirect("ListarRestaurantController");
                } catch (Exception e) {
                    e.printStackTrace();
                    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al eliminar restaurante.");
                }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
