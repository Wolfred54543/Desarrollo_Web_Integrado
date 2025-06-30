<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
            <h1 class="h3 mb-0 text-gray-800">Editar Producto</h1>
        </div>
                    
      <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <!--<div class="col-lg-5 d-none d-lg-block bg-register-image"></div>-->
                    <div class="col-lg-12">
                        <div class="p-5">
                            <form class="user" action="ActualizarProductoController" method="POST">
                                <input type="hidden" name="id" value="${producto.productoId}">
                                <div class="form-group row d-flex justify-content-center">
                                    <div class="col-sm-6 mb-3">
                                        <input type="text" class="form-control form-control-user" name="nombre" value="${producto.nombre}"
                                            placeholder="Nombre del Producto">
                                    </div>
                                    <div class="col-sm-6 mb-3">
                                        <input type="number" class="form-control form-control-user" name="precio" step="0.01"
                                            placeholder="Precio del Producto" value="${producto.precio}">
                                    </div>
                                    <div class="col-sm-6 mb-3">
                                        <input type="text" class="form-control form-control-user" name="descripcion" value="${producto.descripcion}"
                                            placeholder="Descripcion del Producto">
                                    </div>
                                </div>
                                    <div class="form-group row d-flex justify-content-center">
                                        <div class="col-sm-6 mb-3">
                                            <label>Foto del Producto:</label>
                                            <input type="file" class="" name="foto">
                                        </div>
                                    </div>
                                <div class="form-group row d-flex justify-content-center">
                                    <div class="col-sm-6 mb-3">
                                        <label for="restauranteId" class="">ID del Restaurante:</label><br>
                                        <input type="number" id="restauranteId" class="form-control" name="restauranteId" value="${producto.restauranteId}" required><br>
                                    </div>
                                </div>       
                                            
                                <button type="submit" class="btn btn-dark btn-user btn-block">
                                    Actualizar 
                                </button>
                            </form>
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
    </div>
</body>
</html>