package proyecto1;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionBD {
	private static String host = "127.0.0.1"; //poner aqui tus datos de conexion
	private static String port = "3306";
	private static String bd = "tienda";
	private static String user = "root";
	private static String pass = "abc123.";
	
	public static Connection obtenerConexion() {
		Connection conection = null;
		String cadenaConexion = "jdbc:mariadb://127.0.0.1:3306/tienda";
		try {
			conection = DriverManager.getConnection(cadenaConexion, user, pass);
			System.out.println("exito");
		} catch (SQLException e) {
			System.out.printf("Error: %s%n", e.getMessage());
		}
		return conection;
	}
	
	public static void devolverConexion(Connection con) {
		try {
			con.close();
		} catch (SQLException e) {
			System.out.printf("Error: %s%n", e.getMessage());
		}
	}

}
