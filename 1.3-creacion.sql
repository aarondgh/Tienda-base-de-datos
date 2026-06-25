-- ============================================================================
-- SCRIPT DE CREACIÓN DE LA BASE DE DATOS (INVENTARIO Y VENTAS)
-- ============================================================================

DROP TABLE IF EXISTS SE_VENDE;       -- (Borrar primero las que tienen FKs para que no dé error)
DROP TABLE IF EXISTS PRODUCTO;
DROP TABLE IF EXISTS PROVEEDOR;
DROP TABLE IF EXISTS DETALLES_PROVEEDOR;
DROP TABLE IF EXISTS VENTAS;
DROP TABLE IF EXISTS CATEGORIAS;
create database if not exists tienda;
-- 1. Creación de la tabla CATEGORIAS
CREATE TABLE CATEGORIAS (
    codCategoria INT AUTO_INCREMENT,
    nomeCategoria VARCHAR(50) NOT NULL,
    descripcion VARCHAR(255),
    CONSTRAINT PK_CATEGORIAS PRIMARY KEY (codCategoria)
);

-- 2. Creación de la tabla DETALLES_PROVEEDOR
CREATE TABLE DETALLES_PROVEEDOR (
    codDetalle INT AUTO_INCREMENT,
    cif VARCHAR(15) NOT NULL UNIQUE,
    direccionFiscal VARCHAR(150),
    cuentaBancaria VARCHAR(34),
    CONSTRAINT PK_DETALLES_PROVEEDOR PRIMARY KEY (codDetalle)
);

-- 3. Creación de la tabla PROVEEDOR
CREATE TABLE PROVEEDOR (
    codProveedor INT AUTO_INCREMENT,
    nomeEmpresa VARCHAR(100) NOT NULL,
    telefono VARCHAR(15),
    codDetalle INT NOT NULL,
    CONSTRAINT PK_PROVEEDOR PRIMARY KEY (codProveedor),
    CONSTRAINT FK_PROVEEDOR_DETALLES FOREIGN KEY (codDetalle) 
        REFERENCES DETALLES_PROVEEDOR(codDetalle)
        ON DELETE RESTRICT 
        ON UPDATE CASCADE
);

-- 4. Creación de la tabla PRODUCTO
CREATE TABLE PRODUCTO (
    codProducto INT AUTO_INCREMENT,
    nomeProducto VARCHAR(100) NOT NULL,
    stock INT NOT NULL DEFAULT 0,
    precio DECIMAL(10,2) NOT NULL,
    fechaIngreso DATE,
    codCategoria INT NOT NULL,
    codProveedor INT NOT NULL,
    codProductoSustituto INT,
    CONSTRAINT PK_PRODUCTO PRIMARY KEY (codProducto),
    CONSTRAINT FK_PRODUCTO_CATEGORIAS FOREIGN KEY (codCategoria) 
        REFERENCES CATEGORIAS(codCategoria)
        ON DELETE RESTRICT 
        ON UPDATE CASCADE,
    CONSTRAINT FK_PRODUCTO_PROVEEDOR FOREIGN KEY (codProveedor) 
        REFERENCES PROVEEDOR(codProveedor)
        ON DELETE RESTRICT 
        ON UPDATE CASCADE,
    CONSTRAINT FK_PRODUCTO_REFLEXIVA FOREIGN KEY (codProductoSustituto) 
        REFERENCES PRODUCTO(codProducto)
        ON DELETE RESTRICT 
        ON UPDATE CASCADE
);

-- 5. Creación de la tabla VENTAS
CREATE TABLE VENTAS (
    codVenta INT AUTO_INCREMENT,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    totalFacturado DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    CONSTRAINT PK_VENTAS PRIMARY KEY (codVenta)
);

-- 6. Creación de la tabla intermedia SE_VENDE (Relación N:M)
CREATE TABLE SE_VENDE (
    codVenta INT,
    codProducto INT,
    cantidadVendida INT NOT NULL,
    precioUnitarioMomento DECIMAL(10,2) NOT NULL,
    CONSTRAINT PK_SE_VENDE PRIMARY KEY (codVenta, codProducto),
    CONSTRAINT FK_SE_VENDE_VENTAS FOREIGN KEY (codVenta) 
        REFERENCES VENTAS(codVenta)
        ON DELETE RESTRICT 
        ON UPDATE CASCADE,
    CONSTRAINT FK_SE_VENDE_PRODUCTO FOREIGN KEY (codProducto) 
        REFERENCES PRODUCTO(codProducto)
        ON DELETE RESTRICT 
        ON UPDATE CASCADE
);