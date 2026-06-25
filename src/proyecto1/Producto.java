package proyecto1;
import java.io.BufferedReader;
import java.io.FileReader;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.time.LocalDate;
import java.util.ArrayList;

public class Producto {
	private static int contId;
	private int id;
	private String nombre;
	private int stock;
	private double precio;
	private LocalDate fechaAlta;
	private int codCategoria;
	private int codProveedor;
	private Integer codProductoSustituto;
	
	public Producto() {
		super();
		this.id = contId++;
	}
	
	public Producto(String nombre, int stock, double precio, LocalDate fechaAlta,
			int codCategoria, int codProveedor, int codProductoSustituto) {
		super();
		this.nombre = nombre;
		this.stock = stock;
		this.precio = precio;
		this.fechaAlta = fechaAlta;
		this.codCategoria = codCategoria;
		this.codProveedor = codProveedor;
		this.codProductoSustituto = codProductoSustituto;
		this.id = contId++;
	}
	
	public Producto(String nombre, int stock, double precio, LocalDate fechaAlta,
			int codCategoria, int codProveedor) {
		super();
		this.nombre = nombre;
		this.stock = stock;
		this.precio = precio;
		this.fechaAlta = fechaAlta;
		this.codCategoria = codCategoria;
		this.codProveedor = codProveedor;
		this.id = contId++;
	}

	public void almacenar(Producto p) {
		Connection con = ConexionBD.obtenerConexion();
		String sql;
		try {
			sql = """
					INSERT INTO producto(nomeProducto, stock, precio, fechaIngreso, codCategoria, codProveedor, codProductoSustituto )
					VALUES(?,?,?,?,?,?,?)
					""";
			PreparedStatement st = con.prepareStatement(sql);
			st.setString(1, p.getNombre());
			st.setInt(2, (int) p.getStock());
			st.setDouble(3, p.getPrecio());
			if(p.getFechaAlta() != null) {
				st.setDate(4, Date.valueOf(p.getFechaAlta()));
			}else {
				st.setNull(4, Types.DATE);
			}
			st.setInt(5, p.getCodCategoria());

			st.setInt(6, p.getCodProveedor());
			if (p.getCodProductoSustituto() != null) {
			    st.setInt(7, p.getCodProductoSustituto());
			} else {
			    st.setNull(7, java.sql.Types.INTEGER);
			}
			st.executeUpdate();
			ConexionBD.devolverConexion(con);
		} catch (SQLException e) {
			System.out.println("Error: " + e.getMessage());
		}
	}
	
	public ArrayList<Producto> leerProductos(String valor) {
		Connection con = ConexionBD.obtenerConexion();
		String sql;
		Producto p;
		ArrayList<Producto> lista = new ArrayList<Producto>();
		
		// 1. Decidimos la consulta SQL según el valor
		// ¡IMPORTANTE! Usamos .equals() para comparar Strings en Java
		if (valor.equals("*")) {
			sql = "SELECT * FROM producto";
		} else {
			// Usamos '?' para pasar el parámetro de forma segura y evitar Inyección SQL
			sql = "SELECT * FROM producto WHERE nomeProducto LIKE ?";
		}

		try {
			PreparedStatement st = con.prepareStatement(sql);
			
			// 2. Si no es un "*", le inyectamos el valor al '?'
			if (!valor.equals("*")) {
				// El '%' sirve para que busque cualquier cosa que CONTENGA ese valor
				// Ejemplo: si pasas "Leche", buscará "%Leche%"
				st.setString(1, "%" + valor + "%");
			}
			
			// 3. Ejecutamos la consulta (sirve para ambos casos)
			ResultSet rs = st.executeQuery();
			
			// 4. Procesamos los resultados en un único bucle
			while(rs.next()) {
				p = new Producto();
				p.setId(rs.getInt("codProducto"));
				p.setNombre(rs.getString("nomeProducto"));
				p.setPrecio(rs.getDouble("precio"));
				p.setStock(rs.getInt("stock"));
				Date fecha = rs.getDate("fechaIngreso");
				if (fecha != null) {
					p.setFechaAlta(fecha.toLocalDate());
				}
				lista.add(p);
				System.out.println(p);
			}
			
			// Cerramos la conexión al terminar
			ConexionBD.devolverConexion(con);
			
		} catch (Exception e) {
			System.out.println("Error al leer productos: " + e.getMessage());
		}
		
		return lista;
	}
	
	public void leerCategorias(String valor) {
		Connection con = ConexionBD.obtenerConexion();
		String sql;
		Producto p;
		
		// 1. Decidimos la consulta SQL según el valor
		// ¡IMPORTANTE! Usamos .equals() para comparar Strings en Java
		if (valor.equals("*")) {
			sql = "SELECT * FROM categorias";
		} else {
			// Usamos '?' para pasar el parámetro de forma segura y evitar Inyección SQL
			sql = "SELECT * FROM categorias WHERE nomeCategoria LIKE ?";
		}

		try {
			PreparedStatement st = con.prepareStatement(sql);
			
			// 2. Si no es un "*", le inyectamos el valor al '?'
			if (!valor.equals("*")) {
				// El '%' sirve para que busque cualquier cosa que CONTENGA ese valor
				// Ejemplo: si pasas "Leche", buscará "%Leche%"
				st.setString(1, "%" + valor + "%");
			}
			
			// 3. Ejecutamos la consulta (sirve para ambos casos)
			ResultSet rs = st.executeQuery();
			
			// 4. Procesamos los resultados en un único bucle
			while(rs.next()) {
				int codCategoria;
				String nomeCategoria;
				String descripcion;
				codCategoria = rs.getInt("codCategoria");
				nomeCategoria = rs.getString("nomeCategoria");
				descripcion = rs.getString("descripcion");
				System.out.printf("Categoria [id=%d, nombre=%s, descripcion=%s]%n", codCategoria, nomeCategoria, descripcion);
			}
			
			// Cerramos la conexión al terminar
			ConexionBD.devolverConexion(con);
			
		} catch (Exception e) {
			System.out.println("Error al leer categorias: " + e.getMessage());
		}
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public int getStock() {
		return stock;
	}
	
	public int getCodCategoria() {
		return codCategoria;
	}

	public void setCodCategoria(int codCategoria) {
		this.codCategoria = codCategoria;
	}

	public int getCodProveedor() {
		return codProveedor;
	}

	public void setCodProveedor(int codProveedor) {
		this.codProveedor = codProveedor;
	}

	public Integer getCodProductoSustituto() {
	    return codProductoSustituto;
	}
	public void setCodProductoSustituto(Integer codProductoSustituto) {
	    this.codProductoSustituto = codProductoSustituto;
	}

	public void setStock(int stock) {
		this.stock = stock;
	}
	public double getPrecio() {
		return precio;
	}
	public void setPrecio(double precio) {
		this.precio = precio;
	}
	public LocalDate getFechaAlta() {
		return fechaAlta;
	}
	public void setFechaAlta(LocalDate fechaAlta) {
		this.fechaAlta = fechaAlta;
	}

	@Override
	public String toString() {
		return String.format("Producto [id=%s, nombre=%s, stock=%s, precio=%s, fechaAlta=%s]", id, nombre, stock,
				precio, fechaAlta);
	}	
}