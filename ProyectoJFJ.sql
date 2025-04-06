CREATE DATABASE TiendaPokemon;
USE TiendaPokemon;

-- Tabla Clientes
CREATE TABLE Clientes (
    ClienteID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Telefono VARCHAR(20),
    Direccion VARCHAR(150)
);

-- Tabla Categorías de Cartas
CREATE TABLE Categorias (
    CategoriaID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL
);

-- Tabla Productos (Cartas Pokémon)
CREATE TABLE Productos (
    ProductoID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Precio DECIMAL(10, 2) NOT NULL,
    CategoriaID INT,
    FOREIGN KEY (CategoriaID) REFERENCES Categorias(CategoriaID)
);

-- Tabla Proveedores
CREATE TABLE Proveedores (
    ProveedorID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Telefono VARCHAR(20)
);

-- Tabla Sucursales
CREATE TABLE Sucursales (
    SucursalID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Direccion VARCHAR(150) NOT NULL
);

-- Tabla Inventario
CREATE TABLE Inventario (
    InventarioID INT AUTO_INCREMENT PRIMARY KEY,
    ProductoID INT,
    Cantidad INT,
    SucursalID INT,
    ProveedorID INT,
    FOREIGN KEY (SucursalID) REFERENCES Sucursales(SucursalID),
    FOREIGN KEY (ProductoID) REFERENCES Productos(ProductoID),
    FOREIGN KEY (ProveedorID) REFERENCES Proveedores(ProveedorID)
);

-- Tabla Empleados
CREATE TABLE Empleados (
    EmpleadoID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Cargo VARCHAR(50),
    SucursalID INT,
    FOREIGN KEY (SucursalID) REFERENCES Sucursales(SucursalID)
);

-- Tabla Pedidos
CREATE TABLE Pedidos (
    PedidoID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    EmpleadoID INT,
    FechaPedido DATE NOT NULL,
    Estado ENUM('Pendiente', 'Enviado', 'Entregado'),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID),
    FOREIGN KEY (EmpleadoID) REFERENCES Empleados(EmpleadoID)
);

-- Tabla Facturas
CREATE TABLE Facturas (
    FacturaID INT AUTO_INCREMENT PRIMARY KEY,
    PedidoID INT,
    Total DECIMAL(10, 2),
    FechaFactura DATE,
    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID)
);

-- Tabla Pagos
CREATE TABLE Pagos (
    PagoID INT AUTO_INCREMENT PRIMARY KEY,
    PedidoID INT,
    Monto DECIMAL(10, 2),
    MetodoPago ENUM('Tarjeta', 'Efectivo', 'Transferencia'),
    FechaPago DATE,
    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID)
);

-- Clientes
INSERT INTO Clientes (Nombre, Email, Telefono, Direccion) VALUES
('Pedro López', 'pedro.lopez@gmail.com', '612345678', 'Calle 123'),
('Laura Martínez', 'laura.martinez@gmail.com', '623456789', 'Avenida 456'),
('Carlos Rivera', 'carlos.rivera@gmail.com', '634567890', 'Carrera 789'),
('Ana Torres', 'ana.torres@gmail.com', '645678901', 'Diagonal 321'),
('Javier Gómez', 'javier.gomez@gmail.com', '656789012', 'Plaza 654'),
('Marta Reyes', 'marta.reyes@gmail.com', '667890123', 'Callejón 987'),
('Luis Fernández', 'luis.fernandez@gmail.com', '678901234', 'Vía 741'),
('Paula Méndez', 'paula.mendez@gmail.com', '689012345', 'Calle 852'),
('Roberto Nieto', 'roberto.nieto@gmail.com', '690123456', 'Avenida 963'),
('Silvia Vargas', 'silvia.vargas@gmail.com', '701234567', 'Carrera 159'),
('Camila Rojas', 'camila.rojas@gmail.com', '712345678', 'Diagonal 753'),
('Alejandro Cruz', 'alejandro.cruz@gmail.com', '723456789', 'Plaza 159'),
('Isabel Ramírez', 'isabel.ramirez@gmail.com', '734567890', 'Callejón 357'),
('Daniel Herrera', 'daniel.herrera@gmail.com', '745678901', 'Vía 258'),
('Sofía Morales', 'sofia.morales@gmail.com', '756789012', 'Calle 369'),
('Andrea Torres', 'andrea.torres@gmail.com', '767890123', 'Avenida 468'),
('Fernando Gutiérrez', 'fernando.gutierrez@gmail.com', '778901234', 'Carrera 579'),
('Diego Paredes', 'diego.paredes@gmail.com', '789012345', 'Diagonal 681'),
('Patricia Jiménez', 'patricia.jimenez@gmail.com', '790123456', 'Plaza 794'),
('Raúl Castro', 'raul.castro@gmail.com', '801234567', 'Callejón 852'),
('Nicolás Ortega', 'nicolas.ortega@gmail.com', '812345678', 'Vía 963'),
('Mariana Solano', 'mariana.solano@gmail.com', '823456789', 'Calle 147'),
('Iván Benítez', 'ivan.benitez@gmail.com', '834567890', 'Avenida 258'),
('Claudia Pérez', 'claudia.perez@gmail.com', '845678901', 'Carrera 369'),
('Antonio Vargas', 'antonio.vargas@gmail.com', '856789012', 'Diagonal 471');

-- Categorías
INSERT INTO Categorias (Nombre) VALUES
('Full Art'),
('Común'),
('Holográfica'),
('Objeto'),
('Entrenador');

-- Productos
INSERT INTO Productos (Nombre, Precio, CategoriaID) VALUES
('Pikachu "Set Base"', 5.99, 2),
('Charizard "Set Base"', 150.99, 3),
('Blastoise "Set Base"', 80.99, 3),
('Venusaur "Set Base"', 60.99, 3),
('Mewtwo "Set Base"', 40.99, 3),
('Gyarados "Set Base"', 30.99, 3),
('Alakazam "Set Base"', 50.99, 3),
('Machamp "Set Base"', 20.99, 3),
('Zapdos "Set Base"', 35.99, 3),
('Nidoking "Set Base"', 25.99, 3),
('Clefairy "Set Base"', 40.99, 3),
('Raichu "Set Base"', 35.99, 3),
('Magneton "Set Base"', 25.99, 3),
('Hitmonchan "Set Base"', 30.99, 3),
('Chansey "Set Base"', 50.99, 3),
('Poliwrath "Set Base"', 20.99, 3),
('Mew "PROMO"', 20.99, 3),
('Dark Charizard "Team Rocket"', 100.99, 3),
('Dark Blastoise "Team Rocket"', 60.99, 3),
('Dark Dragonite "Team Rocket"', 70.99, 3),
('Shining Charizard "Neo Destiny"', 800.99, 3),
('Shining Mewtwo "Neo Destiny"', 400.99, 3),
('Lugia "Neo Destiny"', 180.99, 3),
('Ho Oh "Neo Genesis"', 170.99, 3),
('Espeon "Neo Discovery"', 80.99, 3);

-- Proveedores
INSERT INTO Proveedores (Nombre, Telefono) VALUES
('Pokémon Company', '612345678'),
('Cartas Yugi S.A.', '856789012'),
('Mundo Pokémon TCG', '845678901'),
('Pokémon Masters Cards', '834567890'),
('Pokémon Collectors', '823456789'),
('Cards Shop', '812345678'),
('La Tienda Pokémon', '801234567'),
('Pokémon Xpress', '790123456'),
('Colecciones Pokémon España', '789012345'),
('Pkmn World Store', '778901234'),
('Masters Cards', '767890123'),
('Tienda Pokémon Online', '756789012'),
('Tienda Collectors', '745678901'),
('Pokémon Decks', '734567890'),
('PokéStore', '723456789'),
('Collectible Cards Pkmn', '712345678'),
('Mega Pokémon Cards', '701234567'),
('Pokémon Shop Online', '690123456'),
('Cartas Pokémon Elite', '689012345'),
('Pokémon Collectors Paradise', '678901234'),
('PokeMarket', '667890123'),
('Cards & Games Shop', '656789012'),
('Pokémon Decks', '645678901');

-- Sucursales
INSERT INTO Sucursales (Nombre, Direccion) VALUES
('Metropolis Center', 'Madrid, España'),
('Poketienda', 'Madrid, España'),
('Tienda de Juegos – Generación X Elfo', 'Madrid, España'),
('Super Friki Market – X-Madrid', 'Alcorcón, España'),
('Pokeiko', 'España'),
('Pokemillon', 'España'),
('Epic Deck', 'España'),
('Shell TCG', 'España'),
('Korete Shop', 'España'),
('Kadoplay', 'Madrid, España');

-- Invetario
INSERT INTO Inventario (ProductoID, Cantidad, SucursalID, ProveedorID) values
(1, 50, 1, 1),
(2, 50, 1, 1),
(3, 50, 3, 1),
(4, 50, 3, 2),
(5, 50, 3, 2),
(6, 50, 4, 2),
(7, 50, 4, 3),
(8, 50, 5, 3),
(9, 50, 5, 3),
(10, 50, 5, 4),
(11, 50, 6, 4),
(12, 50, 6, 5),
(13, 50, 6, 5),
(14, 50, 6, 5),
(15, 50, 6, 5),
(16, 50, 7, 6),
(17, 50, 7, 6),
(18, 50, 7, 7),
(19, 50, 8, 7),
(20, 50, 8, 7),
(21, 50, 8, 8),
(22, 50, 9, 8),
(23, 50, 9, 15),
(24, 50, 10, 15),
(25, 50, 10, 18);

-- Empleados
INSERT INTO Empleados (Nombre, Cargo, SucursalID) VALUES
('Carlos Mendoza', 'Gerente de Ventas', 1),
('Laura Gómez', 'Especialista en Tasación de Cartas', 1),
('Andrés López', 'Encargado de Compras de Colecciones', 1),
('Marta Ruiz', 'Atención al Cliente', 2),
('Javier Torres', 'Encargado de Torneos', 2),
('Sofía Ramírez', 'Especialista en Cartas de Edición Limitada', 2),
('Luis Fernández', 'Responsable de Almacén', 3),
('Natalia Vargas', 'Community Manager', 3),
('Pedro Navarro', 'Técnico en Grading de Cartas', 3),
('Ana Martín', 'Diseñadora Gráfica para Publicidad', 4),
('Roberto Jiménez', 'Vendedor de Mostrador', 4),
('Paula Sánchez', 'Coordinadora de Eventos', 4),
('Diego Ortega', 'Encargado de Subastas Online', 5),
('Elena Castro', 'Responsable de Inventario', 5),
('Daniel Pérez', 'Técnico de Fotografía para Catálogo', 5),
('Clara Herrera', 'Asesora de Nuevos Coleccionistas', 6),
('Iván Gutiérrez', 'Programador de la Tienda Online', 6),
('María del Valle', 'Gestora de Redes Sociales', 6),
('Oscar Molina', 'Atención al Cliente Online', 7),
('Verónica León', 'Encargada de Cartas', 7),
('Héctor García', 'Coordinador de Intercambios', 7),
('Isabel Cruz', 'Responsable de Marketing', 8),
('Ricardo Pineda', 'Técnico de Empaquetado y Envíos', 9),
('Patricia Domínguez', 'Especialista en Cartas', 10),
('Eduardo Blanco', 'Coordinador de Compras Internacionales', 10);

-- Pedidos
INSERT INTO Pedidos (ClienteID, EmpleadoID, FechaPedido, Estado) VALUES
(1, 3, '2025-03-01', 'Entregado'),
(2, 3, '2025-04-05', 'Pendiente'),
(3, 23, '2025-04-05', 'Pendiente'),
(4, 23, '2025-04-26', 'Pendiente'),
(5, 3, '2025-05-01', 'Entregado'),
(6, 23, '2025-05-01', 'Enviado'),
(7, 3, '2025-05-14', 'Enviado'),
(8, 23, '2025-06-05', 'Enviado'),
(9, 3, '2025-06-26', 'Entregado'),
(10, 23, '2025-06-11', 'Entregado'),
(11, 3, '2025-07-07', 'Pendiente'),
(12, 3, '2025-07-17', 'Enviado'),
(13, 23, '2025-08-22', 'Pendiente'),
(14, 23, '2025-08-14', 'Pendiente'),
(15, 3, '2025-08-26', 'Entregado'),
(16, 3, '2025-08-28', 'Enviado'),
(17, 3, '2025-09-11', 'Pendiente'),
(18, 23, '2025-09-16', 'Pendiente'),
(19, 23, '2025-09-27', 'Entregado'),
(20, 3, '2025-09-14', 'Enviado'),
(21, 23, '2025-09-17', 'Pendiente'),
(22, 3, '2025-09-17', 'Entregado'),
(23, 23, '2025-09-24', 'Pendiente'),
(24, 3, '2025-10-12', 'Enviado'),
(25, 23, '2025-11-19', 'Pendiente');

-- Facturas
INSERT INTO Facturas (PedidoID, Total, FechaFactura) VALUES
(1, 150.99, '2025-03-01'),
(2, 150.99, '2025-04-05'),
(3, 150.99, '2025-04-05'),
(4, 80.99, '2025-04-26'),
(5, 50.99, '2025-05-01'),
(6, 50.99, '2025-05-01'),
(7, 50.99, '2025-05-14'),
(8, 50.99, '2025-06-05'),
(9, 35.99, '2025-06-26'),
(10, 35.99, '2025-06-11'),
(11, 35.99, '2025-07-07'),
(12, 35.99, '2025-07-17'),
(13, 35.99, '2025-08-22'),
(14, 35.99, '2025-08-14'),
(15, 80.99, '2025-08-26'),
(16, 80.99, '2025-08-28'),
(17, 80.99, '2025-09-11'),
(18, 50.99, '2025-09-16'),
(19, 50.99, '2025-09-27'),
(20, 150.99, '2025-09-14'),
(21, 150.99, '2025-09-17'),
(22, 35.99, '2025-09-17'),
(23, 35.99, '2025-09-24'),
(24, 35.99, '2025-10-12'),
(25, 35.99, '2025-11-19');

-- Pagos
INSERT INTO Pagos (PedidoID, Monto, MetodoPago, FechaPago) VALUES
(1, 150.99, 'Tarjeta', '2025-03-01'),
(2, 150.99, 'Efectivo', '2025-04-05'),
(3, 150.99, 'Efectivo', '2025-04-05'),
(4, 80.99, 'Efectivo', '2025-04-26'),
(5, 50.99, 'Efectivo', '2025-05-01'),
(6, 50.99, 'Efectivo', '2025-05-01'),
(7, 50.99, 'Efectivo', '2025-05-14'),
(8, 50.99, 'Efectivo', '2025-06-05'),
(9, 35.99, 'Efectivo', '2025-06-26'),
(10, 35.99, 'Efectivo', '2025-06-11'),
(11, 35.99, 'Efectivo', '2025-07-07'),
(12, 35.99, 'Efectivo', '2025-07-17'),
(13, 35.99, 'Efectivo', '2025-08-22'),
(14, 35.99, 'Efectivo', '2025-08-14'),
(15, 80.99, 'Efectivo', '2025-08-26'),
(16, 80.99, 'Efectivo', '2025-08-28'),
(17, 80.99, 'Efectivo', '2025-09-11'),
(18, 50.99, 'Efectivo', '2025-09-16'),
(19, 50.99, 'Efectivo', '2025-09-27'),
(20, 150.99, 'Efectivo', '2025-09-14'),
(21, 150.99, 'Efectivo', '2025-09-17'),
(22, 35.99, 'Efectivo', '2025-09-17'),
(23, 35.99, 'Efectivo', '2025-09-24'),
(24, 35.99, 'Efectivo', '2025-10-12'),
(25, 35.99, 'Efectivo', '2025-11-19');


