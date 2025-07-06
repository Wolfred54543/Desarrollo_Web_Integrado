package controllers;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.CarritoDAO;
import java.util.List;
import models.Carrito;

/**
 * Controlador para listar los artículos en el carrito.
 * 
 * @author franc
 */
@WebServlet(name = "ListarCarritoController", urlPatterns = {"/ListarCarritoController"})
public class ListarCarritoController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Instanciar el DAO del carrito
            CarritoDAO dao = new CarritoDAO();
            
            // Obtener los elementos del carrito y el total
            List<Carrito> items = dao.getItems();
            double total = dao.getTotal();

            // Establecer atributos para la JSP
            request.setAttribute("items", items);
            request.setAttribute("total", total);

            // Redirigir a la JSP correcta
            request.getRequestDispatcher("car_list.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            // Manejo de errores
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al cargar el carrito: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Método no utilizado, puedes implementar lógica si es necesario
    }

    @Override
    public String getServletInfo() {
        return "Controlador para listar los artículos en el carrito";
    }
}