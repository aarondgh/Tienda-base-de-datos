USE tienda;

-- 1. INSERCIONES EN LA TABLA: CATEGORIAS (15 registros)
INSERT INTO CATEGORIAS (nomeCategoria, descripcion) VALUES
('Alimentación Básica', 'Arroz, legumbres, pasta y productos de despensa general'),
('Bebidas y Refrescos', 'Aguas, zumos, refrescos con y sin gas'),
('Lácteos y Huevos', 'Leche, quesos, yogures y huevos frescos'),
('Frutas y Verduras', 'Productos frescos de huerta y temporada'),
('Carnes y Aves', 'Cortes de carne vacuna, porcina y pollo fresco'),
('Pescados y Mariscos', 'Pescado fresco, congelado y mariscos del día'),
('Congelados', 'Platos precocinados, verduras y alimentos ultracongelados'),
('Limpieza del Hogar', 'Detergentes, lavavajillas y desinfectantes'),
('Higiene Personal', 'Champús, geles de baño, desodorantes y cuidado diario'),
('Snacks y Dulces', 'Patatas fritas, frutos secos, chocolates y galletas'),
('Panadería y Bollería', 'Pan fresco, moldes, cruasanes y repostería'),
('Charcutería', 'Jamones, embutidos variados y cecinas'),
('Conservas y Encurtidos', 'Atún en lata, aceitunas, espárragos y salsas'),
('Mascotas', 'Comida para perros, gatos y productos de cuidado animal'),
('Bazar y Menaje', 'Pilas, bombillas, servilletas y utensilios básicos');

-- 2. INSERCIONES EN LA TABLA: DETALLES_PROVEEDOR (15 registros)
INSERT INTO DETALLES_PROVEEDOR (cif, direccionFiscal, cuentaBancaria) VALUES
('A1234567B', 'Polígono San Cibrao, Rúa Progreso 12, Ourense', 'ES2100491234567890123456'),
('B9876543C', 'Av. de Marín 45, Bajo, Ourense', 'ES2100499876543210987654'),
('A4561237D', 'Polígono Barreiros, Parcela 4, San Cibrao', 'ES2100851122334455667788'),
('B1122334E', 'Rúa do Paseo 8, 3º Izquierda, Ourense', 'ES2100305566778899001122'),
('A5566778F', 'Vía Principal, Polígono Carballiño, Ourense', 'ES2100112233445566778899'),
('A9988776G', 'Rúa Bedoya 14, Ourense', 'ES2100759988776655443322'),
('B4455661H', 'Polígono Silleda, Nave 12, Pontevedra', 'ES2100914455667788990011'),
('A7788992I', 'Av. de Santiago 120, Ourense', 'ES2100127788990011223344'),
('B3344553J', 'Rúa Ervedelo 67, Ourense', 'ES2100223344556677889900'),
('A2233445K', 'Polígono Industrial Ceao, Nave B2, Lugo', 'ES2100562233445566778899'),
('B6677889L', 'Rúa Progreso 150, Ourense', 'ES2100886677889900112233'),
('A1144778M', 'Av. Buenos Aires 34, Ourense', 'ES2100441144778899001122'),
('B5522998N', 'Rúa de la Estación s/n, Monforte de Lemos', 'ES2100155522998877665544'),
('A8833112O', 'Polígono A Granxa, Parcela 18, Porriño', 'ES2100628833112233445566'),
('B9911223P', 'Rúa Pena Trevinca 5, Ourense', 'ES2100339911223344556677');

-- 3. INSERCIONES EN LA TABLA: PROVEEDOR (15 registros)
-- Nota: codDetalle va del 1 al 15, asignando uno a cada uno de forma exacta (1:1)
INSERT INTO PROVEEDOR (nomeEmpresa, telefono, codDetalle) VALUES
('Distribuciones Galaicas S.A.', '988212121', 1),
('Frutas Ourense S.L.', '988541236', 2),
('Lácteos del Miño S.A.', '982341122', 3),
('Cárnicas Miño S.L.', '988654987', 4),
('Congelados del Sil S.A.', '988112233', 5),
('Limpiezas Auria S.L.', '988778899', 6),
('Panificadora Miñota S.L.', '986445566', 7),
('Bebidas Orensanos S.A.', '988990011', 8),
('Suministros Mascotas Ourense', '988334455', 9),
('Mariscos Costas de Galicia', '982556677', 10),
('Embutidos San Lorenzo S.L.', '988151515', 11),
('Higiene Total S.A.', '988441122', 12),
('Conservas de la Ribeira', '982775533', 13),
('Bazar Comercial Ourense', '986118899', 14),
('Dulces del Centro S.L.', '988339911', 15);

-- 4. INSERCIONES EN LA TABLA: PRODUCTO (15 registros)
-- Nota: Añadimos stock y un precio base realista. Para la reflexiva 'codProductoSustituto',
-- la mayoría quedan en NULL, y los últimos apuntan a registros anteriores ya creados.
INSERT INTO PRODUCTO (nomeProducto, stock, precio, fechaIngreso, codCategoria, codProveedor, codProductoSustituto) VALUES
('Arroz Redondo Extra 1kg', 120, 1.45, '2026-05-10', 1, 1, NULL),
('Agua Mineral Natural 1.5L', 500, 0.48, '2026-05-12', 2, 8, NULL),
('Leche Entera Brick 1L', 300, 0.95, '2026-05-11', 3, 3, NULL),
('Plátano de Canarias Extra (Kg)', 80, 1.99, '2026-06-01', 4, 2, NULL),
('Pechuga de Pollo Fileteada (Kg)', 45, 6.75, '2026-06-02', 5, 4, NULL),
('Filete de Merluza Congelada 500g', 60, 4.25, '2026-05-20', 6, 5, NULL),
('Pizza Carbonara Ultracongelada', 90, 2.99, '2026-05-18', 7, 5, NULL),
('Lavavajillas Líquido Concentrado 1L', 75, 2.10, '2026-04-15', 8, 6, NULL),
('Gel de Baño Familiar 1L', 110, 1.85, '2026-04-20', 9, 12, NULL),
('Patatas Fritas Onduladas 150g', 140, 1.20, '2026-05-25', 10, 1, NULL),
('Barra de Pan Artesana 250g', 200, 0.85, '2026-06-08', 11, 7, NULL),
('Chorizo Casero Gallego (Kg)', 35, 8.90, '2026-05-30', 12, 11, NULL),
('Atún Claro en Aceite de Oliva 3x80g', 180, 2.65, '2026-05-05', 13, 13, NULL),
('Pienso Completo Perro Adulto 4kg', 40, 12.40, '2026-04-10', 14, 9, NULL),
('Pack 4 Pilas Alcalinas AA', 95, 3.50, '2026-03-12', 15, 14, NULL);

-- Ajustamos la reflexiva para cumplir el requisito de artículos vinculados
UPDATE PRODUCTO SET codProductoSustituto = 1 WHERE codProducto = 10; -- Patatas enlazadas con Arroz (comida)
UPDATE PRODUCTO SET codProductoSustituto = 3 WHERE codProducto = 2;  -- Agua enlazada con Leche (bebidas)

-- 5. INSERCIONES EN LA TABLA: VENTAS (15 registros)
INSERT INTO VENTAS (fecha, hora, totalFacturado) VALUES
('2026-06-01', '09:15:00', 14.25),
('2026-06-01', '11:30:00', 4.85),
('2026-06-02', '10:00:00', 25.60),
('2026-06-02', '13:45:00', 8.90),
('2026-06-03', '17:20:00', 43.10),
('2026-06-03', '19:10:00', 12.40),
('2026-06-04', '11:05:00', 3.45),
('2026-06-04', '16:30:00', 18.20),
('2026-06-05', '09:50:00', 7.30),
('2026-06-05', '12:15:00', 32.80),
('2026-06-06', '18:00:00', 15.95),
('2026-06-06', '20:15:00', 9.40),
('2026-06-07', '10:30:00', 5.70),
('2026-06-08', '11:00:00', 22.15),
('2026-06-08', '15:30:00', 11.60);

-- 6. INSERCIONES EN LA TABLA INTERMEDIA: SE_VENDE (15 registros)
-- Relaciona las ventas del 1 al 15 con diversos códigos de producto del 1 al 15.
INSERT INTO SE_VENDE (codVenta, codProducto, cantidadVendida, precioUnitarioMomento) VALUES
(1, 1, 2, 1.45),
(1, 3, 4, 0.95),
(2, 2, 6, 0.48),
(3, 5, 2, 6.75),
(3, 7, 3, 2.99),
(4, 12, 1, 8.90),
(5, 14, 2, 12.40),
(5, 13, 3, 2.65),
(6, 4, 4, 1.99),
(7, 11, 2, 0.85),
(8, 9, 2, 1.85),
(9, 15, 1, 3.50),
(10, 6, 3, 4.25),
(11, 10, 5, 1.20),
(12, 8, 2, 2.10);