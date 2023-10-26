use sistemainicial;
DELIMITER //
CREATE PROCEDURE InsertarPersonal (
    IN p_CI VARCHAR(20), 
    IN p_Nombre VARCHAR(50), 
    IN p_Apellido VARCHAR(50), 
    IN p_Telefono VARCHAR(15), 
    IN p_Email VARCHAR(100)
)
BEGIN
    -- Ejemplo de una simple validación: verificar si el email ya existe
    IF NOT EXISTS (SELECT 1 FROM personal WHERE Email = p_Email) THEN
        INSERT INTO personal (CI, Nombre, Apellido, Telefono, Email) 
        VALUES (p_CI, p_Nombre, p_Apellido, p_Telefono, p_Email);
    ELSE
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: El email ya existe.';
    END IF;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE ActualizarPersonal (IN p_CI VARCHAR(20), IN p_Nombre VARCHAR(50) , IN p_Apellido VARCHAR(50), IN p_Telefono VARCHAR(15), IN p_Email VARCHAR(100))
BEGIN
    UPDATE personal SET Nombre = p_Nombre, Apellido = p_Apellido, Telefono = p_Telefono, Email = p_Email WHERE CI = p_CI;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE EliminarPersonal (IN p_CI VARCHAR(20))
BEGIN
    DELETE FROM personal WHERE CI = p_CI;
END //
DELIMITER ;

DELIMITER //

DELIMITER //
CREATE PROCEDURE InsertarUsuario (
    IN p_CI VARCHAR(20)
)
BEGIN
    DECLARE p_Password VARCHAR(255) DEFAULT 'micodigo';
    DECLARE p_Nombre VARCHAR(50);
    DECLARE p_Apellido VARCHAR(50);
    DECLARE v_NombreUsuario VARCHAR(50);
    SELECT Nombre, Apellido INTO p_Nombre, p_Apellido FROM personal WHERE CI = p_CI;
    SET p_Apellido = SUBSTRING_INDEX(p_Apellido, ' ', 1);
    SET v_NombreUsuario = CONCAT(LEFT(p_Nombre, 1), p_Apellido);
    SET p_Password = SHA2(p_Password, 256);
    INSERT INTO usuario (CI, Nombre_Usuario, Password) VALUES (p_CI, v_NombreUsuario, p_Password);

END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE ActualizarNombreUsuario (
    IN p_ID INT,
    IN p_Nombre_Usuario VARCHAR(50)
)
BEGIN
    UPDATE usuario 
    SET Nombre_Usuario = p_Nombre_Usuario 
    WHERE ID = p_ID;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE ResetearPassword (
    IN p_ID INT,
    IN p_Password VARCHAR(255)
)
BEGIN
    SET @PasswordHasheada = SHA2(p_Password, 256);
    UPDATE usuario 
    SET Password = @PasswordHasheada 
    WHERE ID = p_ID;
END //
DELIMITER ;





DELIMITER //
CREATE PROCEDURE EliminarUsuario (IN p_ID INT)
BEGIN
    DELETE FROM usuario WHERE ID = p_ID;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE ListarPersonales ()
BEGIN
    SELECT * FROM personal;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE ListarUsuarios ()
BEGIN
    SELECT ID, CI, Nombre_Usuario,creado,actualizado FROM usuario;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE ListarUsuariosConPassword ()
BEGIN
    SELECT ID, CI, Nombre_Usuario, Password FROM usuario;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE IniciarSesion (
    IN p_Nombre_Usuario VARCHAR(50), 
    IN p_Password VARCHAR(255), 
    OUT p_Resultado INT,
     OUT p_UsuarioID INT
)
BEGIN
    -- Asignamos un valor predeterminado al resultado
    SET p_Resultado = 0;
    SET p_UsuarioID = NULL;

    -- Verifica si el nombre de usuario y la contraseña coinciden con algún registro en la base de datos
    IF EXISTS (SELECT 1 FROM usuario WHERE Nombre_Usuario = p_Nombre_Usuario AND Password = SHA2(p_Password, 256)) THEN
        -- Si la contraseña es "micodigo", establecemos el resultado en 2
        IF p_Password = 'micodigo' THEN
            SET p_Resultado = 2;
        -- Si la contraseña no es "micodigo", establecemos el resultado en 1
        ELSE
            SET p_Resultado = 1;
        END IF;
                SELECT ID INTO p_UsuarioID FROM usuario WHERE Nombre_Usuario = p_Nombre_Usuario AND Password = SHA2(p_Password, 256);
    END IF;
END //
DELIMITER ;



DELIMITER //
CREATE PROCEDURE ObtenerNombreUsuario (IN p_Nombre_Usuario VARCHAR(50), OUT p_Nombre VARCHAR(50), OUT p_Apellido VARCHAR(50), OUT p_UsuarioID INT)
BEGIN
    SELECT p.Nombre, p.Apellido, u.ID INTO p_Nombre, p_Apellido, p_UsuarioID 
    FROM personal p
    INNER JOIN usuario u ON p.CI = u.CI
    WHERE u.Nombre_Usuario = p_Nombre_Usuario;
END //
DELIMITER ;

-- Procedimiento a ser utilizado para que el usuario logueado puede ver su datos y modificar su contrasena
DELIMITER $$

CREATE PROCEDURE GetPersonalUsuarioInfo(IN in_UsuarioID INT)
BEGIN
    SELECT 
        p.CI,
        CONCAT(p.Nombre, ' ', p.Apellido) AS Nombre_Completo,
        p.Telefono,
        p.Email,
        u.Nombre_Usuario
    FROM
        usuario u
    JOIN
        personal p
    ON
        u.CI = p.CI
    WHERE
        u.ID = in_UsuarioID;
END$$

DELIMITER ;
-- fin del procedimiento


DELIMITER //
CREATE PROCEDURE InsertarRol (
    IN p_RoleName VARCHAR(50),
    IN p_RoleDescription VARCHAR(255)
)
BEGIN
    INSERT INTO roles (RoleName, RoleDescription) 
    VALUES (p_RoleName, p_RoleDescription);
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE ActualizarRol (
    IN p_RoleID INT,
    IN p_RoleName VARCHAR(50),
    IN p_RoleDescription VARCHAR(255)
)
BEGIN
    UPDATE roles 
    SET RoleName = p_RoleName, RoleDescription = p_RoleDescription 
    WHERE RoleID = p_RoleID;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE EliminarRol (
    IN p_RoleID INT
)
BEGIN
    DELETE FROM roles WHERE RoleID = p_RoleID;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE AsignarRolUsuario (
    IN p_UsuarioID INT,
    IN p_RoleID INT
)
BEGIN
    INSERT INTO usuario_roles (UsuarioID, RoleID) 
    VALUES (p_UsuarioID, p_RoleID);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE CambiarRolUsuario (
    IN p_UsuarioRoleID INT,
    IN p_RoleID INT
)
BEGIN
    UPDATE usuario_roles 
    SET RoleID = p_RoleID 
    WHERE UsuarioRoleID = p_UsuarioRoleID;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE EliminarRolUsuario (
    IN p_UsuarioRoleID INT
)
BEGIN
    DELETE FROM usuario_roles WHERE UsuarioRoleID = p_UsuarioRoleID;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE ListarRoles()
BEGIN
    SELECT * FROM roles;
END //
DELIMITER ;


DELIMITER //
CREATE PROCEDURE ListarUsuarioRoles()
BEGIN
    SELECT 
        u.CI,
        u.Nombre_Usuario,
        CONCAT(p.Nombre, ' ', p.Apellido) AS Nombre_Completo,
        r.RoleName AS Rol
    FROM 
        usuario_roles ur
    JOIN 
        usuario u ON u.ID = ur.UsuarioID
    JOIN
        personal p ON p.CI = u.CI
    JOIN 
        roles r ON r.RoleID = ur.RoleID;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE CrearToken (
    IN p_UsuarioID INT,
    IN p_Token VARCHAR(255),
    IN p_Expiracion DATETIME
)
BEGIN
    INSERT INTO tokens (UsuarioID, Token, Expiracion) VALUES (p_UsuarioID, p_Token, p_Expiracion);
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE ValidarToken (
    IN p_Token VARCHAR(255),
    OUT p_Valido INT
)
BEGIN
    SET p_Valido = 0;
    
    IF EXISTS (SELECT 1 FROM tokens WHERE Token = p_Token AND Expiracion > NOW()) THEN
        SET p_Valido = 1;
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE EliminarToken (
    IN p_Token VARCHAR(255)
)
BEGIN
    DELETE FROM tokens WHERE Token = p_Token;
END //
DELIMITER ;


