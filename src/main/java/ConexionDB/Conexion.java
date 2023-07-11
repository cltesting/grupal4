package ConexionDB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cl.grupo1.servlet.*;


public class Conexion {
    private static Conexion instancia;
    private Connection conexion;

    private Conexion() {
        // Establecer la conexión a la base de datos en el constructor privado
        // Usar Singleton para asegurar que solo haya una instancia de UsuarioDAO
        // y una única conexión a la base de datos en todo el proyecto
    }

    public static Conexion getInstancia() {
        if (instancia == null) {
            instancia = new Conexion();
        }
        return instancia;
    }

    // Métodos CRUD

    public List<ListarCapacitacion> obtenerCapacitaciones() {
        List<ListarCapacitacion> capacitaciones = new ArrayList<>();
        String consulta = "SELECT id, rut, dia, hora, lugar, cantidad FROM asesoria.capacitacion";

        try (Connection conexion = obtenerConexion();
             PreparedStatement statement = conexion.prepareStatement(consulta);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
            	ListarCapacitacion capacitacion = new ListarCapacitacion();
                capacitacion.setId(resultSet.getInt("id"));
                capacitacion.setRut(resultSet.getString("rut"));
                capacitacion.setDia(resultSet.getString("dia"));
                capacitacion.setHora(resultSet.getString("hora"));
                capacitacion.setLugar(resultSet.getString("lugar"));
                capacitacion.setCantidad(resultSet.getString("cantidad"));
                
                capacitaciones.add(capacitacion);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return capacitaciones;
    }
    
    public EditarCapacitacion obtenerCapacitacionesPorId(int id) {
        EditarCapacitacion capacitacion = null;
        String consulta = "SELECT id, rut, dia, hora, lugar, cantidad FROM asesoria.capacitacion WHERE id = ?";

        try (Connection conexion = obtenerConexion();
             PreparedStatement statement = conexion.prepareStatement(consulta)) {
            statement.setInt(1, id);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    capacitacion = new EditarCapacitacion();
                    capacitacion.setId(resultSet.getInt("id"));
                    capacitacion.setRut(resultSet.getString("rut"));
                    capacitacion.setDia(resultSet.getString("dia"));
                    capacitacion.setHora(resultSet.getString("hora"));
                    capacitacion.setLugar(resultSet.getString("lugar"));
                    capacitacion.setCantidad(resultSet.getString("cantidad"));
                    
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return capacitacion;
    }


    public void agregarCapacitacion(CrearCapacitacion capacitacion) {
        String consulta = "INSERT INTO asesoria.capacitacion (rut, dia, hora, lugar, cantidad) VALUES (?, ?, ?, ?, ?)";

        try (Connection conexion = obtenerConexion();
             PreparedStatement statement = conexion.prepareStatement(consulta)) {
            statement.setString(1, capacitacion.getRut());
            statement.setString(2, capacitacion.getDia());
            statement.setString(3, capacitacion.getHora());
            statement.setString(4, capacitacion.getLugar());
            statement.setString(5, capacitacion.getCantidad());

            statement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void actualizarCapacitacion(ActualizarCapacitacion capacitacion) {
        String consulta = "UPDATE asesoria.capacitacion SET rut = ?, dia = ?, hora = ?, lugar = ?, cantidad = ? WHERE id = ?";

        try (Connection conexion = obtenerConexion();
             PreparedStatement statement = conexion.prepareStatement(consulta)) {
        	
        	statement.setString(1, capacitacion.getRut());
            statement.setString(2, capacitacion.getDia());
            statement.setString(3, capacitacion.getHora());
            statement.setString(4, capacitacion.getLugar());
            statement.setString(5, capacitacion.getCantidad());
            statement.setInt(6, capacitacion.getId());
            
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void eliminarCapacitacion(int id) {
        String consulta = "DELETE FROM capacitacion WHERE id = ?";

        try (Connection conexion = obtenerConexion();
             PreparedStatement statement = conexion.prepareStatement(consulta)) {
            statement.setInt(1, id);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
  
    
    public Connection obtenerConexion() {
        String url = "jdbc:mysql://localhost:3306/";
        String db = "asesoria";
        String usuario = "hola";
        String password = "Hola.2023";
        String driver ="com.mysql.cj.jdbc.Driver";
        Connection conexion = null;
        
        try {
            Class.forName(driver);
            conexion = DriverManager.getConnection(url+db, usuario, password);
        } catch (ClassNotFoundException | SQLException e) {
            System.err.println("Error al cargar el controlador de la base de datos.");
            e.printStackTrace();
        } 
        
        if (conexion == null) {
            throw new RuntimeException("No se pudo establecer la conexión a la base de datos.");
        }
        
        return conexion;
    }
}
