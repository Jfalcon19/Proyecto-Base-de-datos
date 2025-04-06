# Proyecto-Base-de-datos
This proyect was made for the subject called Data Bases for the curse im doing right now called Grado Superior - Administrador de Sistemas informáticos en red (ASIR) 2024/2025, it's a database focused on managing the data of a Pokemon Card Shop (Not Real)

Programs used: Xampp (Windows), Dbeaver (Windows)

The PDF file explains in spanish what's going on

Just conect to a user in your database manager and ejecute the script line per line to create the database, because otherwise it will send an error message, and see results

A line for example might be : 

CREATE TABLE Categorias (
    CategoriaID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL
);
