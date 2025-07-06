package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.ProductoDAO;
import utils.DatabaseConnection;
import java.sql.*;
import java.util.List;
import models.Producto;

@WebServlet(name = "ActualizarProductoController", urlPatterns = {"/ActualizarProductoController"})
public class ActualizarProductoController extends HttpServlet {

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
        Double precio = Double.parseDouble(request.getParameter("precio"));
        String descripcion = request.getParameter("descripcion");
        String foto = request.getParameter("foto");
        int restauranteId = Integer.parseInt(request.getParameter("restauranteId"));
        
        Producto producto = new Producto(id, nombre, precio, descripcion, foto, restauranteId);

        try {
            ProductoDAO dao = new ProductoDAO();
            dao.actualizarProducto(producto);
            
            List<Producto> listaProductos = dao.obtenerProductos();
            request.getSession().setAttribute("listaProductos", listaProductos);
            response.sendRedirect("ListarProductoController?tipo=admin");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
