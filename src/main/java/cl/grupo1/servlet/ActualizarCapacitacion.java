package cl.grupo1.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import ConexionDB.Conexion;

/**
 * Servlet implementation class ActualizarCapacitacion
 */
@WebServlet("/Actualizar-Capacitacion")
public class ActualizarCapacitacion extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private int id;
	private String rut;
	private String dia;
	private String hora;
	private String lugar;
	private String cantidad;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActualizarCapacitacion() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			int id = Integer.parseInt(request.getParameter("id"));
		 	String rut = request.getParameter("rut");
			String dia = request.getParameter("dia");
			String hora = request.getParameter("hora");
			String lugar =request.getParameter("lugar");
			String cantidad = request.getParameter("cantidad");

	        ActualizarCapacitacion capacitacion = new ActualizarCapacitacion();
	        capacitacion.setId(id);
	        capacitacion.setRut(rut);
			capacitacion.setDia(dia);
			capacitacion.setHora(hora);
			capacitacion.setLugar(lugar);
			capacitacion.setCantidad(cantidad);

			Conexion conexion = Conexion.getInstancia();
	        conexion.actualizarCapacitacion(capacitacion);
	        response.sendRedirect("ListarCapacitaciones");
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRut() {
		return rut;
	}

	public void setRut(String rut) {
		this.rut = rut;
	}

	public String getDia() {
		return dia;
	}

	public void setDia(String dia) {
		this.dia = dia;
	}

	public String getHora() {
		return hora;
	}

	public void setHora(String hora) {
		this.hora = hora;
	}

	public String getLugar() {
		return lugar;
	}

	public void setLugar(String lugar) {
		this.lugar = lugar;
	}

	public String getCantidad() {
		return cantidad;
	}

	public void setCantidad(String cantidad) {
		this.cantidad = cantidad;
	}
	        
}
