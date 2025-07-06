package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import dao.CarritoDAO;

@WebServlet(name = "EliminarCarritoController", urlPatterns = {"/EliminarCarritoController"})
public class EliminarCarritoController extends HttpServlet {

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
            int pedidoId = Integer.parseInt(request.getParameter("pedido_id"));
           HttpSession session = request.getSession();
           CarritoDAO cart = (CarritoDAO) session.getAttribute("cart");

           if (cart != null) {
//               cart.removeItemById(pedidoId);
               session.setAttribute("cart", cart);
           }
           response.sendRedirect("cart_list.jsp");
        }
    

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
