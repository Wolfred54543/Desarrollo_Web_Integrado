package controllers;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.UsuarioDAO;
import utils.DatabaseConnection;
import java.sql.*;
import java.util.List;
import models.AdmUsuario;

/**
 *
 * @author franc
 */
@WebServlet(name = "ListarUsuariosController", urlPatterns = {"/ListarUsuariosController"})
public class ListarUsuariosController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            try {
                UsuarioDAO dao = new UsuarioDAO();
                List<AdmUsuario> usuarios = dao.obtenerUsuarios();
                request.setAttribute("usuarios", usuarios);
                request.getRequestDispatcher("Adm_Lista_Usuarios.jsp").forward(request, response);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
