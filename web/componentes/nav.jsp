<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="totalProductos" value="0"/>
<c:if test="${not empty cart.items}">
    <c:forEach var="item" items="${cart.items}">
        <c:set var="totalProductos" value="${totalProductos + item.cantidad}"/>
    </c:forEach>
</c:if>
<!DOCTYPE html>
<nav class="navbar navbar-expand-lg sticky-top navbar-dark bg-dark">
      <div class="container-fluid">
        <button class="navbar-toggler mb-2" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link" href="home.jsp">Inicio</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="contact.jsp">Contactanos</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="ListarAdmController">Nosotros</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="ListarRestaurantController?destino=restaurantes">Restaurantes</a>
            </li>
            <li>
              <div class="mx-3 text-white">
                  <img src="img/Logo/logo.webp" width="45" alt="logo">
                  <span class="font fs-4">Food Mastering</span>
              </div>
            </li>
          <li class="nav-item">    
              <div class="nav-link"><a href="" class="text-white"><i class="bi bi-youtube text-white fs-5"></i></a></div> 
          </li>
          <li class="nav-item">    
              <div class="nav-link"><a href="" class="text-white"><i class="bi bi-whatsapp text-white fs-5"></i></a></div> 
          </li>
          <li class="nav-item">    
              <div class="nav-link"><a href="" class="text-white"><i class="bi bi-facebook text-white fs-5"></i></a></div> 
          </li>
        </ul>
            <a href="cart_list.jsp" class="text-white mx-4"><i class="bi bi-bag-fill text-white my-1 mx-1 align-items-center"></i>
            Mis Pedidos <span class="badge bg-warning">${totalProductos}</span></a>
            <div class="dropdown me-5">
                <button class="btn btn-dark dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                  Mi Cuenta
                </button>
                <ul class="dropdown-menu p-1" aria-labelledby="dropdownMenuButton1">
                  <li><a class="dropdown-item" href="LogoutController">Cerrar Sesion</a></li>
                </ul>
            </div>
        </div>
  </div>
</nav>
