<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <%@include file="componentes/head.jsp"%>
    </head>
    <body>
        <%-- Nav Start --%>
            <%@include file="componentes/nav.jsp"%>
        <%-- Nav End --%>
        
        <section class="py-5">
            <div class="container px-5">
                <div class="bg-light rounded-4 py-5 px-4 px-md-5">
                    <div class="text-center mb-5">
                        <h1 class="fw-bolder">Tienes Alguna Sugerencia o Queja</h1>
                        <p class="lead fw-normal text-muted mb-0">No dudes en consultarnos!</p>
                    </div>
                    <div class="row gx-5 justify-content-center">
                        <div class="col-lg-8 col-xl-6">
                            <form>
                                <div class="form-floating mb-3">
                                    <input class="form-control" id="name" type="text" placeholder="Ingresa tu nombre"/>
                                    <label for="nombre">Ingresa tu nombre</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input class="form-control" id="email" type="email" placeholder="Ingresa tu correo">
                                    <label for="email">Correo electronico</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <input class="form-control" id="phone" type="text" placeholder="Numero de telefono"/>
                                    <label for="telefono">Telefono</label>
                                </div>
                                <div class="form-floating mb-3">
                                    <textarea class="form-control" id="message" type="text" placeholder="Mensaje" style="height: 10rem"></textarea>
                                    <label for="mensaje">Mensaje</label>
                                </div>
                                <div class="d-grid"><button class="btn btn-dark btn-lg" type="submit">Enviar</button></div>
                            </form>
                        </div>
                    </div>
                    <div class="map mt-5">
                        <div class="alert-info p-3">ESTAMOS UBICADOS EN AREQUIPA:</div>
                        <div class="map__iframe">
                            <iframe  src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d2684.409263695538!2d-71.5374512849433!3d-16.409047988386734!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2sbd!4v1649999999999" height="300" width="100%" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <%-- Footer Start --%>
            <%@include file="componentes/footer.jsp"%>
        <%-- Footer End --%>
    </body>
</html>
