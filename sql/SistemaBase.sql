CREATE DATABASE sistemainicial;
USE sistemainicial;

CREATE TABLE personal (
    CI VARCHAR(20) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Telefono VARCHAR(15),
    Email VARCHAR(100) NOT NULL,
    creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
 

CREATE TABLE usuario (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    CI VARCHAR(20),
    Nombre_Usuario VARCHAR(50) UNIQUE NOT NULL,
    Password VARCHAR(255) NOT NULL,
        FOREIGN KEY (CI) REFERENCES personal(CI),
           creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


CREATE TABLE tokens (
    TokenID INT AUTO_INCREMENT PRIMARY KEY,
    UsuarioID INT,
    Token VARCHAR(255) NOT NULL,
    Expiracion DATETIME NOT NULL,
    FOREIGN KEY (UsuarioID) REFERENCES usuario(ID),
       creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE roles (
    RoleID INT AUTO_INCREMENT PRIMARY KEY,
    RoleName VARCHAR(50) NOT NULL,
    RoleDescription VARCHAR(255),
       creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE usuario_roles (
    UsuarioRoleID INT AUTO_INCREMENT PRIMARY KEY,
    UsuarioID INT,
    RoleID INT,
    FOREIGN KEY (UsuarioID) REFERENCES usuario(ID),
    FOREIGN KEY (RoleID) REFERENCES roles(RoleID),
       creado TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    actualizado TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


