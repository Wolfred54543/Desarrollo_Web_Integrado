<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
                    <form action="UsuarioController" method="POST" class="form-control form-bg text-white p-5">
                        <h3 class="text-center pb-3">REGISTRO</h3>
                         <input type="hidden" name="action" value="registrar">
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
                                <label for="inputEmail" class="form-label">Correo Electrónico</label>
                                <div class="col-sm-12">
                                <input type="email" class="form-control" id="inputEmail" name="email" required>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputPassword" class="form-label">Contraseña</label>
                                <div class="col-sm-12">
                                <input type="password" class="form-control" id="inputPassword" name="contrasenia" required>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputTelefono" class="form-label">Teléfono</label>
                                <div class="col-sm-12">
                                <input type="tel" class="form-control" id="inputTelefono" name="telefono" required>
                                </div>
                            </div>
                            <div class="text-center">
                                <button class="btn btn-dark mb-3" type="submit" value="Registrar">Registrarse</button>
                            </div>
                        <p class="text-center">Volver al <a href="login.jsp">Inicio de Sesion</a></p>
                    </form>
                    <br>
                </div>
            </div>   
        </div>
    </body>
</html>