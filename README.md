# Gestión de Tienda - Java & JDBC

Pequeña aplicación de consola para la gestión y persistencia de productos y categorías.

## 🛠️ Tecnologías utilizadas
* **Lenguaje:** Java
* **Base de Datos:** MariaDB / MySQL
* **Conectividad:** JDBC (Java Database Connectivity)

## 🚀 Características del proyecto
* **Consultas seguras:** Uso de `PreparedStatement` para evitar Inyección SQL.
* **Control de datos:** Gestión de inserciones con campos opcionales (`NULL`) usando `setNull()`.
* **Interfaz dinámica:** Menú interactivo por consola mediante `BufferedReader`.

## 📦 Requisitos e Instalación

Para que el proyecto funcione correctamente y pueda conectarse a la base de datos, es necesario añadir el conector de MariaDB a Java:

1. Descarga el archivo del conector: **`mariadb-java-client-3.5.8.jar`** (o una versión compatible).
2. Añádelo a Eclipse:
   * Haz clic derecho sobre el proyecto ➡️ **Properties**.
   * Ve a **Java Build Path** y entra en la pestaña **Libraries**.
   * Selecciona **Modulepath** y haz clic en el botón **Add External JARs...**
   * Selecciona el archivo `.jar` que has descargado, dale a **Apply and Close** y listo.

Tambien tendras que crear la base de datos con las sentecnias sql que te proporciono, las cuales te crearan la base de datos, tablas y llenara de datos dichas tablas
