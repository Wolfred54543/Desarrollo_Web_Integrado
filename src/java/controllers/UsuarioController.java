package controllers;

import dao.UsuarioDAO;
import jakarta.servlet.RequestDispatcher;
import models.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "UsuarioController", urlPatterns = {"/UsuarioController"})
public class UsuarioController extends HttpServlet {
    private UsuarioDAO usuarioDAO = new UsuarioDAO();
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("registrar".equals(action)) {
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/registrarUsuario.jsp");
            dispatcher.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String contrasenia = request.getParameter("contrasenia");
        String email = request.getParameter("email");
        String telefono = request.getParameter("telefono");
        
        Usuario usuario = new Usuario();
        usuario.setNombre(nombre);
        usuario.setApellido(apellido);
        usuario.setEmail(email);
        usuario.setContrasenia(contrasenia);
        usuario.setTelefono(telefono);
        usuarioDAO.registrarUsuario(usuario);
        response.sendRedirect("index.jsp");
        
    }
    

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
