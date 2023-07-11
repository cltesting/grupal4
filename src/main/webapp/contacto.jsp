<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Contacto</title>
<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
	<div class="container col-lg-8 mt-4">
		<h1>Contacto</h1>
		<form action="resumen_mensaje.jsp" method="post">
			<div class="form-group">
				<label for="nombre">Nombre:</label> <input type="text"
					class="form-control" id="nombre" name="nombre" required>
			</div>
			<div class="form-group">
				<label for="email" class="form-label">Correo Electronico</label> <input
					type="email" class="form-control" id="email" name="email" required>
			</div>

			<div class="form-group">
				<label for="mensaje">Mensaje:</label>
				<textarea class="form-control" id="mensaje" name="mensaje" rows="4"></textarea>
			</div>

			<button type="submit" class="btn btn-primary">Enviar</button>
		</form>

	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"
		integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"
		integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF"
		crossorigin="anonymous"></script>
</body>
</html>
