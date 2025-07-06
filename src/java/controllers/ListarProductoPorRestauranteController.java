package controllers;

import dao.RestauranteDAO;
import dao.ProductoDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import models.Producto;
import models.Restaurante;
import utils.DatabaseConnection;

@WebServlet(name = "ListarProductoPorRestauranteController", urlPatterns = {"/ListarProductoPorRestauranteController"})
public class ListarProductoPorRestauranteController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idParam = request.getParameter("id");
        List<Producto> productos = null;

        if (idParam != null && !idParam.isEmpty()) {
            try {
                int restauranteId = Integer.parseInt(idParam);  

                ProductoDAO productoDao = new ProductoDAO();
                RestauranteDAO restauranteDao = new RestauranteDAO();

                productos = productoDao.obtenerProductosPorRestaurante(restauranteId);
                Restaurante restaurante = restauranteDao.obtenerPorId(restauranteId);

                request.setAttribute("productos", productos);
                request.setAttribute("restaurante", restaurante); // Para el mapa
                request.getRequestDispatcher("productos.jsp").forward(request, response);
            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID de restaurante no válido.");
            } catch (SQLException e) {
                e.printStackTrace();
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al obtener productos o restaurante.");
            }
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID de restaurante no proporcionado.");
        }
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
