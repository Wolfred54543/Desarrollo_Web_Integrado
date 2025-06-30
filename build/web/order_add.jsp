<%@page import="java.sql.*"%>
<%@page import="conexion.Conexion"%>
<%@page import="java.io.*, controllers.Register_order" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <%@include file="componentes/head.jsp"%>
        
    </head>
    
    <body >
        
        <%@include file="componentes/nav.jsp"%>
        
        <div class="container-fluid container-bg align-content-center p-5">
            <div class="row justify-content-center">
                <div class="col-lg-5 col-sm-10">
                    <form action="order_add.jsp" method="POST" class="form-control form-bg bg-light text-black p-5">
                        <h3 class="text-center pb-3">AÑADIR MENU</h3>
                        <div class="mb-3 row">
                            <div class="col-md-6">
                                <label for="inputNombre" class="form-label">Nombre del menu</label>
                                <input type="text" class="form-control" id="inputNombre" name="nombre_menu" required>
                            </div>
                            <div class="col-md-6">
                                <label for="inputApellido" class="form-label">Descripcion del menu</label>
                                <input type="text" class="form-control" id="inputApellido" name="descripcion_menu" required>
                            </div> 
                        </div>
                            <div class="mb-3 row">
                                <label for="inputUsuario" class="form-label">Precio del menu</label>
                                <div class="col-sm-12">
                                <input type="text" class="form-control" id="inputUsuario" name="precio_menu" required>
                                </div>
                            </div>
                            <div class="mb-3 row">
                                <label for="inputEmail" class="form-label">Foto del menu</label>
                                <div class="col-sm-12">
                                    <input type="file" class="form-control" id="inputEmail" name="foto_menu" required>
                                </div>
                            </div>
                            <div class="text-center">
                                <button class="btn btn-dark mb-3" type="submit">Registrar Plato</button>
                            </div>
                        <p class="text-center">Volver a <a href="orders.jsp">Pedidos</a></p>
                    </form>
                    <br>
                    <% 
                        // Manejo de la lógica de registro 
                        if ("POST".equalsIgnoreCase(request.getMethod())) {
                            String nombreMenu = request.getParameter("nombre_menu"); 
                            String descripcionMenu = request.getParameter("descripcion_menu"); 
                            String precioMenu = request.getParameter("precio_menu"); 
                            String fotoMenu = request.getParameter("foto_menu"); 


                            // Llamar a la clase Register para registrar el usuario
                            boolean registrado = Register_order.registrarMenu(nombreMenu, descripcionMenu, precioMenu, fotoMenu);
                            if (registrado) {
                                out.println("<div class='alert alert-success' role='alert'>Menu Registrado exitosamente!</div>");
                            } else {
                                out.println("<div class='alert alert-danger' role='alert'>No se puede procesar el registro</div>");
                            }
                        }
                    %>
                </div>
            </div>   
        </div>
    <%@include file="componentes/footer.jsp"%>
    </body>
        <%-- Script Start --%>
            <%@include file="componentes/script.jsp"%>
        <%-- Script End --%>
</html>
