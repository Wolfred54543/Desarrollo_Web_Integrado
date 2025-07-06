package bridge;

import dao.UsuarioDAO;
import java.sql.SQLException;
import models.AdmUsuario;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class SimpleUsuarioManager extends AdmUsuarioManager {
    public SimpleUsuarioManager(UsuarioDAO usuarioDAO) {
        super(usuarioDAO);
    }

    @Override
    public List<AdmUsuario> listar() {
        try {
            return usuarioDAO.obtenerUsuarios();
        } catch (SQLException ex) {
            Logger.getLogger(SimpleUsuarioManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    @Override
    public List<AdmUsuario> listarPorRol(String rol) {
        try {
            return usuarioDAO.listarUsuariosPorRol(rol);
        } catch (SQLException ex) {
            Logger.getLogger(SimpleUsuarioManager.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}