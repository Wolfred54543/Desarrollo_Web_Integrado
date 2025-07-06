package controllers;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import dao.CarritoDAO;
import models.Carrito;

@WebServlet(name = "CarritoController", urlPatterns = {"/CarritoController"})
public class CarritoController extends HttpServlet {

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
String nombre = request.getParameter("carrito_nombre");
    String precio = request.getParameter("carrito_precio");
    String foto = request.getParameter("carrito_foto");
    String idParam = request.getParameter("carrito_id"); // Modificado

    if (idParam == null || idParam.isEmpty()) {
        throw new IllegalArgumentException("El ID del producto no puede ser nulo o vacío.");
    }

    int idProducto = Integer.parseInt(idParam); // Ahora seguro que no es nulo
    int cantidad = Integer.parseInt(request.getParameter("carrito_cantidad"));
    int idRestaurante = Integer.parseInt(idParam);
    Carrito item = new Carrito(idProducto, idRestaurante, nombre, Double.parseDouble(precio), foto, cantidad);

    HttpSession session = request.getSession();
    CarritoDAO cartDAO = (CarritoDAO) session.getAttribute("cart");

    if (cartDAO == null) {
        cartDAO = new CarritoDAO();
        session.setAttribute("cart", cartDAO);
    }

    try {
        cartDAO.addItem(item);
    } catch (Exception e) {
        e.printStackTrace();
        response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al añadir el producto al carrito.");
        return;
    }

    response.sendRedirect("cart_list.jsp");
}

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
