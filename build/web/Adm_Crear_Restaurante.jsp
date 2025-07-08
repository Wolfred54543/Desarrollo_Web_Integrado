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
                        <h1 class="h3 mb-0 text-gray-800">Registrar Nuevo Restaurante</h1>
                    </div>
                    
                    <div class="container">
                        <div class="card o-hidden border-0 shadow-lg my-5">
                            <div class="card-body p-0">
                                <!-- Nested Row within Card Body -->
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="p-5">
                                            <form class="user" action="CrearRestaurantController" method="POST">
                                                <div class="form-group row d-flex justify-content-center">
                                                    <div class="col-sm-6 mb-3">
                                                        <input type="text" class="form-control form-control-user" name="nombre" placeholder="Nombre del Restaurante">
                                                    </div>
                                                    <div class="col-sm-6 mb-3">
                                                        <input type="text" class="form-control form-control-user" name="direccion" placeholder="Dirección del Restaurante">
                                                    </div>
                                                    <div class="col-sm-6 mb-3">
                                                        <input type="text" class="form-control form-control-user" name="telefono" placeholder="Teléfono del Restaurante">
                                                    </div>
                                                </div>
                                                <div class="form-group row d-flex justify-content-center">
                                                    <div class="col-sm-6 mb-3">
                                                        <label>Foto del Restaurante:</label>
                                                        <input type="file" class="form-control form-control-file" name="foto">
                                                    </div>
                                                </div>
                                                <div class="form-group row d-flex justify-content-center">                                                   
                                                    <div class="col-sm-6 mb-3">
                                                        <label>Seleccione la ubicacion del restaurante en el mapa:</label>
                                                        <div id="map" style="height: 400px;"></div>
                                                    </div>
                                                </div>
                                                <!-- Campos ocultos para latitud y longitud -->
                                                <input type="hidden" id="latitud" name="latitud" />
                                                <input type="hidden" id="longitud" name="longitud" />

                                                <button type="submit" class="btn btn-dark btn-user btn-block">
                                                    Crear Restaurante 
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
    
    <script>
        // Inicializa el mapa
        var map = L.map('map').setView([-16.4090, -71.5370], 13); // Coordenadas de Arequipa, Perú

        // Capa de OpenStreetMap que trae el mapa
        L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
            maxZoom: 19,
            attribution: '© OpenStreetMap'
        }).addTo(map);

        // Marcador inicial
        var marker = L.marker([-16.4090, -71.5370]).addTo(map); // El marcador tambien inicializa en Arequipa, Perú
        marker.bindPopup("<b>¡Hola!</b><br>Seleccione la ruta del restaurante").openPopup();

        // Evento de clic en el mapa para poder definir la posicion
        map.on('click', function(e) {
            var lat = e.latlng.lat; //latitud
            var lng = e.latlng.lng; //longitud
            document.getElementById('latitud').value = lat; // Actualiza el campo de latitud para mandarlo a la base de datos
            document.getElementById('longitud').value = lng; // Actualiza el campo de longitud para mandarlo a la base de datos
            marker.setLatLng([lat, lng]); // Mueve el marcador y va actualizando los campos de la longitud y latitud
        });
    </script>
</body>
</html>