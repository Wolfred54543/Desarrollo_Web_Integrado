package controllers;

import java.io.IOException;
import java.sql.SQLException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import dao.CarritoDAO;
import dao.RestauranteDAO;
import models.Carrito;
import models.Restaurante;

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
     // Obtener parámetros del producto
        String nombre = request.getParameter("carrito_nombre");
        String precioParam = request.getParameter("carrito_precio");
        String foto = request.getParameter("carrito_foto");
        String productoIdParam = request.getParameter("carrito_id");
        String restauranteIdParam = request.getParameter("carrito_restaurante_id");
        String cantidadParam = request.getParameter("carrito_cantidad");

        // Validaciones básicas
        if (productoIdParam == null || restauranteIdParam == null || cantidadParam == null ||
            productoIdParam.isEmpty() || restauranteIdParam.isEmpty() || cantidadParam.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Datos incompletos del producto.");
            return;
        }

        try {
            int productoId = Integer.parseInt(productoIdParam);
            int restauranteId = Integer.parseInt(restauranteIdParam);
            int cantidad = Integer.parseInt(cantidadParam);
            double precio = Double.parseDouble(precioParam);

            // Obtener datos del restaurante
            RestauranteDAO restauranteDAO = new RestauranteDAO();
            Restaurante restaurante = restauranteDAO.obtenerPorId(restauranteId);

            if (restaurante == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Restaurante no encontrado.");
                return;
            }

            // Construir objeto Carrito completo
            Carrito item = new Carrito(productoId, restauranteId, nombre, precio, foto, cantidad);
            item.setNombreRestaurante(restaurante.getNombre());
            item.setLatitud(restaurante.getLatitud());
            item.setLongitud(restaurante.getLongitud());

            // Obtener DAO de carrito (puedes modificar esto si decides manejarlo con usuario)
            HttpSession session = request.getSession();
            CarritoDAO carritoDAO = (CarritoDAO) session.getAttribute("cart");

            if (carritoDAO == null) {
                carritoDAO = new CarritoDAO();
                session.setAttribute("cart", carritoDAO);
            }

            carritoDAO.addItem(item);

            // Redirigir al carrito
            response.sendRedirect("cart_list.jsp");

        } catch (NumberFormatException | SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al procesar el carrito.");
        }
    }


    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
