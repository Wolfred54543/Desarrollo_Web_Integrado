<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <%-- Head Start --%>
            <%@include file="componentes/head.jsp"%>
            <link rel="stylesheet" href="css/login.css"/>
        <%-- Head End --%>
    </head>
    
    <body>
        <div class="container-fluid container-bg align-content-start">
            <div class="">
                <div class="text-white text-center">          
                    <img src="img/Logo/logo.webp" width="200" alt="logo" class="img-fluid">
                    <h2 class="font">Food Mastering</h2>
                </div>
            </div>
            
            <div class="row justify-content-center">
                <div class="col-lg-4 col-sm-8">
                    <form action="LoginController" method="POST" class="form-control form-bg p-5 text-white">
                        <h3 class="text-center pb-3">INICIAR SESION</h3>
                        <div class="mb-3 row">
                            <label for="inputUser" class="form-label">Usuario</label>
                            <div class="col-sm-12">
                                <input type="email" class="form-control" id="inputUser" name="email" required>
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <label for="inputPassword" class="form-label">Contraseña</label>
                            <div class="col-sm-12">
                                <input type="password" class="form-control" id="inputPassword" name="contrasenia" required>
                            </div>
                        </div>
                        <div class="text-center mb-3">
                            <button class="btn btn-dark" type="submit">Iniciar Sesion</button>
                        </div>
                        <c:if test="${not empty error}">
                            <div class="alert alert-danger p-2 text-center" role="alert">${error}</div>
                        </c:if>
                        <p class="text-center">No tiene una cuenta? Registrese <a href="register.jsp">Aqui</a></p>
                    </form>
                    <br>
                </div>
            </div>
        </div>
    </body>
</html>
