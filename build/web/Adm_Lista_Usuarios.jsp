<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <!-- Header -->
    <%@include file="componentes/headerAdmin.jsp" %>
    <!-- End of Header -->
    
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">
        
        <!-- Menu -->
        <%@include file="componentes/menuAdmin.jsp" %>
        <!-- End of Menu -->
  
        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Navbar -->
                <%@include file="componentes/navbarAdmin.jsp" %>
                <!-- End of Navbar -->
                
                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Lista de Clientes</h1>
                    </div>
                    
                    <div class="container">
                        <div class="card o-hidden border-0 shadow-lg my-5">
                            <div class="card-body p-0">
                                <div class="row">
                                    <div class="col-lg-12 justify-content-center">
                                        <div class="p-5">
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th>ID</th>
                                                        <th>Nombre</th>
                                                        <th>Apellido</th>
                                                        <th>Email</th>
                                                        <th>Telefono</th>
                                                        <th>Rol</th>
                                                        <th>Acciones</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="usuario" items="${usuarios}">
                                                        <tr>
                                                            <td>${usuario.id}</td>
                                                            <td>${usuario.nombre}</td>
                                                            <td>${usuario.apellido}</td>
                                                            <td>${usuario.email}</td>
                                                            <td>${usuario.telefono}</td>
                                                            <td>${usuario.rol}</td>
                                                            <td style="display: flex; width: 230px;">
                                                                <form name="eliminar" action="EliminarRestauranteController" method="POST" style="margin-right: 10px;">
                                                                    <button type="submit" class="btn btn-danger btn-user"> 
                                                                        <i class="fas fa-trash-alt"></i> Eliminar
                                                                    </button>
                                                                    <input type="hidden" name="id" value="${restaurante.id}">
                                                                </form>  
                                                                <form name="editar" action="EditarRestauranteController" method="GET">
                                                                    <button type="submit" class="btn btn-primary btn-user"> 
                                                                        <i class="fas fa-pencil-alt"></i> Editar
                                                                    </button>
                                                                    <input type="hidden" name="id" value="${restaurante.id}">
                                                                </form>                                             
                                                            </td>                                       
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Page Content -->
            </div>
                
            <!-- Footer -->
            <%@include file="componentes/footerAdmin.jsp" %>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <%@include file="componentes/logoutAdmin.jsp" %>
    <!-- End of Scripts -->
    
    <!-- Scripts -->
    <%@include file="componentes/scriptAdmin.jsp" %>
    <!-- End of Scripts -->
</body>
</html>