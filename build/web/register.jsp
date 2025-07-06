<%@page import="java.sql.*"%>
<%@page import="conexion.Conexion"%>
<%@page import="java.io.*, controllers.Register" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%-- Head Start --%>
            <%@include file="componentes/head.jsp"%>
            <link rel="stylesheet" href="css/register.css"/>
        <%-- Head End --%>
    </head>
    
    <body>
        <div class="container-fluid container-bg align-content-center">
            
            <div class="row justify-content-center">
                <div class="col-lg-5 col-sm-10">
                    <form action="register.jsp" method="POST" class="form-control form-bg text-white p-5">
                        <h3 class="text-center pb-3">REGISTRO</h3>
                        <div class="mb-3 row">
                            <div class="col-md-6">
                                <label for="inputNombre" class="form-label">Nombre</label>
                                <input type="text" class="form-control" id="inputNombre" name="nombre" required>
                            </div>
                            <div class="col-md-6">
                                <label for="inputApellido" class="form-label">Apellido</label>
                                <input type="text" class="form-control" id="inputApellido" name="apellido" required>
                            </div> 
                        </div>
                            <div class="mb-3 row">
                                <label for="inputUsuario" class="form-label">Nombre de Usuario</label>
                                <div class="col-sm-12">
                                <input type="text" class="form-control" id="inputUsuario" name="usuario" required>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputPassword" class="form-label">Contraseña</label>
                                <div class="col-sm-12">
                                <input type="password" class="form-control" id="inputPassword" name="contrasenia" required>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputEmail" class="form-label">Correo Electrónico</label>
                                <div class="col-sm-12">
                                <input type="email" class="form-control" id="inputEmail" name="email" required>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputTelefono" class="form-label">Teléfono</label>
                                <div class="col-sm-12">
                                <input type="tel" class="form-control" id="inputTelefono" name="telefono" required>
                                </div>
                            </div>
                            <div class="text-center">
                                <button class="btn btn-dark mb-3" type="submit">Registrarse</button>
                            </div>
                        <p class="text-center">Volver al <a href="login.jsp">Inicio de Sesion</a></p>
                    </form>
                    <br>
                    <% 
                        // Manejo de la lógica de registro 
                        if ("POST".equalsIgnoreCase(request.getMethod())) {
                            String nombre = request.getParameter("nombre"); 
                            String apellido = request.getParameter("apellido"); 
                            String usuario = request.getParameter("usuario"); 
                            String contrasenia = request.getParameter("contrasenia"); 
                            String email = request.getParameter("email"); 
                            String telefono = request.getParameter("telefono"); 

                            // Llamar a la clase Register para registrar el usuario
                            boolean registrado = Register.registrarUsuario(nombre, apellido, usuario, contrasenia, email, telefono);
                            if (registrado) {
                                out.println("<div class='alert alert-success' role='alert'>Usuario Registrado exitosamente!</div>");
                            } else {
                                out.println("<div class='alert alert-danger' role='alert'>No se puede procesar el registro</div>");
                            }
                        }
                    %>
                </div>
            </div>   
        </div>
    </body>
</html>