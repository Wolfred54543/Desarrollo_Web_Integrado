package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import dao.MetodoPagoDAO;
import java.time.LocalDate;
import models.MetodoPago;

/**
 *
 * @author franc
 */
@WebServlet(name = "MetodoPagoController", urlPatterns = {"/MetodoPagoController"})
public class MetodoPagoController extends HttpServlet {

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
        MetodoPago metodo = new MetodoPago();

        metodo.setTipo(request.getParameter("tipoPago"));
        metodo.setNombreCliente(request.getParameter("nombreCliente"));
        metodo.setDireccionCliente(request.getParameter("direccionCliente"));
        metodo.setCorreoCliente(request.getParameter("correoCliente"));
        metodo.setTelefonoCliente(request.getParameter("telefonoCliente"));

       // Solo si es tarjeta
       if ("tarjeta".equalsIgnoreCase(metodo.getTipo())) {
           metodo.setTitular(request.getParameter("nombreTitular"));
           metodo.setNumeroTarjeta(request.getParameter("numeroTarjeta"));
           metodo.setCvv(request.getParameter("cvv"));

           String fecha = request.getParameter("fechaVencimiento");
           if (fecha != null && !fecha.isEmpty()) {
               metodo.setFechaVencimiento(LocalDate.parse(fecha));
           }
       }

       // Obtener latitud y longitud
       String lat = request.getParameter("latitud");
       String lng = request.getParameter("longitud");

       if (lat != null && lng != null && !lat.isEmpty() && !lng.isEmpty()) {
           try {
               metodo.setLatitud(Double.parseDouble(lat));
               metodo.setLongitud(Double.parseDouble(lng));
           } catch (NumberFormatException e) {
               System.out.println("Latitud o longitud inválida");
           }
       }

       try {
            MetodoPagoDAO dao = new MetodoPagoDAO();
            dao.guardarMetodoPago(metodo);

            // Enviar latitud y longitud al JSP
            request.getSession().setAttribute("clienteLatitud", metodo.getLatitud());
            request.getSession().setAttribute("clienteLongitud", metodo.getLongitud());

            // Redirige con forward para mantener los atributos
            request.getRequestDispatcher("detalle_pedido.jsp").forward(request, response);
       } catch (Exception e) {
           e.printStackTrace();
           response.sendError(500, "Error al guardar método de pago");
       }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
