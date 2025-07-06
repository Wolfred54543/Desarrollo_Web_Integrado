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
                        <h1 class="h3 mb-0 text-gray-800">Lista de Restaurantes</h1>
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
                                                        <th>Foto</th>
                                                        <th>Nombre</th>
                                                        <th>Dirección</th>
                                                        <th>Teléfono</th>
                                                        <th>Acciones</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="restaurante" items="${restaurantes}">
                                                        <tr>
                                                            <td>${restaurante.id}</td>
                                                            <td><img src="img/Restaurantes/${restaurante.foto}" class="product-image" style="
                                                                    width: 60px;
                                                                    height: 60px;
                                                                    object-fit: cover;
                                                                    margin-right: 10px;">                   
                                                            </td>
                                                            <td>${restaurante.nombre}</td>
                                                            <td>${restaurante.direccion}</td>
                                                            <td>${restaurante.telefono}</td>
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

    <!-- Modal -->
    <div class="modal fade" id="errorModal" tabindex="-1" role="dialog" aria-labelledby="errorModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="errorModalLabel">Error</h5>
                </div>
                <div class="modal-body">
                    ${errorMessage}
                </div>
                <div class="modal-footer">
                    <a href="ListarRestaurantController" class="btn btn-outline-dark">Cerrar</a>
                </div>
            </div>
        </div>
    </div>

    <script>
        $(document).ready(function() {
            <% if (request.getAttribute("errorMessage") != null) { %>
                $('#errorModal').modal('show');
            <% } %>
    });
    </script>
</body>
</html>