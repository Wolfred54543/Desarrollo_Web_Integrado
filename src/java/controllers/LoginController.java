package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import dao.UsuarioDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

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
        String email = request.getParameter("email");
        String contrasenia = request.getParameter("contrasenia");
        
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        String rol = usuarioDAO.validarUsuario(email, contrasenia);
        
        if (rol != null) {
            HttpSession session = request.getSession();
            session.setAttribute("usuario", email);
            session.setAttribute("rol", rol); 
            
            if (rol.equals("administrador")) {
                response.sendRedirect("admin_dashboard.jsp");
            } else {
                response.sendRedirect("home.jsp");
            }
        } else {
            request.setAttribute("error", "Usuario o Contraseña Incorrectos");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    
    
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
