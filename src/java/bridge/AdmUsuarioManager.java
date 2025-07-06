package bridge;
import dao.UsuarioDAO;
import models.AdmUsuario;
import java.util.List;

public abstract class AdmUsuarioManager {
    protected UsuarioDAO usuarioDAO;

    protected AdmUsuarioManager(UsuarioDAO usuarioDAO) {
        this.usuarioDAO = usuarioDAO;
    }

    public abstract List<AdmUsuario> listar();
    public abstract List<AdmUsuario> listarPorRol(String rol);
}