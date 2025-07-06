package controllers;

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
import utils.DatabaseConnection;
import iterator.ProductoCollection;
import iterator.ProductoIterator;

@WebServlet(name = "ListarProductoController", urlPatterns = {"/ListarProductoController"})
public class ListarProductoController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String tipoUsuario = request.getParameter("tipo");

        try {
            ProductoDAO dao = new ProductoDAO();
             List<Producto> productosBD = dao.obtenerProductos();

            // Usamos el patrón Iterator
            ProductoCollection productoCollection = new ProductoCollection(productosBD);
            ProductoIterator iterator = productoCollection.createIterator();


            request.setAttribute("productos", productosBD);
            
            if ("admin".equals(tipoUsuario)) {
                request.getRequestDispatcher("Adm_Lista_Productos.jsp").forward(request, response);
            } else {
                request.getRequestDispatcher("productos.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al obtener productos.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Implementar según sea necesario
    }

    @Override
    public String getServletInfo() {
        return "Controlador para listar productos.";
    }
}