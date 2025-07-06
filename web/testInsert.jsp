<%@ page import="java.sql.*, conexion.Conexion" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Prueba de Inserción</title>
</head>
<body>
    <h1>Prueba de Inserción en la Base de Datos</h1>

    <form action="testInsert.jsp" method="post">
        <input type="text" name="nombre" placeholder="Nombre" required>
        <input type="text" name="apellido" placeholder="Apellido" required>
        <input type="text" name="usuario" placeholder="Usuario" required>
        <input type="password" name="contrasena" placeholder="Contraseña" required>
        <input type="email" name="email" placeholder="Email" required>
        <input type="text" name="telefono" placeholder="Teléfono" required>
        <button type="submit">Registrar</button>
    </form>

    <%
        if ("POST".equalsIgnoreCase(request.getMethod())) {
            String nombre = request.getParameter("nombre");
            String apellido = request.getParameter("apellido");
            String usuario = request.getParameter("usuario");
            String contrasena = request.getParameter("contrasena");
            String email = request.getParameter("email");
            String telefono = request.getParameter("telefono");

            Connection con = null;
            PreparedStatement ps = null;

            try {
                con = Conexion.conectar();
                String sql = "INSERT INTO usuarios (usuario_nombre, usuario_apellido, usuario_usuario, usuario_contrasenia, usuario_email, usuario_telefono) VALUES (?, ?, ?, ?, ?, ?)";
                ps = con.prepareStatement(sql);
                ps.setString(1, nombre);
                ps.setString(2, apellido);
                ps.setString(3, usuario);
                ps.setString(4, contrasena);
                ps.setString(5, email);
                ps.setString(6, telefono);

                int resultado = ps.executeUpdate();
                if (resultado > 0) {
                    out.println("<h2>Registro insertado exitosamente!</h2>");
                } else {
                    out.println("<h2>Error al insertar el registro.</h2>");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                out.println("<h2>Error en la base de datos: " + e.getMessage() + "</h2>");
            } finally {
                try {
                    if (ps != null) ps.close();
                    if (con != null) con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    %>
</body>
</html>