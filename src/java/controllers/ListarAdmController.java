package controllers;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.UsuarioDAO;
import bridge.SimpleUsuarioManager;
import models.AdmUsuario;
import utils.DatabaseConnection;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "ListarAdmController", urlPatterns = {"/ListarAdmController"})
public class ListarAdmController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String rol = "administrador";
        UsuarioDAO usuarioDAO = new UsuarioDAO(); 
        SimpleUsuarioManager manager = new SimpleUsuarioManager(usuarioDAO);
        List<AdmUsuario> usuarios = manager.listarPorRol(rol);
        request.setAttribute("usuarios", usuarios);

        request.getRequestDispatcher("about_us.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Controlador para listar administradores";
    }
}