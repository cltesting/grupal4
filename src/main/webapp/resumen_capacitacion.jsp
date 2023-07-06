<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Listado Capacitaciones</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

	<div class="container col-lg-8 my-4">
		<h1>Resumen de Registro de Capacitacion</h1>

		<div class="card">
			<div class="card-body">
				<h5 class="card-title">Capacitacion Creada</h5>
				<p class="card-text">
					<strong>Rut:</strong>
					<%=request.getParameter("rut")%></p>
				<p class="card-text">
					<strong>Dia de la Capacitacion:</strong>
					<%=request.getParameter("dia")%></p>
				<p class="card-text">
					<strong>Hora de la Capacitacion:</strong>
					<%=request.getParameter("hora")%></p>
				<p class="card-text">
					<strong>Lugar de la Capacitacion:</strong>
					<%=request.getParameter("lugar")%></p>
				<p class="card-text">
					<strong>Cantidad de Asistentes:</strong>
					<%=request.getParameter("cantidad")%></p>
			</div>
		</div>
		<div class="mt-4">
			<a href="index.jsp">Ir a Inicio</a> <a href="crear_capacitacion.jsp">Crear
				Capacitacion</a> <a href="contacto.jsp">Contactanos</a>
		</div>
	</div>


	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.1/dist/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
