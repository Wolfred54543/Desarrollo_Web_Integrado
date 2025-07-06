<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Procesar Pedido</title>
        <%@include file="componentes/head.jsp"%>
    </head>
    <body>
        <%-- Nav Start --%>
            <%@include file="componentes/nav.jsp"%>
        <%-- Nav End --%>
        
        <div class="alert alert-success my-5 p-2" role="alert">
          <h4 class="alert-heading">Su pedido ha sido procesado exitosamente!</h4>
          <p>Puede solicitar el delivery o vistar nuestro establecimiento</p>
          <hr>
          <p class="mb-0">Muchas Gracias</p>
        </div><br>
        <div class="map mt-5 p-2">
            <div class="alert-info p-3">ESTAMOS UBICADOS EN AREQUIPA:</div>
            <div class="map__iframe">
                <iframe  src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d2684.409263695538!2d-71.5374512849433!3d-16.409047988386734!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sbd!4v1649999999999" height="300" width="100%" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
            </div>
        </div>
        <%-- Footer Start --%>
            <%@include file="componentes/footer.jsp"%>
        <%-- Footer End --%>
    </body>
        <%-- Script Start --%>
            <%@include file="componentes/script.jsp"%>
        <%-- Script End --%>
</html>
