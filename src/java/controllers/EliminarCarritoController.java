package controllers;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.*;
import dao.CarritoDAO;

@WebServlet(name = "EliminarCarritoController", urlPatterns = {"/EliminarCarritoController"})
public class EliminarCarritoController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
 try {
            // Obtener el ID del pedido desde la solicitud
            int pedidoId = Integer.parseInt(request.getParameter("pedido_id"));
            HttpSession session = request.getSession();

            // Obtener el DAO del carrito de la sesión
            CarritoDAO cartDAO = (CarritoDAO) session.getAttribute("cart");

            if (cartDAO == null) {
                cartDAO = new CarritoDAO();
                session.setAttribute("cart", cartDAO);
            }

            // Eliminar el artículo del carrito
            cartDAO.removeItemById(pedidoId);

            // Redirigir directamente a car_lis.jsp
            response.sendRedirect(request.getContextPath() + "/cart_list.jsp");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al eliminar el artículo del carrito.");
        } catch (NumberFormatException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID de producto no válido.");
        }
    }

    @Override
    public String getServletInfo() {
        return "Controlador para eliminar artículos del carrito";
    }
}