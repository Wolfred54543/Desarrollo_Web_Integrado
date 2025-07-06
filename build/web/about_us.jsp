<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Lista de Administradores</title>
    <%@include file="componentes/head.jsp"%>
</head>
<body>
    <%@include file="componentes/nav.jsp"%>
    <section class="page-section bg-light mt-5 mb-5 p-2">
        <div class="container">
            <div class="text-center mb-5">
                <h2 class="section-heading text-uppercase mt-5">NUESTRO EQUIPO DE TRABAJO</h2><br>
                <h4 class="section-subheading text-muted">SISTEMA DE RESTAURANT CON JSP</h4>
            </div>

            <c:if test="${not empty error}">
                <div class="alert alert-danger">${error}</div>
            </c:if>

            <c:if test="${not empty usuarios}">
                <div class="row mb-5">
                    <c:forEach var="usuario" items="${usuarios}">
                        <div class="col-lg-4">
                            <div class="card text-center shadow-lg">
                                <img class="mx-auto rounded-circle" src="img/About_us/about_photo.jpeg" alt="photo1" />
                                <h5 class="card-title">${usuario.nombre} ${usuario.apellido}</h5>
                                <p class="text-muted">Email: ${usuario.email}</p>
                                <p class="text-muted">Teléfono: ${usuario.telefono}</p>
                                <p class="text-muted text-uppercase">${usuario.rol}</p>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </c:if>

            <c:if test="${empty usuarios}">
                <div class="alert alert-info">No hay administradores disponibles.</div>
            </c:if>

            <div class="row mt-4">
                <div class="col-lg-8 mx-auto text-center">
                    <p class="large">Curso Desarrollo Web Integrado | Ciclo Marzo - 2025</p>
                </div>
            </div>
        </div>
</section>
    <%@include file="componentes/footer.jsp"%>
    <%@include file="componentes/script.jsp"%>
</body>
</html>