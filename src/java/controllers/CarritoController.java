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
        int id = Integer.parseInt(request.getParameter("carrito_id"));
        int cantidad = Integer.parseInt(request.getParameter("carrito_cantidad"));

        Carrito item = new Carrito(id, nombre, Double.parseDouble(precio), foto, cantidad);

        HttpSession session = request.getSession();
        CarritoDAO cart = (CarritoDAO) session.getAttribute("cart");

        if (cart == null) {
            cart = new CarritoDAO();
            session.setAttribute("cart", cart);
        }

        cart.addItem(item);
        
        response.sendRedirect("cart_list.jsp");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
