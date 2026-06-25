package proyecto1;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class App {
	public static void main(String[] args) {
		Producto p = new Producto();
		BufferedReader bf = new BufferedReader(new InputStreamReader(System.in));
		while (true) {
			System.out.printf("                 Menu%n========================================%n"
					+ "Presiona A para leer todos los productos%n"
					+ "Presiona B para leer un solo producto%n"
					+ "Presiona C para leer las categorias%n"
					+ "Presiona D para leer una sola categoria%n"
					+ "Presiona E para almacenar un producto%n");
			try {
				String linea;
				System.out.printf("Introduce la opcion: ");
				linea = bf.readLine().toUpperCase();
				switch (linea) {
				case "A":
					p.leerProductos("*");
					break;
				case "B":
					System.out.println("Introduce el nombre del producto: ");
					linea = bf.readLine();
					p.leerProductos(linea);
					break;
				case "C":
					p.leerCategorias("*");
					break;
				case "D":
					System.out.println("Introduce el nombre de la categoria: ");
					linea = bf.readLine();
					p.leerCategorias(linea);
					break;
				case "E":
					Producto pro = new Producto();
					System.out.println("Introuce nombre: ");
					pro.setNombre(bf.readLine());
					pro.setFechaAlta(LocalDate.now());
					System.out.println("Intoduce precio: ");
					pro.setPrecio(Double.parseDouble(bf.readLine()));
					System.out.println("Intoduce stock");
					pro.setStock(Integer.parseInt(bf.readLine()));
					System.out.println("Introduce codigo de la categoria: ");
					pro.setCodCategoria(Integer.parseInt(bf.readLine()));
					System.out.println("Introduce codigo de producto sustituto si tiene (Pulsa Enter si no tiene): ");
				    String entradaSustituto = bf.readLine();
				    if (entradaSustituto.trim().isEmpty()) {
				        pro.setCodProductoSustituto(null); // Si está vacío, guardamos null
				    } else {
				        pro.setCodProductoSustituto(Integer.parseInt(entradaSustituto)); // Si tiene texto, lo convertimos
				    }
					System.out.println("Intoduce codigo del proveedor: ");
					pro.setCodProveedor(Integer.parseInt(bf.readLine()));
					almacenarProductoBD(pro);
				default:
					break;
				}
			} catch (Exception e) {
				System.out.println("Error" + e.getMessage());
			}
		}
	}


	private static void almacenarProductosBD(ArrayList<Producto> lista) {
		for (Producto producto : lista) {
			producto.almacenar(producto);
		}	
	}
		private static void almacenarProductoBD(Producto producto) {
				producto.almacenar(producto);
	}
}
