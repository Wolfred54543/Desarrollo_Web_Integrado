<%
    String rol = (String) session.getAttribute("rol");
    if (rol == null || !rol.equals("administrador")) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <!-- Header -->
        <%@include file="componentes/headerAdmin.jsp" %>
    <!-- End of Header -->
    
<body id="page-top">
    <!-- Validar Sesion -->
    <% 
        HttpSession mysession = request.getSession();
        String usuario = (String)request.getSession().getAttribute("usuario");
        if(usuario==null){
            response.sendRedirect("sinLogin.jsp");
        }
    %>
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
                        <h1 class="h3 mb-0 text-gray-800">Bienvenido al Administrador de Restaurantes</h1>
                    </div>
                    
                        <div class="container mt-4 text-white">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="card bg-primary m-2">
                                        <div class="card-body">
                                            <h5 class="card-title">Clientes</h5>
                                            <p class="card-text">91</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="card bg-success m-2">
                                        <div class="card-body">
                                            <h5 class="card-title">Proveedores</h5>
                                            <p class="card-text">2</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="card bg-warning m-2">
                                        <div class="card-body">
                                            <h5 class="card-title">Productos</h5>
                                            <p class="card-text">205</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="card bg-info m-2">
                                        <div class="card-body">
                                            <h5 class="card-title">Facturas</h5>
                                            <p class="card-text">82</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="card bg-dark m-2">
                                        <div class="card-body">
                                            <h5 class="card-title">Existencia total</h5>
                                            <p class="card-text">3019</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="card bg-secondary m-2">
                                        <div class="card-body">
                                            <h5 class="card-title">Existencia vendida</h5>
                                            <p class="card-text">2366</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="card bg-danger m-2">
                                        <div class="card-body">
                                            <h5 class="card-title">Importe vendido</h5>
                                            <p class="card-text">S/. 32,678</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="card bg-light text-dark m-2">
                                        <div class="card-body">
                                            <h5 class="card-title">Importe pagado</h5>
                                            <p class="card-text">S/. 32,698</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="card bg-success m-2">
                                        <div class="card-body">
                                            <h5 class="card-title">Importe restante</h5>
                                            <p class="card-text">S/. -20</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="card bg-info m-2">
                                        <div class="card-body">
                                            <h5 class="card-title">Beneficio Neto</h5>
                                            <p class="card-text">S/. 4,505</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <p>Aqui va el contenido del inicio</p>   
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
