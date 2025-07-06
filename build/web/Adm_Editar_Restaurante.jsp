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
            <h1 class="h3 mb-0 text-gray-800">Editar Restaurante</h1>
        </div>
                    
      <div class="container">

        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
                <!-- Nested Row within Card Body -->
                <div class="row">
                    <!--<div class="col-lg-5 d-none d-lg-block bg-register-image"></div>-->
                    <div class="col-lg-12">
                        <div class="p-5">
                            <form class="user" action="ActualizarRestauranteController" method="POST">
                                <input type="hidden" name="id" value="${restaurante.id}">
                                <div class="form-group row d-flex justify-content-center">
                                    <div class="col-sm-6 mb-3">
                                        <input type="text" class="form-control form-control-user" name="nombre" value="${restaurante.nombre}"
                                            placeholder="Nombre del Restaurante">
                                    </div>
                                    <div class="col-sm-6 mb-3">
                                        <input type="text" class="form-control form-control-user" name="direccion" value="${restaurante.direccion}"
                                            placeholder="Direccion del Restaurante">
                                    </div>
                                    <div class="col-sm-6 mb-3">
                                        <input type="text" class="form-control form-control-user" name="telefono" value="${restaurante.telefono}"
                                            placeholder="Telefono del Restaurante">
                                    </div>
                                </div>
                                    <div class="form-group row d-flex justify-content-center">
                                        <div class="col-sm-6 mb-3">
                                            <label>Foto del Restaurante</label>
                                            <input type="file" class="" name="foto">
                                        </div>
                                    </div>
                                    <!-- Campos ocultos para latitud y longitud -->
                                    <input type="hidden" id="latitud" name="latitud" value="${restaurante.latitud}" />
                                    <input type="hidden" id="longitud" name="longitud" value="${restaurante.longitud}" />
                                    
                                    <div class="form-group row d-flex justify-content-center">
                                        <div class="col-sm-6 mb-3">
                                            <label>Ubicación en el Mapa:</label>
                                            <div id="map" style="height: 400px;"></div>
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
<script>
    // Inicializa el mapa con los valores del restaurante o valores por defecto
    var lat = ${restaurante.latitud != null ? restaurante.latitud : -16.4090};
    var lng = ${restaurante.longitud != null ? restaurante.longitud : -71.5370};

    var map = L.map('map').setView([lat, lng], 13);
    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        maxZoom: 19,
        attribution: '© OpenStreetMap'
    }).addTo(map);

    var marker = L.marker([lat, lng], {draggable: true}).addTo(map);
    marker.bindPopup("Ubicación actual").openPopup();

    // Actualiza los inputs al mover el marcador
    function updateLatLngInputs(lat, lng) {
        document.getElementById('latitud').value = lat;
        document.getElementById('longitud').value = lng;
    }

    marker.on('dragend', function (e) {
        var position = marker.getLatLng();
        updateLatLngInputs(position.lat, position.lng);
    });

    // También permite click en el mapa para mover el marcador
    map.on('click', function(e) {
        var lat = e.latlng.lat;
        var lng = e.latlng.lng;
        marker.setLatLng([lat, lng]);
        updateLatLngInputs(lat, lng);
    });
</script>

</html>