<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="cl.grupo1.servlet.ListarCapacitacion" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Listado Capacitaciones</title>
  

  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
</head>
<body>
<%
    session=request.getSession(false);
    if(session.getAttribute("admin")==null)
    {
        response.sendRedirect("login_user.jsp");
    }

%>
<nav class="navbar navbar-expand-lg bg-body-tertiary" style="background-color: #e3f2fd;">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Menu</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarText">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="usuario.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="crear_capacitacion.jsp">Crear Capacitacion</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="ListarCapacitaciones">Listar Capacitaciones</a>
        </li>
         <li class="nav-item">
          <a class="nav-link" href="CrearUsuario">Crear Usuario</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="ListarUsuarios">Listar Usuarios</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="contacto.jsp">Contacto</a>
        </li>
          <li class="nav-item">
          <a class="nav-link" href="cerrar_sesion.jsp">Cerrar Sesion</a>
        </li>
      </ul>
      <span class="navbar-text">
        Sistema Asesoria Prevencion De Riesgo V1.0
      </span>
    </div>
  </div>
</nav>


  <div class="container">
        <h1 class="mt-4">Listado de Capacitaciones</h1>
        <table class="table table-striped mt-4">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Rut</th>
                    <th>Dia</th>
                    <th>Hora</th>
                    <th>Lugar</th>
                    <th>Cantidad</th>
                </tr>
            </thead>
            <tbody>
                <% List<ListarCapacitacion> capacitaciones = (List<ListarCapacitacion>) request.getAttribute("capacitaciones"); %>
                <% for (ListarCapacitacion capacitacion : capacitaciones) { %>
                    <tr>
                        <td><%= capacitacion.getId() %></td>
                        <td><%= capacitacion.getRut() %></td>
                        <td><%= capacitacion.getDia() %></td>
                        <td><%= capacitacion.getHora() %></td>
                        <td><%= capacitacion.getLugar() %></td>
                        <td><%= capacitacion.getCantidad() %></td>
                        <td>
                            <a href="Editar-Capacitacion?id=<%= capacitacion.getId() %>" class="btn btn-primary btn-sm">Editar</a>
                            <a href="Eliminar-Capacitacion?id=<%= capacitacion.getId() %>" class="btn btn-danger btn-sm">Eliminar</a>
                        </td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>


  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</body>
</html>