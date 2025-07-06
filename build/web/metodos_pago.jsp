<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="models.Producto" %>
<%@ page import="dao.ProductoDAO" %>
<%@ page import="utils.DatabaseConnection" %>
<%@ page import="java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html>
<head>
    <%@include file="componentes/head.jsp"%>
</head>
<body>
    <%@include file="componentes/nav.jsp"%>
    <section class="product spad mt-4">
        <h1 class="text-center mb-5 font text-warning">Metodos de Pago</h1>
        <div class="container">
            <div class="row d-flex justify-content-center">
                    <div class="col-lg-3 col-md-6 col-sm-6 mb-4">
                        <form action="" method="post" class="form-control">
                            <input class="input-group-text" type="text" name="tipo" placeholder="Tipo de pago" required />
                            <input class="input-group-text" type="text" name="descripcion" placeholder="Descripción" required />
                            <button class="btn btn-success" type="submit">Agregar Método de Pago</button>
                        </form>
                    </div>
            </div>
        </div>
    </section>
    <%@include file="componentes/footer.jsp"%>
</body>
<%@include file="componentes/script.jsp"%>
</html>