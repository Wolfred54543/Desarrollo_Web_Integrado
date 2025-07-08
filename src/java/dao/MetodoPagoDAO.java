package dao;

import java.sql.*;
import models.MetodoPago;
import utils.DatabaseConnection;

public class MetodoPagoDAO {

    public void guardarMetodoPago(MetodoPago metodo) throws SQLException {
        String sql = "INSERT INTO metodos_pago (tipo, titular, numero_tarjeta, cvv, fecha_vencimiento, nombre_cliente, direccion_cliente, correo_cliente, telefono_cliente, latitud, longitud) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseConnection.getInstancia().getConexion();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, metodo.getTipo());
            stmt.setString(2, metodo.getTitular());
            stmt.setString(3, metodo.getNumeroTarjeta());
            stmt.setString(4, metodo.getCvv());

            if (metodo.getFechaVencimiento() != null) {
                stmt.setDate(5, Date.valueOf(metodo.getFechaVencimiento()));
            } else {
                stmt.setNull(5, Types.DATE);
            }

            stmt.setString(6, metodo.getNombreCliente());
            stmt.setString(7, metodo.getDireccionCliente());
            stmt.setString(8, metodo.getCorreoCliente());
            stmt.setString(9, metodo.getTelefonoCliente());

            if (metodo.getLatitud() != null) {
                stmt.setDouble(10, metodo.getLatitud());
            } else {
                stmt.setNull(10, Types.DOUBLE);
            }

            if (metodo.getLongitud() != null) {
                stmt.setDouble(11, metodo.getLongitud());
            } else {
                stmt.setNull(11, Types.DOUBLE);
            }

            stmt.executeUpdate();
        }
    }
}
