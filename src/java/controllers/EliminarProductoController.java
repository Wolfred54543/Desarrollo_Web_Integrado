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

@WebServlet(name = "EliminarProductoController", urlPatterns = {"/EliminarProductoController"})
public class EliminarProductoController extends HttpServlet {

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

            try {
                ProductoDAO dao = new ProductoDAO(); // DAO obtiene conexión vía Singleton

                dao.eliminarProducto(id);
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
